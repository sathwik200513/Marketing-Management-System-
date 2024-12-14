<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing1", "root", "admin");

        String sql = "SELECT * FROM marketers WHERE approved = FALSE";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();

        out.println("<h2>Approve Marketers</h2>");
        while (rs.next()) {
            out.println("<p>Username: " + rs.getString("username") + "</p>");
            out.println("<p>Email: " + rs.getString("email") + "</p>");
            out.println("<form action='approveMarketerLogic.jsp' method='post'>");
            out.println("<input type='hidden' name='marketerId' value='" + rs.getInt("marketerId") + "'>");
            out.println("<button type='submit'>Approve</button>");
            out.println("</form>");
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
