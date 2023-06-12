<%-- 
    Document   : addPati
    Created on : Jun 10, 2023, 4:17:41 PM
    Author     : Abrham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
            Date todaysDate = new Date();
            DateFormat df2 = new SimpleDateFormat("dd-MM-yyyy");
            String DateAndTime = df2.format(todaysDate);
            Connection con = storePatientId.initializeJdbc();
            PreparedStatement pst = con.prepareStatement("insert into patient values(?,?,?,?,?,?,?,?,?)");
            pst.setString(1, patientId.getFname());
            pst.setString(2, patientId.getLname());
            pst.setString(3,patientId.getGender());
            pst.setString(4, patientId.getMobile());
            pst.setString(5,patientId.getCity());
            pst.setString(6,patientId.getEmail());
            pst.setString(7, patientId.getAge());
            pst.setString(8,patientId.getAddress());
            pst.setString(9,DateAndTime);
            pst.executeUpdate();
        %>
        <script>
           alert("Patient is successfully stored!");
           window.location.href = "addPatient.html";
       </script>