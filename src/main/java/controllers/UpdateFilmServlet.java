package controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.FilmDAO;
import models.Film;

/**
 * Servlet implementation class UpdateFilmServlet This class updates the film
 * object.
 */
@WebServlet("/update")
public class UpdateFilmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateFilmServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		FilmDAO dao = FilmDAO.INSTANCE;
		Film film = null;
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			film = dao.getFilmByID(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(film);
		request.setAttribute("film", film);
		RequestDispatcher dispatcher = request.getRequestDispatcher("update-film.jsp");
		dispatcher.include(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String director = request.getParameter("director");
		String stars = request.getParameter("stars");
		String review = request.getParameter("review");
		int year = 0;
		try {
			year = Integer.parseInt(request.getParameter("year"));
		} catch (NumberFormatException e) {
			System.out.println("Invalid year format. Please enter a valid integer.");
		}
		FilmDAO filmDAO = FilmDAO.INSTANCE;
		Film updatedFilm = new Film(id, title, year, director, stars, review);
		if (year > 0) {
			try {
				filmDAO.updateFilm(updatedFilm);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("update-message.jsp");
		}
	}
}
