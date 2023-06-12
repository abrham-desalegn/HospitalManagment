<%-- 
    Document   : WorkerUp
    Created on : Jun 11, 2023, 10:35:30 AM
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
<%@ page import = "beanPack.RecpBean" %>
<%@ page import = "beanPack.StorePatient" %>
<jsp:useBean id = "recpBean" class = "beanPack.RecpBean" scope = "session"></jsp:useBean>
<jsp:setProperty name = "recpBean" property = "*" />
<jsp:useBean id = "storePatientId" class = "beanPack.StorePatient" scope = "application"></jsp:useBean>
    <%
            Connection con = storePatientId.initializeJdbc();
            String tr = request.getParameter("mobile");
            PreparedStatement  pt = con.prepareStatement("Delete  from worker where phone = ?");
            pt.setString(1, tr);
            pt.executeUpdate();
     %>
     <script>
    window.location.href = "adminRecpList.jsp";
     </script>
