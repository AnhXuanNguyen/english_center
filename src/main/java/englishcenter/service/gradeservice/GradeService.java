package englishcenter.service.gradeservice;

import englishcenter.config.ConnectionSigleton;
import englishcenter.model.Course;
import englishcenter.model.Grade;
import englishcenter.model.Teacher;
import englishcenter.service.courseservice.CourseService;
import englishcenter.service.teacherservice.TeacherSevice;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GradeService implements IGradeService{
    private Connection connection = ConnectionSigleton.getConnection();
    private TeacherSevice teacherSevice = TeacherSevice.getTeacherSevice();
    private CourseService courseService = CourseService.getCourseService();
    private List<Grade> grades;
    private static GradeService gradeService;
    private GradeService(){}
    public static GradeService getGradeService(){
        if (gradeService == null){
            gradeService = new GradeService();
        }
        return gradeService;
    }
    @Override
    public List<Grade> selectAllGrade() {
        grades = new ArrayList<>();
        String query = "call selectallgrade();";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int teacherid = rs.getInt(3);
                int courseid = rs.getInt(4);
                Teacher teacher = teacherSevice.selectTeacherById(teacherid);
                Course course = courseService.selectCourseById(courseid);
                grades.add(new Grade(id, name, teacher, course));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return grades;
    }

    @Override
    public Grade selectGradebyId(int id) {
        Grade grade = null;
        String query = "call selectgradebyid(?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1,id);
            ResultSet rs = callableStatement.executeQuery();
            if (rs.next()){
                String name = rs.getString(2);
                grade = new Grade(id,name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return grade;
    }

    @Override
    public void insertGrade(Grade grade) {
        String query = "call insertgrade(?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setString(1, grade.getName());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateGrade(Grade grade) {
        String query = "call updategrade(?,?,?,?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1, grade.getTeacher().getId());
            callableStatement.setInt(2, grade.getCourse().getId());
            callableStatement.setInt(3, grade.getId());
            callableStatement.setString(4, grade.getName());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void dropGrade(Grade grade) {
        String query = "call dropgrade(?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1,grade.getId());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
