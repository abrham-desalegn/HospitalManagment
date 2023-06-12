<%-- 
    Document   : DoctorUp
    Created on : Jun 11, 2023, 10:24:06 AM
    Author     : Abrham
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import = "beanPack.DoctorBean" %>
<%@ page import = "beanPack.StorePatient" %>
<jsp:useBean id = "doctorId" class = "beanPack.DoctorBean" scope = "session"></jsp:useBean>
<jsp:setProperty name = "doctorId" property = "*" />
<jsp:useBean id = "storePatientId" class = "beanPack.StorePatient" scope = "application"></jsp:useBean>
    <%
            Connection con = storePatientId.initializeJdbc();
            String tr = request.getParameter("id");
            PreparedStatement  pt = con.prepareStatement("Delete  from doctor where id = ?");
            pt.setString(1, tr);
            pt.executeUpdate();
     %>
     <script>
    window.location.href = "adminDoctorList.jsp";
     </script>