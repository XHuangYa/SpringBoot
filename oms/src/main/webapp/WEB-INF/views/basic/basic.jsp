<%--
  User: liting
  Date: 2019/3/26
  Time: 9:33 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
            <title><tiles:getAsString name="title" /></title>
    </head>
    <body style="background: rgba(53, 53, 53, 0.98);"  >
        <table border="0" width="100%" height="800px" cellspacing="5" align="center" >
                <tr  >
                    <td   style="height: 50px" colspan="2" style="background:rgba(53, 53, 53, 0.98)">
                        <tiles:insertAttribute name="header" />
                    </td>
                </tr>

                <tr>
                    <td width="140" valign="top" style="background:rgba(53, 53, 53, 0.98);">
                        <tiles:insertAttribute name='menu' />
                    </td>
                    <td valign="top" align="left" style="background:white";>
                        <tiles:insertAttribute name='body' />
                    </td>
                </tr>
                <tr height="30px">
                    <td colspan="2">
                        <tiles:insertAttribute name="footer" />
                    </td>
                </tr>
            </table>
    </body>
</html>
