package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import models.Film;

/**
 * This enum manage a connection with database.
 */
public enum FilmDAO {
	INSTANCE;

	Film oneFilm = null;
	Film foundFilm = null;
	Connection connection = null;
	Statement statement = null;
	String user = "null";
	String password = "null";
	String url = "jdbc:mysql://localhost:6306/" + user;

	/**
	 * Get Database Connection
	 *
	 * @return Statement Object
	 */
	private void openConnection() {
		// loading jdbc driver for mysql
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			System.out.println(e);
		}

		// connecting to database
		try {
			// connection string for demos database, username demos, password demos
			connection = DriverManager.getConnection(url, user, password);
			statement = connection.createStatement();
		} catch (SQLException se) {
			System.out.println(se);
		}
	}

	/**
	 * Close any open database connection
	 *
	 */
	private void closeConnection() {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private Film getNextFilm(ResultSet result) {
		Film thisFilm = null;
		try {
			thisFilm = new Film(result.getInt("id"), result.getString("title"), result.getInt("year"),
					result.getString("director"), result.getString("stars"), result.getString("review"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return thisFilm;
	}

	/**
	 * Retrieve all Films
	 *
	 * @return Collection of all films found in the database
	 * @throws SQLException
	 */
	public ArrayList<Film> getAllFilms() throws SQLException {

		ArrayList<Film> allFilms = new ArrayList<>();
		openConnection();

		// Create select statement and execute it
		try {
			String selectSQL = "SELECT id, title, year, director, stars, review FROM films;";
			ResultSet queryResult = statement.executeQuery(selectSQL);
			// Retrieve the results
			while (queryResult.next()) {
				oneFilm = getNextFilm(queryResult);
				System.out.print(oneFilm);
				allFilms.add(oneFilm);
			}

			statement.close();
			closeConnection();
		} catch (SQLException se) {
			throw new SQLException("Film Collection Not Found");
		}
		return allFilms;
	}

	/**
	 * Retrieve Film by id
	 *
	 * @param id
	 * @return a film object
	 * @throws SQLException
	 */
	public Film getFilmByID(int id) throws SQLException {

		openConnection();
		oneFilm = null;
		PreparedStatement statement = null;
		// Create select statement and execute it
		String selectSQL = "SELECT id, title, year, director, stars, review FROM films WHERE id=?;";
		try {
			statement = connection.prepareStatement(selectSQL);
			statement.setInt(1, id);

			ResultSet queryResult = statement.executeQuery();
			// Retrieve the results
			while (queryResult.next()) {
				oneFilm = getNextFilm(queryResult);
			}

			statement.close();
			closeConnection();
		} catch (SQLException se) {
			throw new SQLException("Film Not Found");
		}

		return oneFilm;
	}

	/***
	 * Deletes films by the given id
	 *
	 * @param id
	 * @throws SQLException
	 *
	 */
	public void deleteFilmByID(int id) throws SQLException {
		openConnection();
		PreparedStatement statement = null;
		// Create remove statement and execute it
		String removeSQL = "DELETE FROM films WHERE id=?;";
		try {
			statement = connection.prepareStatement(removeSQL);
			statement.setInt(1, id);
			statement.executeUpdate();
			statement.close();
			closeConnection();
		} catch (SQLException se) {
			throw new SQLException("Film Not Deleted");
		}

	}

	/**
	 * Inserts a film to the database
	 *
	 * @param film object
	 * @throws SQLException
	 */

	public void insertFilm(Film film) throws SQLException {

		try {
			openConnection();
			// Create insert statement and execute it
			String insertSQL = "INSERT INTO films (title, year, director, stars, review) VALUES(?,?,?,?,?);";
			try (PreparedStatement statement = connection.prepareStatement(insertSQL)) {
				statement.setString(1, film.getTitle());
				statement.setInt(2, film.getYear());
				statement.setString(3, film.getDirector());
				statement.setString(4, film.getStars());
				statement.setString(5, film.getReview());
				statement.executeUpdate();
				statement.close();
			}
			closeConnection();
		} catch (SQLException e) {
			throw new SQLException("Film Not Added");
		}
	}

	/**
	 * Update a film in the database
	 *
	 * @param film object
	 * @throws SQLException
	 */
	public void updateFilm(Film film) throws SQLException {

		try {
			openConnection();
			// Create update statement and execute it
			String updateSQL = "UPDATE films SET title=?, year=?, director=?, stars=?, review=? WHERE id=?;";

			try (PreparedStatement statement = connection.prepareStatement(updateSQL)) {
				statement.setString(1, film.getTitle());
				statement.setInt(2, film.getYear());
				statement.setString(3, film.getDirector());
				statement.setString(4, film.getStars());
				statement.setString(5, film.getReview());
				statement.setInt(6, film.getId());
				statement.executeUpdate();
				statement.close();
			}
			closeConnection();
		} catch (SQLException e) {
			throw new SQLException("Film Not Updated");
		}
	}

	/**
	 * Finds the films given title, year or director.
	 *
	 * @param a string of searchTerm
	 * @return an array of films with found result
	 * @throws SQLException
	 */
	public ArrayList<Film> searchFilms(String searchTerm) throws SQLException {
		ArrayList<Film> foundFilms = new ArrayList<>();
		try {
			openConnection();
			// Create select statement and execute it. String Values are converted to
			// lowercase to ignore the case sensitivity. Year is casted to a string.
			String selectSQL = "SELECT id, title, CAST(year AS CHAR) AS year,  director, stars, review \n"
					+ "FROM films \n"
					+ "WHERE LOWER(title) LIKE ? OR LOWER(director) LIKE ? OR CAST(year AS CHAR) = ?;";
			try (PreparedStatement statement = connection.prepareStatement(selectSQL)) {
				statement.setString(1, "%" + searchTerm.toLowerCase() + "%");
				statement.setString(2, "%" + searchTerm.toLowerCase() + "%");
				statement.setString(3, searchTerm);

				ResultSet queryResult = statement.executeQuery();
				// Retrieve the results
				while (queryResult.next()) {
					Film foundFilm = getNextFilm(queryResult);
					foundFilms.add(foundFilm);
				}
				statement.close();
			}
		} catch (SQLException se) {
			throw new SQLException("Film Not Found");
		} finally {
			closeConnection();
		}
		return foundFilms;
	}
}
