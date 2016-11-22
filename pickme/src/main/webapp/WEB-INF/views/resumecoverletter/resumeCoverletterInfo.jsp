<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 정보</title>
<!-- Bootstrap Core CSS -->
<link href="resumecoverlettersetting/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="resumecoverlettersetting/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="resumecoverlettersetting/dist/css/sb-admin-2.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="resumecoverlettersetting/vendor/morrisjs/morris.css" rel="stylesheet">
<!-- Social Buttons CSS -->
<link href="resumecoverlettersetting/vendor/bootstrap-social/bootstrap-social.css" rel="stylesheet">
<!-- DataTables CSS -->
<link href="resumecoverlettersetting/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
<!-- DataTables Responsive CSS -->
<link href="resumecoverlettersetting/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="resumecoverlettersetting/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- jQuery -->
<script src="resumecoverlettersetting/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="resumecoverlettersetting/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="resumecoverlettersetting/vendor/metisMenu/metisMenu.min.js"></script>
<!-- Morris Charts JavaScript -->
<script src="resumecoverlettersetting/vendor/raphael/raphael.min.js"></script>
<script src="resumecoverlettersetting/vendor/morrisjs/morris.min.js"></script>
<script src="resumecoverlettersetting/data/morris-data.js"></script>
<!-- Custom Theme JavaScript -->
<script src="resumecoverlettersetting/dist/js/sb-admin-2.js"></script>
<!-- Flot Charts JavaScript -->
<script src="resumecoverlettersetting/vendor/flot/excanvas.min.js"></script>
<script src="resumecoverlettersetting/vendor/flot/jquery.flot.js"></script>
<script src="resumecoverlettersetting/vendor/flot/jquery.flot.pie.js"></script>
<script src="resumecoverlettersetting/vendor/flot/jquery.flot.resize.js"></script>
<script src="resumecoverlettersetting/vendor/flot/jquery.flot.time.js"></script>
<script src="resumecoverlettersetting/vendor/flot-tooltip/jquery.flot.tooltip.min.js"></script>
<script src="resumecoverlettersetting/data/flot-data.js"></script>
<!-- DataTables JavaScript -->
<script src="resumecoverlettersetting/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="resumecoverlettersetting/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="resumecoverlettersetting/vendor/datatables-responsive/dataTables.responsive.js"></script>
<script src="resumecoverlettersetting/data/flot-data.js"></script>
<!-- Page-Level Demo Scripts - Notifications - Use for reference -->
<script>
    // tooltip demo
    $('.tooltip-demo').tooltip({
        selector: "[data-toggle=tooltip]",
        container: "body"
    })
    // popover demo
    $("[data-toggle=popover]")
        .popover()
</script>
<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
	$(document).ready(function() {
	$('#dataTables-example').DataTable({
    	responsive: true
        });
    });
</script>

