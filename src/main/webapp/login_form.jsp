<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
        <%@include file="Header.jsp" %>

        <script>

            function userlogin()
            {
                var email = document.getElementById("Email").value;
                var password = document.getElementById("Password").value;
                
//                alert(email);
//                alert(password);
                if (email == "" || password == "")
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter The Form Properly.Fill all details !'
                    });
                } else if (email.indexOf("@") == -1)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter Email in Proper Format !'
                    });
                }

                else{
                var formdata = new FormData();


                formdata.append("email", email);
                formdata.append("password", password);
                
                var url = "./login_form";

                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => renderAsHtml(ans));
                }
            }
            function renderAsHtml(ans)
            {
                if (ans == "success") {
                    Swal.fire({
                                icon: 'sucsess',
                                title: 'Done...',
                                text: 'Login Successfull!'
                            }).then(function () {
                                window.location = "index.jsp";
                            });
                } else {
                    //alert("fail");
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Incorrect email or password.Failed to login !'
                    });
                }
            }

        </script>

    </head>
    <body>
        <section class="appointment" id="appointment">
            <div class="test_agile_info py-5" style="height:100vh">
                <div class="container py-lg-3">
                    <div class="heading text-center">
                        <i class="fas fa-home"></i>
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase"> USER LOGIN</h3>
                    </div>
                    
                    <div class="contact_grid_right">
                        <form action="#" method="post">
                            <div class="contact_left_grid">
                                
                                <div class="form-group">
                                    <input class="form-control" type="email" id="Email" placeholder="Email" required="">
                                </div>

                                <div class="form-group">
                                    <input class="form-control" type="password" id="Password" placeholder="Password" required="">
                                </div>
                                
                                <input class="btn btn-success"   type="button" onclick="userlogin()" value="LOGIN" style="width: 100%;" >
                            </div>
                        </form>
                         <div style=" margin: 40px; text-align: center">
                             <a href="USER_SIGN_UP.jsp"><p style="color: white"><b>Don't have an account? SignUp here!</b></p></a>
        </div>
                    </div>

                </div>
            </div>
        </section>
    </body>
</html>
