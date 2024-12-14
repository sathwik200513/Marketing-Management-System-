<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Marketer View Business</title>
   <!--  <link rel="stylesheet" href="styles.css">--> 
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
    <h2>All Business Requests</h2>
    <%
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing1", "root", "admin");

            String sql = "SELECT * FROM businesses";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int businessId = rs.getInt("businessId");
                String businessName = rs.getString("businessName");
                String description = rs.getString("description");
                String contactInfo = rs.getString("contactInfo");
                int userId = rs.getInt("userId");
                int approve = rs.getInt("approve");

                out.println("<div class='card'>");
                out.println("<p>Business Name: " + businessName + "</p>");
                out.println("<p>Description: " + description + "</p>");
                out.println("<p>Contact Info: " + contactInfo + "</p>");
                
                if (approve == 0) {
                    out.println("<form method='post'>");
                    out.println("<input type='hidden' name='businessId' value='" + businessId + "'/>");
                    out.println("<input type='hidden' name='userId' value='" + userId + "'/>");
                    out.println("<input type='hidden' name='businessName' value='" + businessName + "'/>");
                    out.println("<input type='hidden' name='description' value='" + description + "'/>");
                    out.println("<input type='hidden' name='contactInfo' value='" + contactInfo + "'/>");
                    out.println("<button type='submit' name='approveBtn' value='approve'>Approve</button>");
                    out.println("</form>");
                } else {
                    out.println("<p>The deal has closed.</p>");
                }
                
                out.println("</div>");
            }

            if ("POST".equalsIgnoreCase(request.getMethod()) && "approve".equals(request.getParameter("approveBtn"))) {
                int businessId = Integer.parseInt(request.getParameter("businessId"));
                int userId = Integer.parseInt(request.getParameter("userId"));
                String businessName = request.getParameter("businessName");
                String description = request.getParameter("description");
                String contactInfo = request.getParameter("contactInfo");
                int approve = 1;

                /* String insertSql = "INSERT INTO viewm (businessId, userId, businessName, description, contactInfo, approve) VALUES (?, ?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(insertSql);
                stmt.setInt(1, businessId);
                stmt.setInt(2, userId);
                stmt.setString(3, businessName);
                stmt.setString(4, description);
                stmt.setString(5, contactInfo);
                stmt.setInt(6, approve);
                stmt.executeUpdate(); */

               // Update the businesses table to mark approval (if needed)
                 String updateSql = "UPDATE businesses SET approve=1 WHERE businessId=?";
                stmt = conn.prepareStatement(updateSql);
                stmt.setInt(1, businessId);
                stmt.executeUpdate();

                response.sendRedirect("MarketViewBusiness.jsp");
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
