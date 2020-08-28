package imdb.sergiu;

public class Distributie {
    private int id;
    private int idFilm;
    private int idActor;

    Distributie(){}

    public Distributie(int idFilm, int idActor) {
        this.idFilm = idFilm;
        this.idActor = idActor;
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

    public void setId(int id) {
        this.id = id;
    }

    public void setIdFilm(int idFilm) {
        this.idFilm = idFilm;
    }

    public void setIdActor(int idActor) {
        this.idActor = idActor;
    }

    @Override
    public String toString() {
        return "Distributie{" +
                "id=" + id +
                ", idFilm=" + idFilm +
                ", idActor=" + idActor +
                '}';
    }
}
