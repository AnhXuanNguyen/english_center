package englishcenter.controller.gradeservlet;

import englishcenter.model.Grade;
import englishcenter.service.gradeservice.GradeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GradeServlet", value = "/GradeServlet")
public class GradeServlet extends HttpServlet {
    private GradeService gradeService = GradeService.getGradeService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            default: listGradeShow(request, response); break;
        }
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

    }
}
