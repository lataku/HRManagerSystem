<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>企业信息化平台管理系统</title>
    <jsp:include page="header.jsp"></jsp:include>

</head>
<body class="easyui-layout">
<div class="easyui-layout" style="width: 100%; height: 100%;">
    <div data-options="region:'north'"
         style="overflow: hidden; height:50px; background-color: #c1e2f9">
        <h2 style="margin-left: 30px; color: #007dbe; float: left;">企业信息化平台管理系统</h2>
        <div id="right" style="float: right">
            <p id="ptime"style="float:right"></p>
            <span style="float:left">当前用户：${sessionScope.username}</span>
            <a href=${pageContext.request.contextPath}>&nbsp;&nbsp;&nbsp;注销</a>
            <!-- 				<input type="button"
                                style="background-image: url(r01.png); width: 30px; height: 30px;"
                                data-options="iconCls:icon-redo"> <input type="button"
                                style="background-image: url(r02.png); width: 30px; height: 30px;"
                                data-options="iconCls:icon-help"> <input type="button"
                                style="background-image: url(r03.png); width: 30px; height: 30px;"
                                data-options="iconCls:icon-reload"> -->
        </div>
    </div>
    <div data-options="region:'south',split:true"
         style="height: 50px; text-align: center;">
        <span style="font-size: 12px">JAVAEE技术开发 170815</span>
    </div>
    <div data-options="region:'west',split:true" title="导航菜单"
         style="width: 200px;">
        <div class="easyui-accordion"
             style="width: 200px; height: 100%;">
            <div title="用户管理" data-options="iconCls:'icon-ok'" style="padding: 10px;"">
            <button id="btn_selectUser" class="btn_nav easyui-linkbutton"
                    data-options="iconCls:'icon-search'" style="width: 80%">用户查询</button>
            <button id="btn_addUser" class="btn_nav easyui-linkbutton"
                    data-options="iconCls:'icon-add'" style="width: 80%">添加用户</button>
        </div>
        <div title="部门管理" data-options="iconCls:'icon-edit'"
             style="padding: 10px;">
            <button id="btn_selectDept" class="btn_nav easyui-linkbutton"
                    data-options="iconCls:'icon-search'" style="width: 80%">部门查询</button>
            <button id="btn_addDept" class="btn_nav easyui-linkbutton"
                    data-options="iconCls:'icon-add'" style="width: 80%">添加部门</button>
        </div>
        <div title="职位管理" data-options="iconCls:'icon-filter'"
             style="padding: 10px;">
            <button id="btn_selectJob" class="btn_nav easyui-linkbutton"
                    data-options="iconCls:'icon-search'" style="width: 80%">职位查询</button>
            <button id="btn_addJob" class="btn_nav easyui-linkbutton"
                    data-options="iconCls:'icon-add'" style="width: 80%">添加职位</button>
        </div>
        <div title="员工管理" data-options="iconCls:'icon-man'"
             style="padding: 10px;">
            <button id="btn_selectEmployee" class="btn_nav easyui-linkbutton"
                    data-options="iconCls:'icon-search'" style="width: 80%">员工查询</button>
            <button id="btn_addEmployee" class="btn_nav easyui-linkbutton"
                    data-options="iconCls:'icon-add'" style="width: 80%">添加员工</button>
        </div>
        <div title="公告管理" data-options="iconCls:'icon-print'"
             style="padding: 10px;">
            <button id="btn_selectNotice" class="btn_nav easyui-linkbutton"
                    data-options="iconCls:'icon-search'" style="width: 80%">公告查询</button>
            <button id="btn_addNotice" class="btn_nav easyui-linkbutton"
                    data-options="iconCls:'icon-add'" style="width: 80%">添加公告</button>
        </div>
        <div title="下载中心" data-options="iconCls:'icon-save'"
             style="padding: 10px;">
            <button id="btn_selectUploadFile" class="btn_nav easyui-linkbutton"
                    data-options="iconCls:'icon-search'" style="width: 80%">上传文件</button>
            <button id="btn_addUploadFile" class="btn_nav easyui-linkbutton"
                    data-options="iconCls:'icon-add'" style="width: 80%">下载文件</button>
        </div>
    </div>
