package englishcenter.service.teacherservice;

import englishcenter.model.Teacher;

import java.util.List;

public interface ITeacherSevice {
    List<Teacher> showTeacherList();
    Teacher selectTeacherById(int id);
    void insertTeacher(Teacher teacher);
    boolean updateTeacher(Teacher teacher);
    void deleteTeacher(Teacher teacher);
    void changePassword(Teacher teacher);
}
