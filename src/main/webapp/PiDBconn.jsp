<%@ page import="java.sql.*" %>
<%
    Connection conn = null;

    String url = "jdbc:mysql://kenken0803.asuscomm.com:3306/";
    String user = "root";
    String password = "88198819";

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<%--==================================================================================================================--%>

<%--<%@include file="PiDBconn.jsp" %>--%>

<%--<%--%>
<%--    request.setCharacterEncoding("UTF-8");--%>

<%--    String id = request.getParameter("id");--%>
<%--    String name = request.getParameter("name");--%>

<%--    PreparedStatement preparedStatement = null;--%>
<%--    ResultSet resultSet = null;--%>

<%--//    int result = 0;--%>
<%--    try {--%>
<%--        String sql = "";--%>

<%--        preparedStatement = conn.prepareStatement(sql);--%>

<%--        preparedStatement.setString(1, id);--%>
<%--        preparedStatement.setString(2, name);--%>

<%--//        result = preparedStatement.executeUpdate();--%>
<%--        resultSet = preparedStatement.executeQuery();--%>

<%--        while (resultSet.next()) {--%>
<%--%>--%>


<%--<%--%>
<%--        }--%>

<%--    } catch (SQLException e) {--%>
<%--        e.printStackTrace();--%>
<%--    } finally {--%>
<%--        if (preparedStatement != null) preparedStatement.close();--%>
<%--        if (conn != null) conn.close();--%>
<%--        if (resultSet != null) resultSet.close();--%>
<%--    }--%>
<%--%>--%>