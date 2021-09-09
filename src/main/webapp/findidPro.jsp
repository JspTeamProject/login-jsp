<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;Charset=UTF-8");
%>
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

입력 이름 :
<jsp:getProperty name="recv" property="name"/>
<br/>
입력 전화번호 :
<jsp:getProperty name="recv" property="phone"/>

<%
    String name = recv.getName();
    String phone = recv.getPhone();

    System.out.println(name + phone);

    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

//    int result = 0;
    try {
        String sql = "select id from db01.member where phone=? and name=?";

        preparedStatement = conn.prepareStatement(sql);

        preparedStatement.setString(1, phone);
        preparedStatement.setString(2, name);

        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            String rId = resultSet.getString("id");
%>

    <div>
    요청하신 아이디는 <%=rId%> 입니다.
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
