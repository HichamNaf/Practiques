package persistence;

import business.entities.Monster;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
//Aquesta clase es practicament igual que el characterDAO, pero nomes necesitem el readAll, no hem d'escriure ni
//modificar res en el json, nomes llegir.
/**
 * Class that contains all the methods needed related to reading the json file that contains
 * the monsters.
 *
 * @author Hicham Naf
 * @version 4.0
 */
public class MonstersDAOGSON implements MonsterDAO{

    private static final String path = "filesjsons/monsters.json";
    private  final File file;
    private Gson gson;

    /**
     * Constructor that creates the file path and the gson
     * @throws FileNotFoundException if in the path cant find the file it trows this exception.
     */
    public MonstersDAOGSON() throws FileNotFoundException {
        file = new File(path);
        gson = new GsonBuilder().setPrettyPrinting().create();
        if(!file.exists()){
            throw new FileNotFoundException();
        }}

    /**
     * Method that reads all the monsters saved in the file
     * @return an array list of all the monsters.
     */
    public Monster[] readAll(){
        try {
            FileReader reader = new FileReader(path);
            return gson.fromJson(reader, Monster[].class);
        }catch (FileNotFoundException e){
            return new Monster[0];
        }
    }

}
