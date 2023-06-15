<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<head>
  <link rel="stylesheet" href="style.css" type="text/css" />
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>

  <style>
    .container {
      max-width: 60%;
      margin: 0 auto;
    }

    .form-control {
      width: 100%;
    }

    .header-container {
      text-align: center;
      padding-top: 32px;
      margin-bottom: 32px;
    }

  </style>
</head>

<div class="container">
  <div class="header-container">
    <jsp:include page="headeradmin.jsp">
      <jsp:param name="title" value="Create Parent" />
    </jsp:include>
  </div>
</div>

<div id="middle">
  <h3 style="text-align: center; padding-top: 32px;">
    <b>Enter Parent Details</b>
  </h3>
  <c:if test="${message != null}">
    <fieldset>
      <h3>
        <span style="color: red">${message}</span>
      </h3>
    </fieldset>
  </c:if>
  <form action="createparent.php?page=createparent" method="post" class="form-group">
    <label for="firstname">Firstname:</label>
    <input type="text" size="25" maxlength="50" name="firstname" id="firstname" class="form-control" />

    <label for="lastname">Lastname:</label>
    <input type="text" size="50" maxlength="50" name="lastname" id="lastname" class="form-control" />

    <label for="dob">Date of Birth:</label>
    <input type="date" name="dob" id="dob" class="form-control" />

    <label for="email">Email:</label>
    <input type="text" size="50" maxlength="50" name="email" id="email" class="form-control" />

    <label for="phonenumber">Phone Number:</label>
    <input type="number" name="phonenumber" id="phonenumber" class="form-control" />

    <label>
      <input type="radio" name="gender" value="male">
      Male
    </label>

    <label>
      <input type="radio" name="gender" value="female">
      Female
    </label>

    <br>

    <label for="address">Address:</label>
    <input type="number" name="address" id="address" class="form-control" />

    <label for="student">Student ID:</label>
    <input type="number" name="student" id="student" class="form-control" />

    <input type="submit" name="savePrt" value="Register Parent" class="btn btn-primary" style="margin-top: 16px;" />
  </form>
</div>

<%@ include file="footer.jsp" %>