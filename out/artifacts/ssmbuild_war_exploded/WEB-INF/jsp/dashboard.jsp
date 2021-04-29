<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Equipment Leasing Management">
    <meta name="author" content="Zuo">
    <title>建筑工地设备租赁管理系统</title>
    <link rel="icon" href="${pageContext.request.contextPath}/fonts/favicon.ico">

    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<%--    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>--%>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/css/dashboard.css" rel="stylesheet">


    <script>
        //加载用户名称，拦截器将此前已经拦截未登录用户
        window.onload = function(){
            if ('${USERNAME}' != '') {
                $('#aforusername').html("欢迎您，"+'${USERNAME}');
            }
        }



        $(document).ready(function () {
            $("#dbcontent").load('${pageContext.request.contextPath}/statics/overview.jsp');
                $('.list-item').click(function () {
                    var pageURL = $(this).attr('href');
                    $("#dbcontent").load(pageURL + ' #content > *');
                    
                    switch ($(this).text()) {
                        case "设备管理":
                            allEquip();
                            break;
                    }
                    //高亮属性转移
                    var items = $(".list-item");
                    items.each(function () {
                        if ($(this).parent().hasClass("active")){
                            $(this).parent().removeClass("active");
                        }
                    })
                    $(this).parent().addClass("active");
                    //禁止href跳转
                    return false;
            });

        })

        var equipArray = new Array();

        function allEquip(){



            // function equipsfun(id,equipID,equipName,equipDesc,equipPrice,equipOut,equipSpec,equipCount){
            //     return {"id":id,"equipID":equipID,"equipName":equipName,"equipDesc":equipDesc,"equipPrice":equipPrice,
            //     "equipOut":equipOut,"equipSpec":equipSpec,"equipCount":equipCount};
            // }

            // alert("go");
            $.ajax({
                url:"${pageContext.request.contextPath}/equip/allEquip",
                type:"post",
                cache: false,
                dataType:"json",
                success:function (equips) {
                    //alert("succeed!");
                    $("#equipdiv").children().remove();
                    $.each(equips,function (index,item) {
                        $("#equipdiv").append(
                            "<div class=\"col-sm-6 col-md-4 equipdiv\">"
                            +"<div class=\"thumbnail\">"
                            +"<img src=\"${pageContext.request.contextPath}/pics/"+item.equipName+".jpeg\"" +
                            "  height=\"400\" width=\"400\"  alt=\"默认设备图像\">"
                            +"<div class=\"caption\">"
                            +"<h3>"+item.equipName+"</h3>"
                            +"<p>"+item.equipDesc+"</p>"
                            +"<p style=\"text-align: center\">"
                            +"<a style=\"margin-right:5%\" href=\"#\" data-toggle=\"modal\"  data-target=\"#equipModal\" class=\"editor btn btn-primary\" role=\"button\">编辑此类</a>"
                            +"<a href=\"#\" class=\"updatePic btn btn-default\" role=\"button\">上传图片</a>"
                            +"<a style=\"margin-left:5%\"  href=\"#\" class=\"deleteEquips btn btn-default\" role=\"button\">删除此类</a>"
                            +"</p></div></div></div>"
                        )

                        // equipArray.push(equipsfun(item.id,item.equipID,item.equipName,item.equipDesc,item.equipPrice,item.equipOut,item.equipSpec,item.equipCount));
                    })

                    // for (var i = 0; i < equipArray.length; i++) {
                    //     console.log(equipArray[i]);
                    // }
                },
                error:function () {
                    alert("error!");
                }

            })
          //  return false;
        }


        $(document).on('click','.editor',function () {

            var container = $(this).closest('.caption');
            var equipName = container.children('h3').text();

            // alert(equipName);
            $.ajax({
                url:"${pageContext.request.contextPath}/equip/queryEquip",
                data:{'equipName':equipName},
                type:"GET",
                cache: false,
                success:function (equip) {
                    $('.equipidd').prop("value",equip.id);
                    $('.equipName').prop("value",equip.equipName);
                    $('.equipID').prop("value",equip.equipID);
                    $('.equipPrice').prop("value",equip.equipPrice);
                    $('.equipSpec').prop("value",equip.equipSpec);
                    $('.equipCount').prop("value",equip.equipCount);
                    $('.equipOut').prop("value",equip.equipOut);
                    $('.equipDesc').prop("value",equip.equipDesc);
                }
            })
        })


        $(document).on('click','.deleteEquips',function () {

            var container = $(this).closest('.caption');
            var equipName = container.children('h3').text();

            // alert(equipName);
            $.ajax({
                url:"${pageContext.request.contextPath}/equip/deleteEquip",
                data:{'equipName':equipName},
                type:"GET",
                cache: false,
                success:function (result) {
                    if (result != null){
                        if (result == 1){
                            alert("删除成功！");
                            $('#modeldiss').trigger('click');
                            allEquip();
                        } else{
                            alert("更新出错");
                        }
                    }
                }
            })
        })



        $(document).on('click','#updateEquip',function () {

            $.ajax({
                url:"${pageContext.request.contextPath}/equip/updateEquip",
                cache: false,
                data:$("#form-horizontal1").serialize(),
                success:function (result) {
                    if (result != null){
                        if (result == 1){
                            alert("更新成功！");
                            $('#modeldiss').trigger('click');
                            allEquip();

                        } else{
                            alert("更新出错");
                        }
                    }
                }
            })
        })


        $(document).on("click","#insertEquip",function () {
            $('#equipModal2').modal();
        })

        $(document).on("click","#addEquip",function () {

            $.ajax({
                url:"${pageContext.request.contextPath}/equip/insertEquip",
                cache: false,
                data:$("#form-horizontal2").serialize(),
                success:function (result) {
                    if (result != null){
                        if (result == 1){
                            alert("新增成功！");
                            $('#modeldiss2').trigger('click');
                            $('.equipName2').prop("value",null);
                            $('.equipID2').prop("value",null);
                            $('.equipPrice2').prop("value",null);
                            $('.equipSpec2').prop("value",null);
                            $('.equipCount2').prop("value",null);
                            $('.equipOut2').prop("value",null);
                            $('.equipDesc2').prop("value",null);
                            allEquip();
                        } else {
                            alert("新增出错");
                        }
                    }
                }
            })
        })

        //更改设备图片
        $(document).on("click",".updatePic",function () {
            $('#equipModal3').modal();
        })


        



    </script>





