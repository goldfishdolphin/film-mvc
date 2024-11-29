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
 * Servlet implementation class InsertFilmServlet This class handles post
 * request to add a film object.
 */
@WebServlet("/add-film")
public class InsertFilmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertFilmServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("add-film.jsp");
		dispatcher.include(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		if (year > 0) {
			FilmDAO filmDAO = FilmDAO.INSTANCE;
			Film newFilm = new Film(title, year, director, stars, review);

			try {
				filmDAO.insertFilm(newFilm);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("insert-message.jsp");
		}
	}
}
