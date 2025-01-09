package business;
//Listener que l'hi va notificant al controller tot lo que esta pasant en el gameManager

/**
 * Interfice that uses the GameManager to talk with the controller.
 *
 *@author Hicham Naf
 *@version 4.0
 */
public interface GameListener {
    /**
     * Method that gets a message to tell the controller.
     * @param msg a String that contains an event occurred during the game.
     */
    void notifyGameEvents(String msg);
}
