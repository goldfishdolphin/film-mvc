<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="models.Film"%>
<%@ page import="controllers.*"%>
<%@ page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Result</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="./css/site.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
</head>
<body>
<h1 class="center">Film Collection</h1>

	<nav class="navbar navbar-light bg-light">
		<div class="container-fluid">
		<button class="btn btn-outline-dark">
			<a class="navbar-brand" href="/FilmMVC/index"> <svg
					xmlns="http://www.w3.org/2000/svg" width="20" height="20"
					fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
  <path
						d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5z" />
</svg> Home</a>
			</button>

			<form action="./add-film" method="get" class="form-group">
				<input class="btn btn-warning" type="submit"
					value="Add a new film">
			</form>
			<form class="d-flex" action="./search" method="get">
				<input class="form-control me-2" type="text" placeholder="Search"
					aria-label="Search" name=searchTerm>
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>

		</div>
	</nav>
<h1>Search Result</h1>

      <c:choose>
            <c:when test="${empty filmSearchArray}">
                <tr>
                    <colspan="6" class>No results found.
                </tr>
            </c:when>
            <c:otherwise>
            <table class="table">
		<thead>
		<tr>
		<th scope="col">ID</th>
		<th scope="col">Title</th>
		<th scope="col">Stars</th>
        <th scope="col">Year</th>
        <th scope="col">Director</th>
        <th scope="col">Review</th>
        <th scope="col">View</th>
		<th scope="col">Delete</th>
		<th scope="col">Update</th>
        </tr>
      </thead>
      <tbody class="table-group-divider">
      <c:forEach items="${filmSearchArray}" var="f">	
        <tr>
          <td>${f.id}</td>
          <td>${f.title}</td>
          <td>${f.stars}</td>
          <td>${f.year}</td>
          <td>${f.director}</td> 
          <td><button class="btn btn-success"> 
					<details>
							<summary>
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-chat-text" viewBox="0 0 16 16">
  <path d="M2.678 11.894a1 1 0 0 1 .287.801 11 11 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8 8 0 0 0 8 14c3.996 0 7-2.807 7-6s-3.004-6-7-6-7 2.808-7 6c0 1.468.617 2.83 1.678 3.894m-.493 3.905a22 22 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a10 10 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9 9 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105" />
<path d="M4 5.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8m0 2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5" /></svg> Review </summary> <p>${f.review}</p></details></button></td>

<td><a href="./film?id=${f.id}"><button class="btn btn-primary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
  <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2z"/>
  <path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8m0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5m0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5m-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0M4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0m0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0"/>
</svg> View</button></a></td>

<td><a href="./delete?id=<c:out value='${f.id}'/>"><button type="submit" class="btn btn-danger"><svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M11 1.5V2.5H14.5C14.7761 2.5 15 2.72386 15 3C15 3.27614 14.7761 3.5 14.5 3.5H13.9616L13.1088 14.1595C13.0257 15.1989 12.1579 16 11.1152 16H4.88479C3.84207 16 2.97431 15.1989 2.89116 14.1595L2.0384 3.5H1.5C1.22386 3.5 1 3.27614 1 3C1 2.72386 1.22386 2.5 1.5 2.5H5V1.5C5 0.671573 5.67157 0 6.5 0H9.5C10.3284 0 11 0.671573 11 1.5ZM6 1.5V2.5H10V1.5C10 1.22386 9.77614 1 9.5 1H6.5C6.22386 1 6 1.22386 6 1.5ZM4.49999 5.0285L4.99999 13.5285C5.0162 13.8042 5.25282 14.0145 5.52849 13.9983C5.80415 13.9821 6.01448 13.7454 5.99826 13.4698L5.49826 4.96978C5.48205 4.69411 5.24543 4.48379 4.96976 4.5C4.6941 4.51622 4.48377 4.75283 4.49999 5.0285ZM11.0302 4.50086C10.7546 4.48465 10.5179 4.69497 10.5017 4.97064L10.0017 13.4706C9.98552 13.7463 10.1958 13.9829 10.4715 13.9991C10.7472 14.0154 10.9838 13.805 11 13.5294L11.5 5.02936C11.5162 4.75369 11.3059 4.51708 11.0302 4.50086ZM8 4.5C7.72386 4.5 7.5 4.72386 7.5 5V13.5C7.5 13.7761 7.72386 14 8 14C8.27615 14 8.5 13.7761 8.5 13.5V5C8.5 4.72386 8.27615 4.5 8 4.5Z" fill="white" />
</svg> Delete</button></a></td>

<td><a href="./update?id=${f.id}"><button type="button"
								class="btn btn-dark" data-bs-toggle="modal"
								data-bs-target="#exampleModal">
								<svg width="16" height="16" viewBox="0 0 16 16" fill="none"
									xmlns="http://www.w3.org/2000/svg">
<path d="M12.1464 0.146447C12.3417 -0.0488155 12.6583 -0.0488155 12.8536 0.146447L15.8536 3.14645C16.0488 3.34171 16.0488 3.65829 15.8536 3.85355L5.85355 13.8536C5.80567 13.9014 5.74857 13.9391 5.6857 13.9642L0.685695 15.9642C0.499987 16.0385 0.287878 15.995 0.146446 15.8536C0.00501511 15.7121 -0.0385219 15.5 0.0357614 15.3143L2.03576 10.3143C2.06091 10.2514 2.09857 10.1943 2.14645 10.1464L12.1464 0.146447ZM11.2071 2.5L13.5 4.79289L14.7929 3.5L12.5 1.20711L11.2071 2.5ZM12.7929 5.5L10.5 3.20711L4 9.70711V10H4.5C4.77614 10 5 10.2239 5 10.5V11H5.5C5.77614 11 6 11.2239 6 11.5V12H6.29289L12.7929 5.5ZM3.03165 10.6755L2.92612 10.781L1.39753 14.6025L5.21902 13.0739L5.32454 12.9683C5.13495 12.8973 5 12.7144 5 12.5V12H4.5C4.22386 12 4 11.7761 4 11.5V11H3.5C3.2856 11 3.10271 10.865 3.03165 10.6755Z" fill="white" />
</svg> Update</button></a></td> 
          </tr>
        </c:forEach>
              </c:otherwise>
        </c:choose>
        </tbody>
    </table>
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
		crossorigin="anonymous"></script>
		

</body>
</html>