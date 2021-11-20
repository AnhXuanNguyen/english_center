package englishcenter.controller.ministryservlet;

import englishcenter.model.Ministry;
import englishcenter.service.ministryservice.MinistryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MinistryServlet", value = "/MinistryServlet")
public class MinistryServlet extends HttpServlet {
    private MinistryService ministryService = MinistryService.getMinistryService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "info": ministryInfoShow(request, response); break;
            case "welcome": ministryWelcome(request, response); break;
            case "edit": ministryEditShow(request, response); break;
            case "editpass": ministryEditPassShow(request, response); break;
            case "logout": ministryLogout(request, response); break;
            case "listministry": ministryListShow(request, response); break;
            case "drop": dropMinistry(request, response); break;
            case "create": insertMinistryShow(request, response); break;
            default: ministryLoginShow(request, response); break;
        }
    }

    private void insertMinistryShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/ministry/create.jsp");
        dispatcher.forward(request, response);
    }

    private void dropMinistry(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Ministry ministry = ministryService.selectMinistryById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/ministry/list.jsp");
        if (ministryService.dropMinistry(ministry)){
            List<Ministry> ministries = ministryService.selectAllMinistry();
            request.setAttribute("ministrylist", ministries);
        }
        else {
            List<Ministry> ministries = ministryService.selectAllMinistry();
            request.setAttribute("ministrylist", ministries);
            request.setAttribute("mes", "xoa khong thanh cong");
        }
        dispatcher.forward(request, response);
    }

    private void ministryListShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Ministry> ministries = ministryService.selectAllMinistry();
        request.setAttribute("ministrylist", ministries);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/ministry/list.jsp");
        dispatcher.forward(request, response);
    }

    private void ministryLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    private void ministryEditPassShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Ministry ministry = ministryService.selectMinistryById(id);
        request.setAttribute("ministry", ministry);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/ministry/editpass.jsp");
        dispatcher.forward(request, response);
    }

    private void ministryEditShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Ministry ministry = ministryService.selectMinistryById(id);
        request.setAttribute("ministry", ministry);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/ministry/editministry.jsp");
        dispatcher.forward(request, response);
    }

    private void ministryWelcome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Ministry ministry = ministryService.selectMinistryById(id);
        request.setAttribute("ministry", ministry);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/ministry/welcome.jsp");
        dispatcher.forward(request, response);
    }

    private void ministryInfoShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Ministry ministry = ministryService.selectMinistryById(id);
        request.setAttribute("ministry", ministry);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/ministry/infoministry.jsp");
        dispatcher.forward(request, response);
    }

    private void ministryLoginShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/ministry/ministrylogin.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "edit": ministryEdit(request, response); break;
            case "editpass": ministryEditPass(request, response); break;
            case "create": insertMinistry(request, response); break;
            default: ministryLogin(request, response); break;
        }
    }

    private void insertMinistry(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Ministry ministry = new Ministry(name, email, dob, address, phone, username, password);
        ministryService.insertMinistry(ministry);
        List<Ministry> ministries = ministryService.selectAllMinistry();
        request.setAttribute("ministrylist", ministries);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/ministry/list.jsp");
        dispatcher.forward(request, response);
    }

    private void ministryEditPass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Ministry ministry = ministryService.selectMinistryById(id);
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String repass = request.getParameter("repass");
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/ministry/editpass.jsp");
        if (ministry.getPassword().equals(oldpass)){
            if (newpass.equals(repass)){
                ministry.setPassword(newpass);
                if (ministryService.updatePassWordMinistry(ministry)){
                    request.setAttribute("ministry", ministry);
                    request.setAttribute("mes", "Doi mat khau thanh cong");
                }
                else {
                    request.setAttribute("mes", "Doi mat khau khong thanh cong");
                }
            }
            else {
                request.setAttribute("ministry", ministry);
                request.setAttribute("mes", "Mat khau khong trung nhau");
            }
        }else {
            request.setAttribute("ministry", ministry);
            request.setAttribute("mes", "Sai mat khau");
        }
        dispatcher.forward(request, response);
    }

    private void ministryEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        Ministry ministry = ministryService.selectMinistryById(id);
        ministry.setName(name);
        ministry.setEmail(email);
        ministry.setDob(dob);
        ministry.setAddress(address);
        ministry.setPhone(phone);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/ministry/editministry.jsp");
        if (ministryService.updateMinistry(ministry)){
            request.setAttribute("mes", "Sua thong tin thanh cong");
            request.setAttribute("ministry", ministry);
        }
        else {
            request.setAttribute("mes", "Sua thong tin khong thanh cong");
            request.setAttribute("ministry", ministry);
        }
        dispatcher.forward(request, response);
    }

    private void ministryLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        List<Ministry> ministries = ministryService.selectAllMinistry();
        boolean checklogin = false;
        Ministry ministrys = null;
        RequestDispatcher dispatcher;
        for (Ministry ministry: ministries){
            if (ministry.getUsername().equals(username) && ministry.getPassword().equals(password)){
                ministrys = ministry;
                checklogin = true;
            }
        }
        if (checklogin){
            request.setAttribute("ministry", ministrys);
            dispatcher = request.getRequestDispatcher("english/ministry/welcome.jsp");
        }
        else {
            request.setAttribute("mes", "Sai tai khoan hoac mat khau");
            dispatcher = request.getRequestDispatcher("english/ministry/ministrylogin.jsp");
        }
        dispatcher.forward(request, response);
    }
}
