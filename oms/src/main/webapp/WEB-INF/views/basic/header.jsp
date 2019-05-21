<%@ page import="com.bakery.application.entity.Employee" %><%--
  User: liting
  Date: 2019/3/26
  Time: 9:35 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    Employee employee=(Employee)request.getSession().getAttribute("employees");
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>header</title>
    <script src="<%=basePath%>static/js/jquery-3.2.1.min.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap-theme.min.css">

    <style>
        .ha:hover {
            text-decoration: none;
            color: darkgrey;
        }

        .ha:visited {
            text-decoration: none;
            color: white;
        }

        .ha {
            color: white;
        }

        .hna {
            color: white;
        }

        .hd1 {
            font-size: 20px;
        }
    </style>
</head>
<body>
<input type="hidden" id="queryEmpManegeUrl" value="empManageListqueryEmp"/>
<div class="container-fluid hna">
    <div class="row">
        <div class="col-md-8 glyphicon glyphicon-bell hd1">&nbsp;UNIQUE&烘焙店后台管理系统</div>
        <div class="col-md-2 col-md-offset-2" style="text-align: center">
            <span class="dropdown">
                <a role="button" class="dropdown-toggle ha" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i> &nbsp;${employees.empName}
                    <i class="caret"></i>
                </a>
                <ul class="dropdown-menu">
                    <li onclick="show()"><a tabindex="-1" class="glyphicon glyphicon-user">&nbsp;个人信息</a></li>
                    <%--<li><a tabindex="-1"   class="glyphicon glyphicon-lock">&nbsp;修改密码</a></li>--%>
                    <li class="divider "></li>
                    <li><a tabindex="-1" href="<%=basePath%>oms" class="glyphicon glyphicon-log-in">&nbsp;切换账号</a></li>
                     <li class="divider "></li>
                    <li><a tabindex="-1" onclick="closeCurrentPage()" class="glyphicon glyphicon-off">&nbsp;登出</a></li>
                </ul>
          </span>
        </div>
    </div>
</div>
</div>
<!--模态框 start-->
<div class="modal fade" id="myInfo" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog modal-lg" role="document" style="width: 700px">
        <form class="form-horizontal" role="form" id="empForm" name="empForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button onclick="rightClose()" type="button" class="close" data-dismiss="modal"
                            aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">个人信息</h4>
                </div>
                <fieldset disabled>
                    <div class="modal-body" style="margin-right: 30px">
                        <input type="hidden" class="form-control" name="empNo" id="empNo" placeholder="请输入..."/>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2"><span style="color:red">*</span>员工名称:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="empName" id="empName"
                                       placeholder="请输入..."/>
                            </div>
                            <label class="control-label col-sm-2">员工密码:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="password" id="password"
                                       placeholder="默认123456"/>
                            </div>
                        </div>

                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2"><span style="color:red">*</span>电话号码:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="phone" id="phone" placeholder="请输入..."/>
                            </div>
                            <label class="control-label col-sm-2 "><span style="color:red">*</span>员工标识:</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="roleId" id="roleId"
                                        onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2 "><span style="color:red">*</span>员工职位:</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="job" id="job"
                                        onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                            <label class="control-label col-sm-2 "><span style="color:red">*</span>上级领导:</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="mgr" id="mgr"
                                        onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2">员工性别:</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="sex" id="sex"
                                        onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                            <label class="control-label col-sm-2">出生日期:</label>
                            <div class="col-sm-4 has-feedback ">
                                <input name="birth" id="birth" type="text" placeholder="精确到年月日... "
                                       class="form-control  input-sm "
                                       onFocus="WdatePicker({dateFmt: 'yyyy-MM-dd'})"/>
                                <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2">居住地址:</label>
                        </div>
                        <div class="form-group form-group-sm" style="padding-left: 10px">
                            <div class="col-sm-12">
                            <textarea class="form-control" name="addr" id="addr"
                                      style="resize:none; height: 50px;" rows="3"
                                      placeholder="请输入..."
                                      onkeyup="this.value=this.value.replace(/\s+/g,'')"></textarea>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2"><span style="color:red">*</span>员工薪资:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="sal" id="sal" placeholder="请输入..."/>
                            </div>
                            <label class="control-label col-sm-2 "><span style="color:red">*</span>归属部门:</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="depNo" id="depNo"
                                        onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2 ">存档时间:</label>
                            <div class="col-sm-4 has-feedback ">
                                <input name="doneTime" id="doneTime" type="text " placeholder="精确年月日时分秒 "
                                       class="form-control"
                                       onFocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt: 'yyyy-MM-dd'})"/>
                                <span class="glyphicon glyphicon-calendar form-control-feedback "></span>
                            </div>

                            <label class="control-label col-sm-2 ">修改时间:</label>
                            <div class="col-sm-4 has-feedback ">
                                <input name="updateTime" id="updateTime" type="text " placeholder="精确年月日时分秒 "
                                       class="form-control "
                                       onFocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt: 'yyyy-MM-dd'})"/>
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
                </fieldset>
                <div class="form-group form-group-sm">
                    <button id="closedMy" onclick="rightClose()" data-dismiss="modal"
                            class="btn btn-primary  col-sm-4 col-sm-offset-4">关闭
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<!--模态框 end-->
</body>
<script>
    /*关闭当前页*/
    function closeCurrentPage() {
        var userAgent = navigator.userAgent;
        if (userAgent.indexOf("Firefox") != -1 || userAgent.indexOf("Chrome") !=-1) {
            window.location.href="about:blank";
            window.close();
        } else {
            window.opener = null;
            window.open("", "_self");
            window.close();
        }
    }
    /*查看按钮*/
    function show() {
        var empNo = '<%=employee.getEmpNo()%>';
        var queryEmpManegeUrl=$("#queryEmpManegeUrl").val();
        $.ajax({
            type: "post",
            url: queryEmpManegeUrl,
            data: {"empNo": empNo},
            dataType: 'JSON',
            success: function (data, status) {
                if (status == "success") {
                    $('#myInfo #empNo').val(data.rows[0].empNo);
                    $('#myInfo #empName').val(data.rows[0].empName);
                    $('#myInfo #password').val(data.rows[0].password);
                    $('#myInfo #phone').val(data.rows[0].phone);
                    $('#myInfo #roleId').val(data.rows[0].roleId);
                    $('#myInfo #job').val(data.rows[0].job);
                    $('#myInfo #mgr').val(data.rows[0].mgr);
                    $('#myInfo #sex').val(data.rows[0].sex);
                    $('#myInfo #birth').val(data.rows[0].birth);
                    $('#myInfo #addr').val(data.rows[0].addr);
                    $('#myInfo #sal').val(data.rows[0].sal);
                    $('#myInfo #depNo').val(data.rows[0].depNo);
                    $('#myInfo #doneTime').val(data.rows[0].doneTime);
                    $('#myInfo #updateTime').val(data.rows[0].updateTime);
                    $('#myInfo #remark').val(data.rows[0].remark);
                    $('#myInfo').modal('show');

                }
            },
            error: function () {
                $.alert({
                    title: '提示',
                    content: '后台异常！',
                    type: 'red', //一般危险操作用red,保存成功操作green
                    buttons: { //定义按钮
                        confirm: {
                            text: '确认',
                            btnClass: 'btn-primary',
                            action: function () { //这里写点击按钮回调函数
                            }
                        }
                    }
                });
            },
            complete: function () {

            }

        });



    }

</script>
</html>
