package  imdb.sergiu;

import java.sql.Date;

public class Regizor {
    private int id;
    private String nume;
    private String prenume;
    private java.sql.Date dataNasterii;
    private String loculNasterii;

    Regizor() {
    }

    public Regizor(String nume, String prenume, java.sql.Date dataNasterii, String loculNasterii) {

        this.nume = nume;
        this.prenume = prenume;
        this.dataNasterii = dataNasterii;
        this.loculNasterii = loculNasterii;

    }
    public void setId(int id) {
        this.id = id;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public void setPrenume(String prenume) {
        this.prenume = prenume;
    }

    public void setDataNasterii(Date dataNasterii) {
        this.dataNasterii = dataNasterii;
    }

    public void setLoculNasterii(String loculNasterii) {
        this.loculNasterii = loculNasterii;
    }

    public int getId() {
        return id;
    }

    public String getPrenume() {
        return prenume;
    }

    public Date getDataNasterii() {
        return dataNasterii;
    }

    public String getLoculNasterii() {
        return loculNasterii;
    }

    public String getNume() {
        return nume;
    }
    @Override
    public String toString() {
        return "Regizor{" +
                "id=" + id +
                ", nume='" + nume + '\'' +
                ", prenume='" + prenume + '\'' +
                ", dataNasterii=" + dataNasterii +
                ", loculNasterii='" + loculNasterii + '\'' +
                '}';
    }

    public void setIdRegizor(int id) {
        this.id = id;
    }
}
