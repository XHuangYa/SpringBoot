
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
    <%--js--%>
    <script src="<%=basePath%>static/js/jquery-3.2.1.min.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/jquery-confirm.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap-table.min.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap-table-zh-CN.min.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap-table-group.js"></script>
    <script src="<%=basePath%>static/My97DatePicker/WdatePicker.js"></script>
    <script src="<%=basePath%>static/js/jquery.serializejson.min.js"></script>
    <script src="<%=basePath%>static/jquery_mloading/jquery.mloading.js"></script>
    <script src="<%=basePath%>static/bootstrap/bootstrapValidator/js/bootstrapValidator.min.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap-editable.min.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap-table-editable.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="<%=basePath%>static/js/jquery.dataTables.js"></script>
    <script src="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.js"></script>
    <%--css--%>
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/jquery-confirm.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap-table.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap-table-group.css">
    <link rel="stylesheet" href="<%=basePath%>static/jquery_mloading/jquery.mloading.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/bootstrapValidator/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap-editable.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href=" http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.css">
    <style>
        * {
            margin: 0;
            padding: 0;
          }

        .breadcrumb {
            width: 1200px;
            height: 40px;
            margin-top: 15px;
        }
        .row {
            margin-bottom: 10px;
        }
        .modal-dialog {
            width: 700px;
        }
        .serbtn{
            padding-left: 850px;
        }
        .btnfun{

        }
        .text-c>th{
        text-align: center;
        }
        #table-div1 .pagination{
        position:relative;
        margin-left: -530px;
        margin-top: 45px;
        float: left;
        }
        #table-div1 .dataTables_info{
        position:relative;
        margin-right: -120px;
        }
    </style>
</head>
<body>
<input type="hidden" id="baseCodeTypePageList" value="<%=basePath%>codeTypeByPageList" />
<input type="hidden" id="baseCodePageList" value="<%=basePath%>baseCodeByPageList" />
<input type="hidden" id="insertCodeType" value="<%=basePath%>insertCodeType" />
<input type="hidden" id="updateCodeType" value="<%=basePath%>updateCodeType" />
<input type="hidden" id="deleteInfoCodeType" value="<%=basePath%>deleteInfoCodeType" />
<input type="hidden" id="deleteCodeTypeList" value="<%=basePath%>deleteListCodeType" />
<input type="hidden" id="insertCode" value="<%=basePath%>insertCode" />
<input type="hidden" id="updateCode" value="<%=basePath%>updateCode" />
<input type="hidden" id="deleteInfoCode" value="<%=basePath%>deleteInfoCode" />
<input type="hidden" id="deleteCodeList" value="<%=basePath%>deleteListCode" />

<div class="container-fluid">
	<ol class="breadcrumb">
        <li><a href="<%=basePath%>welcome">Home</a></li>
	    <li><a>字典管理</a></li>
	    <li class="active">数据字典</li>
	</ol>
</div>
<!-- 查询框 start -->
<div class="panel-body" style="padding-bottom:0px;">
    <div class="panel panel-default">
    <div class="panel-heading">查询条件</div>
    <div class="panel-body">
       <div class="container-fluid">
            <form id="searchBasecodeForm" name="searchBasecodeForm" class="form-horizontal">
                <div class="form-group">
                        <div class="row">
                            <label class="control-label col-md-1 ">类别代码:</label>
                            <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm " name="search_codeType" id="search_codeType"
                                       placeholder="请输入类别代码">
                            </div>

                            <label class="control-label col-md-1 ">类别名称:</label>
                             <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm " name="search_codeName" id="search_codeName"
                                       placeholder="请输入类别名称">
                            </div>
                          <input type="hidden" name="rowid" id="rowid">
		                   <span class="input-group-btn ">
							<button style="margin-left: 50px" class="btn btn-primary" type="button" id="searchBtn" onclick="searchDatas();" style="margin-right: 10px; margin-left: 10px"><span class="glyphicon glyphicon-zoom-in">
							</span>查&nbsp;&nbsp;&nbsp;询</button>
							<button style="margin-left: 70px" class="btn btn-primary" type="button"  id="resetSearchBtn" onclick="resetSearchConditions();"><span class="glyphicon glyphicon-remove">
						   </span>重&nbsp;&nbsp;&nbsp;置</button>
				          </span>

			           </div>
                    </div>


		  </form>
	</div>
    </div>
	</div>
</div>
<!--查询框 end-->
<!--类别模态框 start-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <form class="form-horizontal" role="form" id="baseCodeTypeForm" name="baseCodeTypeForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
                </div>
                <div class="modal-body" style="margin-right: 30px">
                <input type="hidden" name="ids" id="id" />
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 ">类别代码:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="codeType" id="codeType" oninput="check()" onmouseleave="checkInputing()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
                        </div>

                        <label class="control-label col-sm-2">类别名称:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="codeName" id="codeName" oninput="check()" onmouseleave="checkInputing()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..."/>
                        </div>
                    </div>

                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述:</label>
                    </div>
                    <div class="form-group form-group-sm" style="padding-left: 10px">
                        <div class="col-sm-12 ">
                            <textarea class="form-control" name="remark" id="remark" style="resize:none; height: 70px"
                                      rows="3" placeholder="请输入..." oninput="check()" onmouseleave="checkInputing()"
                                      onkeyup="this.value=this.value.replace(/\s+/g,'')"></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group-sm">
                    <button id="okCodeType" class="btn btn-default  col-sm-1 col-sm-offset-2  "  onclick="submitCodeType()" style="width: 80px">保存</button>
                    <button id="resetedCodeType" class="btn btn-default  col-sm-1  col-sm-offset-2 " onclick="resetCodeType()" style="width: 80px">重置</button>
                    <button id="closeCodeTypeModel" type="button" class="btn btn-default col-sm-1  col-sm-offset-2 "  data-dismiss="modal">关闭</button>
                </div>
            </div>
        </form>
    </div>
