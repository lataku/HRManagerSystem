<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加用户</title>
    <jsp:include page="header.jsp"></jsp:include>
    <script type="text/javascript" src="mjs/tool.js"></script>
</head>
<body>
<div class="easyui-panel" title="添加用户" style="width: 400px">
    <div style="padding: 10px 60px 20px 60px">
        <form id="ff" method="post">
            <table cellpadding="5">
                <tr>
                    <td>部门:</td>
                    <td><input class="easyui-combobox" name="deptId" editable="false"
                               id="deptId" data-options="
				url: 'selectAllDeptsForSelecting',
				method: 'post',
				valueField: 'did',
				textField: 'dname',
				panelWidth: 350,
				panelHeight: 'auto'
			"></input>
                    </td>
                </tr>
                <tr>
                    <td>职位:</td>
                    <td><input class="easyui-combobox" name="jobId" editable="false"
                               id="jobId" data-options="
				url: 'selectAllJobsForSelecting',
				method: 'post',
				valueField: 'jid',
				textField: 'jname',
				panelWidth: 350,
				panelHeight: 'auto'
			"></input>
                    </td>
                </tr>
                <tr>
                    <td>用户名:</td>
                    <td><input class="easyui-textbox" type="text" name="name"
                               data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td>工作证编号:</td>
                    <td><input class="easyui-numberbox" name="cardId" id="cardId"
                               data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td><span id="isUsed_cardId"
                              style="color: #FF0000; font-size: 12px"></span></td>
                </tr>
                <tr>
                    <td>地址:</td>
                    <td><input class="easyui-textbox" type="text" name="address"
                               style="font-size: 13.5px"></input></td>
                </tr>
                <tr>
                    <td>邮编:</td>
                    <td><input class="easyui-textbox" type="text" name="postCode"
                               style="font-size: 13.5px"></input></td>
                </tr>
                <tr>
                    <td>电话：</td>
                    <td><input class="easyui-numberbox" name="tel" id="tel"
                               ></input></td>
<%--                                        <td><span id="isUsed_tel"--%>
<%--                                                  style="color: #FF0000; font-size: 12px"></span></td>--%>
                </tr>
                <tr>
                    <td>手机：</td>
                    <td><input class="easyui-numberbox" name="phone" id="phone"
                               validType="tel"></input></td>
                    <td><span id="isUsed_phone"
                              style="color: #FF0000; font-size: 12px"></span></td>
                </tr>
                <tr>
                    <td>QQ号码:</td>
                    <td><input class="easyui-numberbox" type="text" name="qqNum"
                               style="font-size: 13.5px"></input></td>
                </tr>
                <tr>
                    <td>邮箱:</td>
                    <td><input class="easyui-textbox" type="email" name="email"
                               style="font-size: 13.5px"></input></td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td><select id="sex" class="easyui-combobox" name="sex" editable="false"
                    	style="width:50px;" value="男">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select></td>
                </tr>
                <tr>
                    <td>政治面貌:</td>
                    <td><select id="party" class="easyui-combobox" name="party" editable="false"
                    	style="width:80px;" value="群众">
                        <option value="群众">群众</option>
                        <option value="共青团员">共青团员</option>
                        <option value="共产党员">共产党员</option>
                    </select></td>
                </tr>
            <tr>
                <td>出生日期：</td>
                <td><input class="easyui-datebox" name="birthday" id="birthday_edit"
                	style="width: 200px" editable="false"></td>
            </tr>
                <tr>
                    <td>民族:</td>
                    <td><input class="easyui-textbox" type="text" name="race"
                               style="font-size: 13.5px"></input></td>
                </tr>
                <tr>
                    <td>学历:</td>
                    <td><input class="easyui-textbox" type="text" name="education"
                               style="font-size: 13.5px"></input></td>
                </tr>
                <tr>
                    <td>专业:</td>
                    <td><input class="easyui-textbox" type="text" name="speciality"
                               style="font-size: 13.5px"></input></td>
                </tr>
                <tr>
                    <td>爱好:</td>
                    <td><input class="easyui-textbox" type="text" name="hobby"
                               style="font-size: 13.5px"></input></td>
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
    $(function () {
        // combobo组合框默认值
        $('#deptId').combobox({
            onLoadSuccess: function (data) {
                if (data) {
                    $(this).combobox('setValue', data[0].did);
                }
            }
        });
        $('#jobId').combobox({
            onLoadSuccess: function (data) {
                if (data) {
                    $(this).combobox('setValue', data[0].jid);
                }
            }
        });
        // 键盘抬起事件
        // 账号输入检测
        onKeyUp('cardIdAjax', 'cardId', 'isUsed_cardId', '该工作编号已存在');
        onKeyUp('EphoneAjax', 'phone', 'isUsed_phone', '该手机号已存在');

        $.extend($.fn.validatebox.defaults.rules, {
            testnumber: {
                validator: function (value) {
                    var reg = /^[1-9]\d{0,9}$/; // 正则表达
                    return reg.test(value);
                },
                message: '不能以0开头，必须10位以内数字'
            }
        });


        $.extend($.fn.validatebox.defaults.rules, {
            tel: {
                validator: function (value) {
                    var reg = /^1[3-8][0-9]{9}$/;
                    return reg.test(value);
                },
                message: '请输入正确的手机号！'
            }
        });
    });

    function submitForm2() {
        var cardId = $('#isUsed_cardId').html();
        var phone = $('#isUsed_phone').html();
        if (cardId != "" && phone != "")
            return;
        $('#ff').form('submit', {
            url: 'addEmployee',
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
        }).serialize();
    }

    function clearForm() {
        $('#ff').form('clear');
    }
</script>
</body>
</html>