<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<jsp:include page="headeradmin.jsp"><jsp:param
        name="title" value="Create Student" />
</jsp:include>
<div id="middle">
    <h2 style="text-align: left;">
        <b>Enter Student Details</b>
    </h2>
    <c:if test="${message != null}">
        <fieldset>
            <h3>
                <span style="color: red"> ${message}</span>
            </h3>
        </fieldset>
    </c:if>
    <form action="createstudent.php?page=createstudent" method="post">
        <table>
            <tr>
                <td align="right"><b><t:field mandatory="yes"
                                              text="studentfname"></t:field></b></td>
                <td align="left"><input type="text" size="25" maxlength="50"
                                        name="firstName" id="firstName" /></td>
            </tr>
            <tr>
                <td align="right"><b><t:field mandatory="yes"
                                              text="studentfname"></t:field></b></td>
                <td align="left"><input type="text" size="25"
                                        maxlength="50" name="lastName" id="lastName" /></td>
            </tr>
            <tr>
                <td align="right"><b>Gender</b></td>
                <td align="left"><input type="text" size="50" maxlength="50"
                                        name="gender" id="gender" /></td>
            </tr>
            <tr>
                <td align="right"><b>Email</b></td>
                <td align="left"><input type="text" size="50" maxlength="50"
                                        name="email" id="email" /></td>
            </tr>

            <tr>
                <td align="right"><b>DOB</b></td>
                <td align="left"><input type="date" size="50" maxlength="50"
                                        name="dateOfBirth" id="dateOfBirth" /></td>
            </tr>

            <tr>
                <td align="right"><b>Address_id</b></td>
                <td align="left"><input type="number" size="50" maxlength="50"
                                        name="address" id="address" /></td>
            </tr>

            <tr>
                <td align="right"><b>PhoneNumber</b></td>
                <td align="left"><input type="text" size="50" maxlength="50"
                                        name="phoneNumber" id="phoneNumber" /></td>
            </tr>

            <tr>
                <td align="right">&nbsp;</td>
                <td align="left"><input type="submit" name="saveStd"
                                        value="Create Student" /></td>
            </tr>
        </table>
    </form>
    <a href="liststudents.php?page=students&&action=list">All students</a>

</div>
<%@ include file="footer.jsp"%>
