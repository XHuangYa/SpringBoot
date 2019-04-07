<%--
  User: liting
  Date: 2019/4/1
  Time: 10:28 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>product</title>
    <script src="<%=basePath%>/static/js/jquery-3.2.1.min.js"></script>
    <script src="<%=basePath%>/static/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>/static/bootstrap/css/bootstrap.min.css">
    <style>
        .breadcrumb {
            width: 1205px;
            height: 40px;
            margin-left: 18px;
        }

        .modal-dialog {
            width: 400px;
        }

        .modal-body {
            margin-right: 15px;
        }

    </style>


</head>

<body>
<ol class="breadcrumb">
    <li><a>Home</a></li>
    <li><a>订单管理</a></li>
    <li class="active">订单列表</li>
</ol>
<!-- 查询框 start -->
<div class="panel-body" style="padding-bottom:0px; padding-top:0px ;">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="container-fluid">

                <form id="searchOrderForm" name="searchOrderForm" class="form-horizontal">
                    <div class="form-group  ">
                        <div class="row">
                            <label class="control-label col-md-1 ">客户名称:</label>
                            <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm " name="search_userName"
                                       id="search_userName" placeholder="请输入客户名称">
                            </div>

                            <label class="control-label col-md-1 ">时&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;间:</label>
                            <div class="col-md-2 has-feedback ">
                                <input name="beginTime " id="search_beginTime " type="text " placeholder="精确到年月日时分秒 "
                                       class="form-control input-sm "/>
                                <span class="glyphicon glyphicon-calendar form-control-feedback "></span>
                            </div>

                            <label class="control-label col-md-1 " style="padding-right: 60px; ">至:</label>
                            <div class="col-md-2 has-feedback ">
                                <input name="endTime " id="search_endTime " type="text " placeholder="精确到年月日时分秒 "
                                       class="form-control  input-sm "/>
                                <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
                            </div>
                            <div class="col-md-1  col-md-offset-1 has-feedback " style="color: white">
                                <button class="btn btn-primary " style="width: 80px;  text-align: left;" type="button "
                                        id="searchBtn ">查&nbsp;询
                                </button>
                                <span class="glyphicon glyphicon-search form-control-feedback"></span>
                            </div>
                            <div class="col-md-1 has-feedback " style="color: white">
                                <button disabled class="btn btn-primary "
                                        style="width: 80px; background-color: grey; border-color: grey; text-align: left;"
                                        type="button " id="resetSearchBtn "> 重&nbsp;置
                                </button>
                                <span class="glyphicon glyphicon-repeat form-control-feedback"></span>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 查询框 end -->
<!--模态框 start-->
<button class="btn btn-danger" id="click">click</button>
<div class="modal fade  bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <form class="form-horizontal" role="form" id="empForm" name="empForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
                </div>
                <div class="modal-body" style="padding-right: 25px;">

                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">明细编号:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control input-sm" name="order_dtlId" id="order_dtlId"
                                   placeholder="请输入..."/>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">商品名称:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control input-sm" name="pdtName" id="pdtName"
                                   placeholder="请输入..."/>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">出售时间:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control input-sm" name="doneTime" id="doneTime"
                                   placeholder="请输入..."/>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">出售数量:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control input-sm" name="saleNum" id="saleNum"
                                   placeholder="请输入..."/>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control input-sm" name="unit_price" id="unit_price"
                                   placeholder="请输入..."/>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control input-sm" name="total_price" id="total_price"
                                   placeholder="请输入..."/>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">客&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;户:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control input-sm" name="userName" id="userName"
                                   placeholder="请输入..."/>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-4">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>
                    </div>
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12" style="margin-left: 25px; padding-right: 40px; ">
                            <textarea class="form-control" name="remark" id="remark" style="resize:none;height: 40px"
                                      rows="2"
                                      placeholder="请输入..."
                                      onkeyup="this.value=this.value.replace(/\s+/g,'')"></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group-sm">
                    <button id="ok" class="btn btn-primary  col-sm-2 col-sm-offset-3   btn-sm">保存</button>
                    <button id="reseted" class="btn btn-warning  col-sm-2  col-sm-offset-2  btn-sm">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!--模态框 end-->
</body>
<script>
    $(function () {
        $("#click").click(function () {
            $('#myModal').modal('show')
        })
    })
</script>
</html>
