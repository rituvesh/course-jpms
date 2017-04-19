package hibernate;

public class HibernateException extends Exception {

	public HibernateException(String message) {
		super(message);
	}

	public HibernateException(String message, Throwable cause) {
		super(message, cause);
	}

}
