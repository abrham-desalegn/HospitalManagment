<%-- 
    Document   : updatepatient
    Created on : Jun 11, 2023, 12:58:35 PM
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
<%@ page import = "beanPack.MedicineBean" %>
<%@ page import = "beanPack.StorePatient" %>
<jsp:useBean id = "medicineBean" class = "beanPack.MedicineBean" scope = "session"></jsp:useBean>
<jsp:setProperty name = "medicineBean" property = "*" />
<jsp:useBean id = "storePatientId" class = "beanPack.StorePatient" scope = "application"></jsp:useBean>
    <%
        Date todaysDate = new Date();
        DateFormat df2 = new SimpleDateFormat("dd-MM-yyyy");
        String DateAndTime = df2.format(todaysDate);
        Connection con = storePatientId.initializeJdbc();
        PreparedStatement pst = con.prepareStatement("insert into MedicineStore values(?,?,?,?)");
        pst.setString(1, medicineBean.getMname());
        pst.setString(2, medicineBean.getMid());
        pst.setString(3,medicineBean.getQuantity());
        pst.setString(4,DateAndTime);
        pst.executeUpdate();
        %>
     <script>
    window.location.href = "adminMedicineList.jsp";
     </script>