</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/resumecoverletter/module/modHeader.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/resumecoverletter/module/modSideCommon.jsp" />
<body>
	<div id="wrapper">
		<div id="page-wrapper">
	    		<div class="row">
	            	<div class="col-lg-10">
	                    <h1 class="page-header">나의 이력서 및 자소서(나의 정보페이지)</h1>
						<div class="jumbotron">
						나의 지원현황/채용마감임박리스트 10/게시판 답글등등 보여주기 구현예정
						</div>
	                </div>
	                <!-- /.col-lg-12 -->
	            </div>
	            <!-- /.row -->
	            <div class="row">
	                <div class="col-lg-2 col-md-6">
	                    <div class="panel panel-primary">
	                        <div class="panel-heading">
	                            <div class="row">
	                                <div class="col-xs-3">
	                                    <i class="fa fa-pencil fa-5x"></i>
	                                </div>
	                                <div class="col-xs-9 text-right">
	                                    <div class="huge">26</div>
	                                    <div>내가 쓴 자소서</div>
	                                </div>
	                            </div>
	                        </div>
	                        <a href="#">
	                            <div class="panel-footer">
	                                <span class="pull-left">상세보기</span>
	                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	                                <div class="clearfix"></div>
	                            </div>
	                        </a>
	                    </div>
	                </div>
	                <div class="col-lg-2 col-md-6">
	                    <div class="panel panel-green">
	                        <div class="panel-heading">
	                            <div class="row">
	                                <div class="col-xs-3">
	                                    <i class="fa fa-list-alt fa-5x"></i>
	                                </div>
	                                <div class="col-xs-9 text-right">
	                                    <div class="huge">12</div>
	                                    <div>나의 이력서</div>
	                                </div>
	                            </div>
	                        </div>
	                        <a href="#">
	                            <div class="panel-footer">
	                                <span class="pull-left">상세보기</span>
	                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	                                <div class="clearfix"></div>
	                            </div>
	                        </a>
	                    </div>
	                </div>
	                <div class="col-lg-2 col-md-6">
	                    <div class="panel panel-yellow">
	                        <div class="panel-heading">
	                            <div class="row">
	                                <div class="col-xs-3">
	                                    <i class="fa fa-bookmark-o fa-5x"></i>
	                                </div>
	                                <div class="col-xs-9 text-right">
	                                    <div class="huge">124</div>
	                                    <div>나의 채용 북마크</div>
	                                </div>
	                            </div>
	                        </div>
	                        <a href="#">
	                            <div class="panel-footer">
	                                <span class="pull-left">상세보기</span>
	                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	                                <div class="clearfix"></div>
	                            </div>
	                        </a>
	                    </div>
	                </div>
	                <div class="col-lg-2 col-md-6">
	                    <div class="panel panel-red">
	                        <div class="panel-heading">
	                            <div class="row">
	                                <div class="col-xs-3">
	                                    <i class="fa fa-comments fa-5x"></i>
	                                </div>
	                                <div class="col-xs-9 text-right">
	                                    <div class="huge">13</div>
	                                    <div>나의 게시글 답글</div>
	                                </div>
	                            </div>
	                        </div>
	                        <a href="#">
	                            <div class="panel-footer">
	                                <span class="pull-left">상세보기</span>
	                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	                                <div class="clearfix"></div>
	                            </div>
	                        </a>
	                    </div>
	                </div>
	                <div class="col-lg-2 col-md-6">
	                    <div class="panel panel-red">
	                        <div class="panel-heading">
	                            <div class="row">
	                                <div class="col-xs-3">
	                                    <i class="fa fa-comments fa-5x"></i>
	                                </div>
	                                <div class="col-xs-9 text-right">
	                                    <div class="huge">13</div>
	                                    <div>나의 게시글 답글</div>
	                                </div>
	                            </div>
	                        </div>
	                        <a href="#">
	                            <div class="panel-footer">
	                                <span class="pull-left">상세보기</span>
	                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	                                <div class="clearfix"></div>
	                            </div>
	                        </a>
	                    </div>
	                </div>
	            </div>
	            <!-- /.row -->
	            <div class="row">
	                <div class="col-lg-10">
	                    <div class="panel panel-default">
	                        <div class="panel-heading">
	                            <i class="fa fa-bell fa-fw"></i> 채용 마감 임박
	                        </div>
	                        <!-- /.panel-heading -->
	                        <div class="panel-body">
	                            <div class="list-group">
	                                <a href="#" class="list-group-item">
	                                    <i class="fa fa-comment fa-fw"></i> New Comment
	                                    <span class="pull-right text-muted small"><em>4 minutes ago</em>
	                                    </span>
	                                </a>
	                                <a href="#" class="list-group-item">
	                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
	                                    <span class="pull-right text-muted small"><em>12 minutes ago</em>
	                                    </span>
	                                </a>
	                                <a href="#" class="list-group-item">
	                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
	                                    <span class="pull-right text-muted small"><em>27 minutes ago</em>
	                                    </span>
	                                </a>
	                                <a href="#" class="list-group-item">
	                                    <i class="fa fa-tasks fa-fw"></i> New Task
	                                    <span class="pull-right text-muted small"><em>43 minutes ago</em>
	                                    </span>
	                                </a>
	                                <a href="#" class="list-group-item">
	                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
	                                    <span class="pull-right text-muted small"><em>11:32 AM</em>
	                                    </span>
	                                </a>
	                                <a href="#" class="list-group-item">
	                                    <i class="fa fa-bolt fa-fw"></i> Server Crashed!
	                                    <span class="pull-right text-muted small"><em>11:13 AM</em>
	                                    </span>
	                                </a>
	                                <a href="#" class="list-group-item">
	                                    <i class="fa fa-warning fa-fw"></i> Server Not Responding
	                                    <span class="pull-right text-muted small"><em>10:57 AM</em>
	                                    </span>
	                                </a>
	                                <a href="#" class="list-group-item">
	                                    <i class="fa fa-shopping-cart fa-fw"></i> New Order Placed
	                                    <span class="pull-right text-muted small"><em>9:49 AM</em>
	                                    </span>
	                                </a>
	                                <a href="#" class="list-group-item">
	                                    <i class="fa fa-money fa-fw"></i> Payment Received
	                                    <span class="pull-right text-muted small"><em>Yesterday</em>
	                                    </span>
	                                </a>
	                            </div>
	                            <!-- /.list-group -->
	                            <a href="#" class="btn btn-default btn-block">View All Alerts</a>
	                        </div>
	                        <!-- /.panel-body -->
	                    </div>
	                    <!-- /.panel -->
	                </div>
	                <!-- /.col-lg-4 -->
	            </div>
	            <!-- /.row -->
	        </div>
	        <!-- /#page-wrapper -->
	</div>
</body>
</html>
