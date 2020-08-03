<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

<!-- 	<p> -->
<!-- 		<input type="text" placeholder="请输入想说的话..." id="myInput"> -->
<!-- 	</p> -->
<!-- 	<div id="result"></div> -->

	<form id='ff' method="post">
	
		<input class="easyui-datebox" name="birthday" style="width: 200px" editable="false">
		<td><a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="submitForm2()">提交</a></td>
		<td><a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="clearForm()">清空</a></td>
	</form>
</body>
<script>
// 	$(function() {
// 		$("#myInput").on("input", function() {
// 			//在输入框中打印输入的值
// 			$("#result").text($(this).val());
// 		});
// 	});
	
    function submitForm2() {
     $('#ff').form('submit', {
         url: 'testDate',
         onSubmit: function () {
             return $(this).form().serialize();
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
</html>