package persistence;

import business.entities.Adventure;
import business.entities.Character;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import persistence.ApiHelper.ApiHelper;
import persistence.CharacterPersistence.CharacterClass;
import persistence.exception.ApiConection;

import java.io.IOException;
//Adaplta tota la part de percistencia per poder llegir i escriure en l'API
/**
 * Class that contains all the methods needed related to creating, and reading the API that contains
 * the adventure.
 *
 * @author Hicham Naf
 * @version 4.0
 */
public class AdventureDAOAPI implements AdventureDAO{
    private final ApiHelper api;
    private static final String url = "https://balandrau.salle.url.edu/dpoo/S1-Project_6/adventures";
    private final Gson gson;

    /**
     * Constructor of the class. Creates the api connection and the gson.
     * @throws ApiConection exception that is thrown when we cant make the connection with the api.
     */
    public AdventureDAOAPI() throws ApiConection {
        this.api = new ApiHelper();
        GsonBuilder gsonBuilder = new GsonBuilder();
        gsonBuilder.registerTypeAdapter(Character.class, new CharacterClass());
        this.gson = gsonBuilder.setPrettyPrinting().create();
    }

    /**
     * Method to read all the adventures
     * @return an array list of all the adventures.
     */
    @Override
    public Adventure[] readAll() {
        try{
            return gson.fromJson(api.getFromUrl(url), Adventure[].class);
        } catch (IOException e) {
            return new Adventure[0];
        }
    }

    /**
     * method that gets an Adventure and uses the readAll and writeAll methods to save it in the API.
     * @param adventure gets an instance of one adventure to save.
     */
    @Override
    public void createAdventure(Adventure adventure) {
        try {
            api.postToUrl(url,getStile(adventure));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    /**
     * Method that convert the instance class to a String format.
     *
     * @param adventure instance of one adventure
     * @return String format of the class to save it in the API.
     */
    private String getStile(Adventure adventure) {return gson.toJson(adventure);
    }
}
