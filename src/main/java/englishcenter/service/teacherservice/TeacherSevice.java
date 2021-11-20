package englishcenter.service.teacherservice;

import englishcenter.config.ConnectionSigleton;
import englishcenter.model.Teacher;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TeacherSevice implements ITeacherSevice{
    private List<Teacher> teachers;
    private Connection connection = ConnectionSigleton.getConnection();
    private static TeacherSevice teacherSevice;
    private TeacherSevice(){}
    public static TeacherSevice getTeacherSevice(){
        if (teacherSevice == null){
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
            while (rs.next()){
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
            callableStatement.setInt(1,id);
            ResultSet rs = callableStatement.executeQuery();
            if (rs.next()){
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
    public void insertTeacher(Teacher teacher) {

    }

    @Override
    public boolean updateTeacher(Teacher teacher) {
        return false;
    }

    @Override
    public void deleteTeacher(Teacher teacher) {

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
