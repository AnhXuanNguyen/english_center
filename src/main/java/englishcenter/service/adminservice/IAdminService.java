package englishcenter.service.adminservice;

import englishcenter.model.Admin;

import java.sql.SQLException;

public interface IAdminService {
    Admin selectAdmin() throws SQLException;
    boolean updateAdmin(Admin admin);
    boolean changePasswordAdmin(Admin admin);
}
