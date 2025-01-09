package presentation;

import java.util.InputMismatchException;
import java.util.Scanner;
//En la clase menu hi ha un llistat de Strings que es mostren per pantalla, també s'encarrega de mostrar tots els
//misatges i llegir lo que s'escriu per consola i comprovar que estigui en el format desitjat.

/**
 *The user interface. Its the class that talks with the user.
 * @author Hicham Naf
 * @version 4.0
 */
public class Menu {

    String SHOW_MENU = "\nThe tavern keeper looks at you and says:\n"+
            "“Welcome adventurer! How can I help you?”\n"+
            "\t1) Character creation \n" +
            "\t2) List characters\n" +
            "\t3) Create an adventure\n"+
            "\t4) Start an adventure\n"+
            "\t5) Exit\n\n";
    String SHOW_MENU_2 = "\nThe tavern keeper looks at you and says:\n"+
            "“Welcome adventurer! How can I help you?”\n"+
            "\t1) Character creation \n" +
            "\t2) List characters\n" +
            "\t3) Create an adventure\n"+
            "\t4) Start an adventure(disabled: create 3 characters first)\n"+
            "\t5) Exit\n\n";
    String ERROR_DATA = "Couldn’t connect to the remote server.\n" +
            "Reverting to local data.\n\n";
    String ERROR_DATA_2 = "Couldn’t connect to local data.\n";
    String DATA_OK ="\nData was successfully loaded.\n";
    String ASK_NAME = "\n\nTavern keeper: “Oh, so you are new to this land.”\n" +
            "“What’s your name?”\n\n"+"-> Enter your name: ";
    String NAME_EXIST = "Nome already registered";
    String WELCOME = "\nTavern keeper: “Hello, %s, be welcome.”\n" +
            "“And now, if I may break the fourth wall, who is your Player?”\n\n" +
            "-> Enter the player’s name: ";
    String ASK_EXP = "\nTavern keeper: “I see, I see...”\n" +
            "“Now, are you an experienced adventurer?”\n\n" +
            "-> Enter the character’s level [1..10]: ";
    String LVL_MSG = "\nTavern keeper: “Oh, so you are level %d!”\n" +
            "“Great, let me get a closer look at you...”\n\n" +
            "Generating your stats...\n\n";
    String SHOW_STATES = "Body: You rolled %d (%d and %d).\n"+
            "Mind: You rolled %d (%d and %d).\n"+
            "Spirit: You rolled %d (%d and %d).\n\n";
    String SHOW_STATES_2 = "Your stats are:\n - Body: %+d\n - Mind: %+d\n - Spirit: %+d\n\n";
    String CHARACTER_CREATED = "The new character %s has been created.\n\n";
    String ASK_NAME_LIST = "Tavern keeper: “Lads! They want to see you!”\n" +
            "“Who piques your interest?”\n\n" +
            "-> Enter the name of the Player to filter: ";
    String NO_PLAYER = "No Player founded";
    String COMENT_1 = "\nYou watch as some adventurers get up from their chairs and approach you.\n\n";
    String EXIT = "\nTavern keeper: “Are you leaving already? See you soon, adventurer.”";
    String SHOW_STATES_3 = "\nTavern keeper: “Hey %s get here; the boss wants to see you!”\n\n%s\n";
    String DELETE = "[Enter name to delete, or press enter to cancel]\n";
    String DELETE_2 = "Do you want to delete %s? ";
    String DELETE_3 = "\nTavern keeper: “I’m sorry kiddo, but you have to leave.”\n\n" +
            "Character %s left the Guild.\n\n";
    String NAME_ADVENTURE = "Tavern keeper: “Planning an adventure? Good luck with that!”\n" +
            "-> Name your adventure: ";
    String ASK_ENCOUNTERS = "\nTavern keeper: “You plan to undertake Strolling through Mordor, really?”\n\n" +
            "“How long will that take?”";
    String ASK_ENCOUNTERS_2 ="\n-> How many encounters do you want [1..4]: ";
    String SHOW_ENCOUNTERS = "\nTavern keeper: “%d encounters? That is too much for me...”\n\n";
    String ACTUAL_ENCOUNTER = "* Encounter %d / %d\n* Monsters in encounter\n";
    String EMPTY = "  # Empty\n\n";
    String ADVENTURE_OPTIONS = "\n1. Add monster\n" +
            "2. Remove monster\n" +
            "3. Continue\n";
    String ADVENTURE_OPTIONS_2 = " \n-> Enter an option [1..3]: ";
    String ADVENTURE_MSG = "Tavern keeper: “So, you are looking to go on an adventure?”\n" +
            "“Where do you fancy going?”\n\nAvailable adventures:\n";
    String ASK_ADVENTURE ="-> Choose an adventure:";
    String ASK_CHARACTERS = "%s it is!”\n" +
            "“And how many people shall join you?”\n\n" +
            "-> Choose a number of characters [3..%d]: ";
    String ASK_CHARACTERS_2 = "Tavern keeper: “Great, %d it is.”\n" +
            "“Who among these lads shall join you?”\n";
    String ASK_PARTY = "\n\n-----------------------------\n" +
            "Your party (%d / %d):\n";
    String ASK_PARTY_2 = "------------------------------\n" +
            "Available characters:\n";
    String ASK_MEMBER = "-> Choose character %d in your party:";
    String END_MEMBER = "------------------------------\n\n" +
            "Tavern keeper: “Great, good luck on your adventure lads!”\n\n\nThe “%s” will start soon...\n";

