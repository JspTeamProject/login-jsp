<%--
  Created by IntelliJ IDEA.
  User: ojh21
  Date: 2021-09-09
  Time: 오후 2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="dbconn.jsp" %>
<%@ page import="Pack.memberBean"%>
<body>
<jsp:useBean id="recv" class="Pack.memberBean" scope="page"/>
<jsp:setProperty name="recv" property="*"/>
<%=recv.getId() %>
<%
	String name = recv.getId();
	System.out.println("이름"+name);
    request.setCharacterEncoding("UTF-8");
	
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    int result = 0;

    try {
        String sql = "insert into member(id,pw,name,email,address,phone) values(?,?,?,?,?,?)";
        
        preparedStatement = conn.prepareStatement(sql);
        
        preparedStatement.setString(1, recv.getId());
        preparedStatement.setString(2, recv.getPw());
        preparedStatement.setString(3, recv.getName());
        preparedStatement.setString(4, recv.getEmail());
        preparedStatement.setString(5, recv.getAddress());
        preparedStatement.setString(6, recv.getPhone());
        
        result = preparedStatement.executeUpdate();
        
		if(result != 0){		
			System.out.println(recv.getId());
%>
		<script>
			alert("회원가입 성공하셨습니다");
			location.href="login.jsp";
		</script>
<%			

		}else{
			System.out.println(recv.getId());
%>
			<script>
				alert("회원가입 실패하셨습니다");
				location.href="join.jsp";
			</script>
<%				

		}
        
    } catch (SQLException e) {
        out.print(e.getMessage());
%>
		<script>
			alert("ERROR");
		</script>
<%        
        
    } finally {
        if (preparedStatement != null) preparedStatement.close();
        if (conn != null) conn.close();
        if (resultSet != null) resultSet.close();
    }
%>
</body>