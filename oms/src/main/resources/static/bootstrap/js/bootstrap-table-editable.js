$(function () {
    $("#tb_user").bootstrapTable({
        toolbar: "#toolbar",
        idField: "Id",
        pagination: true,
        showRefresh: true,
        search: true,
        clickToSelect: true,
        queryParams: function (param) {
            return {};
        },
        url: "/Editable/GetUsers",
        columns: [{
            checkbox: true
        }, {
            field: "UserName",
            title: "用户名",
            editable: {
                type: 'text',
                title: '用户名',
                validate: function (v) {
                    if (!v) return '用户名不能为空';

                }
            }
        }, {
            field: "Age",
            title: "年龄",
        }, {
            field: "Birthday",
            title: "生日",
            formatter: function (value, row, index) {
                var date = eval('new ' + eval(value).source)
                return date.format("yyyy-MM-dd");
            }
        },
            {
                field: "DeptName",
                title: "部门"
            }, {
                field: "Hobby",
                title: "爱好"
            }],
        onEditableSave: function (field, row, oldValue, $el) {
            $.ajax({
                type: "post",
                url: "/Editable/Edit",
                data: row,
                dataType: 'JSON',
                success: function (data, status) {
                    if (status == "success") {
                        alert('提交数据成功');
                    }
                },
                error: function () {
                    alert('编辑失败');
                },
                complete: function () {

                }

            });
        }
    });
});