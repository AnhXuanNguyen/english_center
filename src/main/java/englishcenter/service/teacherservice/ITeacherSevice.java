package englishcenter.service.teacherservice;

import englishcenter.model.Course;
import englishcenter.model.Teacher;

import java.util.List;

public interface ITeacherSevice {
    List<Teacher> showTeacherList();
    Teacher selectTeacherById(int id);
    void insertTeacher(Teacher teacher, int[] courseIds);
    void updateTeacher(Teacher teacher);
    void deleteTeacherAndCourseId(Teacher teacher, List<Course> courses);
    void changePassword(Teacher teacher);
}
