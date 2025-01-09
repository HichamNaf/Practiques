package persistence;

import business.entities.Adventure;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.io.FileNotFoundException;
/**
 * Class that contains all the methods needed related to creating, and reading the json file that contains
 * the adventure.
 *
 * @author Hicham Naf
 * @version 4.0
 */
//Aquesta clase es practicament igual que el characterDAOGSON
public class AdventureDAOGSON implements AdventureDAO{

    private final String path = "filesjsons/adventures.json";
    private  final File file;
    private Gson gson;

    /**
     * Constructor of the class, creates the path file and the gson.
     */
    public AdventureDAOGSON(){
        file = new File(path);
        gson = new GsonBuilder().setPrettyPrinting().create();
        }

    /**
     * Method to write all the list of adventures that we get in the json file adventure.json.
     * In the json file we cant add an adventure only because it overwrites all that we have saved,
     * for that reason we need to write all that we have saved again.
     * @param adventure a List of adventures to save
     */
    private void writeAll(List<Adventure> adventure){
        try {
            FileWriter writer = new FileWriter(path);
            gson.toJson(adventure, writer);
            writer.close();
        }catch (IOException e){
            throw new RuntimeException(e);
        }
    }

    /**
     * Method that reads all json adventure.
     * @return return an array list of all adventures saved.
     */
    public Adventure[] readAll(){
        try {
            FileReader reader = new FileReader(path);
            return gson.fromJson(reader, Adventure[].class);
        }catch (FileNotFoundException e){
            return new Adventure[0];
        }
    }

    /**
     * method that gets an adventure and uses the readAll and writeAll methods to save it in the json file.
     * @param adventure an instance of class adventure to save in the file.
     */
    public void createAdventure(Adventure adventure){
        List<Adventure> addAdv = new ArrayList<>();
        addAdv.add(adventure);
        if (file.length() != 0){
            Collections.addAll(addAdv, readAll());
        }
        writeAll(addAdv);
    }
}

