import business.AdventureManager;
import business.CharacterManager;
import business.GameManager;
import persistence.*;
import persistence.CharacterPersistence.CharacterDAO;
import persistence.CharacterPersistence.CharacterDAOAPI;
import persistence.CharacterPersistence.CharacterDAOGSON;
import persistence.exception.ApiConection;
import presentation.Controller;
import presentation.Menu;

import java.io.FileNotFoundException;
/**
 * Tha project main class, just holds the main methods.
 *
 * @author Hicham Naf
 * @version 4.0
 */

public class Main {
    /**
     * The game's main method, it functions is inicialitza-te the class and the DAO interfaces.
     * @param args The program's arguments
     */
    public static void main(String[] args) {
        // crear la clase main
        Menu menu = new Menu();
        //Inicialitzar les interficies de persistencia
        CharacterDAO characterDAO = null;
        AdventureDAO adventureDAO = null;
        MonsterDAO monsterDAO = null;

        //Varriable que utilitzo per comprovar si les la pesistencia en Cloud i local no estan disponibles.
        int Error = 0 ;
        //Mostrar per pantalla el menu inicial i demanar quin tipus de persistencia es vol
        menu.startGame();
        //Demanar si es vol Cloud o local
        int option = menu.askForInteger("Invalid Option\n-> Answer: ",1,2);
        //Misatge d'espera
        menu.showMessage("Loading data...");
        //Comensu primer per la opcio de cloud així si hi ha algun problema pasem a local
        if (option == 2){
                //Carreguem les clases de persistencia a les interficies i comprovem que podem accedir al Cloud
                try {
                    characterDAO = new CharacterDAOAPI();
                    adventureDAO = new AdventureDAOAPI();
                    monsterDAO = new MonsterDAOAPI();
                }catch (ApiConection e){
                    //Mostrem un misatge d'error de que no es pot accedir al Cloud si salta un error
                    menu.errorData();
                    //Cambiem la opcio a local
                    option = 1;
                }}
        if (option == 1) {
            try {
                //Carregar les clases de persistencia a les interficies, aqui nomes podem tenir error en l'archiu de monster
                characterDAO = new CharacterDAOGSON();
                adventureDAO = new AdventureDAOGSON();
                monsterDAO = new MonstersDAOGSON();
            }catch (FileNotFoundException e){
                //Mostrem un misatge d'error de que l'archiu monsters.json no existeix i no podem continuar.
                menu.errorData2();
                //Posem a 1 la variable Error indicant que no podem fer servir cap persistencia
                Error = 1;
            }}
        if (Error == 0){
            //Si no ha hagut cap problema, inicialitzem totes les clases
            AdventureManager AdventureManager = new AdventureManager(adventureDAO, monsterDAO);
            CharacterManager CharacterManager = new CharacterManager(characterDAO);
            GameManager GameManager = new GameManager(CharacterManager, AdventureManager);

            Controller controller = new Controller(menu, CharacterManager, AdventureManager, GameManager);
            //Mostrar misatge de que tot ha anat be
            menu.dataOk();
            //Afegir un listener que és el controler al GameManager per a que li vaigui notificant tot el que va pasant
            GameManager.addListener(controller);
            //Executar el run del controller
            controller.run();}
}}




