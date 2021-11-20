package englishcenter.controller.teacherservlet;

import englishcenter.model.Course;
import englishcenter.model.Teacher;
import englishcenter.service.courseservice.CourseService;
import englishcenter.service.teacherandcourseservice.TeacherAndCourseService;
import englishcenter.service.teacherservice.TeacherSevice;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TeacherServlet", value = "/TeacherServlet")
public class TeacherServlet extends HttpServlet {
    private TeacherSevice teacherSevice = TeacherSevice.getTeacherSevice();
    private CourseService courseService = CourseService.getCourseService();
    private TeacherAndCourseService teacherAndCourseService = TeacherAndCourseService.getTeacherAndCourseService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "welcome": welcomeTeacher(request, response); break;
            case "create": insertTeacherShow(request, response); break;
            case "info": infoTeacher(request, response); break;
            case "edit": updateTacherShow(request, response); break;
            case "list": teacherListShow(request, response); break;
            case "editpass": changePasswordShow(request, response); break;
            case "logout": logOut(request, response); break;
            case "drop": dropTeacher(request, response); break;
            default: teacherLoginShow(request, response); break;
        }
    }

    private void dropTeacher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ministryid = Integer.parseInt(request.getParameter("mid"));
        int id = Integer.parseInt(request.getParameter("id"));
        Teacher teacher = teacherSevice.selectTeacherById(id);
        List<Course> courses = teacherAndCourseService.selectCourseByTeacherId(id);
        teacherSevice.deleteTeacherAndCourseId(teacher, courses);
        teacherSevice.deleteTeacherbyId(teacher.getId());
        List<Teacher> teachers = teacherSevice.showTeacherList();
        request.setAttribute("ministryid", ministryid);
        request.setAttribute("teachers", teachers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/teacher/list.jsp");
        dispatcher.forward(request, response);
    }

    private void insertTeacherShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ministryid = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("ministryid", ministryid);
        List<Course> courses = courseService.listCourseShow();
        request.setAttribute("courses", courses);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/teacher/create.jsp");
        dispatcher.forward(request, response);
    }

    private void logOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    private void changePasswordShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Teacher teacher = teacherSevice.selectTeacherById(id);
        request.setAttribute("teacher", teacher);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/teacher/editpass.jsp");
        dispatcher.forward(request, response);
    }

    private void teacherListShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Teacher> teachers = teacherSevice.showTeacherList();
        request.setAttribute("teachers", teachers);
        request.setAttribute("ministryid", id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/teacher/list.jsp");
        dispatcher.forward(request, response);
    }

    private void updateTacherShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Teacher teacher = teacherSevice.selectTeacherById(id);
        request.setAttribute("teacher", teacher);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/teacher/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void welcomeTeacher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Teacher teacher = teacherSevice.selectTeacherById(id);
        request.setAttribute("teacher", teacher);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/teacher/welcome.jsp");
        dispatcher.forward(request, response);
    }

    private void infoTeacher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Teacher teacher = teacherSevice.selectTeacherById(id);
        List<Course> courses = teacherAndCourseService.selectCourseByTeacherId(id);
        request.setAttribute("course", courses);
        request.setAttribute("teacher",teacher);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/teacher/info.jsp");
        dispatcher.forward(request, response);
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
            case "edit": updateTacher(request, response); break;
            case "create": insertTeacher(request, response); break;
            case "editpass": changePassword(request, response); break;
            default: teacherLogin(request, response); break;
        }
    }

    private void updateTacher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ministryid = Integer.parseInt(request.getParameter("mid"));
        int id = Integer.parseInt(request.getParameter("id"));
        Teacher teacher = teacherSevice.selectTeacherById(id);
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        teacher.setName(name);
        teacher.setEmail(email);
        teacher.setDob(dob);
        teacher.setAddress(address);
        teacher.setPhone(phone);
        teacherSevice.updateTeacher(teacher);
        List<Teacher> teachers = teacherSevice.showTeacherList();
        request.setAttribute("teachers", teachers);
        request.setAttribute("ministryid", ministryid);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/teacher/list.jsp");
        dispatcher.forward(request, response);
    }

    private void insertTeacher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ministryid = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String username = request.getParameter("email");
        String password = request.getParameter("password");
        Teacher teacher = new Teacher(name, email, dob, address, phone, email, password);
        String[] courseidStr = request.getParameterValues("courseid");
        int[] courseids = new int[courseidStr.length];
        for (int i = 0; i < courseidStr.length; i++){
            courseids[i] = Integer.parseInt(courseidStr[i]);
        }
        teacherSevice.insertTeacher(teacher, courseids);
        List<Teacher> teachers = teacherSevice.showTeacherList();
        request.setAttribute("ministryid",ministryid);
        request.setAttribute("teachers", teachers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/teacher/list.jsp");
        dispatcher.forward(request, response);
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String repass = request.getParameter("repass");
        int id = Integer.parseInt(request.getParameter("id"));
        Teacher teacher = teacherSevice.selectTeacherById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/teacher/editpass.jsp");
        if (teacher.getPassword().equals(oldpass)){
            if (newpass.equals(repass)){
                teacher.setPassword(newpass);
                teacherSevice.changePassword(teacher);
                request.setAttribute("mes", "Doi mat khau thanh cong");
            }
            else {
                request.setAttribute("mes", "Mat khau khong trung nhau");
            }
        }
        else {
            request.setAttribute("mes", "Sai mat khau");
        }
        request.setAttribute("teacher", teacher);
        dispatcher.forward(request, response);
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
