package controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.FilmDAO;
import models.Film;

/**
 * Servlet implementation class SearchFilmServlet
 * This servelet handles search request
 */
@WebServlet("/search")
public class SearchFilmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchFilmServlet() {
		super();
	}

	/**
	 * This Http method get the results of a search given the search term.
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String searchTerm = request.getParameter("searchTerm");
		FilmDAO dao =  FilmDAO.INSTANCE;
		if (searchTerm != null) {
			ArrayList<Film> foundFilms = null;
			try {
				foundFilms = dao.searchFilms(searchTerm);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("filmSearchArray", foundFilms);
			RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
			dispatcher.include(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
