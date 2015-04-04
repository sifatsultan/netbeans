<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : response
    Created on : Mar 31, 2015, 12:06:43 PM
    Author     : Sifat
--%>

<sql:query var="counselorQuery" dataSource="jdbc/IFPWAFCAD">
    SELECT * FROM Subject, Counselor WHERE Counselor.counselor_id = Subject.counselor_idfk AND Subject.subject_id = ? <sql:param value="${param.subject_id}"/>
</sql:query>

<c:set var="counselorDetails" value="${counselorQuery.rows[0]}"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>IFPWAFCAD - ${counselorDetails.name}</title>
    </head>
    <body>
        <table border="0">
            <thead>
                <tr>
                    <th colspan="2">${counselorDetails.name}</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><h3>Description: </h3></td>
                    <td><span class="description">${counselorDetails.description}</span></td>
                </tr>
                <tr>
                    <td><h3>Counselor: </h3></td>
                    <td><strong>${counselorDeitals.name} ${counselorDetails.nickname} ${counselorDetails.last_name}</strong> 
                        <br>
                        <span style="font-size:smaller; font-style:italic;">
                            <em>member since: ${counselorDetails.member_since}</em></span>
                    </td>
                </tr>
                <tr>
                    <td><h3>Contact Details: </h3></td>
                    <td><strong>email: </strong>
                        <a href="mailto:${counselorDetails.email}">${counselorDetails.email}</a>
                        <br><strong>phone: </strong>${counselorDetails.telephone}
                    </td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
