<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>       
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="./static/main.css" />
		<title>Student</title>
	</head>
	<body>
		<div class="table-title">
			<h3>Data Table</h3>
		</div>
		<table class="table-fill">
		<thead>
			<tr>
				<th class="text-left">Name</th>
				<th class="text-left">Id</th>
				<th class="text-left">Apply</th>
			</tr>
		</thead>
		<tbody class="table-hover">
		<%@ page import ="java.sql.*" %>
		<%
			Class.forName("com.mysql.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudentID",
	    	        "root", "inspiron34");
	    	Statement st = con.createStatement();
	    	ResultSet rs;
	    	rs = st.executeQuery("select * from Company");
	    	while(rs.next()){
	    		String name = rs.getString(1);
	    		String ID = rs.getString(2);
	    		int app = rs.getInt(3);
	    		session.setAttribute("Cname", name);
	    		session.setAttribute("ID", ID);
	    		session.setAttribute("app", app);%>
	    		<tr>
					<td class="text-left"><%= session.getAttribute("Cname") %></td>
					<td class="text-,left"><%= session.getAttribute("ID") %></td>
					<td class="text-,left"> <button> Apply </button> </td>
				</tr>
	    	<% } %>
		</tbody>
		</table>
	</body>
</html>
