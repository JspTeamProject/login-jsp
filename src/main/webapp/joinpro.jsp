<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;Charset=UTF-8");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="PiDBconn.jsp" %>
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
        String sql = "insert into db01.member(id,pw,name,email,address,phone) values(?,?,?,?,?,?)";
        
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
			location.href="index.jsp";
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