</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" >建筑工地设备租赁管理系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a id="aforusername" style="display: inline-block"></a></li>
                <li><a style="display: inline-block" href="${pageContext.request.contextPath}/user/outLogin">注销</a></li>
                <li><a href="#">系统设置</a></li>
                <li><a href="#">个人信息</a></li>
                <li><a href="#">帮助中心</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="搜索...">
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li  class="active li-item"><a class="list-item" href="${pageContext.request.contextPath}/statics/overview.jsp">全局总览</a></li>
                <li  class="li-item"><a class="list-item" href="#">近期订单</a></li>
                <li  class="li-item"><a class="list-item" href="#">合作对象</a></li>
                <li  class="li-item"><a class="list-item" href="#">办公记录</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li class="li-item"><a class="list-item" href="${pageContext.request.contextPath}/statics/equipment.jsp">设备管理</a></li>
                <li class="li-item"><a class="list-item" href="">物料管理</a></li>
                <li class="li-item"><a class="list-item" href="">订单管理</a></li>
                <li class="li-item"><a class="list-item" href="">健康工地</a></li>
                <li class="li-item"><a class="list-item" href="">客户反馈</a></li>
                <li class="li-item"><a class="list-item" href="">需求提交</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li class="li-item"><a class="list-item" href="">个人信息</a></li>
                <li class="li-item"><a class="list-item" href="">用户管理</a></li>
                <li class="li-item"><a class="list-item" href="">日志管理</a></li>
                <li class="li-item"><a class="list-item" href="">系统设置</a></li>
                <li class="li-item"><a class="list-item" href="">帮助中心</a></li>
            </ul>
        </div>





        <div id="dbcontent"  class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        </div>



        <div class="modal fade" id="equipModal"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button id="modeldiss" type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h2 class="modal-title" style="text-align: center" id="myModalLabel">编辑设备信息</h2>
                    </div>

                    <div class="modal-body">
                        <form id="form-horizontal1" class="form-horizontal update_dept_form">

                            <div class="form-group" style="display: none">
                                <label  class="col-sm-2 control-label"><span style="font-size: initial">id:</span></label>
                                <div class="col-sm-9">
                                    <input type="text" id="equipidd" name="id" class="equipidd form-control" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-2 control-label"><span style="font-size: initial">设备名称:</span></label>
                                <div class="col-sm-9">
                                    <input type="text" id="equipName" name="equipName" class="equipName form-control"  >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"><span style="font-size: initial">设备序号:</span></label>
                                <div class="col-sm-9">
                                    <input type="text" id="equipID" name="equipID" class="equipID form-control" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"><span style="font-size: initial">设备租金:</span></label>
                                <div class="col-sm-9">
                                    <input type="text" id="equipPrice" name="equipPrice" class="equipPrice form-control" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"><span style="font-size: initial">设备规格:</span></label>
                                <div class="col-sm-9">
                                    <input type="text" id="equipSpec" name="equipSpec" class="equipSpec form-control" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"><span style="font-size: initial">设备总量:</span></label>
                                <div class="col-sm-9">
                                    <input type="text" id="equipCount" name="equipCount" class="equipCount form-control" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"><span style="font-size: initial">已租出量:</span></label>
                                <div class="col-sm-9">
                                    <input type="text" id="equipOut" name="equipOut" class="equipOut form-control" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"><span style="font-size: initial">设备详情:</span></label>
                                <div class="col-sm-9">
                                    <input type="text" id="equipDesc" name="equipDesc" class="equipDesc form-control" >
                                </div>
                            </div>

                        </form>

                    </div>


                    <div class="modal-footer">
                        <button style="float: right; margin-right: 10%" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button style="float: left; margin-left: 10%"  type="button" id="updateEquip" class="equipupdate btn btn-primary">提交更改</button>

                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

        <div class="modal fade" id="equipModal2"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button id="modeldiss2" type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h2 class="modal-title" style="text-align: center" id="myModalLabel2">新增设备信息</h2>
                    </div>

                    <div class="modal-body">
                        <form id="form-horizontal2" class="form-horizontal update_dept_form">

