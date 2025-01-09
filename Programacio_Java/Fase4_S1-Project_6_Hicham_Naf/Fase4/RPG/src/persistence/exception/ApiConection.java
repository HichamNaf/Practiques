package persistence.exception;

/**
 * Class For the api exception
 */
public class ApiConection extends Exception{
    /**
     * Method that return the exception
     * @param message the exception message
     * @param cause the cause of the exception
     */
    public ApiConection(String message, Exception cause){
        super(message, cause);
    }
}
