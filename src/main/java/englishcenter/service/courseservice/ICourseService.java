package englishcenter.service.courseservice;

import englishcenter.model.Course;
import englishcenter.model.Teacher;

import java.util.List;

public interface ICourseService {
    List<Course> listCourseShow();
    Course selectCourseById(int id);
    void insertCourse(Course course);
    void updateCourse(Course course);
    void dropCourse(Course course, List<Teacher> teachers);
}
