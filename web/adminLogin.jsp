<%-- 
    Document   : adminLogin
    Created on : Jun 9, 2023, 9:59:07 PM
    Author     : Abrham
--%>

<%@page  pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "beanPack.AdminBean" %>
<%@ page import = "beanPack.StorePatient" %>
<jsp:useBean id = "adminId" class = "beanPack.AdminBean" scope = "session"></jsp:useBean>
<jsp:setProperty name = "adminId" property = "*" />
<jsp:useBean id = "storePatientId" class = "beanPack.StorePatient" scope = "application"></jsp:useBean>
          <%            
        Connection con = storePatientId.initializeJdbc();
        Statement pst = con.createStatement();
        ResultSet resultSet = pst.executeQuery("select * from  adminlogin");                           
        String username = request.getParameter("name");
        String pass = request.getParameter("pass");
           while(resultSet.next()){
           String usename = resultSet.getString(1);
           String pwd = resultSet.getString(2);
             if ( (username.equalsIgnoreCase("abrham") && pass.equalsIgnoreCase("123"))||(username.equalsIgnoreCase("edemix") && pass.equalsIgnoreCase("321")))  {
       %>
       <script>
           window.location.href = "adminHome.html";
       </script>
       <%
           }
    else if(username.equalsIgnoreCase(usename) && !pass.equalsIgnoreCase(pwd)){
       %>
       <script>
    alert("You entered wrong Password!"
    + "Please Enter right Password!");
    window.location.href = "adminLogin.html";
       </script>
       <%
           }
        else if(!username.equalsIgnoreCase(usename) && pass.equalsIgnoreCase(pwd)){
       %>
       <script>
     alert("You entered wrong Username!" 
    + "Please Enter right Username!");
    window.location.href = "adminLogin.html";
       </script>
       <%
           }
           else{
       %>
     <script>
     alert("You entered wrong Username and password!"); 
    window.location.href = "adminLogin.html";
       </script>
       <%
           }
}
       %>
       