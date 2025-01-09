package business;

import business.entities.Character;
import business.entities.Characters.*;
import persistence.CharacterPersistence.CharacterDAO;

import java.util.ArrayList;
import java.util.List;

/**
 *Class that manages all related to the character.
 *
 * @author Hicham Naf
 * @version 4.0
 */
public class CharacterManager {
    private CharacterDAO characterDAO;
    //Constructor del CharacterManager

    /**
     * Constructor of the class that gets the dao to talk with persistence selected.
     * @param characterDAO an instance of the class characterDAO.
     */
    public CharacterManager(CharacterDAO characterDAO){
        this.characterDAO = characterDAO;
    }

    //Aquesta funcio ens serveix per crear un personatge en el json

    /**
     * Method used to save the character in persistence
     * @param name String that contains the name of the character
     * @param player String that contains the name of the player
     * @param xp Integer that contains the experience
     * @param body Integer that contains the stat body
     * @param mind Integer that contains the stat mind
     * @param spirit Integer that contains the stat spirit
     * @param classe String that contains the class of the character
     */
    public void createCharacter(String name, String player, int xp, int body, int mind, int spirit, String classe) {
        //Primer calculem l'experiencia que ha de tindre depenent del nivell que s'ha indicat
        //Aixo ho fem amb un simple if, si el nivell es 1, l'experiencia sera 0, si el nivell es més gran que 1
        //l'experiencia minima és 100 vegades el nivell-1-
        Character character;
        if(xp==1){
            xp=0;
        }else{
            xp=(xp-1)*100;
        }
        // creem la clase que toca i hi guardem totes les dades.
        switch (classe) {
            case "Adventurer" -> character = new Adventurer(name, player, xp, body, mind, spirit);
            case "Cleric" -> character = new Cleric(name, player, xp, body, mind, spirit);
            case "Wizard" -> character = new Wizard(name, player, xp, body, mind, spirit);
            case "Warrior" -> character = new Warrior(name, player, xp, body, mind, spirit);
            case "Champion" -> character = new Champion(name, player, xp, body, mind, spirit);
            case "Paladin" -> character = new Paladin(name, player, xp, body, mind, spirit);
            default -> character = null;
        }
        //Guardem aquesta clase al json.
        characterDAO.createCharacter(character);
    }
    //Aquesta funcio ens serveix per llistar els characters d'un player

    /**
     * Method that returns all the characters of a player. if the String name is void we return all the characters.
     * @param name the name String of the player.
     * @return a list of all the names of the player characters.
     */
    public List<String> listAllCharacters(String name){
        //Primer creem una llista de clases character on hi guardem tots els characters del json.
        Character[] charList = characterDAO.readAll();
        //Creem una nova llista on hi anem acomulant els characters que volem
        List<String> list = new ArrayList<>();
        //Aixo ho fem amb un for que recorre tot l'arrat charList
        for (Character charact : charList) {
            //Primer pasem a minuscules el nom que volem
            name= name.toLowerCase();
            //Llavors fem un get del player de la clase
            String scharact = charact.getPlayer().toLowerCase();
            //Si els dos noms son iguals o el nom és "", guardem el character a la llista
            if(scharact.equals(name) || name=="")
                list.add(charact.getName());
        }
        //Finalment retornem la llista amb tots els characters
        return list;
    }
    //Aquesta funcio la utilitzem per eliminar un character del json

    /**
     * Method that deletes a character in persistence
     * @param name String that contains the name of the character that we need to delete.
     */
    public void removeCharacter(String name){
        //Primer guardem tot el json en un array
        Character[] charList = characterDAO.readAll();
        int index=0;
        //Llavors fem un bucle on busquem aquest nom en la llista, si coincideix amb algun character l'eliminem
        //Ulitlitzem un index que va augmentant de valor perque per eliminar un charecter necesitem saver la seva
        //posició
        for (Character charact : charList) {
            if (name.equalsIgnoreCase(charact.getName())){
                characterDAO.removeCharacter(index);
            }
            index++;
        }

    }
    //Ens serveix per buscar un character en el json, si el name que reb aquesta funcio coincideix
    //amb el nom d'un character retorna true, sino retorna false.
    /**
     * Method that looks in the persistence if the name introduced exists in the persistence.
     * @param name String that contains the name of the character.
     * @return boolean that is truie if the character exists and false if not.
     */

