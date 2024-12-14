<%@ page import="java.sql.*" %>
<%
    int marketerId = Integer.parseInt(request.getParameter("marketerId"));

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing1", "root", "admin");

        String sql = "UPDATE marketers SET approved = TRUE WHERE marketerId = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, marketerId);
        stmt.executeUpdate();

        response.sendRedirect("approveMarketers.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
