<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"/>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="cssfile.css" type="text/css" />
    <link rel="stylesheet" href="css/displaytag.css" type="text/css" />
    <link rel="stylesheet" href="css/screen.css" type="text/css" />
    <link rel="stylesheet" href="css/site.css" type="text/css" />
    <title>Parent Details</title>
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
<div id="layout" class="container" style="padding-top: 16px; ">
    <div id="banner">
        <div class="bannerlogo"></div>
        <div class="text_header">Parents Information</div>
        <div class="right" style="text-align: right;">
            <c:if test="${authenticatedUser !=null}">
                <b> <a
                        href="listmarks.php?page=profile&&id=${authenticatedUser.id}"><button>Profile
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

    <div class="left" style="text-align: left; ">
        <%@ include file="menu.jsp"%>
    </div>

    <div id="middle">
        <c:if test="${authenticatedUser !=null}">
            <div class="options">

                <a href="createparent.php?page=createmark"><button>
                    <img src="icons/application_view_columns.png" /> Parent
                </button></a>
            </div>
            <div class="search">
                <form action="listparents.php" method="get">
                    <table>
                        <tr>
                            <td style="color: #000000;">Enter parent ID</td>
                            <td><input type="text" name="id" id="id" /></td>
                            <td><input type='submit' name="parentregistrationsearch"
                                       value='search' /></td>
                        </tr>
                    </table>
                </form>
            </div>
            <hr />
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <td>ID</td>
                        <td>Firstname</td>
                        <td>Lastname</td>
                        <td>Gender </td>
                        <td>Phone Number</td>
                        <td colspan="2" rowspan="1">Operation </td>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${parents}" var="prt" varStatus="prtstatus">
                        <tr>
                            <td>${prt.getId()}</td>
                            <td>${prt.getFirstName()}</td>
                            <td>${prt.getLastName()}</td>
                            <td>${prt.getGender()}</td>
                            <td>${prt.getPhoneNumber()}</td>

                            <td><a href="editparent.php?page=editparent">Edit</a></td>
                            <td><a href="deleteparent.php?page=deleteparent">Delete</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </form>
        </c:if>
    </div>
<%@ include file="footer.jsp"%>