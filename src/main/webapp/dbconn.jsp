<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;Charset=UTF-8");
%>
<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    String server = "localhost";
    String database = "db01";
    String user_name = "root";
    String password = "1234";
    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    try {
        conn = DriverManager.getConnection("jdbc:mysql://" + server + "/" + database + "?useSSL=false&useUnicode=true&characterEncoding=utf8&&characterSetResults=UTF-8", user_name, password);
        System.out.println("jdbc:mysql://" + server + "/" + database + "?useSSL=false&useUnicode=true&characterEncoding=utf8" + user_name + password);
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>