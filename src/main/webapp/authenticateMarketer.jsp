<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/marketing1", "root", "admin");

        String sql = "SELECT * FROM marketers WHERE username = ? AND password = ? AND approved = TRUE";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, password);
        rs = stmt.executeQuery();

        if (rs.next()) {
        	 int marketerId = rs.getInt("marketerId");
        	HttpSession session1 = request.getSession();
            session1.setAttribute("marketerId", marketerId);
            session1.setAttribute("username", username);
            session1.setMaxInactiveInterval(260);
            response.sendRedirect("marketerDashboard.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid username or password, or account not approved");
            request.getRequestDispatcher("loginMarketer.jsp").forward(request, response);
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
