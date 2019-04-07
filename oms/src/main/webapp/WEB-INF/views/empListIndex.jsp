<%--
  User: liting
  Date: 2019/3/26
  Time: 9:48 PM
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
    <title>Title</title>
    <script src="<%=basePath%>/static/js/jquery-3.2.1.min.js"></script>
    <script src="<%=basePath%>/static/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>/static/bootstrap/css/bootstrap.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .breadcrumb {
            width: 1205px;
            height: 40px;
            margin-left: 18px;
        }
        .row {
            margin-bottom: 10px;
        }
        .modal-dialog {
            width: 700px;
        }
    </style>
</head>
<body>
<ol class="breadcrumb">
    <li><a>Home</a></li>
    <li><a>员工管理</a></li>
    <li class="active">员工列表</li>
</ol>
<!-- 查询框 start -->
<div class="panel-body" style="padding-bottom:0px; padding-top:0px ;">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="container-fluid">
                <form id="searchEmpForm" name="searchEmpForm" class="form-horizontal">
                    <div class="form-group">
                        <div class="row">
                            <label class="control-label col-md-1 ">员工名称:</label>
                            <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm " name="search_empId" id="search_empId"
                                       placeholder="请输入客户名称">
                            </div>

                            <label class="control-label col-md-1 ">电话号码:</label>
                            <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm " id="search_empPhone "
                                       name="search_empPhone" placeholder="请输入电话号码">
                            </div>
                            <label class="control-label col-md-1 ">员工标识:</label>
                            <div class="col-md-2 ">
                                <select type="text" class="form-control  input-sm " id="search_roleId"
                                        name="search_roleId">
                                    <option value="">请选择用户级别</option>
                                    <option value="">普通管理员</option>
                                    <option value="">超级管理员</option>
                                </select>
                            </div>
                            <label class="control-label col-md-1 ">归属部门:</label>
                            <div class="col-md-2 ">
                                <select type="text" class="form-control  input-sm " id="search_dptId"
                                        name="search_dptId">
                                    <option value="">请选择归属部门</option>
                                    <option value="">普通管理员</option>
                                    <option value="">超级管理员</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group ">
                        <div class="row ">
                            <label class="control-label col-md-1 ">开始时间:</label>
                            <div class="col-md-3 has-feedback ">
                                <input name="beginTime " id="search_beginTime " type="text " placeholder="精确到年月日时分秒 "
                                       class="form-control Wdate input-sm "/>
                                <span class="glyphicon glyphicon-calendar form-control-feedback "></span>
                            </div>

                            <label class="control-label col-md-1 ">结束时间:</label>
                            <div class="col-md-3 has-feedback ">
                                <input name="endTime " id="search_endTime " type="text " placeholder="精确到年月日时分秒 "
                                       class="form-control Wdate input-sm "/>
                                <span class="glyphicon glyphicon-calendar form-control-feedback "></span>
                            </div>

                            <div class="col-md-1 col-lg-offset-2   has-feedback " style="color: white">
                                <button class="btn btn-primary " style="width: 70px;  text-align: left;" type="button "
                                        id="searchBtn ">查&nbsp;询
                                </button>
                                <span class="glyphicon glyphicon-search form-control-feedback"></span>
                            </div>
                            <div class="col-md-1 has-feedback " style="color: white">
                                <button disabled class="btn btn-primary "
                                        style="width: 70px; background-color: grey; border-color: grey; text-align: left;"
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
<!--查询框 end-->
<!--模态框 start-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <form class="form-horizontal" role="form" id="empForm" name="empForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
                </div>
                <div class="modal-body" style="margin-right: 30px">
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2"><span>*</span>员工编号:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control input-sm" name="empId" id="empId"
                                   placeholder="请输入..."/>
                        </div>
                        <label class="control-label col-sm-2 ">员工名称:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="empName" id="empName" placeholder="请输入..."/>
                        </div>
                    </div>

                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">电话号码:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="empPhone" id="empPhone" placeholder="请输入..."/>
                        </div>
                        <label class="control-label col-sm-2 "><span>*</span>员工标识:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="roleId" id="roleId"
                                    onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                <option value="">请选择</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 ">员工职位:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="emoJob" id="emoJob"
                                    onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                <option value="">请选择</option>
                            </select>
                        </div>
                        <label class="control-label col-sm-2 ">上级领导:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="empMgr" id="empMgr"
                                    onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                <option value="">请选择</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">员工性别:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="sex" id="sex" placeholder="请输入..."/>
                        </div>
                        <label class="control-label col-sm-2">出生日期:</label>
                        <div class="col-sm-4 has-feedback ">
                            <input name="empBirth " id="empBirth " type="text " placeholder="精确到年月日... "
                                   class="form-control  input-sm "/>
                            <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">居住地址:</label>
                    </div>
                    <div class="form-group form-group-sm" style="padding-left: 10px">
                        <div class="col-sm-12">
                            <textarea class="form-control" name="address" id="address"
                                      style="resize:none; height: 50px;" rows="3"
                                      placeholder="请输入..."
                                      onkeyup="this.value=this.value.replace(/\s+/g,'')"></textarea>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">员工薪资:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="empsal" id="empsal" placeholder="请输入..."/>
                        </div>
                        <label class="control-label col-sm-2 ">归属部门:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="deptId" id="deptId"
                                    onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                <option value="">请选择</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 ">存档时间:</label>
                        <div class="col-sm-4 has-feedback ">
                            <input name="doneTime " id="doneTime " type="text " placeholder="精确年月日时分秒 "
                                   class="form-control"/>
                            <span class="glyphicon glyphicon-calendar form-control-feedback "></span>
                        </div>

                        <label class="control-label col-sm-2 ">修改时间:</label>
                        <div class="col-sm-4 has-feedback ">
                            <input name="updateTime " id="updateTime " type="text " placeholder="精确年月日时分秒 "
                                   class="form-control "/>
                            <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述:</label>
                    </div>
                    <div class="form-group form-group-sm" style="padding-left: 10px">
                        <div class="col-sm-12 ">
                            <textarea class="form-control" name="remark" id="remark" style="resize:none; height: 70px"
                                      rows="3" placeholder="请输入..."
                                      onkeyup="this.value=this.value.replace(/\s+/g,'')"></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group-sm">
                    <button id="ok" class="btn btn-primary  col-sm-1 col-sm-offset-4   " style="width: 80px">保存</button>
                    <button id="reseted" class="btn btn-warning  col-sm-1  col-sm-offset-2 " style="width: 80px">重置
                    </button>
                </div>
            </div>
        </form>
    </div>
    <!--模态框 end-->
</div>
<button class="btn btn-danger" id="click">click</button>
</body>
<script>
    $(function () {
        $("#click").click(function () {
            $('#myModal').modal('show')
        })
    })
</script>
</html>
