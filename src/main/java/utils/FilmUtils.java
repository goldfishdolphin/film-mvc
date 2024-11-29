package utils;

import java.sql.SQLException;

import database.FilmDAO;
import models.Film;

public class FilmUtils {
	/**
	 * This methods checks if a film exists in the database.
	 * @param id
	 * @return
	 */
	public static boolean filmExists(int id) {
		FilmDAO filmDAO = FilmDAO.INSTANCE;
		Film film = null;
		try {
			film = filmDAO.getFilmByID(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return film != null;
	}

}