<%--                            <div class="form-group" style="display: none">--%>
<%--                                <label  class="col-sm-2 control-label"><span style="font-size: initial">id:</span></label>--%>
<%--                                <div class="col-sm-9">--%>
<%--                                    <input type="text" id="equipidd2" name="id" class="equipidd2 form-control" >--%>
<%--                                </div>--%>
<%--                            </div>--%>

                            <div class="form-group">
                                <label  class="col-sm-2 control-label"><span style="font-size: initial">设备名称:</span></label>
                                <div class="col-sm-9">
                                    <input type="text" id="equipName2" name="equipName" class="equipName2 form-control"  >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"><span style="font-size: initial">设备序号:</span></label>
                                <div class="col-sm-9">
                                    <input type="text" id="equipID2" name="equipID" class="equipID2 form-control" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"><span style="font-size: initial">设备租金:</span></label>
                                <div class="col-sm-9">
                                    <input type="text" id="equipPrice2" name="equipPrice" class="equipPrice2 form-control" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"><span style="font-size: initial">设备规格:</span></label>
                                <div class="col-sm-9">
                                    <input type="text" id="equipSpec2" name="equipSpec" class="equipSpec2 form-control" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"><span style="font-size: initial">设备总量:</span></label>
                                <div class="col-sm-9">
                                    <input type="text" id="equipCount2" name="equipCount" class="equipCount2 form-control" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"><span style="font-size: initial">已租出量:</span></label>
                                <div class="col-sm-9">
                                    <input type="text" id="equipOut2" name="equipOut" class="equipOut2 form-control" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"><span style="font-size: initial">设备详情:</span></label>
                                <div class="col-sm-9">
                                    <input type="text" id="equipDesc2" name="equipDesc" class="equipDesc2 form-control" >
                                </div>
                            </div>

                        </form>

                    </div>


                    <div class="modal-footer">
                        <button style="float: right; margin-right: 10%" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button style="float: left; margin-left: 10%"  id="addEquip" type="button" class="equipupdate btn btn-primary">确认增加</button>

                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>






        <div class="modal fade" id="equipModal3"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button id="modeldiss3" type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h2 class="modal-title" style="text-align: center" id="myModalLabel3">更改设备图片</h2>
                    </div>

                    <div class="modal-body">
                        <form id="form-horizontal3" action="${pageContext.request.contextPath}/picUpload" class="form-horizontal update_dept_form" enctype="multipart/form-data" method="post">

                            <div>
                                <label><span style="font-size: initial">请选择需要更换的图片:</span></label>
                            </div>

                            <div>
                                <input type="file" id="picupload" name="picupload">
                                <input type="submit" value="确认上传">
                            </div>

                        </form>
                    </div>


                    <div class="modal-footer">
                        <button style="float: right; margin-right: 10%" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>





    </div>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<%--<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>--%>




</body>
</html>
