function onKeyUp(url, tbIdBeChecked, tbIdValid, errMsg) {
	$('#' + tbIdBeChecked).next().children().on("input", function() {
		if (tbIdBeChecked == null) {
			alert('空');
			return;
		}
		// 在输入框中打印输入的值
		var numbervalue = $(this).val();
		var json = {};
		json[tbIdBeChecked] = numbervalue;
//		alert(numbervalue);
		// Ajax 用post方法完成ajax提交数据:rul, json, data :返回值
		$.post(url, json, function(data) {
			$('#' + tbIdValid).text("");
			if ("1" == data) {
				$('#' + tbIdValid).text(errMsg);
			}
		});

	});
}

