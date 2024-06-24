<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, java.io.File, java.io.IOException, java.util.ArrayList, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HTML & CSS Quiz</title>
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
                <li class="nav-item active">
                    <a class="nav-link" href="page4.jsp">HTML & CSS Quiz</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Content -->
    <div class="container mt-5">
        <h1 class="mb-4">HTML & CSS Quiz</h1>
        <form action="saveQuiz.jsp" method="post">
            <ol>
                <% 
                // Lista de preguntas y respuestas
                List<String[]> questions = new ArrayList<>();
                questions.add(new String[]{"¿Cuál es la etiqueta correcta para definir encabezados de nivel 1 en HTML?", "A. <h1>", "B. <header>", "C. <heading>", "D. <head>", "A"});
                questions.add(new String[]{"¿Cómo se enlaza un archivo de hoja de estilos externo en HTML?", "A. <link rel=\"stylesheet\" href=\"styles.css\">", "B. <style src=\"styles.css\">", "C. <script src=\"styles.css\">", "D. <css src=\"styles.css\">", "A"});
                questions.add(new String[]{"¿Qué propiedad de CSS se utiliza para cambiar el color del texto?", "A. color", "B. text-color", "C. font-color", "D. text-style", "A"});
                questions.add(new String[]{"¿Cuál es la forma correcta de definir una lista desordenada en HTML?", "A. <list>", "B. <ol>", "C. <ul>", "D. <unordered>", "C"});
                questions.add(new String[]{"¿Cómo se define una clase CSS llamada 'destacado'?", "A. .destacado {}", "B. #destacado {}", "C. class.destacado {}", "D. <div class=\"destacado\">", "A"});
                questions.add(new String[]{"¿Qué etiqueta HTML se utiliza para definir una imagen?", "A. <img>", "B. <picture>", "C. <image>", "D. <figure>", "A"});
                questions.add(new String[]{"¿Cómo se define un comentario en HTML?", "A. <!-- Comentario -->", "B. // Comentario //", "C. /* Comentario */", "D. * Comentario *", "A"});
                questions.add(new String[]{"¿Qué propiedad de CSS se utiliza para establecer el margen externo?", "A. padding", "B. margin", "C. spacing", "D. outer-margin", "B"});
                questions.add(new String[]{"¿Cuál es la etiqueta correcta para crear un enlace en HTML?", "A. <a>", "B. <link>", "C. <href>", "D. <anchor>", "A"});
                questions.add(new String[]{"¿Qué atributo se utiliza para especificar la dirección del contenido en un elemento HTML?", "A. text-align", "B. content-align", "C. align", "D. dir", "D"});
                questions.add(new String[]{"¿Cuál es la forma correcta de definir una tabla en HTML?", "A. <table><tr><td></td></tr></table>", "B. <tab><row><cell></cell></row></tab>", "C. <tbl><r><c></c></r></tbl>", "D. <grid><row><cell></cell></row></grid>", "A"});
                questions.add(new String[]{"¿Cómo se define un comentario en CSS?", "A. // Comentario", "B. /* Comentario */", "C. <!-- Comentario -->", "D. * Comentario *", "B"});
                questions.add(new String[]{"¿Cuál es la propiedad CSS que se utiliza para establecer el tamaño de la letra?", "A. font-size", "B. text-size", "C. letter-size", "D. size", "A"});
                questions.add(new String[]{"¿Qué etiqueta se utiliza para crear un párrafo en HTML?", "A. <para>", "B. <p>", "C. <paragraph>", "D. <text>", "B"});
                questions.add(new String[]{"¿Cómo se indica el color de fondo de un elemento en CSS?", "A. background-color", "B. color-background", "C. bg-color", "D. background", "A"});
                
                // Guardar preguntas en archivo
                String fileName = application.getRealPath("/") + "html_css_questions.txt";
                File file = new File(fileName);
                try (PrintWriter writer = new PrintWriter(file)) {
                    for (int i = 0; i < questions.size(); i++) {
                        String[] question = questions.get(i);
                        writer.println("Pregunta " + (i + 1) + ": " + question[0]);
                        for (int j = 1; j < question.length - 1; j++) {
                            writer.println("    " + question[j]);
                        }
                        writer.println("Respuesta correcta: " + question[question.length - 1]);
                        writer.println(); // Agregar línea en blanco entre preguntas
                    }
                } catch (IOException e) {
                    out.println("Error al guardar el archivo: " + e.getMessage());
                }
                
                // Mostrar preguntas en HTML
                for (int i = 0; i < questions.size(); i++) {
                    String[] question = questions.get(i);
                %>
                <li class="mb-4">
                    <fieldset>
                        <legend><%= "Pregunta " + (i + 1) + ": " + question[0] %></legend>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" id="optionA_<%= i %>" name="question_<%= i %>" value="A">
                            <label class="form-check-label" for="optionA_<%= i %>"><%= question[1] %></label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" id="optionB_<%= i %>" name="question_<%= i %>" value="B">
                            <label class="form-check-label" for="optionB_<%= i %>"><%= question[2] %></label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" id="optionC_<%= i %>" name="question_<%= i %>" value="C">
                            <label class="form-check-label" for="optionC_<%= i %>"><%= question[3] %></label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" id="optionD_<%= i %>" name="question_<%= i %>" value="D">
                            <label class="form-check-label" for="optionD_<%= i %>"><%= question[4] %></label>
                        </div>
                    </fieldset>
                </li>
                <% } %>
            </ol>
            <button type="submit" class="btn btn-primary">Submit Quiz</button>
        </form>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-light text-center py-3">
        <div class="container">
            <p>&copy; 2024 MyWebApp. All rights reserved.</p>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper
