package englishcenter.model;

public class Student extends User{
    private int id;
    private Grade grade;

    public Student(String name, String email, String dob, String address, String phone, String username, String password, int id, Grade grade) {
        super(name, email, dob, address, phone, username, password);
        this.id = id;
        this.grade = grade;
    }

    public Student(String name, String email, String dob, String address, String phone, String username, String password, Grade grade) {
        super(name, email, dob, address, phone, username, password);
        this.grade = grade;
    }
    public Student(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }
}