    //Un scanner per llegir
    /**
     * the scanner that uses all the methods to read from console
     */
    private static Scanner s = new Scanner(System.in);
    //Funcio per mostrar el missatge de carrega

    /**
     * Method that shows the loading screen
     */
    public void startGame(){
        showMessage(
                        "  ____ _               __ __ ____ ___ ___           _____\n" +
                        " / __/  (_) __ _ ___ / /___ / / / __// _ \\ / _ \\ / ___/\n" +
                        "_\\ \\  / // ' \\ / _ \\ / // -_) / /__ _\\ \\ / , _// ___// (_ /\n" +
                        "/___//_//_/_/_// .__//_/ \\__/ /____//___//_/|_|/_/ \\___/\n" +
                        "              /_/ " +
                "\nWelcome to Simple LSRPG.\n" +
                "Do you want to use your local or cloud data?\n" +
                                "\t1) Local data\n" +
                                "\t2) Cloud data\n\n-> Answer: ");
    }
    //Funcions per mostrar si hi ha hagut algun error o s'ha pogut carregar be la persistencia.

    /**
     * Method to show if it was an error during the data load in the API.
     */
    public void errorData(){
        showMessage(ERROR_DATA);
    }
    /**
     * Method to show if it was an error during the data load in the json files.
     */
    public void errorData2(){showMessage(ERROR_DATA_2);}
    /**
     * Method to show that the connection is ok.
     */
    public void dataOk(){
        showMessage(DATA_OK);
    }

    //Funcio per mostrar misatges per pantalla

    /**
     * the basic method for showing messages in the console
     * @param message a String that contains the message
     */
    public void showMessage(String message) {
        System.out.printf(message);
    }

    //Funcio per demanar un string, aquesta funcio comprova que el string introduit
    //no te cap caracter especial, la unica manera que hem trovat per fer aixó
    //Es fer un string que contingui tots els caracters especials i mirar si el
    // text introduit conté un d'aquests caracters, en el cas afirmatiu retorna null
    //si no te cap caracter especial, les inicials es posen en majuscula i ho retornem.

    /**
     * Method that gets a String and checks if it has any special character.
     * @param message the String message
     * @return the String message if it is correct or a null if not.
     */
    public String askForString(String message) {
        System.out.print(message);
        String str = s.nextLine();
        String[] str2 = str.split(" ");
        str = "";
        for (int i = 0; i < str2.length; i++) {
            String specialCharacters = " ªº!¡·#$%&'()*+,-./:;<=>?¿@[]^_`{|}~0123456789";
            for (int c = 0; c <=str2[i].length();++c){
                if(specialCharacters.contains(Character.toString(str2[i].charAt(0)))){
                    System.out.println("There is a special character in the Name");
                    return null;
                }
            }
            str2[i] = str2[i].toLowerCase();
            if (i==0) {
                str = str + str2[i].substring(0, 1).toUpperCase() + str2[i].substring(1);
            }
            else{
                str = str + " " + str2[i].substring(0, 1).toUpperCase() + str2[i].substring(1);
            }
            }
        return str;
        }
    //Demanem un string normal, aqui no comprovem si te o no te caracters especials

    /**
     * Method that reads the text introduced in the console.
     * @param message the message that we need to show before asking
     * @return the text introduced.
     */
    public String askForStr(String message) {
        System.out.print(message);
        return s.nextLine();
    }
    //L'utilitzem per demanar un integer

    /**
     * Method that asks for a number and checks if its Integer, asking again while the text introduced is not a number.
     * @param msg the message that we need to show before asking.
     * @return the number Integer introduced.
     */
    public int askForAnOption(String msg) {
        System.out.print(msg);
        do {
            try {
                int option = s.nextInt();;
                return option;
            } catch (InputMismatchException e) {
                System.out.printf("Invalid format, try again: ");
            } finally {
                s.nextLine();
            }
            }while (true);
    }
    //L'utilitzem per demanar un integer que estigui entre un rang de valors
    //No se surt d'aquesta funcio fins que s'introdueixi el valor correcte

    /**
     * Method that asks for an integer in a range of two numbers.
     * @param emessage the error message String that we need to show if the number introduced is not correct.
     * @param min the number Integer minimum asked.
     * @param max the number Integer maximum asked.
     * @return the number Integer introduced correctly.
     */
    public int askForInteger(String emessage, int min, int max) {
        int option = min - 1;
        do {
            try {
                option = s.nextInt();
                if (option < min || option > max) {
                    System.out.printf(emessage);
                }
            } catch (InputMismatchException e) {
                System.out.printf(emessage);
            } finally {
                s.nextLine();
            }
        } while (option < min || option > max);

        return option;
    }
    //Com l'anterior pero en aquest, si s'introdueix un valor fora del rang es retorna un 0.

    /**
     * The same as the previous method but this returns a 0 if the number intoduced it's not between the rang asked.
     * @param emessage a String that contains the error mesage that we will show if it's not correct the number.
     * @param min the number Integer minimum asked.
     * @param max the number Integer maximum asked.
     * @param msg the message String that we will shou before asking the number.
     * @return the number Integer introduced correctly. Or 0 if not.
     */
    public int askForInteger(String emessage, int min, int max, String msg) {
        System.out.printf(msg);
        int option = min - 1;
        do {
            try {
                option = s.nextInt();
                if (option < min || option > max) {
                    System.out.printf(emessage);
                    return 0;
                }
            } catch (InputMismatchException e) {
                System.out.printf(emessage);
            } finally {
                s.nextLine();
            }
        } while (option < min || option > max);

        return option;
    }
}
