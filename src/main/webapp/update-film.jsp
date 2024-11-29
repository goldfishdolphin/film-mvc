<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page import="models.Film"%> <%@ page
import="controllers.*"%> <%@ page import="java.util.ArrayList"%> <%@taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Update film</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <link href="./css/site.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
    <h1 class="center">Film Collection</h1>

    <nav class="navbar navbar-dark bg-dark">
      <div class="container-fluid">
        <button class="btn btn-outline-dark">
          <a class="navbar-brand" href="/FilmMVC/index">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="20"
              height="20"
              fill="currentColor"
              class="bi bi-house"
              viewBox="0 0 16 16"
            >
              <path
                d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5z"
              />
            </svg>
            Home
          </a>
        </button>

        <form action="./add-film" method="get">
          <input class="btn btn-warning" type="submit" value="Add a new film" />
        </form>
        <form class="d-flex" action="./search" method="get">
          <input
            class="form-control me-2"
            type="text"
            placeholder="Search"
            aria-label="Search"
            name="searchTerm"
          />
          <button class="btn btn-success" type="submit">Search</button>
        </form>
      </div>
    </nav>
    <c:set value="${requestScope.film}" var="f" />
    <h1>${f.title}</h1>
    <ul>
      <li><b>ID: </b> ${f.id}</li>
      <li><b>Title: </b> ${f.title}</li>
      <li><b>Year: </b> ${f.year}</li>
      <li><b>Stars: </b> ${f.stars}</li>
      <li><b>Director: </b>${f.director}</li>
      <li><b>Review: </b>${f.review}</li>
    </ul>
    <!-- Button trigger modal -->
    <button
      type="button"
      class="btn btn-primary"
      data-bs-toggle="modal"
      data-bs-target="#exampleModal"
    >
      Update the Film Details
    </button>

  
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">${f.title}</h5>
      </div>
      <div class="modal-body">
        <form method="post" id="filmform" class="form-group">
          <div class="form-group">
            <label for="title">Title:</label>
            <input type="text" class="form-control" id="title" name="title" value="${f.title}" required>
          </div>
          <div class="form-group">
            <label for="year">Year:</label>
            <input type="number" class="form-control" id="year" name="year" value="${f.year}" min="1900" required>
          </div>
          <div class="form-group">
            <label for="director">Director:</label>
            <input type="text" class="form-control" id="director" name="director" value="${f.director}" required>
          </div>
          <div class="form-group">
            <label for="stars">Stars:</label>
            <input type="text" class="form-control" id="stars" name="stars" value="${f.stars}" required>
          </div>
          <div class="form-group">
            <label for="review">Review:</label>
            <textarea class="form-control" id="review" name="review" required>${f.review}</textarea>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">Save changes</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

    <footer class="text-center p-4 bg-dark text-light fixed-bottom">
      <p>
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="16"
          height="16"
          viewBox="0 0 16 16"
          fill="none"
        >
          <path
            d="M16 8C16 12.4183 12.4183 16 8 16C3.58172 16 0 12.4183 0 8C0 3.58172 3.58172 0 8 0C12.4183 0 16 3.58172 16 8ZM8.14648 4.99219C9.10742 4.99219 9.78711 5.625 9.875 6.50391H11.1699V6.41602C11.0762 4.89844 9.82227 3.84375 8.14062 3.84375C6.07227 3.84375 4.87109 5.2207 4.87109 7.48242V8.55469C4.87109 10.8223 6.04883 12.1582 8.14062 12.1582C9.81641 12.1582 11.0703 11.1387 11.1699 9.69141V9.59766H9.875C9.78711 10.4297 9.125 11.0156 8.14648 11.0156C6.92188 11.0156 6.21875 10.125 6.21875 8.55469V7.49414C6.21875 5.91211 6.93359 4.99219 8.14648 4.99219Z"
            fill="white"
          />
        </svg>
        Naureen Imran | Manchester Metropolitan University |
        <span id="currentYear"></span>
      </p>
      <script>
        document.getElementById("currentYear").innerHTML =
          new Date().getFullYear();
      </script>
    </footer>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
