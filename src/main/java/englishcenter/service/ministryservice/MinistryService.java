package englishcenter.service.ministryservice;

import englishcenter.config.ConnectionSigleton;
import englishcenter.model.Ministry;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MinistryService implements IMinistryService{
    private List<Ministry> ministries;
    private Connection connection = ConnectionSigleton.getConnection();
    private static MinistryService ministryService;
    private MinistryService(){}
    public static MinistryService getMinistryService(){
        if (ministryService == null){
            ministryService = new MinistryService();
        }
        return ministryService;
    }
    @Override
    public List<Ministry> selectAllMinistry() {
        ministries = new ArrayList<>();
        String query = "call selectallministry();";
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
                ministries.add(new Ministry(name, email, dob, address, phone, username, password, id));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ministries;
    }

    @Override
    public Ministry selectMinistryById(int id) {
        String query = "call selectministrybyid(?);";
        Ministry ministry = null;
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();
            if (rs.next()){
                String name = rs.getString(2);
                String email = rs.getString(3);
                String dob = rs.getString(4);
                String address = rs.getString(5);
                String phone = rs.getString(6);
                String username = rs.getString(7);
                String password = rs.getString(8);
                ministry = new Ministry(name, email, dob, address, phone, username, password, id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ministry;
    }

    @Override
    public void insertMinistry(Ministry ministry) {
        String query = "call insertministry(?, ?, ?, ?, ?, ?, ?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setString(1,ministry.getName());
            callableStatement.setString(2,ministry.getEmail());
            callableStatement.setString(3,ministry.getDob());
            callableStatement.setString(4,ministry.getAddress());
            callableStatement.setString(5,ministry.getPhone());
            callableStatement.setString(6,ministry.getUsername());
            callableStatement.setString(7,ministry.getPassword());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean updateMinistry(Ministry ministry) {
        boolean row = false;
        String query = "call updateministry(?, ?, ?, ?, ?, ?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1, ministry.getId());
            callableStatement.setString(2, ministry.getName());
            callableStatement.setString(3, ministry.getEmail());
            callableStatement.setString(4, ministry.getDob());
            callableStatement.setString(5, ministry.getAddress());
            callableStatement.setString(6, ministry.getPhone());
            row = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }

    @Override
    public boolean dropMinistry(Ministry ministry) {
        boolean row = false;
        String query = "call dropministry(?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1, ministry.getId());
            row = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }

    @Override
    public boolean updatePassWordMinistry(Ministry ministry) {
        boolean row = false;
        String query = "call updatepasswordministry(?, ?);";
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1, ministry.getId());
            callableStatement.setString(2, ministry.getPassword());
            row = callableStatement.executeUpdate()> 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }
}
