<%-- 
    Document   : adminMedicineList
    Created on : Jun 10, 2023, 10:21:16 PM
    Author     : Abrham
--%>
<%-- 
    Document   : adminRecpList
    Created on : Jun 9, 2023, 8:41:29 PM
    Author     : Abrham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "beanPack.MedicineBean" %>
<%@ page import = "beanPack.StorePatient" %>
<jsp:useBean id = "medicine" class = "beanPack.MedicineBean" scope = "session"></jsp:useBean>
<jsp:setProperty name = "medicine" property = "*" />
<jsp:useBean id = "storePatientId" class = "beanPack.StorePatient" scope = "application"></jsp:useBean>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient List</title>
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link
            href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            rel="stylesheet" id="bootstrap-css">
        <script
        src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script
        src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/adddataform.css">
        <link rel="stylesheet" type="text/css" href="css/adddatafrm1.css">
        <link rel="stylesheet" type="text/css" href="css/table.css">
        <style>
            body {
                background-image: url("img/Medical.jpg");
                background-color: #cccccc;
            }
            .serchbar
            {
                width: 60%;
                height: 5%;
                margin-top:2%; 
                margin-left: 100px;
                margin-bottom: 0%;
            }
            .search
            {
                width: 40%;
                height: 40px; 
                border-radius: 10px;
            }
            .text-center{
                color: grey;
                padding: 10px;
                margin-top: 0px;
            }
            input {
                text-align: center;
            }
            ::-webkit-input-placeholder {
                text-align: center;
            }
            :-moz-placeholder {
                text-align: center;
            }
            .mybutton{
                display: inline;
            }
            table {
      border-collapse: collapse;
      width: 100%;
      padding-left: 100px;
      background-color: #f2f2f2;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    
    th, td {
      padding: 8px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    
    th {
      background-color: #1F6E8C;
      color: white;
    }
    
    tr:hover {
      background-color: #f5f5f5;
    }
        </style>
    </head>
    <body>
       
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a href="#" class="navbar-brand"> <img src="img/2855.jpeg"
                                                   height="30" width="100" alt="HospitalManagementSystem">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <h3>
                    <b>Gambey Hospital Management System</b>
                </h3>
                <ul class="navbar-nav ml-auto" style="margin-right: 70px;">

                    <li class="nav-item active">
                        <a class="nav-link" href="adminHome.html">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            PATIENT
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="addpatient.html">Add Patient</a>
                            <a class="dropdown-item" href="adminPatientList.jsp">Patient List</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            DOCTOR
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="addDoctor.html">Add Doctor</a>
                            <a class="dropdown-item" href="adminDoctorList.jsp">View Doctor</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            WORKER
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="addRecp.html">Add Worker</a>
                            <a class="dropdown-item" href="adminRecpList.jsp">View Worker</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">   
                           MEDICINE
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="addMedicine.html">Add Medicine</a>
                            <a class="dropdown-item" href="adminMedicineList.jsp">View Medicine</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <h1 style="text-align: center;color: white">List of all Medicines</h1>
       <table>
    <tr>
      <th>Medicine_ID</th>
      <th>Medicine_Name</th>
      <th>Quantity</th>
      <th>Date</th>
      <th>Edit Medicine</th>
      <th>Delete Medicine</th>
    </tr>
    <%
    Connection con = storePatientId.initializeJdbc();
    Statement pst = con.createStatement();
    ResultSet resultSet = pst.executeQuery("select * from  medicinestore");
    %>
    <%
    while(resultSet.next()){
    %>
    <tr>
      <td><%=resultSet.getString(1)%></td>
      <td><%=resultSet.getString(2)%></td>
      <td><%=resultSet.getString(3)%></td>
      <td><%=resultSet.getString(4)%></td>
      <td><form action="MedicineUpdate.jsp" >
                      <input type="hidden" value="<%=resultSet.getString(2)%>" name="edit">
                      <input type="submit" value="Edit">
      </form></td>
      <td><form action="MedicineUp.jsp" >
                      <input type="hidden" value="<%=resultSet.getString(2)%>" name="mid">
                      <input type="submit" value="Delete">
       </form></td>

    </tr>
    <%
        }
    %>
  </table>

    </body>
</html>

