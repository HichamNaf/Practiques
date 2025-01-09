package persistence.CharacterPersistence;
import business.entities.Character;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/**
 * Class that contains all the methods needed related to creating, deleting and reading the jason file that contains
 * the characters.
 *
 * @author Hicham Naf
 * @version 4.0
 */
public class CharacterDAOGSON implements CharacterDAO {
    private final String path = "filesjsons/characters.json";
    private  final File file;
    private Gson gson;
    // Tenim el constructor del CHaracterDAO que creem un constuctor Gson del json que esta en el path.

    /**
     *CharacterDAOGSON Constructor, creates the file path and the Gson reader with the serializer and deserializer.
     */
    public CharacterDAOGSON(){
        file = new File(path);
        GsonBuilder gsonBuilder = new GsonBuilder();
        gsonBuilder.registerTypeAdapter(Character.class, new CharacterClass());
        this.gson = gsonBuilder.setPrettyPrinting().create();}
    // Aquesta funcio la fem servir per guardar tot una llista de characters en el json

    /**
     * Method to write all the list of characters that we get in the json file Characters.json.
     * In the json file we cant add a character only because it overwrites all that we have saved,
     * for that reason we need to write all that we have saved again.
     * @param character a list of Characters that we need to write
     */
    public void writeAll(List<Character> character){
        Character[] characters = character.toArray(new Character[0]);
        try {
            FileWriter writer = new FileWriter(path);
            gson.toJson(characters, writer);
            writer.flush();
            writer.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    //Amb aquesta funcio llegim tot el json, en el cas de que el json estigui buid
    //fem un catch i retornem una llista buida.

    /**
     * Method that reads all json characters.
     * @return an array of Characters that are in the json file, if it's empty we return a empty array.
     */
    public Character[] readAll(){
        try {
            FileReader reader = new FileReader(path);
            Character[] ch = gson.fromJson(reader, Character[].class);
            return ch;
        }catch (FileNotFoundException e){
            return new Character[0];
        }
    }
    //Amb aquesta funcio afegim un character a la llista, primer
    //creem un array on hi guardem el character que volem i hi afegim
    //tots els que tenim en el json amb un readAll perque quan escrivim
    // en el json, tota la informació que hi havia en aquesta s'esborra
    // per aixo primer la hem de llegir per tornar-la a escriure.

    /**
     * method that gets a Character and uses the readAll and writeAll methods to save it in the json file.
     * @param character one instance of character that we will save in the file.
     */
    public void createCharacter(Character character){
        List<Character> addChar = new ArrayList<>();
        addChar.add(character);
        if (file.length() != 0){
            Collections.addAll(addChar, readAll());
        }
        writeAll(addChar);
    }
    //L'utilitzem per eliminar un character de la llista,
    //aixo ho fem utilitzant un index, primer llegim tot
    // el json i ho guardem en un array, llavors esborrem
    //el character que volem i tornem a guardar aquesta nova llista.

    /**
     * Method that removes a character from the json file
     * @param ind an integer that indicates the position of the character that we need to delete.
     */
    public void removeCharacter(int ind){
        List<Character> charList = new ArrayList<>();
        Character[] readChar = readAll();
        if (Collections.addAll(charList, readChar)){
            charList.remove(ind);
            writeAll(charList);
        }
    }
}
