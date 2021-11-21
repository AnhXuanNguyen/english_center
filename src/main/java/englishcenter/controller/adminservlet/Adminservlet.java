package englishcenter.controller.adminservlet;

import englishcenter.model.Admin;
import englishcenter.service.adminservice.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Adminservlet", value = "/Adminservlet")
public class Adminservlet extends HttpServlet {
    private AdminService adminService = AdminService.getAdminService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "welcome": welcomeAdmin(request, response); break;
            case "edit": updateAdminView(request, response); break;
            case "logout": adminLogout(request, response); break;
            case "editpass": updatePassAdminView(request, response); break;
            case "info": infoAdmin(request, response); break;
            default: adminLoginView(request, response); break;
        }
    }

    private void infoAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Admin admin = adminService.selectAdmin();
        request.setAttribute("admin", admin);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/admin/infoadmin.jsp");
        dispatcher.forward(request, response);
    }

    private void updatePassAdminView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/admin/editpass.jsp");
        dispatcher.forward(request, response);
    }

    private void adminLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    private void welcomeAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Admin admin = adminService.selectAdmin();
        request.setAttribute("admin", admin);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/admin/welcome.jsp");
        dispatcher.forward(request, response);
    }

    private void adminLoginView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/admin/adminlogin.jsp");
        dispatcher.forward(request, response);
    }
    private void updateAdminView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Admin admin = adminService.selectAdmin();
        request.setAttribute("admin", admin);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/admin/editadmin.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "edit": updateAdmin(request, response); break;
            case "editpass": updatePassAdmin(request, response); break;
            default: adminLogin(request, response); break;
        }
    }

    private void updatePassAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String repass = request.getParameter("repass");
        Admin admin = adminService.selectAdmin();
        RequestDispatcher dispatcher;
        if (admin.getPassword().equals(oldpass)){
            if (newpass.equals(repass)){
                admin.setPassword(newpass);
                if (adminService.changePasswordAdmin(admin)){
                    request.setAttribute("mes", "doi mat khau thanh cong");
                    dispatcher = request.getRequestDispatcher("english/admin/editpass.jsp");
                }
                else {
                    request.setAttribute("mes", "Doi mat khau khong thanh cong");
                    dispatcher = request.getRequestDispatcher("english/admin/editpass.jsp");
                }
            }
            else {
                request.setAttribute("mes", "mat khau khong khop");
                dispatcher = request.getRequestDispatcher("english/admin/editpass.jsp");
            }
        }
        else {
            request.setAttribute("mes", "sai mat khau");
            dispatcher = request.getRequestDispatcher("english/admin/editpass.jsp");
        }
        dispatcher.forward(request, response);
    }

    private void updateAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        Admin admin = adminService.selectAdmin();
        admin.setName(name);
        admin.setEmail(email);
        admin.setDob(dob);
        admin.setAddress(address);
        admin.setPhone(phone);
        RequestDispatcher dispatcher;
        if (adminService.updateAdmin(admin)){
            request.setAttribute("admin", admin);
            request.setAttribute("mes", "Sua thong tin thanh cong");
            dispatcher = request.getRequestDispatcher("english/admin/editadmin.jsp");
        }
        else {
            request.setAttribute("admin", admin);
            request.setAttribute("mes", "Khong thanh cong");
            dispatcher = request.getRequestDispatcher("english/admin/editadmin.jsp");
        }
        dispatcher.forward(request, response);
    }


    private void adminLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher;
        Admin admin = adminService.selectAdmin();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (admin.getUsername().equals(username) && admin.getPassword().equals(password)){
            request.setAttribute("admin", admin);
            dispatcher = request.getRequestDispatcher("english/admin/welcome.jsp");
        }
        else {
            request.setAttribute("mes", "Sai dang nhap");
            dispatcher = request.getRequestDispatcher("english/admin/adminlogin.jsp");
        }
        dispatcher.forward(request, response);
    }
}
