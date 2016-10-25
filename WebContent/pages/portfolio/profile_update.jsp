<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">

<!-- 외부참조 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>

<!-- 내부참조 -->
<link rel="stylesheet" href="/portfolio/include/css/profile_modify.css">


<title>Soft Engineer Society</title>
</head>
<body>

	<script type="text/javascript" src="/portfolio/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="/portfolio/js/essential_2.js"></script>
	<!-- essential2에서 헤더호출 -->
	<div id="myheader"></div>
	<!-- Page Content -->
	<div class="container" style="width: 80%; margin-left: 15%">
		<!-- 상단 메뉴 -->

		<!-- Page Navigator -->
		<ol class="breadcrumb path" style="background-color: white;">
			<li><a href="../society/index" onclick="clickMenu('home')">Home</a></li>
			<li class="active">기본정보 관리</li>
		</ol>
		<!--  -->

		<!-- Page Title -->
		<div class="col-md-2"></div>
		<div class="page-header" style="border-left: 5px solid #ff0000;">
			<span style="font-size: 25px; font-weight: bold; font-family: inherit; margin-left: 1%;">개인정보 관리</span>
		</div>


		<!-- essential2에서 탭메뉴호출 -->
		<div id="myheader2"></div>

		<form action="memberUpdate" name="form1" onsubmit="return joinMember()" method="post" style="margin: 0px; padding-bottom: 100px; border-top: none; background: url('') no-repeat center center; background-size: cover;">
			<!-- name 변경 해야함,  col-md(크기) 변경-->
			<fieldset class="width:100%;">
				<ul>
					<li><label for="userid">아이디</label> <input type='text' name="memberVo.memberId" maxlength=20 value="${memberVo.memberId}" readonly /></li>
					<li><label for="userpw">패스워드</label> <input type='password' id="userpw" name="memberVo.password" maxlength=20 /></li>
					<li id="pwEnter"><label for="userpw0">패스워드 확인</label> <input type='password' id="userpw0" maxlength=20 /></li>
					<li><label for="username">이름</label> <input type='text' id="username" name="memberVo.name" maxlength=20 value="${memberVo.name}" /></li>

					<!-- 이부분 Action이랑 연결시켜야함. -->
					<li id="gender"><label>성별</label> <input name="memberVo.sex" id="man" type="radio" value="0" />남자 <input name="memberVo.sex" id="woman" type="radio" value="1" />여자</li>
					<!-- ---- -->
					<li><label>생년월일</label> 
					<s:select headerKey="1" headerValue="y" id="y" list="#{year}" name="u" value="1" />년 
					<s:select headerKey="1" headerValue="year" id="year" list="#{'1':'2011', '2':'2010'}" name="useryear" value="1" />년 
					&nbsp;&nbsp; <select id="month" name="usermonth" title="월">
					</select> 월 &nbsp; <select id="day" name="userday" title="일"></select> 일
					</li>
					<li><label>이메일</label> <input type='text' placeholder='이메일 주소@도메인' id="email" name="memberVo.email" value=""></li>
					<li><label>전화번호</label> <input type='text' id="tel" name="memberVo.phone" placeholder="숫자만 입력" value=""></li>
					
					<!-- <li><label>마스터 기수</label> <input type='text' id="masterN" name="memberVo.gisu" value=""> 기</li> -->
				</ul>

			</fieldset>

			<input type="hidden" id="birthday" name="memberVo.birth" value="">

			<div id="btnCenter" style="top: 50px;">
				<input type="submit" value="수정" /> <input type="reset" value="삭제" />
			</div>
		</form>
		<input type="hidden" id="sex" name="memberVo.sex" value="0">
	</div>
	<!-- end .container -->

	<div class="footer"></div>
	<!-- end .footer -->
</body>
<script type="text/javascript" src="/portfolio/include/js/profile_modify.js"></script>

</html>