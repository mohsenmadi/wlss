<html>
<head>
   <meta name='layout' content='main'/>
   <title><g:message code="springSecurity.login.title"/></title>
   <style type='text/css' media='screen'>
   #login {
      margin: 15px 0px;
      padding: 0px;
      text-align: center;
   }

   #login .inner {
      width: 340px;
      padding-bottom: 6px;
      margin: 60px auto;
      text-align: left;
      border: 1px solid #aab;
      background-color: #f0f0fa;
      -moz-box-shadow: 2px 2px 2px #eee;
      -webkit-box-shadow: 2px 2px 2px #eee;
      -khtml-box-shadow: 2px 2px 2px #eee;
      box-shadow: 2px 2px 2px #eee;
   }

   #login .inner .fheader {
      padding: 18px 26px 14px 26px;
      background-color: #f7f7ff;
      margin: 0px 0 14px 0;
      color: #2e3741;
      font-size: 18px;
      font-weight: bold;
   }

   #login .inner .cssform p {
      clear: left;
      margin: 0;
      padding: 4px 0 3px 0;
      padding-left: 105px;
      margin-bottom: 20px;
      height: 1%;
   }

   #login .inner .cssform input[type='text'] {
      width: 120px;
   }

   #login .inner .cssform label {
      font-weight: bold;
      float: left;
      text-align: right;
      margin-left: -105px;
      width: 110px;
      padding-top: 3px;
      padding-right: 10px;
   }

   #login #remember_me_holder {
      padding-left: 120px;
   }

   #login #submit {
      margin-left: 15px;
   }

   #login #remember_me_holder label {
      float: none;
      margin-left: 0;
      text-align: left;
      width: 200px
   }

   #login .inner .login_message {
      padding: 6px 25px 20px 25px;
      color: #c33;
   }

   #login .inner .text_ {
      width: 120px;
   }

   #login .inner .chk {
      height: 12px;
   }
   </style>
</head>

<body>
<div id='login'>
   <div class='inner'>
      <div class='fheader'><g:message code="springSecurity.login.header"/></div>

      <g:set var="liuService" bean="liuService"/>
      <g:if test='${liuService.firmJustAdded()}'>
         <div class='login_message'>Your profile has been updated. Please relogin using your credentials.</div>
      </g:if>
      <g:elseif test='${flash.message}'>
         <div class='login_message'>${flash.message}</div>
      </g:elseif>

      <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
         <p>
            <label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
            <input type='text' class='text_' name='j_username' id='username'/>
         </p>

         %{--<p hidden>--}%
         %{--<label for='username2'><g:message code="springSecurity.login.username.label"/>:</label>--}%
         %{--<input type='text' class='text_' name='j_username2' id='username2'/>--}%
         %{--</p>--}%

         <p>
            <label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
            <input type='password' class='text_' name='j_password' id='password'/>
         </p>

         <p>
            %{--<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>--}%
            <input type='submit' id="submit" value='sign in'/>

         </p>
         <!--  <p id="remember_me_holder"><a href = "http://dev.lawpro.ca/forgot_password.asp">Forgot your password</a></p> -->
      </form>

      <p id="remember_me_holder"><a
            href="http://dev.lawpro.ca/file_online/Online_services_faqs.asp">Forgot your password?</a></p>
   </div>
</div>
<script type='text/javascript'>
   (function () {
      document.forms['loginForm'].elements['j_username'].focus();
   })();

   $('#loginForm').on('submit', function () {
      $('#submit').prop('disabled', true);
      $("#submit").css('color', '#9f9');
      $("#submit").css('background-color', '#bbb');

//      var pw = $('#password').prop('value').toUpperCase();
//      $('#password').prop('value', pw);
//      alert(pw);


      var un = $('#username').prop('value');
      var isLper = !(/[0-9]/i.test(un));
      if (!isLper) un = un.toUpperCase();
      var expectedLen = 7
      if (un.charAt(un.length-1).match("^[A-Z]+")) expectedLen++;
      if ((un.charAt(0) != 'A' && un.length < expectedLen) && !isLper) {
         expectedLen--;
         while (un.length < expectedLen) un = '0' + un;
         un = 'A' + un;
      }
      $('#username').prop('value', un);

//      alert(un);

      var j = 0;
      var dots = ["... ", ".   ", "..  "];
      (function progressReporter () {
         j++;
         setTimeout(function () {
            var str = "loading [" + j + "]" + dots[j%3];
            $("#submit").prop('value', str);
            progressReporter();
         }, 1000)
      })();
      progressReporter();
   });

</script>
</body>
</html>
