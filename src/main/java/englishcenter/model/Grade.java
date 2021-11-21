package englishcenter.model;

public class Grade {
    private int id;
    private String name;
    private Teacher teacher;
    private Course course;

    public Grade(int id, String name, Teacher teacher, Course course) {
        this.id = id;
        this.name = name;
        this.teacher = teacher;
        this.course = course;
    }

    public Grade(String name, Teacher teacher, Course course) {
        this.name = name;
        this.teacher = teacher;
        this.course = course;
    }

    public Grade() {
    }

    public Grade(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Grade(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
}