</div>
<div data-options="region:'center'">
    <div id="tt" class="easyui-tabs" style="width: 100%; height: 100%">
        <!--             <div title="首页"> -->

        <!--             </div> -->

    </div>

</div>

</div>
<script type="text/javascript">
    if(null == "${sessionScope.username}" || "${sessionScope.username}" == "")
    {//没有登录
        window.location.replace("login.jsp");
    }

    // 定时器
    var time = setInterval(function () {
        getTime();
    }, 1000);

    /*封装获取时间 得到月，日，时，分，秒，要处理少10补0 */
    function getTime() {
        var d = new Date();
        var M = (d.getMonth() + 1) < 10 ? ('0' + (d.getMonth() + 1)) : (d.getMonth() + 1);
        var D = d.getDate() < 10 ? ('0' + d.getDate()) : d.getDate();
        var H = d.getHours() < 10 ? ('0' + d.getHours()) : d.getHours();
        var m = d.getMinutes() < 10 ? ('0' + d.getMinutes()) : d.getMinutes();
        var s = d.getSeconds() < 10 ? ('0' + d.getSeconds()) : d.getSeconds();
        var t = d.getFullYear() + "年" + M + "月" + D
            + "号&nbsp;&nbsp;&nbsp;&nbsp;" + H + ":" + m + ":" + s
            + "&nbsp;&nbsp;&nbsp;&nbsp;星期" + "日一二三四五六".charAt(d.getDay());
        //将控件的内容修改为处理好的字符串
        $("#ptime").html(t);
    }
</script>
<script type="text/javascript">


    // jQuery语法
    $(function () {
        // 为每个按钮绑定新建标签页
        $("#btn_selectUser").click(function () {
            addTabs("#tt", $("#btn_selectUser").text(), "listUser.jsp", 'icon-search');
        });
        $("#btn_addUser").click(function () {
            addTabs("#tt", $("#btn_addUser").text(), "addUser.jsp", 'icon-add');
        });
        $("#btn_selectDept").click(function () {
            addTabs("#tt", $('#btn_selectDept').text(), "listDept.jsp", 'icon-search');
        });
        $("#btn_addDept").click(function () {
            addTabs("#tt", $("#btn_addDept").text(), "addDept.jsp", 'icon-add');
        });
        $("#btn_selectJob").click(function () {
            addTabs("#tt", $("#btn_selectJob").text(), "listJob.jsp", 'icon-search');
        });
        $("#btn_addJob").click(function () {
            addTabs("#tt", $("#btn_addJob").text(), "addJob.jsp", 'icon-add');
        });
        $("#btn_selectEmployee").click(function () {
            addTabs("#tt", $("#btn_selectEmployee").text(), "listEmployee.jsp", 'icon-search');
        });
        $("#btn_addEmployee").click(function () {
            addTabs("#tt", $("#btn_addEmployee").text(), "addEmployee.jsp", 'icon-add');
        });
        $("#btn_selectNotice").click(function () {
            addTabs("#tt", $("#btn_selectNotice").text(), "listNotice.jsp", 'icon-search');
        });
        $("#btn_addNotice").click(function () {
            addTabs("#tt", $("#btn_addNotice").text(), "addNotice.jsp", 'icon-add');
        });
        $("#btn_selectUploadFile").click(function () {
            addTabs("#tt", $("#btn_selectUploadFile").text(), "upload.jsp", 'icon-search');
        });
        $("#btn_addUploadFile").click(function () {
            addTabs("#tt", $("#btn_addUploadFile").text(), "download.jsp", 'icon-add');
        });

        // 封装添加新tab标签页方法,url是要显示在标签页的网页
        function addTabs(tabId, titleName, url, icons) {
            // 先判断是否存在
            var res = $(tabId).tabs("exists", titleName);
            if (res) {
                // 若选项卡存在，则使之选中状态
                $(tabId).tabs("select", titleName);
            } else {
                // 否则添加新标签页
                $(tabId).tabs('add', {
                    title: titleName,
                    content: '<iframe scrolling="auto" frameborder="0" src="'
                        + url + '" style=width:100%;height:100%;></iframe>',
                    closable: true,
                    iconCls: icons,
                });
            }
        }
    })
</script>

</body>
</html>