<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>员工列表</title>
    <jsp:include page="header.jsp"></jsp:include>
    <script type="text/javascript" src="mjs/tool.js"></script>
</head>
<body>
<div>
    <form id="ff" method="post">
        <label for="id_select">编号：</label>
        <input class="easyui-numberbox" style="width: 150px; height: 25px;"
               name="id_select" id="id_select">
        <label for="deptId_select">部门：</label>
        <input class="easyui-combobox" name="deptId_select" editable="false"
               id="deptId_select" data-options="
				url: 'selectAllDeptsForSelecting',
				method: 'post',
				valueField: 'did',
				textField: 'dname',
				panelWidth: 350,
				panelHeight: 'auto'
			">
        <label for="jobId_select">职位：</label>
        <input class="easyui-combobox" name="jobId_select" editable="false"
               id="jobId_select" data-options="
				url: 'selectAllJobsForSelecting',
				method: 'post',
				valueField: 'jid',
				textField: 'jname',
				panelWidth: 350,
				panelHeight: 'auto'
			">
        <label for="name_select">昵称:</label>
        <input class="easyui-textbox" style="width: 150px; height: 25px;"
               name="name_select" id="name_select">
        <label for="cardId_select">工作证编号：</label>
        <input class="easyui-numberbox" style="width: 150px; height: 25px;"
               name="cardId_select" id="cardId_select">
        <label for="address_select">地址:</label>
        <input class="easyui-textbox" style="width: 150px; height: 25px;"
               name="address_select" id="address_select">
        <label for="phone_select">手机号:</label>
        <input class="easyui-numberbox" style="width: 150px; height: 25px;"
               name="phone_select" id="phone_select">
        <label for="sex_select">性别:</label>
        <select id="sex_select" class="easyui-combobox" name="sex_select" editable="false"
                style="width:50px;">
            <option value="男">男</option>
            <option value="女">女</option>
        </select>
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
                <td>编号：</td>
                <td><input class="easyui-textbox" editable="false"
                           name="id" id="id_edit"
                           data-options="required:true"></td>
            </tr>
            <tr>
                <td>部门：</td>
                <td><input class="easyui-combobox" name="deptId" editable="false"
                           id="deptId_edit" data-options="
				url: 'selectAllDeptsForSelecting',
				method: 'post',
				valueField: 'did',
				textField: 'dname',
				panelWidth: 350,
				panelHeight: 'auto'
			"></input></td>
            </tr>
            <tr>
                <td>职位：</td>
                <td><input class="easyui-combobox" name="jobId" editable="false"
                           id="jobId_edit" data-options="
				url: 'selectAllJobsForSelecting',
				method: 'post',
				valueField: 'jid',
				textField: 'jname',
				panelWidth: 350,
				panelHeight: 'auto'
			"></input></td>
            </tr>
            <tr>
                <td>姓名：</td>
                <td><input class="easyui-textbox"
                           type="text" name="name" id="name_edit"
                           data-options="required:true"></td>
            </tr>
            <tr>
                <td>工作证编号：</td>
                <td><input class="easyui-numberbox"
                           name="cardId" id="cardId_edit"
                           data-options="required:true">
                </td>
            </tr>
            <tr>
                <td><span id="isUsed_cardId"
                          style="color: #FF0000; font-size: 12px"></span></td>
            </tr>
            <tr>
                <td>地址：</td>
                <td><input class="easyui-textbox"
                           type="text" name="address" id="address_edit"
                ></td>
            </tr>
            <tr>
                <td>邮编：</td>
                <td><input class="easyui-textbox"
                           type="text" name="postCode" id="postCode_edit"
                ></td>
            </tr>
            <tr>
                <td>电话：</td>
                <td><input class="easyui-numberbox"
                           type="text" name="tel" id="tel_edit"
                           data-options=""></td>
            </tr>
            <tr>
                <td>手机号：</td>
                <td><input class="easyui-numberbox"
                           type="text" name="phone" id="phone_edit"
                           data-options="validType:'length[11,11]'"></td>
            </tr>
            <tr>
                <td>QQ号码：</td>
                <td><input class="easyui-numberbox"
                           type="text" name="qqNum" id="qqNum_edit"
                ></td>
            </tr>
            <tr>
                <td>邮箱：</td>
                <td><input class="easyui-textbox"
                           type="text" name="email" id="email_edit"
                ></td>
            </tr>
            <tr>
                <td>性别：</td>
                <td><select id="sex_edit" class="easyui-combobox" name="sex" style="width:80px;" value="男">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select></td>
            </tr>
            <tr>
                <td>政治面貌：</td>
                <td><select id="party_edit" class="easyui-combobox" editable="false"
                            name="party" style="width:100px;" value="群众">
                    <option value="群众">群众</option>
                    <option value="共青团员">共青团员</option>
                    <option value="共产党员">共产党员</option>
                </select></td>
            </tr>
            <tr>
                <td>出生日期：</td>
                <td><input class="easyui-datebox" name="birthday" id="birthday_edit"
                ></td>
            </tr>
            <tr>
                <td>民族：</td>
                <td><input class="easyui-textbox"
                           type="text" name="race" id="race_edit"
                ></td>
            </tr>
            <tr>
                <td>学历：</td>
                <td><input class="easyui-textbox"
                           type="text" name="education" id="education_edit"
                ></td>
            </tr>
            <tr>
                <td>专业：</td>
                <td><input class="easyui-textbox"
                           type="text" name="speciality" id="speciality_edit"
                ></td>
            </tr>
            <tr>
                <td>爱好：</td>
                <td><input class="easyui-textbox"
                           type="text" name="hobby" id="hobby_edit"
                ></td>
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
        getData("${pageContext.request.contextPath}/selectAllEmployees");
        getPagerbar();
