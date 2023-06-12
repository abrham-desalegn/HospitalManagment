<%-- 
    Document   : addRecp
    Created on : Jun 9, 2023, 8:15:37 PM
    Author     : Abrham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%><%@ page import = "beanPack.MedicineBean" %>
<%@ page import = "beanPack.StorePatient" %>
<jsp:useBean id = "medicineId" class = "beanPack.MedicineBean" scope = "session"></jsp:useBean>
<jsp:setProperty name = "medicineId" property = "*" />
<jsp:useBean id = "storePatientId" class = "beanPack.StorePatient" scope = "application"></jsp:useBean>
       <%
            Connection con = storePatientId.initializeJdbc();
            PreparedStatement st = con.prepareStatement("select MedicineId from MedicineStore where MedicineId = ?");
            String state = request.getParameter("email");
            st.setString(1, state);
            ResultSet re = st.executeQuery();
            if(re.next()){
            %>
         <script>
        alert("Email already exists in the database!");
        window.location.href = "addMedicine.html";
      </script>
       <%
           } else {
        Date todaysDate = new Date();
        DateFormat df2 = new SimpleDateFormat("dd-MM-yyyy");
        String DateAndTime = df2.format(todaysDate);
        PreparedStatement pst = con.prepareStatement("insert into MedicineStore values(?,?,?,?)");
        pst.setString(1, medicineId.getMname());
        pst.setString(2, medicineId.getMid());
        pst.setString(3,medicineId.getQuantity());
        pst.setString(4,DateAndTime);
        pst.executeUpdate();
        %>
<html>
    <head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Home</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/adddataform.css">
        <link rel="stylesheet" type="text/css" href="css/adddatafrm1.css">
        <style>
            body {
                background-image: url("img/Medical.jpg");
                background-color: #ccc;
            }
        </style>
    </head>
    <body>
                 <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a href="#" class="navbar-brand"> 
                <img src="img/2855.jpeg" height="30" width="100" alt="HospitalManagementSystem">
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
                            <a class="dropdown-item" href="addpatient.jsp">Add Patient</a>
                            <a class="dropdown-item" href="adminPatientList.jsp">Patient List</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            DOCTOR
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="addDoctor.jsp">Add Doctor</a>
                            <a class="dropdown-item" href="adminDoctorList.jsp">View Doctor</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            WORKER
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="addRecp.jsp">Add Worker</a>
                            <a class="dropdown-item" href="adminRecpList.jsp">View Worker</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            MEDICINE
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="addMedicine.jsp">Add Medicine</a>
                            <a class="dropdown-item" href="adminMedicineList.jsp">View Medicine</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container-contact100">
            <div class="wrap-contact100">
                <div class="contact100-form-title" style="background-image: url(img/bg-01.jpg);">
                    <span class="contact100-form-title-1">
                        Receptionist Registration Form
                    </span>				
                </div>

                <form class="contact100-form validate-form"  action="adminHome.html" method="post">
                    <div class="wrap-input100 validate-input " >
                    <p style="font-size: 20px; text-align: center ">You entered the following data</p>
                    <p style=" font-size: 15px">Medicine ID  : <%= medicineId.getMid()%></p>
                    <p style=" font-size: 15px">Medicine Name : <%= medicineId.getMname() %></p>
                    <p style=" font-size: 15px">Medicine Name : <%= medicineId.getQuantity() %></p>

                     <div class="container-contact100-form-btn">
                        <button class="contact100-form-btn">
                            <span>
                                Back To Home
                                <i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
                            </span>
                        </button>
                    </div>
                    </div>
                </form>
            </div>
        </div>
        <div id="dropDownSelect1"></div>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
        <script src="js/map-custom.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>

        <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag() {
                dataLayer.push(arguments);
            }
            gtag('js', new Date());

            gtag('config', 'UA-23581568-13');
        </script>
    </body>
</html>
<%
}
%>