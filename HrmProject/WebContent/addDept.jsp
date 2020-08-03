<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加部门</title>
    <jsp:include page="header.jsp"></jsp:include>
    <script type="text/javascript" src="mjs/tool.js"></script>
</head>
<body>
<div class="easyui-panel" title="添加用户" style="width: 400px">
    <div style="padding: 10px 60px 20px 60px">
        <form id="ff" method="post">
            <table cellpadding="5">
                <tr>
                    <td>名称:</td>
                    <td><input class="easyui-textbox" type="text" name="dname" id="dname"
                               data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td><span id="isUsed_dname"
                              style="color: #FF0000; font-size: 12px"></span></td>
                </tr>
                <tr>
                    <td>备注:</td>
                    <td><input class="easyui-textbox" name="dremark"
                               data-options="multiline:true" style="height: 60px"></input></td>
                </tr>
                <tr>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton"
                           onclick="submitDept()">提交</a></td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton"
                           onclick="clearForm()">清空</a></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        // 键盘抬起事件
        onKeyUp('dnameAjax', 'dname', 'isUsed_dname', '该部门已存在')
    });

    function submitDept() {
        var dname = $('#isUsed_dname').html();
        if (dname != "")
            return;
        $('#ff').form('submit', {
            url: 'addDept',
            onSubmit: function () {
                return $(this).form('enableValidation').form('validate');
            },
            success: function (data) { // 弹窗提示提交结果
                if ("0" == data) {
                    $.messager.alert('错误', '添加失败', 'error');
                }
                if ("1" == data) {
                    $.messager.alert('提示', '添加成功', 'info');
                }
            }
        });
    }

    function clearForm() {
        $('#ff').form('clear');
    }
</script>
</body>
</html>