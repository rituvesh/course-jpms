package hibernate;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;

import static java.lang.String.format;

public class Hibernate {

	public static <T> T load(Class<T> type, int id) throws HibernateException {
		try {
			Constructor<T> constructor = type.getDeclaredConstructor();
			constructor.setAccessible(true);
			T instance = constructor.newInstance();

			Field idField = type.getDeclaredField("id");
			idField.setAccessible(true);
			idField.set(instance, id);

			return instance;
		} catch (ReflectiveOperationException ex) {
			String message = format("Loading %s with id '%s' failed.", type.getName(), id);
			throw new HibernateException(message, ex);
		}
	}

}
