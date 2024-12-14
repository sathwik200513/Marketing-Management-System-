<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Business</title>
    <link rel="stylesheet" href="styles.css">
</head>
<style>
/* CSS as provided before */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, rgba(240, 77, 55, 0.1) 0%, rgba(240, 77, 55, 0.4) 100%);
    padding: 20px;
}

.container {
    max-width: 500px;
    margin: 50px auto;
    background-color: #fff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
    font-size: 28px;
    color: #333;
    margin-bottom: 20px;
    text-align: center;
}

.form-group {
    margin-bottom: 15px;
}

label {
    font-size: 16px;
    color: #333;
    margin-bottom: 5px;
    display: block;
}

input, textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    resize: vertical;
}

textarea {
    height: 100px;
}

button {
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    background-color: rgb(240, 77, 55);
    color: #fff;
    text-align: center;
    text-decoration: none; /* Ensure no underline */
}

button:hover {
    background-color: rgba(240, 77, 55, 0.8);
    text-decoration: none;
}
</style>
<body>
    <div class="container">
        <h2>Add Your Business</h2>
        <form action="addBusiness.jsp" method="post">
            <div class="form-group">
                <label for="businessName">Business Name:</label>
                <input type="text" id="businessName" name="businessName" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" required></textarea>
            </div>
            <div class="form-group">
                <label for="contactInfo">Contact Info:</label>
                <input type="text" id="contactInfo" name="contactInfo" required>
            </div>
            <div class="form-group">
                <label for="ms">Previous Marketing Strategies:</label>
                <textarea id="marketingStrategies" name="marketingStrategies" required></textarea>
            </div>
            <button type="submit">Add Business</button>
        </form>
    </div>
</body>
</html>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String businessName = request.getParameter("businessName");
        String description = request.getParameter("description");
        String contactInfo = request.getParameter("contactInfo");
        String marketingStrategies = request.getParameter("marketingStrategies");

        Integer userId = (Integer) session.getAttribute("userId");
        out.println(userId);
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing1", "root", "admin");

            String sql = "INSERT INTO businesses (userId, businessName, description, contactInfo, marketingStrategies) VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setString(2, businessName);
            stmt.setString(3, description);
            stmt.setString(4, contactInfo);
            stmt.setString(5, marketingStrategies);
            stmt.executeUpdate();

            out.println("<p>Business data added successfully!</p>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }
%>
