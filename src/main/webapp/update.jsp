<%--
  Created by IntelliJ IDEA.
  User: ojh21
  Date: 2021-09-09
  Time: 오후 2:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Pack.Member" %>
<%@ include file="dbconn.jsp"%>
<jsp:useBean id="recv" class="Pack.Member" scope="page"/>
<jsp:setProperty name="recv" property="*"/>
<html>
<head>
    <title>Login Result</title>
    <meta charset="UTF-8">
</head>
<style>
    a:link{color:coral; text-decoration:none;}
    a:visited{color:coral;text-decoration: none;}
    a:hover{color:black;text-decoration: underline;}
</style>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;Charset=UTF-8");
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    System.out.println(request.getParameter("name"));
    System.out.println(request.getParameter("address"));
    try {
        String sql = "update member set pw = ?, name = ?, email = ?, address = ?, phone = ? where id ='"+recv.getId()+"'";
        preparedStatement = conn.prepareStatement(sql);
        System.out.println(recv.getName());
        System.out.println(recv.getAddress());
        preparedStatement.setString(1, recv.getPw());
        preparedStatement.setString(2, recv.getName());
        preparedStatement.setString(3, recv.getEmail());
        preparedStatement.setString(4, recv.getAddress());
        preparedStatement.setString(5, recv.getPhone());
        int result = preparedStatement.executeUpdate();
        if(result == 1) {
%>
<h1> 정보 수정이 완료되었습니다.</h1><br>
<a href="index.jsp">돌아가기</a>
<%
}else {
%>
<h1> 정보 수정에 실패했습니다.</h1><br>
<a href="index.jsp">돌아가기</a>
<%
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (preparedStatement != null) preparedStatement.close();
        if (conn != null) conn.close();
        if (resultSet != null) resultSet.close();
    }
%>
</body>
</html>