    public boolean findName(String name){
        Character[] charList = characterDAO.readAll();
        for (Character charact : charList) {
            if (name.equalsIgnoreCase(charact.getName())){
                return true;
            }
        }
        return false;
    }
    //Aquesta funcio ens retorna tota la informacio d'un character

    /**
     * Method that returns a String that contains all the information of a character.
     * @param character String that contains the name of a character
     * @return String that contains all the information of the character.
     */
    public String getAllData(String character){
        //Primer creem una llista amb tots els characters
        Character[] charList = characterDAO.readAll();
        String data = "";
        //Llavors busquem en la llista el character amb el nom que volem i extreiem tota la seva infirmació
        // en un string.
        for (Character charact : charList) {
            if (character.equalsIgnoreCase(charact.getName())){
                 data = charact.getAllData();
                break;
            }
        }
        return data;
    }
    //Aquesta funcio ens serveix per tirar els daus que necesitem per quan volem generar
    //les estadistiques, quan creem un personatge sempre tirem el mateix dau 2d6

    /**
     * Method that throws the dice to calculate the stats of a character
     * @return an array of all the values of the dice trowed.
     */
    public int[] tirarDau(){
        //Lo que fem es cridar la funcio a calculs que tira el dau i lo que ens retorna
        // és un array on a l'index 0 hi trovem el valor total i la resta de index els valors
        //dels daus per separat. Aixo ho fem perque hem de mostrar el total i els dos valors que
        // ens han tocat. Si nomes haguesim de mostrar el total ens sobraria un unic integer.

        int[] dau = Calculs.tirarDau("2d6");
        return dau;
    }

    //Aquesta funcio ens serveix per generar les estadistiques
    // Rebem el valor dels daus i utilitzem if's per saver quina estadistica és.

    /**
     * Method that calculate the statistics based of the dice number.
     * @param e Integer that contains the dice number
     * @return Integer that indicates the statistics
     */
    public int generateStadistics(int e){
        if (e==2){
            return -1;
        } else if (2< e && e <6) {
            return 0;
        } else if (5< e && e <10) {
            return 1;
        } else if (9< e && e <12) {
            return 2;
        }else {
            return 3;
        }
    }
    //Funcio que ens retorna una clase amb tota la informació del personatge que l'hi indiquem

    /**
     * Method that gets a character for the persistence.
     * @param character String name of the character
     * @return instance of the character that have the name indicated.
     */
    public Character getCharacter(String character){
        Character[] charList = characterDAO.readAll();
        //Llavors busquem en la llista el character amb el nom que volem
        for (Character charact : charList) {
            if (character.equalsIgnoreCase(charact.getName())){
                return charact;
            }
        }
        return charList[0];
    }
    //Funció que serveix per guardar l'expercienci que guanyem al acabar una aventura

    /**
     * Method that saves the experience of the character.
     * @param name String name of the character
     * @param xp Integer of the total experience that won in the adventure.
     */
    public void saveExperience(String name, int xp){
        Character[] charList = characterDAO.readAll();
        List<Character> editChar = new ArrayList<>();
        editChar.clear();
        for (Character charact : charList) {
            if (name.equalsIgnoreCase(charact.getName())){
                charact.setXp(xp);
                charact= charact.upgradeCharacterClass();
            }
            editChar.add(charact);
    }
        characterDAO.writeAll(editChar);
    }
    //En aquesta funció l'hi pasem la clase base del personatge i el nivell inicial i mirem si ha d'evolucionar o no.

    /**
     * Method that calculat see if a class evolves.
     * @param class_ String name of the starter class
     * @param Lvl Integer that contains the actual level of the character.
     * @return a String of the actual class according of the level.
     */
    public String calcClass(String class_, int Lvl){

        if(class_.equalsIgnoreCase("adventurer")||class_.equalsIgnoreCase("warrior")||class_.equalsIgnoreCase("champion")){
        if (Lvl<4){
            return "Adventurer";
        } else if (3<Lvl && Lvl< 8) {
            return "Warrior";
        }else {
            return "Champion";
        }
        } else if (class_.equalsIgnoreCase("cleric")||class_.equalsIgnoreCase("paladin")) {
            if (Lvl<5){
                return "Cleric";
            } else {
                return "Paladin";
            }
        } else if (class_.equalsIgnoreCase("Wizard")) {
            return "Wizard";
        }else {return "";}
    }
}
