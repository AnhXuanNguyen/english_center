package englishcenter.model;

public class Teacher extends User{
    private int id;

    public Teacher(String name, String email, String dob, String address, String phone, String username, String password, int id) {
        super(name, email, dob, address, phone, username, password);
        this.id = id;
    }

    public Teacher(int id) {
        this.id = id;
    }

    public Teacher(String name, String email, String dob, String address, String phone, String username, String password) {
        super(name, email, dob, address, phone, username, password);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
