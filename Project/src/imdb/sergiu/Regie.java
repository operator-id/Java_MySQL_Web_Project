package imdb.sergiu;

public class Regie {
    private int id;
    private int idFilm;
    private int idRegizor;

    Regie(){}

    public Regie(int idFilm, int idRegizor) {
        this.idFilm = idFilm;
        this.idRegizor = idRegizor;
    }

    public int getId() {
        return id;
    }

    public int getIdFilm() {
        return idFilm;
    }

    public int getIdRegizor() {
        return idRegizor;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setIdFilm(int idFilm) {
        this.idFilm = idFilm;
    }

    public void setIdRegizor(int idRegizor) {
        this.idRegizor = idRegizor;
    }

    @Override
    public String toString() {
        return "Regie{" +
                "id=" + id +
                ", idFilm=" + idFilm +
                ", idRegizor=" + idRegizor +
                '}';
    }
}
