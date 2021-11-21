package englishcenter.model;

public class Diary {
    int id;
    String tittle;
    String content;
    String date;
    Grade grade;

    public Diary(){}

    public Diary(int id, String tittle, String content, String date, Grade grade) {
        this.id = id;
        this.tittle = tittle;
        this.content = content;
        this.date = date;
        this.grade = grade;
    }

    public Diary(String tittle, String content, String date, Grade grade) {
        this.tittle = tittle;
        this.content = content;
        this.date = date;
        this.grade = grade;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }
}
