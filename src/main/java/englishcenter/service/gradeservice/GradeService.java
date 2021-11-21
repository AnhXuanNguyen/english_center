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
        return null;
    }

    @Override
    public void insertGrade(Grade grade) {

    }

    @Override
    public void updateGrade(Grade grade) {

    }

    @Override
    public void dropGrade(Grade grade) {

    }
}
