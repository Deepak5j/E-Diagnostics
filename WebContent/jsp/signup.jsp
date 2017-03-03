<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Form</title>
<link rel="stylesheet" type="text/css" href="/esportsclub/css/bg-link.css">
<link rel="stylesheet" type="text/css" href="/esportsclub/css/log.css">
<script type="text/javascript">
	function dis(val)
	{
		if(val=="other")
			document.getElementById("city").style.display="block";
		else
			document.getElementById("city").style.display="none";
	}
	function checkId(userid)
	{
		//var i=1;
		//alert("1.Entering main function"+i);
		
		if(XMLHttpRequest)
		{	
			//i++;
			var x=new XMLHttpRequest();
			//alert("2.Entering if()  "+i);
		}
		else
		{
			//i++;
			var x=new ActiveXObject("MicrosoftXMLHTTP");
			//alert("3.Entering else"+i);
		}
		x.onreadystatechange = function () 
		{
			//i++;
			//alert("4.Entering call back function"+i);
			if(x.readyState==4&&x.status==200)
			{
				var data=x.responseText;
				document.getElementById("div").innerHTML = data;
				//alert("5.data="+i+"=="+data);
				//alert("6.writing innerHTML"+i);
			}
		}
		x.open("get","/esportsclub/Signup?ui="+userid,"true");//   here 'ui' get value of 'userid' and pass to 'doGet' i.e. to Server
		//i++;
		//alert("7.==open=="+i);
		//i++;
		x.send();
		//alert("8.==send=="+i);
	}
</script>
</head>
<body class="im">
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<span style="color:red;padding-top:12px;padding-left:25%;position:absolute;font-size: 25px;font-family:serif;">
<%
if((String)request.getAttribute("reset-message")!=null)
{%>
	<%=(String)request.getAttribute("reset-message")%>
<%
}%>
</span>
<div id="fullpage">
	&nbsp
	<p class="content">
		Registration Foram
	</p>
	<div style="margin-left:32%">
		<form method="post" action="/esportsclub/Signup">
			<table style="border-spacing:20px; border-style:inset;">
  			<tr>
    			<th>Name</th>
    			<td><input type="text" name="name" id="Name" placeholder="name" required="required" ></td>
  			</tr>
  			<tr>
    			<th>Email</th>
    			<td><input type="text" name="email" id="Email" placeholder="example@example.com"  required="required"></td>
  			</tr>
  			<tr>
    			<th>ID</th>
    			<td>
    				<input type="text" name="id" id="ID" placeholder="id" required="required" onblur="checkId(this.value)">
    				<!-- value of text box pass as 'value' to the function as 'userid' -->
  						<br><span id="div" style="color:#ff0000"></span>
    			</td>
  			</tr>
  			<tr>
    			<th>Password</th>
    			<td><input type="password" name="pass" id="Pass" placeholder="password" required="required" ></td>
  			</tr>
  			<!--  tr>
    			<th>Date of Birth</th>
    			<td><input type="date" name="DOB" id="DOB"></td>
  			</tr-->
  			<tr>
    			<th>Mobile</th>
    			<td><input type="number" name="phone" id="Mob" placeholder="Country code then 10 digits"  required="required"></td>
  			</tr>
  			<!-- tr>
    			<th>Age</th>
    			<td><input type="number" name="Age" id="Age" placeholder="enter or select age" required="required"></td>
  			</tr-->
  			<!-- tr>
    			<th>Photo</th>
    			<td><input type="file" name="Photo" id="Photo"></td>
  			</tr-->
  			<tr>
    			<th>Hobby</th>
    			<td>
    				Prayanam<input type="checkbox" value="Prayanam" name="hobby" id="Hobby">
    				Bodybuilding<input type="checkbox" value="Bodybuilding" name="hobby" id="Hobby">	
    			</td>
  			</tr>
  			<tr>
    			<th>Gender</th>
    			<td>
    				Male<input type="radio" value="male" name="gen" id="Gender" >
    				Female<input type="radio" value="female" name="gen" id="Gender" checked>
    			</td>
  			</tr> 
  			<tr>
    			<th>City</th>
    			<td>
    				<select name="city" onchange="dis(this.value)">
    					<option value="no city selected">Select City</option>
    					<option value="Lucknow" >Lucknow</option>
    					<option value="kanpur">kanpur</option>
    					<option value="Varanasi">Varanasi</option>
    					<option value="Kolkata">Kolkata</option>
    					<option value="other" id="othe" >Other</option>
    				</select>
    				<input type="text" name="city" id="city" style="display:none"  >
    			</td>
  			</tr>
  			<!-- tr>
    			<th>Addres</th>
    			<td>
    				<textarea rows="0" cols="0" name="Addres" id="Addres">
    				</textarea>
    			</td>
  			</tr--> 
  			<tr>
    			<th><button type="reset" >reset</button></th>
   				<th><button type="submit" >submit</button></th>
  			</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>