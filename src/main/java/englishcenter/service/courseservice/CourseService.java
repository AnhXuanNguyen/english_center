package englishcenter.service.courseservice;
import englishcenter.config.ConnectionSigleton;
import englishcenter.model.Course;
import englishcenter.model.Teacher;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseService implements ICourseService{
    private Connection connection = ConnectionSigleton.getConnection();
    private List<Course> courses;
    private static CourseService courseService;
    private CourseService(){}
    public static CourseService getCourseService(){
        if (courseService == null){
            courseService = new CourseService();
        }
        return courseService;
    }
    @Override
    public List<Course> listCourseShow() {
        courses = new ArrayList<>();
        String query = "call selectallcourse();";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt(1);
                String name = rs.getString(2);
                courses.add(new Course(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    @Override
    public Course selectCourseById(int id) {
        Course course = null;
        String query = "call selectcoursebyid(?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1,id);
            ResultSet rs = callableStatement.executeQuery();
            if (rs.next()){
                String name = rs.getString(2);
                course = new Course(id, name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return course;
    }

    @Override
    public void insertCourse(Course course) {
        String query = "call  insertcourse(?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setString(1, course.getName());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateCourse(Course course) {
        String query = "call updatecourse(?, ?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1,course.getId());
            callableStatement.setString(2, course.getName());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void dropCourse(Course course, List<Teacher> teachers) {
        try {
            if (teachers.size() == 0){
                String query1 = "call dropcoursebycid(?);";
                CallableStatement callableStatement = connection.prepareCall(query1);
                callableStatement.setInt(1,course.getId());
                callableStatement.executeUpdate();
            }
            else {
                String query = "call dropcoursebyid(?, ?);";
                CallableStatement callableStatement = connection.prepareCall(query);
                for (Teacher teacher: teachers){
                    callableStatement.setInt(1, teacher.getId());
                    callableStatement.setInt(2, course.getId());
                    callableStatement.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
