package imdb.sergiu;

import java.sql.Time;

public class Film {

    private  int id;
    private  String titlu;
    private java.sql.Time durata;
    private int anAparitie;
    private float rating;
    private String descriere;

    Film(){}

    public Film(String titlu, Time durata, int anAparitie, float rating, String descriere) {
        this.titlu = titlu;
        this.durata = durata;
        this.anAparitie = anAparitie;
        this.rating = rating;
        this.descriere = descriere;
    }

    public int getId() {
        return id;
    }

    public String getTitlu() {
        return titlu;
    }



    public java.sql.Time getDurata() {
        return durata;
    }

    public int getAnAparitie() {
        return anAparitie;
    }

    public float getRating() {
        return rating;
    }

    public String getDescriere() {
        return descriere;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitlu(String titlu) {
        this.titlu = titlu;
    }

    public void setDurata(java.sql.Time durata) {
        this.durata = durata;
    }

    public void setAnAparitie(int anAparitie) {
        this.anAparitie = anAparitie;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public void setDescriere(String descriere) {
        this.descriere = descriere;
    }
    @Override
    public String toString() {
        return "Film{" +
                "id=" + id +
                ", titlu='" + titlu + '\'' +
                ", durata=" + durata +
                ", anAparitie=" + anAparitie +
                ", rating=" + rating +
                ", descriere='" + descriere + '\'' +
                '}';
    }

    public void setIdFilm(int id) {
        this.id = id;
    }
}
