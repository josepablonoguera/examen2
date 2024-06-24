<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File, java.io.FileNotFoundException, java.util.Scanner, java.util.HashMap, java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Login</h2>
        <form method="post" action="login.jsp">
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="code">Code</label>
                <input type="text" class="form-control" id="code" name="code" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>

        <% 
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String email = request.getParameter("email");
                String code = request.getParameter("code");

                String filePath = application.getRealPath("/") + "../../users.txt";
                File file = new File(filePath);
                Map<String, String> users = new HashMap<>();
 
 
                try (Scanner scanner = new Scanner(file)) {
                    while (scanner.hasNextLine()) {
                        String line = scanner.nextLine();
                      
                        String[] parts = line.split(",");
                        if (parts.length == 2) {
                            users.put(parts[0].trim(), parts[1].trim());
                        }
                    }
                } catch (FileNotFoundException e) {
                    out.println("<div class='alert alert-danger'>Error: Users file not found.</div>");
                }

                if (users.containsKey(email) && users.get(email).equals(code)) {
                    out.println("<div class='alert alert-success'>Login successful!</div>");
                 
    String redirectURL = "welcome.jsp";
    response.sendRedirect(redirectURL);


                } else {
                    out.println("<div class='alert alert-danger'>Invalid email or code.</div>");
                }
            }
        %>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
