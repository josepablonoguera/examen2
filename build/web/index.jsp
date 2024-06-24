<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File, java.io.IOException, java.util.Scanner" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="index.jsp">MyWebApp</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="page1.jsp">Page 1</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="page2.jsp">Page 2</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="page3.jsp">Page 3</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="page4.jsp">Page 4</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Content -->
    <div class="container mt-5">
        <h1>Welcome to MyWebApp</h1>
        <p>This site is a Programming 2 exam.</p>

        <!-- Carousel -->
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://via.placeholder.com/800x400" class="d-block w-100" alt="Slide 1">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Slide 1</h5>
                        <p>Random Image 1</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://via.placeholder.com/800x400" class="d-block w-100" alt="Slide 2">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Slide 2</h5>
                        <p>Random Image 2</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://via.placeholder.com/800x400" class="d-block w-100" alt="Slide 3">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Slide 3</h5>
                        <p>Random Image 3</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <h2 class="mt-5">Exam Results</h2>

        <% 
        // Array con los nombres de las páginas
        String[] pages = {"page1.jsp", "page2.jsp", "page3.jsp", "page4.jsp"};
        for (int i = 0; i < pages.length; i++) {
            String pageName = pages[i];
            String fileName = application.getRealPath("/") + "../../user_code" + (i+1) + ".java";
            File file = new File(fileName);
            boolean isCompleted = file.exists();
        %>
        <div class="card mt-4">
            <div class="card-header">
                <h3><a href="<%= pageName %>">Exercise <%= i+1 %> (<%= isCompleted ? "Completed" : "Not Completed" %>)</a></h3>
            </div>
            <div class="card-body">
                <% if (isCompleted) { %>
                <pre>
                <%
                    try (Scanner scanner = new Scanner(file)) {
                        while (scanner.hasNextLine()) {
                            out.println(scanner.nextLine());
                        }
                    } catch (IOException e) {
                        out.println("Error reading the file: " + e.getMessage());
                    }
                %>
                </pre>
                <% } else { %>
                <p>This exercise has not been completed yet.</p>
                <% } %>
            </div>
        </div>
        <% } %>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-light text-center py-3">
        <div class="container">
            <p>&copy; 2024 MyWebApp. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
