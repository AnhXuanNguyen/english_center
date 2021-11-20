package englishcenter.service.teacherandcourseservice;

import englishcenter.config.ConnectionSigleton;
import englishcenter.model.Course;
import englishcenter.model.Teacher;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TeacherAndCourseService implements ITeacherAndCourseService{
    private List<Course> courses;
    private List<Teacher> teachers;
    private Connection connection = ConnectionSigleton.getConnection();
    private static TeacherAndCourseService teacherAndCourseService;
    private TeacherAndCourseService(){}
    public static TeacherAndCourseService getTeacherAndCourseService(){
        if (teacherAndCourseService == null){
            teacherAndCourseService = new TeacherAndCourseService();
        }
        return teacherAndCourseService;
    }


    @Override
    public List<Teacher> selectTeacherByCourseId(int id) {
        teachers = new ArrayList<>();
        String query = "call selectteacherbycourseid(?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()){
                int teacherid = rs.getInt(1);
                String name = rs.getString(2);
                String email = rs.getString(3);
                String dob = rs.getString(4);
                String address = rs.getString(5);
                String phone = rs.getString(6);
                String username = rs.getString(7);
                String password = rs.getString(8);
                teachers.add(new Teacher(name, email, dob, address, phone, username, password, teacherid));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teachers;
    }

    @Override
    public List<Course> selectCourseByTeacherId(int id) {
        courses = new ArrayList<>();
        String query = "call selectallcoursebyteacherid(?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1,id);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()){
                int courseid = rs.getInt(1);
                String name = rs.getString(2);
                courses.add(new Course(courseid, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }
}
