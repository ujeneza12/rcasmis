<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"/>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" href="cssfile.css" type="text/css" />
  <link rel="stylesheet" href="css/displaytag.css" type="text/css" />
  <link rel="stylesheet" href="css/screen.css" type="text/css" />
  <link rel="stylesheet" href="css/site.css" type="text/css" />
  <title>Employee Details</title>
</head>
<style>
  table {
    font-family: Quicksand, sans-serif;
    border-collapse: collapse;
    width: 100%;
  }

  td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 14px;
  }

  thead{
    background-color: deepskyblue;
    color: white;
    font-family: 'quicksand', sans-serif;
    font-weight: bold;
  }
</style>
<body>
<div id="layout">
  <div id="banner">
    <div class="bannerlogo"></div>
    <div class="text_header">Employee registrations</div>
    <div class="right" style="text-align: right;">
      <c:if test="${authenticatedUser !=null}">
        <b> <a
                href="listuser.php?page=profile&&id=${authenticatedUser.id}"><button>Profile
        </button></a> | <img src="icons/user.png" /> <font color="#ffffff">${authenticatedUser.userRole}:
            ${authenticatedUser.username}</font> | <a href="login.ap?page=logout"><font
                color="#ffffff">Logout</font></a>
        </b>
      </c:if>
      <c:if test="${authenticatedUser ==null}">
        <div class="menu" align="left">
          | <a href="login.php?">Login</a> |
        </div>
      </c:if>
    </div>
  </div>
  <div>
    <%@ include file="menu.jsp"%>
  </div>

  <div id="middle">
    <c:if test="${authenticatedUser !=null}">

      <form action="listemployees.php?page=statusapproval" method="post" class="form-group">
        <div class="search" style="text-align: right; padding-top: 16px; ">
          <form action="listemployees.php" method="get">
            Enter Employee ID
            <input type="text" name="id" id="id" />
            <input type='submit' name="userregistrationsearch"
                   value='search' />

          </form>
        </div>
        <table class="table table-bordered">
          <thead>
          <tr>
            <td>ID</td>
            <td>Name</td>
            <td>Email</td>
            <td>Role</td>
            <td>Check User</td>
            <td colspan="2" rowspan="1">Operation </td>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${users}" var="usr" varStatus="usrstatus">
            <tr>
              <td name="id">${usr.id}</td>
              <td name="fullname">${usr.fullName}</td>
              <td name="email"$>${usr.email}</td>
              <td name="role">${usr.userRole.getRoleDescription()}</td>
              <td><input type="checkbox" name="usrIds"
                         value="${usr.id}" /></td>
              <td><a href="editemployee.php?page=editemployee">Edit</a></td>
              <td><a href="deleteuser.php?page=deleteuser">Delete</a></td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </form>
    </c:if>
  </div>
<%@ include file="footer.jsp"%>