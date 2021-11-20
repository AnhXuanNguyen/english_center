package englishcenter.controller.teacherservlet;

import englishcenter.model.Teacher;
import englishcenter.service.teacherservice.TeacherSevice;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TeacherServlet", value = "/TeacherServlet")
public class TeacherServlet extends HttpServlet {
    private TeacherSevice teacherSevice = TeacherSevice.getTeacherSevice();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "info": break;
            case "edit": break;
            case "logout": break;
            default: teacherLoginShow(request, response); break;
        }
    }

    private void teacherLoginShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/teacher/login.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            default: teacherLogin(request, response); break;
        }
    }

    private void teacherLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        List<Teacher> teachers = teacherSevice.showTeacherList();
        boolean checklogin = false;
        Teacher teach = null;
        for (Teacher teacher: teachers){
            if (teacher.getUsername().equals(username) && teacher.getPassword().equals(password)){
                teach = teacher;
                checklogin = true;
                break;
            }
        }
        RequestDispatcher dispatcher;
        if (checklogin){
            request.setAttribute("teacher", teach);
            dispatcher = request.getRequestDispatcher("english/teacher/welcome.jsp");
        }
        else {
            request.setAttribute("mes", "Sai tai khoan hoac mat khau");
            dispatcher = request.getRequestDispatcher("english/teacher/login.jsp");
        }
        dispatcher.forward(request, response);
    }
}
