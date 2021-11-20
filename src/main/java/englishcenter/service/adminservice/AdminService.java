package englishcenter.service.adminservice;

import englishcenter.config.ConnectionSigleton;
import englishcenter.model.Admin;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminService implements IAdminService{
    private Admin admin;
    private Connection connection = ConnectionSigleton.getConnection();
    private static AdminService adminService;
    private AdminService(){}
    public static AdminService getAdminService(){
        if (adminService == null){
            adminService = new AdminService();
        }
        return adminService;
    }
    @Override
    public Admin selectAdmin() {
        admin = null;
        String query = "call selectadmin();";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            ResultSet rs = callableStatement.executeQuery();
            if (rs.next()){
                String name = rs.getString(1);
                String email = rs.getString(2);
                String dob = rs.getString(3);
                String address = rs.getString(4);
                String phone = rs.getString(5);
                String username = rs.getString(6);
                String password = rs.getString(7);
                admin = new Admin(name, email, dob, address, phone, username, password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }

    @Override
    public boolean updateAdmin(Admin admin) {
        boolean row = false;
        String query = "call updateadmin(?, ?, ?, ?, ?, ?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setString(1, admin.getName());
            callableStatement.setString(2, admin.getEmail());
            callableStatement.setString(3, admin.getDob());
            callableStatement.setString(4, admin.getAddress());
            callableStatement.setString(5, admin.getPhone());
            callableStatement.setString(6, admin.getUsername());
            row = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }

    @Override
    public boolean changePasswordAdmin(Admin admin) {
        String query = "call changepasswordadmin(?, ?);";
        boolean row = false;
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setString(1, admin.getUsername());
            callableStatement.setString(2, admin.getPassword());
            row = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }
}
