package imdb.sergiu;

import java.sql.Date;

public class Actor {


    private int id;
    private String nume;
    private String prenume;
    private java.sql.Date dataNasterii;
    private String loculNasterii;

    Actor() {
    }

    public Actor(String nume, String prenume, java.sql.Date dataNasterii, String loculNasterii) {

        this.nume = nume;
        this.prenume = prenume;
        this.dataNasterii = dataNasterii;
        this.loculNasterii = loculNasterii;

    }

    @Override
    public String toString() {
        return "Actor [idActor=" + id + ", nume=" + nume + ", prenume=" + prenume + ", Data Nasterii="
                + dataNasterii + ", Locul Nasterii=" + loculNasterii + "]";
    }

    public int getIdActor() {
        return id;
    }

    public void setIdActor(int id) {
        this.id = id;
    }

    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public String getPrenume() {
        return prenume;
    }

    public void setPrenume(String prenume) {
        this.prenume = prenume;
    }

    public java.sql.Date getDataNasterii() {
        return dataNasterii;
    }

    public void setDataNasterii(Date dataNasterii) {
        this.dataNasterii = dataNasterii;
    }

    public String getLoculNasterii() {
        return loculNasterii;
    }

    public void setLoculNasterii(String loculNasterii) {
        this.loculNasterii = loculNasterii;
    }
}
