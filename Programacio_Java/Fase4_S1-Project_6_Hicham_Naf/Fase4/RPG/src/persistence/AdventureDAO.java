package persistence;

import business.entities.Adventure;

//Aquest interpreter carrega les funcions per poder llegir de gson o la API.

/**
 * Interface that calls the method to read and write files on api or json, depend of the classe loaded.
 *
 */

public interface AdventureDAO {
    /**
     * Method that returns an array of all adventures saved.
     * @return array list of all adventures.
     */
    Adventure[] readAll();

    /**
     * Method that saves one adventure in persistence.
     * @param adventure an instance of one adventure.
     */
    void createAdventure(Adventure adventure);
}
