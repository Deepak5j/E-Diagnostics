<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*,esports.dbinfo.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/esportsclub/css/bg-link.css">
<title>Edit Profile</title>
</head>
<body class="im">
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);


	HttpSession hs=request.getSession(false);
	System.out.println(hs);
	
	String uid=(String)hs.getAttribute("uinfo");
	if(uid==null||hs.isNew())
	{
		request.setAttribute("msg", "Please! login to edit your profile");
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
		rd.forward(request, response);		
	}
	else{
%>
	<div style="width:100%;height:60px;background-color:#00aa00;color:#ff0000;
	border-radius:32px;font-size: 26px;font-variant: capatelise;padding-top:20px">
		<span style="padding-left: 22px;"></span>Hello!<span style="padding-right: 22px;"></span><%=uid%>
		<span style="padding-top:0px;float:right;margin-right: 30px;">
			<%=new java.util.Date() %> <span style="padding-right: 12px"></span>
			<a style="padding:3px;margin-right:0px;border:2px solid #ff0000;border-style:inset;" href="/esportsclub/Logout">
				Logout
			</a>
		</span>	
	</div>
	<div style="width:100%;height:550px;background-color:#0000aa;color:#00ffff;
			margin-top:10px;border-radius:32px;font-size: 26px;text-align: left;
			font-family: cursive;">
		<center>
		<br/>
		<span style="color:#aaffaa">Edit Your Profile</span> 	
		</center>
		<%
			Connection con=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			
			String strsql="select * from signup where id=?";
			
			con=CrudOperation.createConnection();
			try
			{
				
				ps=con.prepareStatement(strsql);
				ps.setString(1,uid);
				rs=ps.executeQuery();
				if(rs.next())
				{
				%>
					<div div style="padding-top:50px;">
					<center>
						<form method="post" action="/esportsclub/EditProfile">
							<table align="center" style="border-spacing:20px; border-style:inset;
									font-family: sans-serif;font-size: 20px;">
								<tr>
									<td>Name</td>
    								<td><%=rs.getString("name")%></td>
  								</tr>
  								<tr>
    								<td>E-mail</td>
    								<td><input type="text" name="email" id="email" value="<%=rs.getString("email")%>"></td>
 								</tr>
 								<tr>
									<td>Id</td>
    								<td><%=rs.getString("id")%></td>
  								</tr>
  								<tr>
    								<td>Phone</td>
    								<td><input type="text" name="phone" id="phone" value="<%=rs.getString("phone")%>"></td>
 								</tr>
 								<tr>
									<td>Gender</td>
    								<td><%=rs.getString("gender")%></td>
  								</tr>
  								<tr>
    								<td>Hobby</td>
    								<td><%=rs.getString("hobby")%></td>
 								</tr>
  								<tr>
    								<td>City</td>
    								<td><%=rs.getString("city")%></td>
    							</tr>
 								<tr>
  									<th colspan="2"><button type="submit" >submit</button></th>
  								</tr>
							</table>						
						</form>
					</center>
				</div>
				<%
				}
			}
			catch(Exception se)
			{
				System.out.println(se);
			}
			finally
			{
				try
				{
					if(con!=null)
						con.close();
					if(ps!=null)
						ps.close();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
		%>
	</div>
	<%}
	%>
</body>
</html>