<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加用户</title>
    <jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<div class="easyui-panel" title="添加用户" style="width: 400px">
    <div style="padding: 10px 60px 20px 60px">
        <form id="ff" method="post">
            <table cellpadding="5">
                <tr>
                    <td>账号:</td>
                    <td><input class="easyui-textbox" name="number"
                               id="number" validType="testnumber" data-options="required:true"></input>
                    </td>
                    <td><span id="isUsed_number"
                              style="color: #FF0000; font-size: 12px"></span></td>
                </tr>
                <tr>
                    <td>用户名:</td>
                    <td><input class="easyui-textbox" type="text" name="username"
                               data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input id="password" name="password"
                               class="easyui-passwordbox" data-options="required:true"
                               prompt="Passwoafeferd" iconWidth="28"
                               style="width: 100%; height: 34px; padding: 10px"></td>
                </tr>
                <tr>
                    <td>确认密码:</td>
                    <td><input class="easyui-passwordbox" name="enterpassword"
                               validType="eqPwd['#password']" data-options="required:true"></input>
                    </td>
                </tr>
                <tr>
                    <td>角色:</td>
                    <td><input class="easyui-combobox" editable="false"
                               name="roleId"
                               data-options="
				url: 'selectAllRoles',
				method: 'get',
				valueField: 'rid',
				textField: 'rname',
				panelWidth: 350,
				panelHeight: 'auto',
				required:true
			">
                    </td>
                </tr>
                <tr>
                    <td>电话：</td>
                    <td><input class="easyui-numberbox" name="phone" id="phone"
                               data-options="required:true" validType="tel"></td>
                    <td><span id="isUsed_phone"
                              style="color: #FF0000; font-size: 12px"></span></td>
                </tr>
                <tr>
                    <td>备注:</td>
                    <td><input class="easyui-textbox" name="remark"
                               data-options="multiline:true" style="height: 60px"></input></td>
                </tr>
                <tr>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton"
                           onclick="submitForm2()">提交</a></td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton"
                           onclick="clearForm()">清空</a></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<script>
    $(function() {
        // 键盘抬起事件
        // 账号已被注册
        $('#number').textbox({
            inputEvents : $.extend({}, $.fn.textbox.defaults.inputEvents, {
                keyup : function(event) {
                    var numbervalue = $('#number').next().children().val();
                    var json = {
                        "number" : numbervalue
                    };
                    // Ajax 用post方法完成ajax提交数据:rul, json, data :返回值
                    $.post("numberAjax", json, function(data) {
                        $('#isUsed_number').text("");
                        if ("1" == data) {
                            $('#isUsed_number').text("该账号已注册");
                        }
                    });
                }
            })
        });

        // 手机号已被使用注册
        $('#phone').textbox({
            inputEvents : $.extend({}, $.fn.textbox.defaults.inputEvents, {
                keyup : function(event) {
                    var phonevalue = $('#phone').next().children().val();
                    var json = {
                        "phone" : phonevalue
                    };
                    // Ajax 用post方法完成ajax提交数据:rul, json, data :返回值
                    $.post("phoneAjax", json, function(data) {
                        $('#isUsed_phone').text("");
                        if ("1" == data) {
                            $('#isUsed_phone').text("该手机号已注册");
                        }
                    });
                }
            })
        });

    })

    // 账号输入检测
    $.extend($.fn.validatebox.defaults.rules, {
        testnumber : {
            validator : function(value) {
                var reg = /^[1-9]\d{0,9}$/; // 正则表达
                return reg.test(value);
            },
            message : '不能以0开头，必须10位以内数字'
        }
    });

    $.extend($.fn.validatebox.defaults.rules, {
        eqPwd : {
            validator : function(value, param) {
                return value == $(param[0]).val();
            },
            message : '密码不一致'
        }
    });

    $.extend($.fn.validatebox.defaults.rules, {
        tel : {
            validator : function(value) {
                var reg = /^1[3-8][0-9]{9}$/;
                return reg.test(value);
            },
            message : '请输入正确的手机号！'
        }
    });

    function submitForm2() {
        var number = $('#isUsed_number').html();
        var phone = $('#isUsed_phone').html();
        if (number != "" && "" != phone)
            return;
        $('#ff').form('submit', {
            url:'addUser',
            onSubmit : function() {
                return $(this).form('enableValidation').form('validate');
            },
            success : function(data) { // 弹窗提示提交结果
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