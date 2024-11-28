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
import utils.FilmUtils;

/**
 * Servlet implementation class DelServlet This class handles a delete request
 * to remove a film object from the database.
 */
@WebServlet("/delete")
public class DelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DelServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id;
		id = Integer.parseInt(request.getParameter("id"));
		FilmDAO filmDAO = FilmDAO.INSTANCE;

		if (id > 0 && FilmUtils.filmExists(id)) { // check condition if id is a valid integer and exists in the database
			try {
				filmDAO.deleteFilmByID(id);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("delete-film.jsp");
			dispatcher.include(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
