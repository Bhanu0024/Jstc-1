<%-- 
    Document   : index
    Created on : 22 Jul, 2021, 10:35:19 AM
    Author     : dell
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <from action="index.jsp" method="post">
        Name:<input type="text" name="uname"><br>
        Email:<input type="text" name="email"><br>
        mobile No:<input type="text" name="mobile"><br>
        Gender:<input type="radio" name="gender" value="male"><input type="radio" name="gender" value="female"><br>
        course:<select name="c1">
            <option value="java">java </option>
            <option value="c++">C++</option>
            <option value="pyhon">python</option>
        <option value="Angular">Angular</option>
        </select>
        <br>
        query:<textarea type="text" name="query" ></textarea><br>
        <button type="submit">submit</button>
        <br>
        
        
    </from>
    
    <%
            try
            {
            String name=request.getParameter("uname");
            String email=request.getParameter("email");
            long mobile_no=new Long(request.getParameter("mobile_no"));
            String gender=request.getParameter("gender");
            String course=request.getParameter("c1");
            String query=request.getParameter("query");
      
      
      Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:mysql","root","");
    PreparedStatement pt=con.prepareStatement("insert into enquiry_form2(name, email, mobile, gender, course, query2) values(?, ?, ?, ?, ?, ?)");
    pt.setString(1, name);
    pt.setString(2, email);
    pt.setLong(3, mobile_no);
    pt.setString(4, gender);
    pt.setString(5, course);
    pt.setString(6, query);
    pt.executeQuery();
     
      out.println("data inserted");
     
      
        
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      
      
      %>

    </body>
</html>
