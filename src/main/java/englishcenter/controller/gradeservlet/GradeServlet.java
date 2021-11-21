package englishcenter.controller.gradeservlet;

import englishcenter.model.Course;
import englishcenter.model.Grade;
import englishcenter.model.Teacher;
import englishcenter.service.courseservice.CourseService;
import englishcenter.service.gradeservice.GradeService;
import englishcenter.service.teacherandcourseservice.TeacherAndCourseService;
import englishcenter.service.teacherservice.TeacherSevice;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GradeServlet", value = "/GradeServlet")
public class GradeServlet extends HttpServlet {
    private GradeService gradeService = GradeService.getGradeService();
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
            case "edit": updateGradeShow(request, response); break;
            case "create": insertGradeShow(request, response); break;
            case "drop": dropGrade(request, response); break;
            default: listGradeShow(request, response); break;
        }
    }

    private void dropGrade(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ministryid = Integer.parseInt(request.getParameter("mid"));
        int id = Integer.parseInt(request.getParameter("id"));
        Grade grade = gradeService.selectGradebyId(id);
        gradeService.dropGrade(grade);
        List<Grade> grades = gradeService.selectAllGrade();
        request.setAttribute("grades", grades);
        request.setAttribute("ministryid", ministryid);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/grade/list.jsp");
        dispatcher.forward(request, response);
    }

    private void updateGradeShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ministryid = Integer.parseInt(request.getParameter("mid"));
        int id = Integer.parseInt(request.getParameter("id"));
        Grade grade = gradeService.selectGradebyId(id);
        List<Teacher> teachers = teacherSevice.showTeacherList();
        List<Course> courses = courseService.listCourseShow();
        request.setAttribute("teachers", teachers);
        request.setAttribute("courses", courses);
        request.setAttribute("ministryid", ministryid);
        request.setAttribute("grade", grade);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/grade/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void insertGradeShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ministryid = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("ministryid", ministryid);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/grade/create.jsp");
        dispatcher.forward(request, response);
    }

    private void listGradeShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ministryid = Integer.parseInt(request.getParameter("id"));
        List<Grade> grades = gradeService.selectAllGrade();
        request.setAttribute("grades", grades);
        request.setAttribute("ministryid", ministryid);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/grade/list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create": insertGrade(request, response);break;
            case "edit": updateGrade(request, response); break;
        }
    }

    private void updateGrade(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ministryid = Integer.parseInt(request.getParameter("mid"));
        String name = request.getParameter("newname");
        int id = Integer.parseInt(request.getParameter("id"));
        int teacherid = Integer.parseInt(request.getParameter("teacher"));
        int courseid = Integer.parseInt(request.getParameter("course"));
        List<Course> courses = teacherAndCourseService.selectCourseByTeacherId(teacherid);
        List<Teacher> teachers = teacherAndCourseService.selectTeacherByCourseId(courseid);
        Teacher teacher = teacherSevice.selectTeacherById(teacherid);
        Course course = courseService.selectCourseById(courseid);
        RequestDispatcher dispatcher;
        boolean checkCourse = false;
        for (Course course1: courses){
            if (course1.getId() == course.getId()){
                checkCourse = true;
                break;
            }
        }
        if (checkCourse){
            Grade grade = gradeService.selectGradebyId(id);
            grade.setTeacher(teacher);
            grade.setCourse(course);
            grade.setName(name);
            gradeService.updateGrade(grade);
            List<Grade> grades = gradeService.selectAllGrade();
            request.setAttribute("grades", grades);
            request.setAttribute("ministryid", ministryid);
            dispatcher = request.getRequestDispatcher("english/grade/list.jsp");
        }
        else {
            List<Teacher> teacherss = teacherSevice.showTeacherList();
            List<Course> coursess = courseService.listCourseShow();
            request.setAttribute("teachers", teacherss);
            request.setAttribute("courses", coursess);
            request.setAttribute("ministryid", ministryid);
            Grade grade = gradeService.selectGradebyId(id);
            request.setAttribute("grade", grade);
            request.setAttribute("teach", teacher);
            request.setAttribute("cour", course);
            request.setAttribute("teacherse", teachers);
            dispatcher = request.getRequestDispatcher("english/grade/edit.jsp");
        }
        dispatcher.forward(request, response);
    }

    private void insertGrade(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ministryid = Integer.parseInt(request.getParameter("ministryid"));
        String name = request.getParameter("name");
        Grade grade = new Grade(name);
        gradeService.insertGrade(grade);
        List<Grade> grades = gradeService.selectAllGrade();
        request.setAttribute("grades", grades);
        request.setAttribute("ministryid", ministryid);
        RequestDispatcher dispatcher = request.getRequestDispatcher("english/grade/list.jsp");
        dispatcher.forward(request, response);
    }
}
