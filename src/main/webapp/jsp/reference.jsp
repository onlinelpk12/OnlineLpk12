<%--  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--  <%@taglib prefix="i" uri="/WEB-INF/tlds/customTag"%> > --%>
<%--  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%-- <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %> --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        
          <!-- Link to bootstrap fontawesome and Boxicon -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://kit.fontawesome.com/7ca0ffd650.js" ></script>
        <!-- Link to css file -->
        <link rel="stylesheet" href="<i:ReadUrlFromContext url="/assets/css/style.css"/>">
        <link rel="stylesheet" href="<i:ReadUrlFromContext url="/assets/css/StarRating.css"/>"/>
        <title>Home page</title>
    </head>
    <body>
        <!-- Include header of web site from general-->
        <div  class="container">
        <%--  <jsp:include page="./header.jsp"></jsp:include> --%>   
            </div>

            <!--All home section-->
            <div class="allhome">
                <section class="home" id="home">
                    <div class="content">
                        <h3>Welcome to TutorDuo</h3>
                        <p>
                            The core content of the subject helps students to form and develop their communication ability through practicing listening, speaking, reading and writing skills.</p>
                        <a href="<i:ReadUrlFromContext url="/listarticle"/>" class="btn">More information</a>
                    </div>
                    <div class="image">
                       <!--  <img src="<i:ReadUrlFromContext url="/assets/image/background-title.png"/>" -->
                </div>
            </section>

            <!--section about us-->
            <section class="about" id="about">

                <div class="container">

                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <img  src="<i:ReadUrlFromContext url="/assets/image/why.jpg"/>" class="w-100" style="width: 50%;margin-top: 40px" alt="">

                        </div>
                        <div class="col-md-6">
                            <h3 class="title">Tutor duo</h3>
                            <p>why do you choose this website </p>
                            <div class="icons-container">
                                <div class="icons">
                                    <i class="fas fa-book-open"></i>
                                    <h3>Approaching to the lessons</h3>
                                </div>
                                <div class="icons">
                                    <i class="fas fa-chalkboard-teacher"></i>
                                    <h3>Hire the suitable teacher</h3>
                                </div>
                                <div class="icons">
                                    <i class="fas fa-school"></i>
                                    <h3>The high quality of subject</h3>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </section>
            
            </div>

            <!-- end section about us-->
</html>