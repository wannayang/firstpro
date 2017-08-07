<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta charset="utf-8">
<title>Notebook | Web Application</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="<%=basePath%>resources/notebook/css/app.v2.css" type="text/css" />
<script type="text/javascript" src="<%=basePath%>resources/notebook/js/app.v2.js"></script>
</head>
<body>
	<section class="vbox">
			<section class="hbox stretch">
				<section id="content">
					<section class="vbox">
						
						<section class="scrollable">
							<section class="hbox stretch">
								<aside class="aside-lg bg-light lter b-r">
									<section class="vbox">
										<section class="scrollable">
											
										</section>
									</section>
								</aside>
								<aside class="bg-white">
									<section class="vbox">
										<header class="header bg-light bg-gradient">
											<ul class="nav nav-tabs nav-white">
												<li class=""><a href="#activity" data-toggle="tab">Activity</a>
												</li>
												<li class=""><a href="#events" data-toggle="tab">Events</a>
												</li>
												<li class="active"><a href="#interaction"
													data-toggle="tab">Interaction</a>
												</li>
											</ul>
										</header>
										<section class="scrollable">
											<div class="tab-content">
												<div class="tab-pane" id="activity">
													<ul
														class="list-group no-radius m-b-none m-t-n-xxs list-group-lg no-border">
														<li class="list-group-item"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar_default.jpg" class="img-circle">
														</a> <a href="#" class="clear"> <small class="pull-right">3
																	minuts ago</small> <strong class="block">Drew Wllon</strong> <small>Wellcome
																	and play this web application template ... </small> </a></li>
														<li class="list-group-item"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar.jpg" class="img-circle"> </a> <a
															href="#" class="clear"> <small class="pull-right">1
																	hour ago</small> <strong class="block">Jonathan George</strong>
																<small>Morbi nec nunc condimentum...</small> </a></li>
														<li class="list-group-item"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar.jpg" class="img-circle"> </a> <a
															href="#" class="clear"> <small class="pull-right">2
																	hours ago</small> <strong class="block">Josh Long</strong> <small>Vestibulum
																	ullamcorper sodales nisi nec...</small> </a></li>
														<li class="list-group-item"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar_default.jpg" class="img-circle">
														</a> <a href="#" class="clear"> <small class="pull-right">1
																	day ago</small> <strong class="block">Jack Dorsty</strong> <small>Morbi
																	nec nunc condimentum...</small> </a></li>
														<li class="list-group-item"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar.jpg" class="img-circle"> </a> <a
															href="#" class="clear"> <small class="pull-right">3
																	days ago</small> <strong class="block">Morgen Kntooh</strong> <small>Mobile
																	first web app for startup...</small> </a></li>
														<li class="list-group-item"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar_default.jpg" class="img-circle">
														</a> <a href="#" class="clear"> <small class="pull-right">Jun
																	21</small> <strong class="block">Yoha Omish</strong> <small>Morbi
																	nec nunc condimentum...</small> </a></li>
														<li class="list-group-item"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar.jpg" class="img-circle"> </a> <a
															href="#" class="clear"> <small class="pull-right">May
																	10</small> <strong class="block">Gole Lido</strong> <small>Vestibulum
																	ullamcorper sodales nisi nec...</small> </a></li>
														<li class="list-group-item"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar_default.jpg" class="img-circle">
														</a> <a href="#" class="clear"> <small class="pull-right">Jan
																	2</small> <strong class="block">Jonthan Snow</strong> <small>Morbi
																	nec nunc condimentum...</small> </a></li>
														<li class="list-group-item" href="#email-content"
															data-toggle="class:show"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar_default.jpg" class="img-circle">
														</a> <a href="#" class="clear"> <small class="pull-right">3
																	minuts ago</small> <strong class="block">Drew Wllon</strong> <small>Vestibulum
																	ullamcorper sodales nisi nec sodales nisi nec sodales
																	nisi nec...</small> </a></li>
														<li class="list-group-item"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar.jpg" class="img-circle"> </a> <a
															href="#" class="clear"> <small class="pull-right">1
																	hour ago</small> <strong class="block">Jonathan George</strong>
																<small>Morbi nec nunc condimentum...</small> </a></li>
														<li class="list-group-item"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar.jpg" class="img-circle"> </a> <a
															href="#" class="clear"> <small class="pull-right">2
																	hours ago</small> <strong class="block">Josh Long</strong> <small>Vestibulum
																	ullamcorper sodales nisi nec...</small> </a></li>
														<li class="list-group-item"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar_default.jpg" class="img-circle">
														</a> <a href="#" class="clear"> <small class="pull-right">1
																	day ago</small> <strong class="block">Jack Dorsty</strong> <small>Morbi
																	nec nunc condimentum...</small> </a></li>
														<li class="list-group-item"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar.jpg" class="img-circle"> </a> <a
															href="#" class="clear"> <small class="pull-right">3
																	days ago</small> <strong class="block">Morgen Kntooh</strong> <small>Mobile
																	first web app for startup...</small> </a></li>
														<li class="list-group-item"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar_default.jpg" class="img-circle">
														</a> <a href="#" class="clear"> <small class="pull-right">Jun
																	21</small> <strong class="block">Yoha Omish</strong> <small>Morbi
																	nec nunc condimentum...</small> </a></li>
														<li class="list-group-item"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar.jpg" class="img-circle"> </a> <a
															href="#" class="clear"> <small class="pull-right">May
																	10</small> <strong class="block">Gole Lido</strong> <small>Vestibulum
																	ullamcorper sodales nisi nec...</small> </a></li>
														<li class="list-group-item"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar_default.jpg" class="img-circle">
														</a> <a href="#" class="clear"> <small class="pull-right">Jan
																	2</small> <strong class="block">Jonthan Snow</strong> <small>Morbi
																	nec nunc condimentum...</small> </a></li>
														<li class="list-group-item" href="#email-content"
															data-toggle="class:show"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar_default.jpg" class="img-circle">
														</a> <a href="#" class="clear"> <small class="pull-right">3
																	minuts ago</small> <strong class="block">Drew Wllon</strong> <small>Vestibulum
																	ullamcorper sodales nisi nec sodales nisi nec sodales
																	nisi nec...</small> </a></li>
														<li class="list-group-item"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar.jpg" class="img-circle"> </a> <a
															href="#" class="clear"> <small class="pull-right">1
																	hour ago</small> <strong class="block">Jonathan George</strong>
																<small>Morbi nec nunc condimentum...</small> </a></li>
														<li class="list-group-item"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar.jpg" class="img-circle"> </a> <a
															href="#" class="clear"> <small class="pull-right">2
																	hours ago</small> <strong class="block">Josh Long</strong> <small>Vestibulum
																	ullamcorper sodales nisi nec...</small> </a></li>
														<li class="list-group-item"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar_default.jpg" class="img-circle">
														</a> <a href="#" class="clear"> <small class="pull-right">1
																	day ago</small> <strong class="block">Jack Dorsty</strong> <small>Morbi
																	nec nunc condimentum...</small> </a></li>
														<li class="list-group-item"><a href="#"
															class="thumb-sm pull-left m-r-sm"> <img
																src="images/avatar.jpg" class="img-circle"> </a> <a
															href="#" class="clear"> <small class="pull-right">3
																	days ago</small> <strong class="block">Morgen Kntooh</strong> <small>Mobile
																	first web app for startup...</small> </a></li>
													</ul>
												</div>
												<div class="tab-pane" id="events">
													<div class="text-center wrapper">
														<i class="fa fa-spinner fa fa-spin fa fa-large"></i>
													</div>
												</div>
												<div class="tab-pane active" id="interaction">
													<div class="text-center wrapper">
														<i class="fa fa-spinner fa fa-spin fa fa-large"></i>
													</div>
												</div>
											</div>
										</section>
									</section>
								</aside>
								<aside class="col-lg-4 b-l">
									
								</aside>
							</section>
						</section>
					</section>
					<a href="#" class="hide nav-off-screen-block"
						data-toggle="class:nav-off-screen" data-target="#nav"></a>
				</section>
				<aside class="bg-light lter b-l aside-md hide" id="notes">
					<div class="wrapper">Notification</div>
				</aside>
			</section>
			              <footer class="footer bg-white b-t">
                <div class="row text-center-xs">
                  <div class="col-md-6 hidden-sm">
                    <p class="text-muted m-t">Showing 20-30 of 50</p>
                  </div>
                  <div class="col-md-6 col-sm-12 text-right text-center-xs">
                    <ul class="pagination pagination-sm m-t-sm m-b-none">
                      <li><a href="#"><i class="fa fa-chevron-left"></i></a></li>
                      <li class="active"><a href="#">1</a></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">3</a></li>
                      <li><a href="#">4</a></li>
                      <li><a href="#">5</a></li>
                      <li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
                    </ul>
                  </div>
                </div>
              </footer>
			
	</section>
	
	<!-- Bootstrap -->
	<!-- App -->


</body>
</html>