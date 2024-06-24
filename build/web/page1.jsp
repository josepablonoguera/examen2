<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.FileWriter, java.io.PrintWriter, java.io.File, java.io.IOException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page 1</title>
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

    <!-- Content -->
    <div class="container mt-5">
        <h1>Page 1</h1>
        <p>This page contains a programming exercise.</p>
        
        <div class="card mt-4">
            <div class="card-header">
                <h3>Programming Exercise</h3>
            </div>
            <div class="card-body">
                <h5 class="card-title">Problem Statement</h5>
                <p class="card-text">
                    Write a Java program to find the factorial of a given number. 
                    The factorial of a number n is the product of all positive integers less than or equal to n.
                    For example, the factorial of 5 is 5! = 5 × 4 × 3 × 2 × 1 = 120.
                </p>
                <h5 class="card-title">Guidelines</h5>
                <ul>
                    <li>Accept a number as input from the user.</li>
                    <li>Use a loop to calculate the factorial.</li>
                    <li>Print the result to the console.</li>
                </ul>
                
                <h5 class="card-title mt-4">Your Solution</h5>
                <form method="post" action="page1.jsp">
                    <div class="form-group">
                        <label for="codeInput">Enter your code here:</label>
                        <textarea class="form-control" id="codeInput" name="code" rows="10" placeholder="Write your Java code here..."></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>

                <% 
                // Procesar el código enviado por el usuario
                String code = request.getParameter("code");
                if (code != null && !code.trim().isEmpty()) {
                    // Guardar el código en un archivo en la raíz del proyecto
                    String filePath = application.getRealPath("/") + "../../user_code1.java";
                    try (FileWriter fileWriter = new FileWriter(filePath); PrintWriter fileOut = new PrintWriter(fileWriter)) {
                        fileOut.println(code);
                    } catch (IOException e) {
                        out.println("<div class='alert alert-danger mt-4'>Error saving the code: " + e.getMessage() + "</div>");
                    }

                    // Leer el archivo y mostrar el contenido
                    File file = new File(filePath);
                    if (file.exists()) {
                        out.println("<div class='mt-4'><pre>");
                        try (java.util.Scanner scanner = new java.util.Scanner(file)) {
                            while (scanner.hasNextLine()) {
                                out.println(scanner.nextLine());
                            }
                        } catch (IOException e) {
                            out.println("Error reading the file: " + e.getMessage());
                        }
                        out.println("</pre></div>");
                    }
                }
                %>
            </div>
        </div>
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
