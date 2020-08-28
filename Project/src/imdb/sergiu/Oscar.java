package  imdb.sergiu;

public class Oscar {
    int id;
    int idFilm;
    int idActor;
    int anul;
    String categorie;
    Oscar(){}

    public Oscar(int idFilm, int idActor, int anul, String categorie) {
        this.idFilm = idFilm;
        this.idActor = idActor;
        this.anul = anul;
        this.categorie = categorie;
    }

    @Override
    public String toString() {
        return "Oscar{" +
                "id=" + id +
                ", idFilm=" + idFilm +
                ", idActor=" + idActor +
                ", anul=" + anul +
                ", categorie='" + categorie + '\'' +
                '}';
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setIdFilm(int idFilm) {
        this.idFilm = idFilm;
    }

    public void setIdActor(int idActor) {
        this.idActor = idActor;
    }

    public void setAnul(int anul) {
        this.anul = anul;
    }

    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }

    public int getId() {
        return id;
    }

    public int getIdFilm() {
        return idFilm;
    }

    public int getIdActor() {
        return idActor;
    }

    public int getAnul() {
        return anul;
    }

    public String getCategorie() {
        return categorie;
    }

    public void setIdOscar(int id) {
        this.id = id;
    }
}
