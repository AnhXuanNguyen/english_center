package englishcenter.service.gradeservice;

import englishcenter.model.Grade;

import java.util.List;

public interface IGradeService {
    List<Grade> selectAllGrade();
    Grade selectGradebyId(int id);
    void insertGrade(Grade grade);
    void updateGrade(Grade grade);
    void dropGrade(Grade grade);
}
