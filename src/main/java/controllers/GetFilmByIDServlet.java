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
 * Servlet implementation class GetFilmByIDServlet
 * This class get a film given by id from the database.
 */
@WebServlet("/film")
public class GetFilmByIDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetFilmByIDServlet() {
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

		RequestDispatcher dispatcher = request.getRequestDispatcher("film.jsp");
		dispatcher.include(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
