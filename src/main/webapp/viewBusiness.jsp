<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>User View Business</title>
   <!--   <link rel="stylesheet" href="styles.css">-->
   <style>
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
    max-width: 800px;
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

.card {
    background-color: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 5px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.card h3 {
    font-size: 24px;
    color: #333;
    margin-bottom: 10px;
}

.card p {
    font-size: 16px;
    color: #666;
    margin-bottom: 10px;
}

.card p strong {
    color: #333;
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
    text-decoration: none;
}

button:hover {
    background-color: rgba(240, 77, 55, 0.8);
    text-decoration: underline;
}
   
   
   </style>
</head>
<body>
    <h2>Your Business Data</h2>
    <%
        int userId = (Integer) session.getAttribute("userId");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing1", "root", "admin");

            String sql = "SELECT * FROM businesses WHERE userId = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int businessId = rs.getInt("businessId");
                String businessName = rs.getString("businessName");
                String description = rs.getString("description");
                String contactInfo = rs.getString("contactInfo");
                String marketingStrategies = rs.getString("marketingStrategies");
                int approve = rs.getInt("approve");

                out.println("<div class='card'>");
                out.println("<p>Business Name: " + businessName + "</p>");
                out.println("<p>Description: " + description + "</p>");
                out.println("<p>Contact Info: " + contactInfo + "</p>");
                out.println("<p>Previous Marketing Strategies: " + marketingStrategies + "</p>");
                out.println("<p>Status: " + (approve == 1 ? "Your campaign deal is approved" : "Pending approval") + "</p>");
                out.println("</div>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
</body>
</html>
