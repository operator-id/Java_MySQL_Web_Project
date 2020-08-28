package  imdb.sergiu;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

public class TestIMDB {
    public static void main(String[] args) throws SQLException {


        int idActor = 2;

        String nume, prenume, loculNasterii;
        java.sql.Date dataNasterii;

        GestiuneActor ga = new GestiuneActor();

        Actor actorCautat = ga.getDateActor(idActor);

        System.out.println(actorCautat);



        // Introduc date manual, mai tarziu se vor prelua dintr-un text field fiecare;
        nume = "Hyde";
        prenume = "Sam";
        loculNasterii = " Fall River, Massachusetts, US";
        dataNasterii = Date.valueOf("1985-04-16");
        //ga.salveazaActor(new Actor(nume, prenume, dataNasterii, loculNasterii));

        //de modificat la executiile urmatoare
        idActor = 11;

        //ga.stergeActor(idActor);

        int idRegizor = 2;

        GestiuneRegizor gr = new GestiuneRegizor();
        Regizor regizorCautat = gr.getDateRegizor(idRegizor);
        System.out.println(regizorCautat);


        gr.modificaNumeRegizor(idRegizor, "NumeNou");
         regizorCautat = gr.getDateRegizor(idRegizor);
        System.out.println(regizorCautat);


        //gr.salveazaRegizor(new Regizor(nume, prenume, dataNasterii, loculNasterii));
        idRegizor = 9;
        //gr.stergeRegizor(idRegizor);

        int idFilm = 1;

        GestiuneFilm gf = new GestiuneFilm();
        Film filmCautat = gf.getDateFilm(idFilm);
        System.out.println(filmCautat);

        gf.modificaTitluFilm( 1,"The Shawshank Redemption1" );
        filmCautat = gf.getDateFilm(idFilm);
        System.out.println(filmCautat);

        gf.modificaRatingFilm( 1,9.77f );
        filmCautat = gf.getDateFilm(idFilm);
        System.out.println(filmCautat);

        GestiuneOscar go = new GestiuneOscar();
        Oscar oscarCautat = go.getDateOscar(4);
        System.out.println(oscarCautat);

        go.modificaAnulOscar(4, 2010);
        oscarCautat = go.getDateOscar(4);
        System.out.println(oscarCautat);


        //proiect web dinamic /WebContent/
        // /src/

        ArrayList<Actor> actori =  ga.getListaActori();
        for (Actor actor : actori){
        System.out.println(actor.toString());
        }

        ArrayList<Oscar> oscars =  go.getListaOscaruri();
        for (Oscar oscar: oscars){
            System.out.println(oscar.toString());
        }

        GestiuneDistributie gd = new GestiuneDistributie();
        Distributie distr1 = gd.getDateDistributie(6);
        System.out.println("Distributie dupa id: " + distr1);

        ArrayList<Distributie> distributie = gd.getListaDistributiei();
        for (Distributie distr: distributie){
            System.out.println(distr);
        }


    }
}
