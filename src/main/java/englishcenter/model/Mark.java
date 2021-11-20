package englishcenter.model;

public class Mark {
    private int id;
    private double mark;
    private Student student;

    public Mark(int id, double mark, Student student) {
        this.id = id;
        this.mark = mark;
        this.student = student;
    }

    public Mark(double mark, Student student) {
        this.mark = mark;
        this.student = student;
    }

    public Mark() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getMark() {
        return mark;
    }

    public void setMark(double mark) {
        this.mark = mark;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}
