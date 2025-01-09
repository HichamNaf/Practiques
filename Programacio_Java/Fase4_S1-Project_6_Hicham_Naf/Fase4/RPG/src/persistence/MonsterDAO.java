package persistence;

import business.entities.Monster;
//Aquest interpreter carrega les funcions per poder llegir de gson o la API.
/**
 * Interface that calls the method to read and write files on api or json, depend of the classe loaded.
 *
 */

public interface MonsterDAO {

    /**
     * Method that returns a array of all monsters saved.
     * @return array list of all monsters.
     */
    Monster[] readAll();
}
