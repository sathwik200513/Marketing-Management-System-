<%@ page import="java.sql.*" %>
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

        out.println("<h2>All User Business Data</h2>");
        while (rs.next()) {
            out.println("<p>Business Name: " + rs.getString("businessName") + "</p>");
            out.println("<p>Description: " + rs.getString("description") + "</p>");
            out.println("<p>Contact Info: " + rs.getString("contactInfo") + "</p>");
            out.println("<hr>");
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
