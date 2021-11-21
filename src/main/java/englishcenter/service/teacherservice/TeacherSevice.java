package englishcenter.service.teacherservice;

import englishcenter.config.ConnectionSigleton;
import englishcenter.model.Course;
import englishcenter.model.Teacher;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TeacherSevice implements ITeacherSevice {
    private List<Teacher> teachers;
    private Connection connection = ConnectionSigleton.getConnection();
    private static TeacherSevice teacherSevice;

    private TeacherSevice() {
    }

    public static TeacherSevice getTeacherSevice() {
        if (teacherSevice == null) {
            teacherSevice = new TeacherSevice();
        }
        return teacherSevice;
    }

    @Override
    public List<Teacher> showTeacherList() {
        teachers = new ArrayList<>();
        String query = "call selectallteacher();";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String email = rs.getString(3);
                String dob = rs.getString(4);
                String address = rs.getString(5);
                String phone = rs.getString(6);
                String username = rs.getString(7);
                String password = rs.getString(8);
                teachers.add(new Teacher(name, email, dob, address, phone, username, password, id));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teachers;
    }

    @Override
    public Teacher selectTeacherById(int id) {
        Teacher teacher = null;
        String query = "call selectteacherbyid(?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();
            if (rs.next()) {
                String name = rs.getString(2);
                String email = rs.getString(3);
                String dob = rs.getString(4);
                String address = rs.getString(5);
                String phone = rs.getString(6);
                String username = rs.getString(7);
                String password = rs.getString(8);
                teacher = new Teacher(name, email, dob, address, phone, username, password, id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teacher;
    }

    @Override
    public void insertTeacher(Teacher teacher, int[] courseIds) {
        String query = "call insertteacher(?, ?, ?, ?, ?, ?, ?, ?);";
        String query2 = "call insertcourseteacherid(?, ?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            CallableStatement callableStatement1 = connection.prepareCall(query2);
            callableStatement.setString(1, teacher.getName());
            callableStatement.setString(2, teacher.getEmail());
            callableStatement.setString(3, teacher.getDob());
            callableStatement.setString(4, teacher.getAddress());
            callableStatement.setString(5, teacher.getPhone());
            callableStatement.setString(6, teacher.getUsername());
            callableStatement.setString(7, teacher.getPassword());
            callableStatement.registerOutParameter(8, Types.INTEGER);
            callableStatement.executeUpdate();
            int id = callableStatement.getInt(8);
            for (int i = 0; i < courseIds.length; i++) {
                callableStatement1.setInt(1, id);
                callableStatement1.setInt(2, courseIds[i]);
                callableStatement1.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateTeacher(Teacher teacher) {
        String query1 = "call updateteacher(?, ?, ?, ?, ?, ?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query1);
            callableStatement.setInt(1, teacher.getId());
            callableStatement.setString(2, teacher.getName());
            callableStatement.setString(3, teacher.getEmail());
            callableStatement.setString(4, teacher.getDob());
            callableStatement.setString(5, teacher.getAddress());
            callableStatement.setString(6, teacher.getPhone());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    public void deleteTeacherAndCourseId(Teacher teacher, List<Course> courses) {
        String query = "call dropteacherbyidtc(?,?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            for (int i = 0; i < courses.size(); i++){
                callableStatement.setInt(1, teacher.getId());
                callableStatement.setInt(2, courses.get(i).getId());
                callableStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void deleteTeacherbyId(int id){
        String query = "call dropteacher(?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1,id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void changePassword(Teacher teacher) {
        String query = "call updatepasswordteacher(?, ?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1, teacher.getId());
            callableStatement.setString(2, teacher.getPassword());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
