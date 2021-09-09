<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Pack.memberBean" %>
<%@include file="PiDBconn.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="recv" class="Pack.memberBean" scope="page"/>
<jsp:setProperty name="recv" property="*"/>

입력 아이디 :
<jsp:getProperty name="recv" property="id"/>
<br/>
입력 이름 :
<jsp:getProperty name="recv" property="name"/>

<%
    String id = recv.getId();
    String name = recv.getName();

    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

//    int result = 0;
    try {
        String sql = "select password from db01.member where id=? and name=?";

        preparedStatement = conn.prepareStatement(sql);

        preparedStatement.setString(1, id);
        preparedStatement.setString(2, name);

        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            String rPassword = resultSet.getString("password");
%>

<div>
    요청하신 비밀번호는 <%=rPassword%> 입니다.
    <div>

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
