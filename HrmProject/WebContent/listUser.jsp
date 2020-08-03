<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <jsp:include page="header.jsp"></jsp:include>
    <script type="text/javascript" src="mjs/tool.js"></script>
</head>
<body>
<div>
    <form id="ff" method="post">
        <label for="number">账号：</label>
        <input class="easyui-numberbox" style="width: 150px; height: 25px;"
               name="number" id="number">
        <label for="username">昵称:</label>
        <input class="easyui-textbox" style="width: 150px; height: 25px;"
               name="username" id="username">
        <label for="phone">手机号:</label>
        <input class="easyui-numberbox" style="width: 150px; height: 25px;"
               name="phone" id="phone">
        <label for="role">角色:</label>
        <input class="easyui-combobox" id="role" name="role"
				editable="false"
               data-options="url: 'selectAllRoles',
				method: 'get',
 				valueField: 'rid',
 				textField: 'rname',
 				panelWidth: 350,
 				panelHeight: 'auto'
			">
    </form>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="findLike"
       onclick="submitForm1()">查询</a>

    <a href="javascript:void(0)" class="easyui-linkbutton"
       onclick="clearForm()">清空</a>
</div>
<table id="dg" style="width: 100%; height: 420px"></table>

<div id="dlg" class="easyui-dialog" title="修改用户信息"
     data-options="closed:true,iconCls:'icon-edit',toolbar:'#dlg-toolbar',buttons:'#dlg-buttons'"
     style="width:400px;height:450px;padding:10px">
    <form id="form_edit" class="easyui-form" method="post">
        <table cellpadding="10">
            <tr>
                <td>账号：</td>
                <td><input class="easyui-textbox" disabled="disabled"
                           type="text" name="number" id="number_edit"
                           data-options="required:true"></td>
            </tr>
            <tr>
                <td>姓名：</td>
                <td><input class="easyui-textbox"
                           type="text" name="username" id="username_edit"
                           data-options="required:true"></td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input class="easyui-textbox"
                           type="password" name="password" id="password_edit"
                           data-options="required:true,validType:'length[2,16]'"></td>
            </tr>
            <tr>
                <td>手机号：</td>
                <td><input class="easyui-numberbox"
                           type="text" name="phone" id="phone_edit"
                           data-options="required:true,validType:'length[11,11]'"></td>
            </tr>
            <tr>
                <td>角色：</td>
                <td><input class="easyui-combobox" id="roleId_edit" name="role" value="请选择角色"
                			editable="false"
                           data-options="url: 'selectAllRoles',
                                        method: 'get',
                                        valueField: 'rid',
                                        textField: 'rname',
                                        panelWidth: 350,
                                        panelHeight: 'auto'
			"></td>
            </tr>
            <tr>
                <td>备注：</td>
                <td><input class="easyui-textbox" data-options="multiline:true"
                           name="remark" id="remark_edit"></td>
            </tr>
        </table>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveEdit()">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')">取消</a>
</div>

</body>
<script type="text/javascript">
    // 页面加载完成自动调用后
    $(function () {
        getData("${pageContext.request.contextPath}/selectAllUsers");
        getPagerbar();
    });

    // 模糊查询用户
    function submitForm1() {
        var number = $('#number').val();
        var username = $('#username').val();
        var phone = $('#phone').val();
        var roleId = $('#role').val();
        // alert(number+username+phone+roleId);
        getData("${pageContext.request.contextPath}/selectUsersLike", number, username, phone, roleId);
        getPagerbar();
    }

    // 获取用户数据
    function getData(url, number, username, phone, roleId) {
        $('#dg').datagrid({
            url: url,
            title: '用户列表',
            border: false,
            rownumbers: true,
            toolbar: '#tb',
            pagination: true,
            pageSize: "10",
            // easyui额外参数queryParams, 默认参数page,rows
            queryParams: {
                number: number,
                username: username,
                phone: phone,
                roleId: roleId,
            },
            pageList: [5, 10, 15, 20],
            singleSelect: true,
            columns: [[{
                field: 'id',
                value: 'number',
                checkbox: 'true',
                title: '选择',
                width: 50
            }, {
                field: 'number',
                title: '账号',
                width: 80
            }, {
                field: 'username',
                title: '呢称',
                width: 80
            }, {
                field: 'password',
                title: '密码',
                width: 80
            }, {
                field: 'phone',
                title: '手机',
                width: 220
            }, {
                field: 'role',
                title: '角色',
                width: 100,
                formatter: function (value, row, index) {
                    if (null != row.role)
                        return row.role.rname;
                    return row.roleId;
                }
            }, {
                field: 'createdate',
                title: '注册时间',
                width: 220
            }, {
                field: 'remark',
                title: '备注',
                width: 220
            }
            ]]
        });
    }

    // 显示表格下方的删除修改工具栏
    function getPagerbar() {
        var pager = $('#dg').datagrid().datagrid('getPager');	// get the pager of datagrid
        pager.pagination({
            buttons: [{
                iconCls: 'icon-cancel',
                text: '删除',
                handler: function () {
                    var row = $('#dg').datagrid('getSelected');
                    if (null != row) {
                        $.messager.confirm('确定要删除', '确定要删除(' + row.username + ')吗？', function (r) {
                            if (r) {
                                $.get('deleteUser?number=' + row.number, null, function (data) {
                                    // ajax异步返回结果
                                    $.messager.alert('结果', data, 'info', function () {
                                        // 刷新页面
                                        window.location.reload();
                                    });
                                });
                            }
                        });
                    } else {
                        $.messager.alert('警告', '请选中要操作的对象', 'warning');
                    }
                }
            }, {
                iconCls: 'icon-edit',
                text: '修改',
                handler: function () {
                    var row = $('#dg').datagrid('getSelected');
                    if (null != row) {
                        $('#dlg').dialog('open');
                        var row = $('#dg').datagrid('getSelected');
                        if (null != row) {
                            $('#number_edit').textbox('setValue', row.number);
                            $('#username_edit').textbox('setValue', row.username);
                            $('#password_edit').textbox('setValue', row.password);
                            $('#roleId_edit').textbox('setValue', row.roleId);
                            $('#phone_edit').textbox('setValue', row.phone);
                            $('#remark_edit').textbox('setValue', row.remark);
                            $('#dlg').dialog('open');
                        }
                    } else {
                        $.messager.alert('警告', '请选中要操作的对象', 'warning');
                    }
                }
            }]
        });
    }

    // 修改后保存数据的方法
    function saveEdit() {
        var number = $('#number_edit').val();
        var username = $('#username_edit').val();
        var password = $('#password_edit').val();
        var roleId = $('#roleId_edit').val();
        var phone = $('#phone_edit').val();
        var remark = $('#remark_edit').val();

        var json = {
            "number": number,
            "username": username,
            "password": password,
            "roleId": roleId,
            "phone": phone,
            "remark": remark
        }
        $.post('updateUser', json, function (data) {
            $.messager.alert('结果', data, 'info', function () {
                window.location.reload();
            })
        });
    }

    function clearForm() {
        $('#ff').form('clear');
    }
</script>

</html>