</div>
    <!--模态框 end-->
<!--明细模态框 start-->
<div class="modal fade" id="myModalTwo" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabelTwo">
    <div class="modal-dialog modal-lg" role="document">
        <form class="form-horizontal" role="form" id="baseCodeForm" name="baseCodeForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabelTwo">Modal title</h4>
                </div>
                <div class="modal-body" style="margin-right: 30px">
                <input type="hidden" name="codes" id="codes" />
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 ">代码:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="dataCode" id="dataCode" oninput="check2()" onmouseleave="checkInputing2()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
                        </div>

                        <label class="control-label col-sm-2">名称:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="codeName" id="dataName" oninput="check2()" onmouseleave="checkInputing2()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..."/>
                        </div>
                    </div>

                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 ">类别代码:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="codeType" id="codeTypeTwo" oninput="check2()" onmouseleave="checkInputing2()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述:</label>
                    </div>
                    <div class="form-group form-group-sm" style="padding-left: 10px">
                        <div class="col-sm-12 ">
                            <textarea class="form-control" name="remark" id="remarkTwo" style="resize:none; height: 70px"
                                      rows="3" placeholder="请输入..." oninput="check2()" onmouseleave="checkInputing2()"
                                      onkeyup="this.value=this.value.replace(/\s+/g,'')"></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group-sm">
                    <button id="okCode" class="btn btn-default  col-sm-1 col-sm-offset-2  "  onclick="submitCode()" style="width: 80px">保存</button>
                    <button id="resetedCode" class="btn btn-default  col-sm-1  col-sm-offset-2 " onclick="resetCode()" style="width: 80px">重置</button>
                    <button id="closeCodeModel" type="button" class="btn btn-default col-sm-1  col-sm-offset-2 "  data-dismiss="modal">关闭</button>
                </div>
            </div>
        </form>
    </div>
</div>


<div id='table-div1' style="width:45%;float:left;">
	<div class="btn-group" style="margin-top:10px; " >
	   <button type="button" class="btn btn-default" onclick="addCodeTypeFun()" style="margin-left:16px"> 新增</button>
		<button class="btn btn-default" onclick="deleteCodeTypeListFun()" >&nbsp;删除</button>
	</div>
	<table class="display table table-striped table-bordered table-hover table-checkable text-center" id="codeTypeListTable" style="white-space:nowrap">
		<thead>
			<tr class="text-c">
			    <th>
	                <input type="checkbox" id="checkCodeTypeall" class="checkCodeTypeall" name="checkBoxs" />
	            </th>
				<th></th>
				<th>类别代码</th>
				<th>类别名称</th>
				<th>操作</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>
<div id='table-div2'  style="width:54%;float: right;visibility: hidden">
	<div class="btn-group" style="margin-top:10px;" >
	   <button type="button" class="btn btn-default" onclick="addCodeFun()" style="margin-left:16px">&nbsp;新增</button>
	   <button class="btn btn-default" onclick="deleteCodeListFun()" >&nbsp;删除</button>
	</div>
	<table class="display table table-striped table-bordered table-hover table-checkable text-center" id="codeListTable" style="white-space:nowrap">
		<thead>
			<tr class="text-c">
			    <th>
	                <input type="checkbox" id="checkCodeall" class="checkCodeall" name="checkBoxsTwo" />
	            </th>
	            <th></th>
				<th>代码</th>
				<th>名称</th>


				<th></th>
				<th>操作</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>
