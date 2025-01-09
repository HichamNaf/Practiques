package persistence.CharacterPersistence;

import business.entities.Adventure;
import business.entities.Character;
import business.entities.Characters.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import persistence.ApiHelper.ApiHelper;
import persistence.exception.ApiConection;

import java.io.IOException;
import java.util.List;
/**
 * Class that contains all the methods needed related to creating, deleting and reading the API that contains
 * the characters.
 *
 * @author Hicham Naf
 * @version 4.0
 */
//Adaplta tota la part de percistencia per poder llegir i escriure en l'API

public class CharacterDAOAPI implements CharacterDAO {


    private final ApiHelper api;
    private static final String url = "https://balandrau.salle.url.edu/dpoo/S1-Project_6/characters";
    private final Gson gson;

    /**
     *Constructor of the method, creates an ApiHelper class to reader and write, and a gson with the serializer and deserializer.
     *
     * @throws ApiConection an exception that it's throwed when we cant make the connection with the API.
     */
    public CharacterDAOAPI() throws ApiConection {
        api = new ApiHelper();
        GsonBuilder gsonBuilder = new GsonBuilder();
        gsonBuilder.registerTypeAdapter(Character.class, new CharacterClass());
        gsonBuilder.registerTypeAdapter(Adventure.class, new CharacterClass());
        gsonBuilder.registerTypeAdapter(Champion.class, new CharacterClass());
        gsonBuilder.registerTypeAdapter(Cleric.class, new CharacterClass());
        gsonBuilder.registerTypeAdapter(Paladin.class, new CharacterClass());
        gsonBuilder.registerTypeAdapter(Warrior.class, new CharacterClass());
        gsonBuilder.registerTypeAdapter(Wizard.class, new CharacterClass());
        this.gson = gsonBuilder.setPrettyPrinting().create();
    }
    //La unica diferencia respecte GSON, es que quan escrivim en un fixer json, es sobre escriu tota la informació,
    //Pero aixó en l'API no pasa, per no modificar lo que ja tinc en el codi nomes he modificat aquesta part
    //Per quan vuigui fer un writeAll, esborri tot el que hi ha i ho torni a escriure tot.
    /**
     * Method to write all the list of characters that we get in the api.
     *
     * @param character a list of Characters that we need to write
     */
    @Override
    public void writeAll(List<Character> character) {
        try{
            Character[] charList = readAll();
            for (int j = 0; j < charList.length; j++) {
                removeCharacter(0);
            }
            for (Character charact : character) {
                api.postToUrl(url,getStile(charact));
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    /**
     * Method that reads all characters from the api.
     * @return a array of Characters that are in the api, if it's empty we return a empty array.
     */

    @Override
    public Character[] readAll() {
        try{
            return gson.fromJson(api.getFromUrl(url), Character[].class);
        } catch (IOException e) {
            return new Character[0];
        }
    }



    /**
     * method that gets a Character and write it in the api, in the java file we need to read all the characters
     * in the file and save them again, in the api we don't have the override problem.
     * @param character one instance of character that we will save in the file.
     */
    @Override
    public void createCharacter(Character character) {
        try {
            api.postToUrl(url,getStile(character));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    /**
     * Method that propose is to adapt the content using the serializer and deserializer
     * @param character gets one character instance of type Character
     * @return a string format of this class serialized to save it in the Api.
     */
    private String getStile(Character character){return gson.toJson(character);}

    /**
     * Method to remove a character for the API. it gets the index of the character position and delete it.
     * @param ind integer that contains the index of the character that we need to delete.
     */
    @Override
    public void removeCharacter(int ind) {
        String url = this.url + "/" + ind;
        try {
            api.deleteFromUrl(url);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
