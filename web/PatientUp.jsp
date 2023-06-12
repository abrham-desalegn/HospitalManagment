<%-- 
    Document   : PatientUp
    Created on : Jun 10, 2023, 11:59:24 PM
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
<%@ page import = "beanPack.PatientBean" %>
<%@ page import = "beanPack.StorePatient" %>
<jsp:useBean id = "patientId" class = "beanPack.PatientBean" scope = "session"></jsp:useBean>
<jsp:setProperty name = "patientId" property = "*" />
<jsp:useBean id = "storePatientId" class = "beanPack.StorePatient" scope = "application"></jsp:useBean>
    <%
            Connection con = storePatientId.initializeJdbc();
            String tr = request.getParameter("email");
            PreparedStatement  pt = con.prepareStatement("Delete  from patient where Email = ?");
            pt.setString(1, tr);
            pt.executeUpdate();
     %>
     <script>
    window.location.href = "adminPatientList.jsp";
     </script>