//         onKeyUp('cardIdAjax', 'cardId', 'isUsed_cardId', '该工作编号已存在');
    });



    // 模糊查询用户
    function submitForm1() {
        var id = $('#id_select').val();
        var deptId = $('#deptId_select').val();
        var jobId = $('#jobId_select').val();
        var name = $('#name_select').val();
        var cardId = $('#cardId_select').val();
        var address = $('#address_select').val();
        var phone = $('#phone_select').val();
        var sex = $('#sex_select').val();
        getData("${pageContext.request.contextPath}/selectEmployeesLike", id, deptId, jobId, name, cardId, address, phone, sex);
        getPagerbar();
    }

    // 获取用户数据
    function getData(url, id, deptId, jobId, name, cardId, address, phone, sex) {
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
                id: id,
                deptId: deptId,
                jobId: jobId,
                name: name,
                cardId: cardId,
                address: address,
                phone: phone,
                sex: sex
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
                field: 'dept',
                title: '部门',
                width: 80,
                formatter: function (value, row, index) {
                    if (null != row.dept)
                        return row.dept.dname;
                    return row.deptId;
                }
            }, {
                field: 'job',
                title: '职位',
                width: 80,
                formatter: function (value, row, index) {
                    if (null != row.job)
                        return row.job.jname;
                    return row.jobId;
                }
            }, {
                field: 'name',
                title: '呢称',
                width: 80
            }, {
                field: 'cardId',
                title: '工作证编号',
                width: 80
            }, {
                field: 'address',
                title: '地址',
                width: 200
            }, {
                field: 'postCode',
                title: '邮编',
                width: 80
            }, {
                field: 'tel',
                title: '电话',
                width: 100
            }, {
                field: 'phone',
                title: '手机',
                width: 100
            }, {
                field: 'qqNum',
                title: 'QQ号码',
                width: 100
            }, {
                field: 'email',
                title: '邮箱',
                width: 100
            }, {
                field: 'sex',
                title: '性别',
                width: 50
            }, {
                field: 'party',
                title: '政治面貌',
                width: 80
            }, {
                field: 'birthday',
                title: '出生日期',
                width: 80
            }, {
                field: 'race',
                title: '民族',
                width: 80
            }, {
                field: 'education',
                title: '学历',
                width: 80
            }, {
                field: 'speciality',
                title: '专业',
                width: 80
            }, {
                field: 'hobby',
                title: '爱好',
                width: 80
            }, {
                field: 'createDate',
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
                        $.messager.confirm('确定要删除', '确定要删除(' + row.name + ')吗？', function (r) {
                            if (r) {
                                $.get('deleteEmployee?id=' + row.id, null, function (data) {
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
                            $('#deptId_edit').textbox('setValue', row.deptId);
                            $('#jobId_edit').textbox('setValue', row.jobId);
                            $('#name_edit').textbox('setValue', row.name);
                            $('#cardId_edit').textbox('setValue', row.cardId);
                            $('#address_edit').textbox('setValue', row.address);
                            $('#postCode_edit').textbox('setValue', row.postCode);
                            $('#tel_edit').textbox('setValue', row.tel);
                            $('#phone_edit').textbox('setValue', row.phone);
                            $('#qqNum_edit').textbox('setValue', row.qqNum);
                            $('#email_edit').textbox('setValue', row.email);
                            $('#sex_edit').textbox('setValue', row.sex);
                            $('#party_edit').textbox('setValue', row.party);
                            $('#birthday_edit').textbox('setValue', row.birthday);
                            $('#race_edit').textbox('setValue', row.race);
                            $('#education_edit').textbox('setValue', row.education);
                            $('#speciality_edit').textbox('setValue', row.speciality);
                            $('#hobby_edit').textbox('setValue', row.hobby);
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
//         var id = $('#id_edit').val();
//         var deptId = $('#deptId_edit').val();
//         var jobId = $('#jobId_edit').val();
//         var name = $('#name_edit').val();
//         var cardId = $('#cardId_edit').val();
//         var address = $('#address_edit').val();
//         var postCode = $('#postCode_edit').val();
//         var tel = $('#tel_edit').val();
//         var phone = $('#phone_edit').val();
//         var qqNum = $('#qqNum_edit').val();
//         var email = $('#email_edit').val();
//         var sex = $('#sex_edit').val();
//         var party = $('#party_edit').val();
//         var birthday = $('#birthday_edit').val();
//         var race = $('#race_edit').val();
//         var education = $('#education_edit').val();
//         var speciality = $('#speciality_edit').val();
//         var hobby = $('#hobby_edit').val();
//         var remark = $('#remark_edit').val();

//         var json = {
//             "id": id,
//             "deptId": deptId,
//             "jobId": jobId,
//             "name": name,
//             "cardId": cardId,
//             "address": address,
//             "postCode": postCode,
//             "tel": tel,
//             "qqNum": qqNum,
//             "email": email,
//             "sex": sex,
//             "party": party,
//             "birthday": birthday,
//             "race": race,
//             "education": education,
//             "speciality": speciality,
//             "hobby": hobby,
//             "remark": remark
//         }
//         $.post('updateEmployee', json, function (data) {
//             alert(data);
//             $.messager.alert('结果', data, 'info', function () {
//                 window.location.reload();
//             })
//         });

        // $('#form_edit').form('submit', {
        //     url: 'updateEmployee',
        //     onSubmit: function () {
        //         return $(this).form();
        //     },
        //     success: function (data) { // 弹窗提示提交结果
        //         if ('1' == data) {
        //             $.messager.alert('提示', '修改成功', 'info');
        //         } else {
        //             $.messager.alert('警告', '修改失败', 'error');
        //         }
        //         window.location.reload();
        //     }
        // });

        $.ajax({
            type: 'POST',
            dataType:'json',
            url:'updateEmployee',
            data:$('#form_edit').serialize(),
            success:function (result) {
                if ('1' == result) {
                    $.messager.alert('提示', '修改成功', 'info');
                } else {
                    $.messager.alert('警告', '修改失败', 'error');
                }
                window.location.reload();
            },
            error:function () {
                alert('异常');
            }
        })
    }


    function clearForm() {
        $('#ff').form('clear');
    }
</script>

</html>