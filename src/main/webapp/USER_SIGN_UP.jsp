<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Header.jsp" %>
        <script>
            function userSignup()
            {
                 var un=document.getElementById("UserName").value;  
                 var em=document.getElementById("Email").value;  
                 var pw=document.getElementById("Password").value;  
                 var cpw=document.getElementById("ConfirmPassword").value;  
                 var f1=document.getElementById("Photo").files[0];  
                 var ph=document.getElementById("PhoneNo").value;  
                 
//                 if(pw!==cpw){
//                     alert("Passwords not matched");
//                 }
                if (un == "" || ph == "" || em == "" || pw == "" || cpw == "")
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter all the fields required !'
                    });
                } else if (ph.length != 10)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter the Phone Number Properly !'
                    });
                } else if (em.indexOf("@") == -1)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter Email in Proper Format !'
                    });
                } else if (document.getElementById("Photo").files.length[0])
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Select the display Picture !'
                    });
                } else if (pw != cpw)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Password & Confirm Passowrd must match !'
                    });
                } 
                 else
                 {
                var formdata = new FormData()
                formdata.append("un",un );
                formdata.append("em",em);
                formdata.append("pw",pw);
                formdata.append("f1",f1);
                formdata.append("ph",ph);
                
                var url = "./userSignup";
                  
                fetch(url, {method: "POST", body: formdata} )
                          .then(response => response.text())
                          .then(ans => renderAsHtml(ans) );
              }
            }
            
            function renderAsHtml(ans)
            {
                alert(ans);
                 if(ans=="success"){
                     //alert("success");
                     //window.location.href="login_form.jsp";
                     Swal.fire({
                        icon: 'success',
                        title: 'Done...',
                        text: 'login Successfull!'
                    });
                     document.getElementById("usersignup").reset();
                  }
                     
                 else
                     //alert("fail");
                         Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'FAIL !'
                    });
            } 
                 
            
        </script>
    </head>
    <body>
        <section class="appointment" id="appointment">
	<div class="test_agile_info py-5" style="height: 100vh">
		<div class="container py-lg-3">
			<div class="heading text-center">
                            <i class="fas fa-home"></i>
				<h3 class="heading mb-sm-5 mb-3 text-uppercase">User Sign Up</h3>
			</div>
			<div class="contact_grid_right">
				<form action="#" method="post" id="usersignup">
					<div class="contact_left_grid">
						<div class="form-group">
							<input class="form-control" type="text" id="UserName" placeholder="USERNAME" required="">
						</div>
						<div class="form-group">
							<input class="form-control" type="email" id="Email" placeholder="EMAIL" required="">
						</div>
						<div class="form-group">
							<input class="form-control" type="password" id="Password" placeholder="PASSWORD" required="">
						</div>
                                                <div class="form-group">
							<input class="form-control" type="password" id="ConfirmPassword" placeholder=" CONFIRM PASSWORD" required="">
						</div>
						<div class="form-group">
							<input class="form-control" type="file" id="Photo" placeholder="Choose Photo" required="">
						</div>
                                                <div class="form-group">
							<input class="form-control" type="text" id="PhoneNo" placeholder="Phone Number" required="">
						</div>
						<input class="btn btn-success" type="button" value="Sign Up" onclick="userSignup()" style="width: 100%">
					</div>
				</form>
                            <div style=" margin: 40px; text-align: center">
                             <a href="login_form.jsp"><p style="color: white"><b>Already a Customer? SignIn here!</b></p></a>
        </div>
			</div>
		</div>
	</div>
            
        
</section>
    </body>
</html>
