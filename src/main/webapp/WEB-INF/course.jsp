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
    <title>Course Registrations</title>
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
        <div class="text_header">RCA Management Information System</div>
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
            <div class="options">

                <a href="createcourse.php?page=createcourse"><button>
                    <img src="icons/application_view_columns.png" /> New course
                </button></a>
            </div>
            <div class="search">
                <form action="listcourse.php" method="get">
                    <table>
                        <tr>
                            <td style="color: #000000;">Enter course ID</td>
                            <td><input type="text" name="id" id="id" /></td>
                            <td><input type='submit' name="courseregistrationsearch"
                                       value='search' /></td>
                        </tr>
                    </table>
                </form>
            </div>
            <hr />
            <form action="listcourse.php?page=statusapproval" method="post">
                <fieldset>
                    <legend> Course Registration Approval Status </legend>

                    <table style="border: 0;">
                        <tr>
                            <td align="left"><input type="text" size="15"
                                                    maxlength="50" readonly="readonly" name="savedBy" id="savedBy"
                                                    hidden="hidden" value="${authenticatedUser.id}" /></td>

                        </tr>
                    </table>

                    <table>
                        <thead>
                        <tr>
                            <td>ID</td>
                            <td>CourseName</td>
                            <td>CourseCode</td>
                            <td>Star Date</td>
                            <td>End Date</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${courses}" var="course" varStatus="usrstatus">
                            <tr>
                                <td>${course.getId()}</td>
                                <td>${course.getName()}</td>
                                <td>${course.getCode()}</td>
                                <td>${course.getStart()}</td>
                                <td>${course.getEnd()}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </fieldset>
            </form>
        </c:if>
    </div>
<%@ include file="footer.jsp"%>