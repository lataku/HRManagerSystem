<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>公告列表</title>
    <jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<div>
    <form id="ff" method="post">
        <label for="id_select">编号：</label>
        <input class="easyui-numberbox" style="width: 150px; height: 25px;"
               name="id_select" id="id_select">
        <label for="username_select">用户昵称:</label>
        <input class="easyui-textbox" style="width: 150px; height: 25px;"
               name="username_select" id="username_select">
        <label for="name_select">媒体号:</label>
        <input class="easyui-textbox" style="width: 150px; height: 25px;"
               name="name_select" id="name_select">
        <label for="title_select">标题:</label>
        <input class="easyui-textbox" style="width: 150px; height: 25px;"
               name="title_select" id="title_select">
    </form>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="findLike"
       onclick="submitForm1()">查询</a>
</div>
<table id="dg" style="width: 100%; height: 420px"></table>

<div id="dlg" class="easyui-dialog" title="修改公告信息"
     data-options="closed:true,iconCls:'icon-edit',toolbar:'#dlg-toolbar',buttons:'#dlg-buttons'"
     style="width:400px;height:450px;padding:10px">
    <form id="form_edit" class="easyui-form" method="post">
        <table cellpadding="10">
            <tr>
                <td>编号：</td>
                <td><input class="easyui-textbox" editable="false"
                           type="text" name="id" id="id_edit"
                           data-options="required:true"></td>
            </tr>
            <tr>
                <td>用户昵称：</td>
                <td><input class="easyui-textbox"
                           type="text" name="username" id="username_edit"></td>
            </tr>
            <tr>
                <td>媒体号：</td>
                <td><input class="easyui-textbox"
                           type="text" name="name" id="name_edit"></td>
            </tr>
            <tr>
                <td>标题：</td>
                <td><input class="easyui-textbox"
                           type="text" name="title" id="title_edit"
                           data-options="required:true"></td>
            </tr>
            <tr>
                <td>内容：</td>
                <td><input class="easyui-textbox"
                           type="text" name="content" id="content_edit"
                           style="height: 200px"
                           data-options="required:true"></td>
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
        getData("${pageContext.request.contextPath}/selectAllNotices");
        getPagerbar();
    });

    // 模糊查询公告
    function submitForm1() {
        var id = $('#id_select').val();
        var username = $('#username_select').val();
        var name = $('#name_select').val();
        var content = $('#content_select').val();
        var title = $('#title_select').val();
        // alert(number+username+phone+roleId);
        getData("${pageContext.request.contextPath}/selectNoticesLike", title,content,username,name);
    }

    // 获取公告数据
    function getData(url, title,content,username,name) {
        $('#dg').datagrid({
            url: url,
            title: '公告列表',
            border: false,
            rownumbers: true,
            toolbar: '#tb',
            pagination: true,
            pageSize: "10",
            // easyui额外参数queryParams, 默认参数page,rows
            queryParams: {
                title:title,
                content:content,
                username:username,
                name:name
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
                field: 'username',
                title: '用户昵称',
                width: 80
            }, {
                field: 'name',
                title: '媒体号',
                width: 80
            }, {
                field: 'title',
                title: '标题',
                width: 80
            }, {
                field: 'content',
                title: '内容',
                width: 1000
            }, {
                field: 'remark',
                title: '备注',
                width: 80
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
                        $.messager.confirm('确定要删除', '确定要删除(' + row.name + ')吗？', function (r) {
                            if (r) {
                                $.get('deleteNotice?id=' + row.id, null, function (data) {
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
                            $('#id_edit').textbox('setValue', row.id);
                            $('#username_edit').textbox('setValue', row.username);
                            $('#name_edit').textbox('setValue', row.name);
                            $('#title_edit').textbox('setValue', row.title);
                            $('#content_edit').textbox('setValue', row.content);
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
        var id = $('#id_edit').val();
        var username = $('#username_edit').val();
        var name = $('#name_edit').val();
        var title = $('#title_edit').val();
        var content = $('#content_edit').val();
        var remark = $('#remark_edit').val();

        var json = {
            "id": id,
            "username": username,
            "name": name,
            "title": title,
            "content": content,
            "remark": remark
        }
        $.post('updateNotice', json, function (data) {
            $.messager.alert('结果', data, 'info', function () {
                window.location.reload();
            })
        });
    }
</script>

</html>