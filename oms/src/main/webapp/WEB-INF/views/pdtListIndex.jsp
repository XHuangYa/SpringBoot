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
            width: 700px;
        }

    </style>
</head>
<body>
<ol class="breadcrumb">
    <li><a>Home</a></li>
    <li><a>商品管理</a></li>
    <li class="active">商品列表</li>
</ol>
<!-- 查询框 start -->
<div class="panel-body" style="padding-bottom:0px;">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="container">
                <form id="searchProductForm" name="searchProductForm" class="form-horizontal">
                    <div class="form-group">
                        <div class="row">
                            <label class="control-label col-md-1 ">商品名称:</label>
                            <div class="col-md-3 ">
                                <input type="text" class="form-control  input-sm " name="search_pdtId" id="search_pdtId"
                                       placeholder="请输入商品名称" onkeyup="this.value=this.value.replace(/\s+/g,'')"/>
                            </div>
                            <label class="control-label col-md-1">商品类别:</label>
                            <div class="col-md-3">
                                <select type="text" class="form-control  input-sm " id="search_pdtType"
                                        name="search_pdtType" onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                    <option value="">请选择</option>
                                    <option value="">请选择</option>
                                    <option value="">请选择</option>
                                </select>
                            </div>

                            <div class="col-md-1 col-md-offset-1 has-feedback"style="color: white; ">
                                <button class="btn btn-primary " style="width: 80px;text-align: left" type="button" id="searchBtn">查询</button>
                                <span class="glyphicon glyphicon-search form-control-feedback"></span>
                            </div>
                            <div class="col-md-2 has-feedback" style="padding-left: 60px;color: white;">
                                <button disabled class="btn btn-primary "
                                        style="width: 80px; background-color: grey; border-color: grey; text-align: left" type="button "
                                        id="resetSearchBtn ">重&nbsp;置</button>
                                <span class="glyphicon glyphicon-repeat  form-control-feedback" style="display: inline-block;padding-right: 70px"></span>
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog " role="document">
        <form class="form-horizontal" role="form" id="empForm" name="empForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2"><span>*</span>商品名称:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control input-sm" name="pdtName" id="pdtName" placeholder="请输入..." />
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">商品编号:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="pdtId" id="pdtId" placeholder="请输入..." />
                        </div>
                        <label class="control-label col-sm-2 ">商品类别:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="pdtType" id="pdtType" onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                <option value="">请选择</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">计量单位:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="measer" id="measer" placeholder="请输入..." />
                        </div>
                        <label class="control-label col-sm-2">商品单价:</label>
                        <div class="col-sm-4 has-feedback ">
                            <input name="unit_price " id="unit_price " type="text " placeholder="精确到年月日 " class="form-control  input-sm " />
                            <span class="glyphicon glyphicon-jpy form-control-feedback"></span>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 ">创建时间:</label>
                        <div class="col-sm-4 has-feedback ">
                            <input name="doneTime " id="doneTime " type="text " placeholder="精确到年月日时分秒 " class="form-control" />
                            <span class="glyphicon glyphicon-calendar form-control-feedback "></span>
                        </div>

                        <label class="control-label col-sm-2 ">修改时间:</label>
                        <div class="col-sm-4 has-feedback ">
                            <input name="updateTime " id="updateTime " type="text " placeholder="精确到年月日时分秒 " class="form-control " />
                            <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述:</label>
                    </div>
                    <div class="form-group form-group-sm"style="padding-left: 18px">
                        <div class="col-sm-12 " >
                            <textarea class="form-control" name="remark" id="remark" style="resize:none;height: 60px;"rows="3" placeholder="请输入..." onkeyup="this.value=this.value.replace(/\s+/g,'')"></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group-sm">
                    <button id="ok" class="btn btn-primary  col-sm-1 col-sm-offset-4   ">保存</button>
                    <button id="reseted" class="btn btn-warning  col-sm-1  col-sm-offset-2  ">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!--模态框 end-->
<button class="btn btn-danger" id="click">click</button>
</body>
<script>
    $(function() {
        $("#click").click(function() {
            $('#myModal').modal('show')
        })
    })
</script>
</html>
