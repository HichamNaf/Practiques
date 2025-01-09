package persistence;

import business.entities.Character;
import business.entities.Monster;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import persistence.ApiHelper.ApiHelper;
import persistence.CharacterPersistence.CharacterClass;
import persistence.exception.ApiConection;

import java.io.IOException;

/**
 * Class that contains the method needed to read the monsters saved in the API.
 *
 * @author Hicham Naf
 * @version 4.0
 */
//Adaplta tota la part de percistencia per poder llegir i escriure en l'API
public class MonsterDAOAPI implements MonsterDAO{


    private final ApiHelper api;
    private static final String url = "https://balandrau.salle.url.edu/dpoo/shared/monsters";
    private final Gson gson;

    /**
     * Constructor of the class, creates the api connection and the gson.
     * @throws ApiConection if it cant make the connection to the API it trows this exception.
     */
    public MonsterDAOAPI() throws ApiConection {
        this.api = new ApiHelper();
        GsonBuilder gsonBuilder = new GsonBuilder();
        gsonBuilder.registerTypeAdapter(Character.class, new CharacterClass());
        this.gson = gsonBuilder.setPrettyPrinting().create();
    }

    /**
     * Method that reads all the monsters saved in the API.
     * @return an array list of all the monsters.
     */
    @Override
    public Monster[] readAll() {
        try{
            return gson.fromJson(api.getFromUrl(url), Monster[].class);
        } catch (IOException e) {
            return new Monster[0];
        }
    }
}
