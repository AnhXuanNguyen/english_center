package englishcenter.service.courseservice;
import englishcenter.model.Course;

import java.util.ArrayList;
import java.util.List;

public class CourseService implements ICourseService{
    private List<Course> courses;
    private static CourseService courseService;
    private CourseService(){}
    public static CourseService getCourseService(){
        if (courseService == null){
            courseService = new CourseService();
        }
        return courseService;
    }
    @Override
    public List<Course> listCourseShow() {
        courses = new ArrayList<>();
        return courses;
    }

    @Override
    public Course selectCourseById(int id) {
        return null;
    }

    @Override
    public void insertCourse(Course course) {

    }

    @Override
    public void updateCourse(Course course) {

    }

    @Override
    public void dropCourse(Course course) {

    }
}
