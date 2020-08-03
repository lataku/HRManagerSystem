<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加公告</title>
    <jsp:include page="header.jsp"></jsp:include>
    <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="ueditor/ueditor.all.min.js"></script>
    <script src="ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
<div class="easyui-panel" title="添加公告">
    <div style="padding: 10px 60px 20px 60px">
        <form method="post" id="ff">
            <table>
                <tr>
                    <td><label for="name">媒体号：</label></td>
                    <td><input class="easyui-textbox" style="width: 200px" name="name" id="name"
                               data-options="required:true"/></td>
                </tr>
                <tr>
                    <td><label for="title">公告题目：</label></td>
                    <td><input class="easyui-textbox" style="width: 200px" name="title" id="title"
                               data-options="required:true"
                    /></td>
                </tr>
                <tr>
                    <td><label for="title">备注：</label></td>
                    <td><input class="easyui-textbox" style="width: 200px;height: 100px;" name="remark" id="remark"
                               data-options="multiline:true"/></td>
                </tr>
            </table>

            <div style="margin: 10px">
                <textarea id="container" name="content" style="width: 100%;height: 500px;"></textarea>
            </div>
            <a href="javascript:void(0)" class="easyui-linkbutton"
               onclick="submitForm()">提交</a></td>
        </form>
    </div>
</div>
<script type="text/javascript">
    var ue = UE.getEditor("container");
    setTimeout(function () {
        /* editor.execCommand('drafts') */
    }, 2000); // 自动保存


    function submitForm() {
        var json = {
            'name': $('#name').val(),
            'remark': $('#remark').val(),
            'title': $('#title').val(),
            'username': "${sessionScope.username}",
            'content': ue.getPlainTxt()
        }
        $.post('addNotice', json, function (data) {
            if ("0" == data) {
                $.messager.alert('错误', '添加失败', 'error');
            }
            if ("1" == data) {
                $.messager.alert('提示', '添加成功', 'info');
            }
        });
    }
</script>
</body>
</html>