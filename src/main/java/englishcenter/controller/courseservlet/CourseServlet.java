package englishcenter.controller.courseservlet;

import englishcenter.model.Course;
import englishcenter.model.Teacher;
import englishcenter.service.courseservice.CourseService;
import englishcenter.service.teacherandcourseservice.TeacherAndCourseService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CourseServlet", value = "/CourseServlet")
public class CourseServlet extends HttpServlet {
    private CourseService courseService = CourseService.getCourseService();
    private TeacherAndCourseService teacherAndCourseService = TeacherAndCourseService.getTeacherAndCourseService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "edit": editCourseShow(request, response); break;
            case "create": createCourseShow(request, response); break;
            case "drop": dropCourse(request, response); break;
            default: sourceListShow(request, response); break;
        }
    }

    private void dropCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ministryid = Integer.parseInt(request.getParameter("mid"));
        int id = Integer.parseInt(request.getParameter("id"));
        Course course = courseService.selectCourseById(id);
        List<Teacher> teachers = teacherAndCourseService.selectTeacherByCourseId(id);
        courseService.dropCourse(course, teachers);
        List<Course> courses = courseService.listCourseShow();
        request.setAttribute("ministryid", ministryid);
        request.setAttribute("courses", courses);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/course/list.jsp");
        dispatcher.forward(request, response);
    }

    private void createCourseShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ministryid = Integer.parseInt(request.getParameter("mid"));
        request.setAttribute("ministryid", ministryid);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/course/create.jsp");
        dispatcher.forward(request, response);
    }

    private void editCourseShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ministryid = Integer.parseInt(request.getParameter("mid"));
        int id = Integer.parseInt(request.getParameter("id"));
        Course course = courseService.selectCourseById(id);
        request.setAttribute("course", course);
        request.setAttribute("ministryid", ministryid);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/course/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void sourceListShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ministryid = Integer.parseInt(request.getParameter("id"));
        List<Course> courses = courseService.listCourseShow();
        request.setAttribute("ministryid", ministryid);
        request.setAttribute("courses", courses);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/course/list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "edit": editCourse(request, response); break;
            case "create": createCourse(request, response); break;
        }
    }

    private void createCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ministryid = Integer.parseInt(request.getParameter("mid"));
        String name = request.getParameter("name");
        Course course = new Course(name);
        courseService.insertCourse(course);
        List<Course> courses = courseService.listCourseShow();
        request.setAttribute("ministryid", ministryid);
        request.setAttribute("courses", courses);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/course/list.jsp");
        dispatcher.forward(request, response);
    }

    private void editCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ministryid = Integer.parseInt(request.getParameter("mid"));
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Course course = courseService.selectCourseById(id);
        course.setName(name);
        courseService.updateCourse(course);
        List<Course> courses = courseService.listCourseShow();
        request.setAttribute("ministryid", ministryid);
        request.setAttribute("courses", courses);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/course/list.jsp");
        dispatcher.forward(request, response);
    }
}
