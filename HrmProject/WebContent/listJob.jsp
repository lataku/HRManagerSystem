<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>职位列表</title>
    <jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<div>
    <form id="ff" method="post">
        <label for="jid_select">编号：</label>
        <input class="easyui-numberbox" style="width: 150px; height: 25px;"
               name="jid_select" id="jid_select">
        <label for="jname_select">名称:</label>
        <input class="easyui-textbox" style="width: 150px; height: 25px;"
               name="jname_select" id="jname_select">
    </form>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="findLike"
       onclick="submitForm1()">查询</a>
</div>
<table id="dg" style="width: 100%; height: 420px"></table>

<div id="dlg" class="easyui-dialog" title="修改职位信息"
     data-options="closed:true,iconCls:'icon-edit',toolbar:'#dlg-toolbar',buttons:'#dlg-buttons'"
     style="width:400px;height:450px;padding:10px">
    <form id="form_edit" class="easyui-form" method="post">
        <table cellpadding="10">
            <tr>
                <td>编号：</td>
                <td><input class="easyui-textbox" disabled="disabled"
                           type="text" name="jid" id="jid_edit"
                           data-options="required:true"></td>
            </tr>
            <tr>
                <td>名称：</td>
                <td><input class="easyui-textbox"
                           type="text" name="jname" id="jname_edit"
                           data-options="required:true"></td>
            </tr>
            <tr>
                <td>备注：</td>
                <td><input class="easyui-textbox" data-options="multiline:true"
                           name="jremark" id="jremark_edit"></td>
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
        getData("${pageContext.request.contextPath}/selectAllJobs");
        getPagerbar();
    });

    // 模糊查询职位
    function submitForm1() {
        var jid = $('#jid_select').val();
        var jname = $('#jname_select').val();
        getData("${pageContext.request.contextPath}/selectJobsLike", jid, jname);
        getPagerbar();
    }

    // 获取职位数据
    function getData(url, jid, jname) {
        $('#dg').datagrid({
            url: url,
            title: '职位列表',
            border: false,
            rownumbers: true,
            toolbar: '#tb',
            pagination: true,
            pageSize: "10",
            // easyui额外参数queryParams, 默认参数page,rows
            queryParams: {
                jid: jid,
                jname:jname,
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
                field: 'jid',
                title: '职位编号',
                width: 80
            }, {
                field: 'jname',
                title: '名称',
                width: 80
            }, {
                field: 'jremark',
                title: '备注',
                width: 200
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
                        $.messager.confirm('确定要删除', '确定要删除(' + row.jname + ')吗？', function (r) {
                            if (r) {
                                $.get('deleteJob?jid=' + row.jid, null, function (data) {
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
                            $('#jid_edit').textbox('setValue', row.jid);
                            $('#jname_edit').textbox('setValue', row.jname);
                            $('#jremark_edit').textbox('setValue', row.jremark);
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
    	var jid = $('#jid_edit').val();
        var jname = $('#jname_edit').val();
        var jremark = $('#jremark_edit').val();

        var json = {
     		"jid": jid,
            "jname": jname,
            "jremark": jremark
        }
        $.post('updateJob', json, function (data) {
            $.messager.alert('结果', data, 'info', function () {
                window.location.reload();
            })
        });
    }
</script>

</html>