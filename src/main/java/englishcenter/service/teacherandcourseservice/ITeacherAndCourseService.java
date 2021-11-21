package englishcenter.service.teacherandcourseservice;

import englishcenter.model.Course;
import englishcenter.model.Teacher;

import java.util.List;

public interface ITeacherAndCourseService {
    List<Teacher> selectTeacherByCourseId(int id);
    List<Course> selectCourseByTeacherId(int id);
}
