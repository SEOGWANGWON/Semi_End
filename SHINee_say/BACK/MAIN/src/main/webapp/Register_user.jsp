<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="shinee.dao.Register_DAO" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>SHINee Music회원가입 페이지</title>
        <link rel="stylesheet" type="text/css" href="css/register_user.css">
    </head>
    <body>
        <div class="pageColor">
            <div class="TabColor"><img src="img/mypage_top.png" class="TabiconImage"><strong class="TabTextStyle">회원 가입</strong> 
                <button id="pageCloseButton" type="button" class="pageCloseButton" onclick="closeButton()"><Strong class="pageCloseButtonText">X</Strong></button>
            </div>           
               <div id="createAccount">
                <form action="Register_user.jsp">
	                <label for="id">
	                        <img class="iconImg" src="img/user.png">
	                </label>
	                    <input id="id" name="idcheck" type="text" placeholder="아이디" oninput="idCheck()" autocomplete="off">
	                    									<!--  oninput = 입력할때마다 실시간 체크   autocomplete="off" 자동완성 기능 off -->
	                    <button id="idButton" type="submit" name="idButton" >아이디 중복 확인</button> <!--  onclick="idDbCheck()" --> 
	                    <span id="ruleid"></span> <!--  <input type="hidden" name="idCheckBox" id="idCheckBox" value="idUnCheck">  -->
	              	</form>
	                	<%	     
                    		String user_id = request.getParameter("idcheck");
	                		Register_DAO userDAO = new Register_DAO();
                    		boolean bb = userDAO.getUserIdCheck(user_id);    
                    		
                    		if(bb==true){
	                	%>
	                		<script>
	                				alert("이미 존재하는 id입니다");
	                		</script>
	                	<%	
                    		}
	                	%>   
                <form action="SHINeeRegisterServlet" method="post" enctype="multipart/form-data">
	                <input type="hidden" name="id" value="<%=user_id%>">
	                <div>
	                    <label for="name">
	                        <img class="iconImg" src="img/name.png">
	                    </label>
	                    <input id="name" name="name" type="text" oninput="nameCheck()" placeholder="이름" autocomplete="off">
	                    <p id="rulename"></p>
	                </div>
	                <div>
	                    <label for="pw">
	                        <img class="iconImg" src="img/password.png">
	                    </label>
	                    <input id="pw" name="pw" type="password" oninput="pwCheck()"  placeholder="비밀번호" autocomplete="off">
	                    <p id="rulepm"></p>
	                </div>
	                <div>
	                    <label for="checkpw">
	                       <img class="iconImg" src="img/passwordcheck.png">
	                    </label>
	                    <input id="checkpw" type="password" oninput="pwCheck()" placeholder="비밀번호 확인">
	                    <span id="checkpm"></span>
	                </div>
	                <br>
	                <div>
	                    <label for="nickname">
	                        <img class="iconImg" src="img/profile.png">
	                    </label>
	                    <input id="nickname" name="nickname" type="text" oninput="nicknameCheck()" placeholder="닉네임" autocomplete="off">
	                    <p id="rulenickname"></p>
	                </div>
	                
	                <div>
	                    <div id="profileContainer">
	                        <!-- 프로필 사진을 표시할 컨테이너 -->
	                        <img id="uploadProfile">
	                    </div>
	                    <input type="file" id="profileInput" name="profileInput" accept="image/*" style="margin: 0 0 0 6%;">
	                    <button id="profileUploadButton" type="button">프로필 등록</button>
	                </div>
	                <br>
	                <div>
	                    <label for="emailid">
	                        <img class="iconImg" src="img/email.png">
	                    </label>
	                    <input id="emailid" type="email" name="emailid"  oninput="userEmailCheck()" placeholder="hongildong@naver.com" autocomplete="off">
	                    <p id="ruleemail"></p>
	                </div>
	                <div>
	                    <label for="phoneNumber">
	                        <img class="iconImg" src="img/phone.png">
	                    </label>
	                    <input id="phoneNumber" name="phoneNumber" type="text" oninput="userPhoneCheck()" placeholder="01012345678" autocomplete="off">
	                    <p id="rulephoneNumber"></p>
	                </div>
	                <button id="createUserButton" onclick="CreateUser()">회원가입</button>
	                
            	</form>
            	</div>

			    
       	</div>
       	<script src="https://code.jquery.com/jquery-3.7.1.js" 
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" 
        crossorigin="anonymous"></script>
       	<script src="js/CreateAccountPage.js">
        </script>
    </body>
</html>