</body>
<script type="text/javascript">
var codeType=null;
var codeName=null;
var dataCode=null;
var dataName=null;
var codeTypeRemark=null;
var codeRemark=null;


   $(document).ready(function() {
	   //默认加载类别dataTable
	   codeTypeDataTableDraw();

	  //默认加载明细dataTable
	   codeDataTableDraw();

	   //类别表单验证
	   codeTypeValidator();

	  //明细表单验证
	   codeValidator();

	  //点击左侧列表
	   var myTable = $('#codeTypeListTable').DataTable();
	   $('#codeTypeListTable').on('click', 'tr',function() {
		   var data = myTable.row(this).data(); //获取单击那一行的数据
		   $('#rowid').val(data.codeType);
           $('#search_codeType').val('');
           var tableTwo = $('#codeListTable').DataTable();
    	   tableTwo.draw(true);                    //刷新列表2
		   $('#table-div2').css("visibility", "visible");
		 });

   });

   $("#okCodeType").attr("disabled","true");
   $("#okCodeType").attr("style","background-color:grey;border-color:grey");
   $("#okCode").attr("disabled","true");
   $("#okCode").attr("style","background-color:grey;border-color:grey");
   function check()
   {
     $("#okCodeType").removeAttr("disabled");
     $("#resetedCodeType").removeAttr("disabled");
     $("#resetedCodeType").removeAttr("style","border-color:grey;background-color:grey");
     $("#okCodeType").removeAttr("style","border-color:grey;background-color:grey");
   }
    function checkInputing(){
		var  codeType=$("#baseCodeTypeForm #codeType").val();
		var  codeName=$("#baseCodeTypeForm #codeName").val();
		var  remark=$("#baseCodeTypeForm #remark").val();
		if((codeType=='')&& (codeName=='' )&&(remark==''))
		{
			$("#okCodeType").attr("disabled","true");
			$("#resetedCodeType").attr("disabled","true");
			$("#okCodeType").attr("style","background-color:grey;border-color:grey");
			$("#resetedCodeType").attr("style","background-color:grey;border-color:grey");
	    }else{
	    	check();
	    }
	}


   function check2()
   {
     $("#okCode").removeAttr("disabled");
     $("#resetedCode").removeAttr("disabled");
     $("#resetedCode").removeAttr("style","border-color:grey;background-color:grey");
     $("#okCode").removeAttr("style","border-color:grey;background-color:grey");
   }
   function checkInputing2(){
	    var  dataCode=$("#baseCodeForm #dataCode").val();
		var  codeName=$("#baseCodeForm #dataName").val();
		var  remarkTwo=$("#baseCodeForm #remarkTwo").val();
		if((dataCode=='')&& (codeName=='' )&&(remarkTwo==''))
		{
			$("#okCode").attr("disabled","true");
			$("#resetedCode").attr("disabled","true");
			$("#okCode").attr("style","background-color:grey;border-color:grey");
			$("#resetedCode").attr("style","background-color:grey;border-color:grey");
	    }else{
	    	check2();
	    }
	}


   //表单验证配置
   function codeTypeValidator(){
   $('#baseCodeTypeForm').bootstrapValidator({
	   message: '不可用的值',
       feedbackIcons: {
	   valid: 'glyphicon glyphicon-ok',
	   invalid: 'glyphicon glyphicon-remove',
	   validating: 'glyphicon glyphicon-refresh'
            },
      fields: {
    	  codeType: {
              validators: {
                  notEmpty: {
                      message: '类别代码不能为空'
                  }
              }
          },
          codeName: {
              validators: {
                  notEmpty: {
                      message: '类别名称不能为空'
                  }
              }
          },
      }
    });
   }

 //表单验证配置
   function codeValidator(){
   $('#baseCodeForm').bootstrapValidator({
	   message: '不可用的值',
       feedbackIcons: {
	   valid: 'glyphicon glyphicon-ok',
	   invalid: 'glyphicon glyphicon-remove',
	   validating: 'glyphicon glyphicon-refresh'
            },
      fields: {
    	  dataCode: {
              validators: {
                  notEmpty: {
                      message: '代码不能为空'
                  }
              }
          },
          codeName: {
              validators: {
                  notEmpty: {
                      message: '名称不能为空'
                  }
              }
          }

      }
    });
   }

   /* 初始化类别 */
   var codeTypeUrlStr = $("#baseCodeTypePageList").val();
   function codeTypeDataTableDraw(){
    $("#codeTypeListTable").dataTable({
	 pagingType: 'full_numbers',
	 scrollY:"260px",
	 scrollX:false,
	 processing : true, //加载转态
	 ordering:false,       //禁用排序去掉图标
	 bProcessing : true, //DataTables载入数据时，是否显示‘进度’提示
	 bAutoWidth: false,
     bServerSide:true, //开启后端分页
     bDestroy: true,         //下边两个属性应该是重载数据相关的 不加在加载数据会弹窗报错 点击确定后显示数据
     bRetrieve: true,
     bProcessing: true, //显示加载数据时的提示
     bInfo:true,  //显示信息 如 当前x页 共x条数据等
     bFilter:false,  //检索、筛选框
     sAjaxSource:codeTypeUrlStr, //请求url
     bLengthChange:false, //支持变更页面显示数据行数
     sPaginationType: "bootstrap", //翻页风格
     bPaginate:true,  //显示翻页按钮
     iDisplayLength : 5,
     iDisplayStart :0,
     fnServerData: retrieveData, //执行函数
     //动态生成复选框
     fnDrawCallback: function() {
           $(this).find('thead input[type=checkbox]').removeAttr('checked');
       },
     aoColumnDefs: [{
                       'targets': 0,
                       'searchable':false,
                       'orderable':false,
                       'className': 'dt-body-center',
                       'render': function (data, type, row){
                        return '<input class="checkbox_select" type="checkbox" data-status="'+ row.status + '"name="id[]" value="' + $('<div/>').text(row.codeType).html() + '">';

                       }
                  }],
     aoColumns:[//列表元素  支持多种属性
                      { "mData": ""},
					  {
					     "mData": "codeType",
					     "visible": false
					  },
                      { "mData": "codeType"},
                      { "mData": "codeName"},
					  {"mData":null,
				            render: function (data, type, row, meta){
				              var html="<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"selectCodeTypeFun('"+meta.row+"')\">查看</button>"+
				            	       "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"updateCodeTypeFun('"+meta.row+"')\">修改</button>"+
				                       "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"deleteCodeTypeFun('"+row.codeType+"')\">删除</button>"
				               return html;
				            }
				      },
				      { "mData": "remark",
				    	  "visible": false
				      }

                  ],
     oLanguage: { 
          "sProcessing" : "正在加载中......", 
          "sLengthMenu" : "_MENU_", 
          "sZeroRecords" : "无记录", 
          "sEmptyTable" : "表中无数据存在！", 
          "sInfo" : "当前显示 _START_ 到 _END_ 条，共 _MAX_  条记录", 
          "sInfoEmpty" : "没有数据", 
          "sInfoFiltered" : "数据表中共为 _TOTAL_ 条记录", 
          "sSearch" : " ", 
          "oPaginate" : { 
           "sFirst" : " 首页 ", 
           "sPrevious" : " 上一页 ", 
           "sNext" : " 下一页 ", 
           "sLast" : " 末页 " 
           } 
    } 
    });
   // $(".dataTables_wrapper .dataTables_filter input").attr("placeholder","检索内容");

}
 //对应上边的回调函数 参数个数不变 名字可改 第一个为请求url  第二个为上送数据 第三个为回调函数
	function retrieveData(sSource,aoData,fnCallback) {
	 var codeTypeSearch = {
	   "name":"codeTypeSearch",
	   "value":$("#search_codeType").val()
	 }
	 var codeNameSearch = {
	   "name":"codeNameSearch",
	   "value":$("#search_codeName").val()
	 }
	 //我这里按照请求数据的格式增加了自己的查询条件 请求数据格式固定为 name-value的格式 可以使用
	 //alert打印查看 包含了基本的页码、页面数据元素、等信息以及新增的查询条件
	 //console.info("codeTypeSearch:"+codeTypeSearch);
	 //console.info("codeNameSearch:"+codeNameSearch);
	 aoData.push(codeTypeSearch);
	 aoData.push(codeNameSearch);
	 $.ajax({
	     url : sSource,//这个就是请求地址对应sAjaxSource
	     data : {"aoData":JSON.stringify(aoData)},//这个是把datatable的一些基本数据传给后台,比如起始位置,每页显示的行数
	     type : 'post',
	     dataType : 'json',
	     async : false,
	     success : function(result) {
	         fnCallback(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的
	     },
	    error : function(XMLHttpRequest, textStatus, errorThrown) {
			/* bootboxAlert({
				message : '获取列表失败：' + getAjaxErrorResponseContent(XMLHttpRequest, textStatus, errorThrown)
	         }); */
	   }
	 });
	}


	 /* 初始化明细 */
   var codeUrlStr = $("#baseCodePageList").val();
   function codeDataTableDraw(){
    $("#codeListTable").dataTable({
	 pagingType: 'full_numbers',
	 scrollY:"260px",
	 scrollX:false,
	// paging:false,  //取消分页
	 processing : true, //加载转态
	 ordering:false,       //禁用排序去掉图标
	 bProcessing : true, //DataTables载入数据时，是否显示‘进度’提示
	 bAutoWidth: false,
     bServerSide:true, //开启后端分页
     bDestroy: true,         //下边两个属性应该是重载数据相关的 不加在加载数据会弹窗报错 点击确定后显示数据
     bRetrieve: true,
     bProcessing: true, //显示加载数据时的提示
     bInfo:true,  //显示信息 如 当前x页 共x条数据等
     bFilter:false,  //检索、筛选框
     sAjaxSource:codeUrlStr, //请求url
     bLengthChange:false, //支持变更页面显示数据行数
     sPaginationType: "bootstrap", //翻页风格
     bPaginate:true,  //显示翻页按钮
     iDisplayLength : 5,
     iDisplayStart :0,
     fnServerData: retrieveDataTwo, //执行函数
     //动态生成复选框
     fnDrawCallback: function() {
           $(this).find('thead input[type=checkbox]').removeAttr('checked');
       },
     aoColumnDefs: [{
                       'targets': 0,
                       'searchable':false,
                       'orderable':false,
                       'className': 'dt-body-center',
                       'render': function (data, type, row){
                        return '<input class="checkbox_selectTwo" type="checkbox" data-status="'+ row.status + '"name="id[]" value="' + $('<div/>').text(row.dataCode).html() + '">';

                       }
                  }],
     aoColumns:[//列表元素  支持多种属性
                      { "mData": ""},
					  {
					     "mData": "dataCode",
					     "visible": false
					  },
					  {
						"mData": "dataCode"
					  },
                      { "mData": "codeName"},

                      { "mData": "codeType",
	                    "visible": false
	                  },

					  {"mData":null,
				            render: function (data, type, row, meta){
				              var html="<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"selectCodeFun('"+meta.row+"')\">查看</button>"+
				            	       "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"updateCodeFun('"+meta.row+"')\">修改</button>"+
				                       "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"deleteCodeFun('"+meta.row+"')\">删除</button>"
				               return html;
				            }
				      },
				      { "mData": "remark",
				    	  "visible": false
				      }

                  ],
     oLanguage: { 
          "sProcessing" : "正在加载中......", 
          "sLengthMenu" : "_MENU_", 
          "sZeroRecords" : "无记录", 
          "sEmptyTable" : "表中无数据存在！", 
          "sInfo" : "当前显示 _START_ 到 _END_ 条，共 _MAX_  条记录", 
          "sInfoEmpty" : "没有数据", 
          "sInfoFiltered" : "数据表中共为 _TOTAL_ 条记录", 
          "sSearch" : " ", 
          "oPaginate" : { 
           "sFirst" : " 首页 ", 
           "sPrevious" : " 上一页 ", 
           "sNext" : " 下一页 ", 
           "sLast" : " 末页 " 
           } 
    } 
    });
   // $(".dataTables_wrapper .dataTables_filter input").attr("placeholder","检索内容");

}
   function retrieveDataTwo(sSource,aoData,fnCallback) {
	  var codeTypeSearch = {
		 "name":"codeTypeSearch",
		 "value":$("#search_codeType").val()+$("#rowid").val()
		}
	 //alert打印查看 包含了基本的页码、页面数据元素、等信息以及新增的查询条件
	console.info("codeTypeSearch:"+codeTypeSearch.value);
	 aoData.push(codeTypeSearch);
	 $.ajax({
	     url : sSource,//这个就是请求地址对应sAjaxSource
	     data : {"aoData":JSON.stringify(aoData)},//这个是把datatable的一些基本数据传给后台,比如起始位置,每页显示的行数
	     type : 'post',
	     dataType : 'json',
	     async : false,
	     success : function(result) {
	         fnCallback(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的
	     },
	    error : function(XMLHttpRequest, textStatus, errorThrown) {
			/* bootboxAlert({
				message : '获取列表失败：' + getAjaxErrorResponseContent(XMLHttpRequest, textStatus, errorThrown)
	         }); */
	   }
	 });
	}







	  //类别 datatable全选
        $('.checkCodeTypeall').on('click', function () {
              if (this.checked) {
                   $(this).attr('checked','checked')
                   $('.checkbox_select').each(function () {
                       this.checked = true;
                   });
               } else {
                   $(this).removeAttr('checked')
                   $('.checkbox_select').each(function () {
                       this.checked = false;
                   });
               }
       });

      //明细 datatable全选
        $('.checkCodeall').on('click', function () {
              if (this.checked) {
                   $(this).attr('checked','checked')
                   $('.checkbox_selectTwo').each(function () {
                       this.checked = true;
                   });
               } else {
                   $(this).removeAttr('checked')
                   $('.checkbox_selectTwo').each(function () {
                       this.checked = false;
                   });
               }
       });



   /* 查询查询条件 */
   function searchDatas(){
	   $("#rowid").val("");
	   var table = $('#codeTypeListTable').DataTable();
	   table.draw(true);
	   var tableTwo = $('#codeListTable').DataTable();
	   tableTwo.draw(true);
    }

   /* 刷新类别列表 */
   function codeTypeRefresh(){
	   var table = $('#codeTypeListTable').DataTable();
	   table.draw(true);
    }

   /* 刷新明细列表 */
   function codeRefresh(){
	   var tableTwo = $('#codeListTable').DataTable();
	   tableTwo.draw(true);
    }

   /**重置查询条件*/
	function resetSearchConditions() {
		$("#searchBasecodeForm")[0].reset();
		var table = $('#codeTypeListTable').DataTable();
		table.draw(true);
	}

	/* 类别关闭模态框*/
	$('#myModal').on('hidden.bs.modal', function() {
		$("#id").val("");
		$("#baseCodeTypeForm")[0].reset();//使用dom的reset
        $("#baseCodeTypeForm").data('bootstrapValidator').destroy();
        $('#baseCodeTypeForm').data('bootstrapValidator', null);
        codeTypeValidator();
    });

	/* 明细关闭模态框*/
	$('#myModalTwo').on('hidden.bs.modal', function() {
		 $("#codes").val("");
		$("#baseCodeForm")[0].reset();//使用dom的reset
        $("#baseCodeForm").data('bootstrapValidator').destroy();
        $('#baseCodeForm').data('bootstrapValidator', null);
        codeValidator();
    });


   /* 按钮关闭类别模态框*/
   function closeCodeTypeModel(){
	   $("#id").val("");
	   $("#baseCodeTypeForm")[0].reset();//使用dom的reset
	   $("#resetedCodeType").attr("disabled","true");
	   $("#okCodeType").attr("disabled","true");
	   $("#resetedCodeType").attr("style","background-color:grey;border-color:grey");
	   $("#okCodeType").attr("style","background-color:grey;border-color:grey");
   }

   /* 按钮关闭明细模态框*/
   function  closeCodeModel(){
	   $("#codes").val("");
	   $("#baseCodeForm")[0].reset();//使用dom的reset
	   $("#resetedCode").attr("disabled","true");
	   $("#okCode").attr("disabled","true");
	   $("#resetedCode").attr("style","background-color:grey;border-color:grey");
	   $("#okCode").attr("style","background-color:grey;border-color:grey");
   }

   /* 按钮重置类别模态框 */
   function resetCodeType(){
	   console.info("类别："+$("#codeType").val());
	   if($("#id").val()==null || $("#id").val()==""){  //新增
		   $("#baseCodeTypeForm").data('bootstrapValidator').resetForm();
		   $("#resetedCodeType").attr("disabled","true");
		   $("#okCodeType").attr("disabled","true");
		   $("#resetedCodeType").attr("style","background-color:grey;border-color:grey");
		   $("#okCodeType").attr("style","background-color:grey;border-color:grey");
		   baseCodeTypeForm.reset();
	   }
	   if($("#id").val()!=null && $("#id").val()!=""){  //修改
		   $("#codeType").val(codeType);
		   $("#codeName").val(codeName);
		   $("#remark").val(codeTypeRemark);
		   $("#baseCodeTypeForm").data('bootstrapValidator').destroy();
	       $('#baseCodeTypeForm').data('bootstrapValidator', null);
	       codeTypeValidator();
	   }
   }

	   /* 按钮重置明细模态框 */
	   function resetCode(){
		   if($("#codes").val()==null || $("#codes").val()==""){  //新增
			   $("#baseCodeForm").data('bootstrapValidator').resetForm();
			   $("#resetedCode").attr("disabled","true");
			   $("#okCode").attr("disabled","true");
			   $("#resetedCode").attr("style","background-color:grey;border-color:grey");
			   $("#okCode").attr("style","background-color:grey;border-color:grey");
			   //baseCodeForm.reset();
			   $("#dataCode").val("");
			   $("#codeTypeTwo").val(codeType);
			   $("#dataName").val("");
			   $("#remarkTwo").val("");
		   }
		   if($("#codes").val()!=null && $("#codes").val()!=""){  //修改
			   $("#dataCode").val(dataCode);
			   $("#codeTypeTwo").val(codeType);
			   $("#dataName").val(dataName);
			   $("#remarkTwo").val(codeRemark);
			   $("#baseCodeForm").data('bootstrapValidator').destroy();
		       $('#baseCodeForm').data('bootstrapValidator', null);
		       codeValidator();
		   }

   }


   /**新增类别信息*/
	function addCodeTypeFun() {
		$("#id").val("");	//避免hidden出现不能reset的情况
		$("#baseCodeTypeForm")[0].reset();//使用dom的reset
		$('#okCodeType').removeAttr("disabled");
		$("#okCodeType").removeAttr("style");
		$('#resetedCodeType').removeAttr("disabled");
		$("#resetedCodeType").removeAttr("style");
		$("#okCodeType").attr("style","display: block;");
		$("#resetedCodeType").attr("style","display: block;");
		$('#closeCodeTypeModel').removeAttr("disabled");
		$('#codeType').removeAttr("readonly");
		$('#codeName').removeAttr("readonly");
	    $('#remark').removeAttr("readonly");
		$('#myModal').modal('show');
	}
	 /**新增明细信息*/
	function addCodeFun() {
		$("#codes").val("");	//避免hidden出现不能reset的情况
		$("#baseCodeForm")[0].reset();//使用dom的reset
		$('#okCode').removeAttr("disabled");
		$("#okCode").removeAttr("style");
		$('#resetedCode').removeAttr("disabled");
		$("#resetedCode").removeAttr("style");
		$("#okCode").attr("style","display: block;");
		$("#resetedCode").attr("style","display: block;");
		$('#closeCodeModel').removeAttr("disabled");
		$('#dataCode').removeAttr("readonly");
		$('#codeTypeTwo').val($('#rowid').val());
		$('#codeTypeTwo').attr("readonly",true);
		$('#dataName').removeAttr("readonly");
	    $('#remarkTwo').removeAttr("readonly");
		$('#myModalTwo').modal('show');
	}


   /* 查看类别信息*/
   function selectCodeTypeFun(Row){
	   $('#myModal').modal('show');
	   var data= $('#codeTypeListTable').DataTable().rows(Row).data()[0];
	   $("#codeType").val(data.codeType);
	   $('#codeType').attr("disabled",true);
	   $("#codeName").val(data.codeName);
	   $('#codeName').attr("disabled",true);
	   $("#remark").val(data.remark);
	   $('#remark').attr("disabled",true);
	   $('#okCodeType').attr("disabled",true);
	   $("#okCodeType").attr("style","background-color:grey;border-color:grey");
	   $('#resetedCodeType').attr("disabled",true);
	   $("#resetedCodeType").attr("style","background-color:grey;border-color:grey");
	   $('#closeCodeTypeModel').removeAttr("disabled");
   }


   /* 查看明细信息*/
   function selectCodeFun(Row){
	   $('#myModalTwo').modal('show');
	   var data= $('#codeListTable').DataTable().rows(Row).data()[0];
	   $("#dataCode").val(data.dataCode);
	   $('#code').attr("disabled",true);
	   $("#dataName").val(data.codeName);
	   $('#dataName').attr("disabled",true);
	   $("#codeTypeTwo").val(data.codeType);
	   $('#codeTypeTwo').attr("disabled",true);
	   $("#remarkTwo").val(data.remark);
	   $('#remarkTwo').attr("disabled",true);
	   $('#okCode').attr("disabled",true);
	   $("#okCode").attr("style","background-color:grey;border-color:grey");
	   $('#resetedCode').attr("disabled",true);
	   $("#resetedCode").attr("style","background-color:grey;border-color:grey");
	   $('#closeCodeModel').removeAttr("disabled");

   }


   /* 修改类别 */
	 function updateCodeTypeFun(Row){
	   $('#okCodeType').removeAttr("disabled");
	   $("#okCodeType").removeAttr("style");
	   $('#resetedCodeType').removeAttr("disabled");
	   $("#resetedCodeType").removeAttr("style");
	   $("#okCodeType").attr("style","display: block;");
	   $("#resetedCodeType").attr("style","display: block;");
	   $('#closeCodeTypeModel').removeAttr("disabled");
	   $('#codeType').attr("readonly",true);
	   $('#codeType').removeAttr("disabled");
	   $('#codeName').removeAttr("disabled");
	   $('#remark').removeAttr("disabled");
	   $('#myModal').modal('show');
	   var data= $('#codeTypeListTable').DataTable().rows(Row).data()[0];
	   $("#baseCodeTypeForm #codeType").val(data.codeType);
	   $("#baseCodeTypeForm #codeName").val(data.codeName);
	   $("#baseCodeTypeForm #remark").val(data.remark);
	   $("#baseCodeTypeForm #id").val(data.codeType);
	   codeType=data.codeType;
	   codeName=data.codeName;
	   codeTypeRemark=data.remark;
	 }


	 /* 修改明细 */
	 function updateCodeFun(Row){
	   $('#okCode').removeAttr("disabled");
	   $("#okCode").removeAttr("style");
	   $('#resetedCode').removeAttr("disabled");
	   $("#resetedCode").removeAttr("style");
	   $("#okCode").attr("style","display: block;");
	   $("#resetedCode").attr("style","display: block;");
	   $('#closeCodeModel').removeAttr("disabled");
	   $('#dataCode').attr("readonly",true);
	   $('#dataCode').removeAttr("disabled");
	   $('#codeTypeTwo').attr("readonly",true);
	   $('#codeTypeTwo').removeAttr("disabled");
	   $('#dataName').attr("readonly",true);
	   $('#dataName').removeAttr("disabled");
	   $('#remarkTwo').removeAttr("disabled");
	   $('#myModalTwo').modal('show');
	   var data= $('#codeListTable').DataTable().rows(Row).data()[0];
	   $("#baseCodeForm #codes").val(data.dataCode);
	   $("#baseCodeForm #dataCode").val(data.dataCode);
	   $("#baseCodeForm #codeTypeTwo").val(data.codeType);
	   $("#baseCodeForm #dataName").val(data.codeName);
	   $("#baseCodeForm #remarkTwo").val(data.remark);
	   dataCode=data.dataCode;
	   codeType=data.codeType;
	   dataName=data.codeName;
	   codeRemark=data.remark;
	   console.info("#codes11111"+  $("#baseCodeForm #code").val());
	   $("#code").val(data.code);
	 }


	 /* 删除类别函数  */
	 function deleteCodeTypeFun(codeType){
		 $.confirm({
	            title: '提示',
	            content: '您确认需要删除选中的数据吗？',
	            type:'red',
	            icon:'glyphicon glyphicon-question-sign',
	            buttons: {
	                ok: {
	                    text: '确认',
	                    btnClass: 'btn-primary',
	                    action: function(){ //确认按钮回调
	                    	deleteCodeType(codeType);
	                    }
	                },
	                cancel: {
	                    text: '取消',
	                    btnClass: 'btn-primary',
	                    action: function(){ //取消按钮回调
	                    }
	                }
	            },
	        });
	 }


	 /* 删除类别数据 */
	 function deleteCodeType(codeType){
	 var delCodeTypeUrl = $("#deleteInfoCodeType").val();
	 $.post(delCodeTypeUrl,  {"codeType": codeType},function(data) {
	 			if (data || data=='true') {
	 				$.alert({
	 	                title: '提示',
	 	                content: '删除成功！',
	 	                type:'green',             //一般危险操作用red,保存成功操作green
	 	                buttons: {              //定义按钮
	 	                    confirm: {
	 	                        text: '确认',
	 	                        btnClass: 'btn-primary',
	 	                        action: function(){ //这里写点击按钮回调函数
	 	                        	codeTypeRefresh(); //刷新列表
	 	                        }
	 	                    }
	 	                }
	 	            });
	 			} else {
	 				$.alert({
	 	                title: '提示',
	 	                content: '删除失败,如有问题请联系管理员！',
	 	                type:'red',             //一般危险操作用red,保存成功操作green
	 	                buttons: {              //定义按钮
	 	                    confirm: {
	 	                        text: '确认',
	 	                        btnClass: 'btn-primary',
	 	                        action: function(){ //这里写点击按钮回调函数
	 	                        }
	 	                    }
	 	                }
	 	            });
	 			}
	 		}, 'json');
	 }


	 /* 删除明细函数  */
	 function deleteCodeFun(Row){
		 var data= $('#codeListTable').DataTable().rows(Row).data()[0];
		 $.confirm({
	            title: '提示',
	            content: '您确认需要删除选中的数据吗？',
	            type:'red',
	            icon:'glyphicon glyphicon-question-sign',
	            buttons: {
	                ok: {
	                    text: '确认',
	                    btnClass: 'btn-primary',
	                    action: function(){ //确认按钮回调
	                    	deleteCode(data.codeType,data.dataCode);
	                    }
	                },
	                cancel: {
	                    text: '取消',
	                    btnClass: 'btn-primary',
	                    action: function(){ //取消按钮回调
	                    }
	                }
	            },
	        });
	 }


	 /* 删除明细数据 */
	 function deleteCode(codeType,dataCode){
	 var delCodeUrl = $("#deleteInfoCode").val();
	 $.post(delCodeUrl,  {"codeType": codeType,"dataCode":dataCode},function(data) {
	 			if (data || data=='true') {
	 				$.alert({
	 	                title: '提示',
	 	                content: '删除成功！',
	 	                type:'green',             //一般危险操作用red,保存成功操作green
	 	                buttons: {              //定义按钮
	 	                    confirm: {
	 	                        text: '确认',
	 	                        btnClass: 'btn-primary',
	 	                        action: function(){ //这里写点击按钮回调函数
	 	                        	codeRefresh(); //刷新列表
	 	                        }
	 	                    }
	 	                }
	 	            });
	 			} else {
	 				$.alert({
	 	                title: '提示',
	 	                content: '删除失败,如有问题请联系管理员！',
	 	                type:'red',             //一般危险操作用red,保存成功操作green
	 	                buttons: {              //定义按钮
	 	                    confirm: {
	 	                        text: '确认',
	 	                        btnClass: 'btn-primary',
	 	                        action: function(){ //这里写点击按钮回调函数
	 	                        }
	 	                    }
	 	                }
	 	            });
	 			}
	 		}, 'json');
	 }



	 /* 批量删除类别 */
	  function deleteCodeTypeListFun(){
		  var selectLoans = [];
          $('.checkbox_select').each(function () {
              if($(this).is(':checked')){
            	   selectLoans.push($(this).val());
              }
          });
         if(selectLoans.length == 0){
        	 $.alert({
 			    title: '提示',
 			    content: '请选择一行数据进行删除！',
 			    type:'red',				//一般危险操作用red,保存成功操作green
 			    buttons: {				//定义按钮
 			        confirm: {
 			        	text: '确认',
 			        	btnClass: 'btn-primary',
 			        	action: function(){	//这里写点击按钮回调函数

 			        	}
 			        }
 			    }
 			});
         }else{
             var idListStr ='';
             for (var i = 0; i < selectLoans.length; i++) {
                 if(i!=selectLoans.length-1){
                     idListStr = idListStr + selectLoans[i] +",";
                 }else{
                     idListStr = idListStr + selectLoans[i];
                 }
             }
             console.info("id:"+idListStr);
             var deleteInfoUrl = $("#deleteCodeTypeList").val();
        	 $.post(deleteInfoUrl,  {"idListStr": idListStr},function(data) {
        	 			if (data || data=='true') {
        	 				$.alert({
        	 	                title: '提示',
        	 	                content: '删除成功！',
        	 	                type:'green',             //一般危险操作用red,保存成功操作green
        	 	                buttons: {              //定义按钮
        	 	                    confirm: {
        	 	                        text: '确认',
        	 	                        btnClass: 'btn-primary',
        	 	                        action: function(){ //这里写点击按钮回调函数
        	 	                        }
        	 	                    }
        	 	                }
        	 	            });
        	 				codeTypeRefresh(); //刷新列表
        	 			} else {
        	 				$.alert({
        	 	                title: '提示',
        	 	                content: '删除失败,如有问题请联系管理员！',
        	 	                type:'red',             //一般危险操作用red,保存成功操作green
        	 	                buttons: {              //定义按钮
        	 	                    confirm: {
        	 	                        text: '确认',
        	 	                        btnClass: 'btn-primary',
        	 	                        action: function(){ //这里写点击按钮回调函数
        	 	                        }
        	 	                    }
        	 	                }
        	 	            });
        	 			}
        	 		}, 'json');
         }

	 }


	  /* 批量删除明细 */
	  function deleteCodeListFun(){
		  var selectLoans = [];
          $('.checkbox_selectTwo').each(function () {
              if($(this).is(':checked')){
            	   selectLoans.push($(this).val());
              }
          });
         if(selectLoans.length == 0){
        	 $.alert({
 			    title: '提示',
 			    content: '请选择一行数据进行删除！',
 			    type:'red',				//一般危险操作用red,保存成功操作green
 			    buttons: {				//定义按钮
 			        confirm: {
 			        	text: '确认',
 			        	btnClass: 'btn-primary',
 			        	action: function(){	//这里写点击按钮回调函数

 			        	}
 			        }
 			    }
 			});
         }else{
             var idListStr ='';
             for (var i = 0; i < selectLoans.length; i++) {
                 if(i!=selectLoans.length-1){
                     idListStr = idListStr + selectLoans[i] +",";
                 }else{
                     idListStr = idListStr + selectLoans[i];
                 }
             }
             console.info("id:"+idListStr);
             var deleteInfoCodeUrl = $("#deleteCodeList").val();
             codeType=$('#rowid').val();
        	 $.post(deleteInfoCodeUrl,  {"idListStr": idListStr,"codeType":codeType},function(data) {
        	 			if (data || data=='true') {
        	 				$.alert({
        	 	                title: '提示',
        	 	                content: '删除成功！',
        	 	                type:'green',             //一般危险操作用red,保存成功操作green
        	 	                buttons: {              //定义按钮
        	 	                    confirm: {
        	 	                        text: '确认',
        	 	                        btnClass: 'btn-primary',
        	 	                        action: function(){ //这里写点击按钮回调函数
        	 	                        }
        	 	                    }
        	 	                }
        	 	            });
        	 				codeRefresh(); //刷新列表
        	 			} else {
        	 				$.alert({
        	 	                title: '提示',
        	 	                content: '删除失败,如有问题请联系管理员！',
        	 	                type:'red',             //一般危险操作用red,保存成功操作green
        	 	                buttons: {              //定义按钮
        	 	                    confirm: {
        	 	                        text: '确认',
        	 	                        btnClass: 'btn-primary',
        	 	                        action: function(){ //这里写点击按钮回调函数
        	 	                        }
        	 	                    }
        	 	                }
        	 	            });
        	 			}
        	 		}, 'json');
         }

	 }



	/**类别表单提交事件*/
	function submitCodeType() {
		var bootstrapValidator = $("#baseCodeTypeForm").data('bootstrapValidator');
		//获取表单验证结果
		var validateResult = bootstrapValidator.validate().isValid();
		if(validateResult){
			var createCodeTypeUrl =null;
			console.info("#id"+$("#id").val());
			console.info("#codeType"+$("#codeType").val());
			//修改
			if($("#id").val()!="" && $("#id").val()!=null)
			{
				createCodeTypeUrl = $("#updateCodeType").val();
			}
			//新增
			else
			{
				createCodeTypeUrl = $("#insertCodeType").val();
			}
			$.post(createCodeTypeUrl, $("#baseCodeTypeForm").serialize(), function(data) {
				console.info("data.result"+data.result);
				if (data.result=='true') {

					$.alert({
		                title: '提示',
		                content: '数据类别保存成功！',
		                type:'green',             //一般危险操作用red,保存成功操作green
		                buttons: {              //定义按钮
		                    confirm: {
		                        text: '确认',
		                        btnClass: 'btn-primary',
		                        action: function(){ //这里写点击按钮回调函数
		                        	 $("#baseCodeTypeForm").data('bootstrapValidator').resetForm();
							         $('#baseCodeTypeForm')[0].reset();
							         codeTypeRefresh(); //刷新列表
		                      	     $('#myModal').modal('hide');
					        		 $('#okCodeType').removeAttr("disabled");
		                        }
		                    }
		                }
		            });
				}
				if (data.result=='repeat') {
					$.alert({
		                title: '提示',
		                content: '类别代码不能重复！',
		                type:'green',             //一般危险操作用red,保存成功操作green
		                buttons: {              //定义按钮
		                    confirm: {
		                        text: '确认',
		                        btnClass: 'btn-primary'
		                    }
		                }
		            });
				}
				if (data.result=='false') {
					$.alert({
		                title: '提示',
		                content:'类别代码保存失败！',
		                type:'red',             //一般危险操作用red,保存成功操作green
		                buttons: {              //定义按钮
		                    confirm: {
		                        text: '确认',
		                        btnClass: 'btn-primary',
		                        action: function(){ //这里写点击按钮回调函数
		                        }
		                    }
		                }
		            });
				}

				}, 'json' );
		}else {
            $.alert({
                title: '提示',
                content: '请按照相关提示修改！',
                type:'red',             //一般危险操作用red,保存成功操作green
                buttons: {              //定义按钮
                    confirm: {
                        text: '确认',
                        btnClass: 'btn-primary',
                        action: function(){ //这里写点击按钮回调函数
                        }
                    }
                }
            });
        }
	}


	/**明细表单提交事件*/
	function submitCode() {
		var bootstrapValidator = $("#baseCodeForm").data('bootstrapValidator');
		//获取表单验证结果
		var validateResult = bootstrapValidator.validate().isValid();
		if(validateResult){
			var createCodeUrl =null;
			console.info("#codes22222"+  $("#baseCodeForm #codeTypeTwo").val());
			if($("#codes").val()!="" && $("#codes").val()!=null)
			{
				createCodeUrl = $("#updateCode").val();
			}
			//新增
			else
			{
				createCodeUrl = $("#insertCode").val();
			}
			$.post(createCodeUrl, $("#baseCodeForm").serialize(), function(data) {
				if (data.result==true) {
					$.alert({
		                title: '提示',
		                content: '数据明细保存成功！',
		                type:'green',             //一般危险操作用red,保存成功操作green
		                buttons: {              //定义按钮
		                    confirm: {
		                        text: '确认',
		                        btnClass: 'btn-primary',
		                        action: function(){ //这里写点击按钮回调函数
		                        	 $("#baseCodeForm").data('bootstrapValidator').resetForm();
							         $('#baseCodeForm')[0].reset();
							         codeRefresh(); //刷新列表
		                      	     $('#myModalTwo').modal('hide');
					        		 $('#okCode').removeAttr("disabled");
		                        }
		                    }
		                }
		            });
				}
				else {
					$.alert({
		                title: '提示',
		                content: '数据明细保存失败！',
		                type:'red',             //一般危险操作用red,保存成功操作green
		                buttons: {              //定义按钮
		                    confirm: {
		                        text: '确认',
		                        btnClass: 'btn-primary',
		                        action: function(){ //这里写点击按钮回调函数
		                        }
		                    }
		                }
		            });
				}

				}, 'json' );
		}else {
            $.alert({
                title: '提示',
                content: '请按照相关提示修改！',
                type:'red',             //一般危险操作用red,保存成功操作green
                buttons: {              //定义按钮
                    confirm: {
                        text: '确认',
                        btnClass: 'btn-primary',
                        action: function(){ //这里写点击按钮回调函数
                        }
                    }
                }
            });
        }
	}

</script>
</html>
