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
    <style>
        *{
            margin: 0;
            padding: 0;
        }

    </style>
    </head>
    <body style="background: black">

        <div class="container-fluid">
            <div class="row" style="background: black;height: 30px">
                <tiles:insertAttribute name='header' />
            </div>
            <div class="row" style="background: rgba(157,157,157,0.7)" >
                <div class="col-md-2" style="width: 200px;margin-top:60px">
                    <tiles:insertAttribute name='menu' />
                </div>
                <div class="col-md-10" style="background: white;width: 1250px;">
                    <tiles:insertAttribute name='body' />
                </div>
            </div>
            <div class="row" style="background: black;height: 10px">
                <tiles:insertAttribute name="footer" />
            </div>
        </div>

<%--
        <table border="0" width="100%" height="700px" cellspacing="5" align="center">
                <tr style="height: 10px">
                    <td  colspan="2">
                        <tiles:insertAttribute name='header' />
                    </td>
                </tr>

                <tr>
                    <td width="140" valign="top">
                        <tiles:insertAttribute name='menu' />
                    </td>
                    <td valign="top" align="left" style="background:white";>
                        <tiles:insertAttribute name='body'/>
                    </td>
                </tr>
                <tr height="15px">
                    <td colspan="2">
                        <tiles:insertAttribute name="footer" />
                    </td>
                </tr>
            </table>--%>
    </body>
</html>
