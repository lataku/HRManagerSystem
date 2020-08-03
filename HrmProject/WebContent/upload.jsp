<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文件上传</title>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<div class="easyui-panel" title="多文件上传">
    <div style="width: 700px;height: 500px;">
        <div style="padding: 40px 60px 20px 60px;">
            <form id="form" method="post" multiple="multiple" enctype="multipart/form-data">
        		上传人：<input class="easyui-textbox" name="name" value="${sessionScope.username }" readonly="readonly">
        		<br>
                <input class="easyui-filebox" style="width: 300px" buttonText="添加文件" buttonIcon="icon-search"
                    multiple="true" name="upload"  id="upload">
                <input type="button" value="上传文件" onclick="submitForm()"
                	class="easyui-linkbutton"
                    style="width: 300px;"> 
                    <a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="clearForm()">清空</a>
				</form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    function submitForm() {
        $('#form').form('submit',{
            url: 'upload',
            success:function (data) {
                if ('1' == data) {
                    $.messager.alert('上传成功', '恭喜，上传成功！', 'info');
                } else {
                    $.messager.alert('上传失败', '对不起，上传失败！', 'info');
                }
            }
        })
    }
    
    function clearForm() {
        $('#upload').textbox('setValue','');
    }
</script>
</html>