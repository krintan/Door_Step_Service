
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Header.jsp" %>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script>
            function vendorSignup()
            {
                alert("working");
                var un = document.getElementById("vendorName").value;
                var em = document.getElementById("Email").value;
                var pw = document.getElementById("Password").value;
                var cpw = document.getElementById("ConfirmPassword").value;
                var f1 = document.getElementById("Photo").files[0];
                var ph = document.getElementById("ph").value;
                var serv = document.getElementById("chooseservice").value;
                var subserv = document.getElementById("choosesubservice").value;
                var desc = document.getElementById("desc").value;
                var add = document.getElementById("add").value;
                var st = document.getElementById("st").value;
                var et = document.getElementById("et").value;
                var sa = document.getElementById("sa").value;
                var lo = document.getElementById("lo").value;
                var la = document.getElementById("la").value;

//                if (pw !== cpw) {
//                    alert("Passwords not matched");
//                } 
if (un == "" || ph == "" || em == "" || pw == "" || cpw == "" || f1 == "" || serv == "" || subserv == "" || desc == "" || add == "" || st == "" || et == "" || sa == "" || la == "" || lo == "")
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter The Form Properly !'
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
                        text: 'Select the Display Picture !'
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
                    formdata.append("un", un);
                    formdata.append("em", em);
                    formdata.append("pw", pw);
                    formdata.append("f1", f1);
                    formdata.append("ph", ph);
                    formdata.append("serv", serv);
                    formdata.append("subserv", subserv);
                    formdata.append("desc", desc);
                    formdata.append("add", add);
                    formdata.append("st", st);
                    formdata.append("et", et);
                    formdata.append("sa", sa);
                    formdata.append("lo", lo);
                    formdata.append("la", la);

                    var url = "./vendor_sign_up";

                    fetch(url, {method: "POST", body: formdata})
                            .then(response => response.text())
                            .then(ans => renderAsHtml(ans));
                }
            }

            function renderAsHtml(ans)
            {
                if (ans == "success") {
                   // alert("success");
                    //window.location.href = "vendor_login_form.jsp";
                    Swal.fire({
                        icon: 'success',
                        title: 'Done...',
                        text: ' Success!'
                    });
                    document.getElementById("vendorsignup").reset();
                } else
                    alert(ans);


            }


            function loginservice()
            {
                //1. Make object of XMLHttpRequest
                var xhttp = new XMLHttpRequest();

                //4. Receive XMLHttpResponse from server & use ans

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var res = this.responseText;
                        alert(res);
                        res = res.trim();
                        var mainobj = JSON.parse(res);
                        var arr = mainobj["ans"];

                        var ans = "";
//                        ans = ans + "<button type=\"button\" class=\"btn btn-primary dropdown-toggle\" id=\"servicebutton\" data-bs-toggle=\"dropdown\"> Enter Service you want to provide: ";
//                        ans = ans + "</button>";

                        ans = ans + "<select id=\"chooseservice\" onchange=\"loginsubservice(this.value)\" style=\"width: 100%;\" >  ";
                        ans = ans + "<option value=\"\" >Choose Your Service</option><br>";
                        for (var i = 0; i < arr.length; i++)
                        {
                            var st = arr[i];
                            ans = ans + "<option value=\'" + st.id + "\' >" + st.servicename + "</option><br>";
                        }
                        ans = ans + "</select>";
                        document.getElementById("services").innerHTML = ans;
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("GET", "./login_service_servlet", true);

                //3. Send Request
                xhttp.send();
                        }

            function loginsubservice(serviceid)
            {
                //1. Make object of XMLHttpRequest
                var xhttp = new XMLHttpRequest();

                //4. Receive XMLHttpResponse from server & use ans

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {

                        var res = this.responseText;
                        alert(res);
                        res = res.trim();
                        var mainobj = JSON.parse(res);
                        var arr = mainobj["ans"];

                        var ans = "";

//                        ans = ans + "<button type=\"button\" class=\"btn btn-primary dropdown-toggle\" id=\"servicebutton\" data-bs-toggle=\"dropdown\"> Its Subservices: ";
//                        ans = ans + "</button>";

//                        ans = ans + "<lable style=\"font-size: 25px;\" ></lable><br>";
                        ans = ans + "<select id=\"choosesubservice\" style=\"width: 100%;\" >";
                        ans = ans + "<option value=\"\" >Choose your SubService</option><br>";
                        for (var i = 0; i < arr.length; i++)
                        {
                            var st = arr[i];
                            ans = ans + "<option value=\'" + st.subservicename + "\' >" + st.subservicename + "</option><br>";
                        }
                        ans = ans + "</select>";
                        document.getElementById("loginsubservice").innerHTML = ans;
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("GET", "./login_subservice_servlet?serviceid=" + serviceid, true);

                //3. Send Request
                xhttp.send();
                        }


        </script>
    </head>
    <body onload="loginservice()">
        <section class="appointment" id="appointment">
            <div class="test_agile_info py-5" style="height:130vh">
                <div class="container py-lg-3" style="height:130vh">
                    <div class="heading text-center">
                        <i class="fas fa-home"></i>
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase">Vendor Sign Up</h3>
                    </div>
                    <div class="contact_grid_right">
                        <form action="#" method="post" id="vendorsignup">
                            <div class="contact_left_grid">
                                <div class="form-group">
                                    <input class="form-control" type="text" id="vendorName" placeholder="VENDORNAME" required="">
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

                                <div class="row" style="text-align: center">
                                    <div class="col-sm-6">
                                        <div class="dropdown" id="services">
                                            <button class="btn btn-info btn-sm dropdown-toggle" type="button" data-toggle="dropdown">SERVICES
                                                <!--
                                                <span class="caret"></span></button>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">HTML</a></li>
                                                <li><a href="#">CSS</a></li>
                                                <li><a href="#">JavaScript</a></li>
                                            </ul>
                                                -->
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="dropdown" id="loginsubservice">
                                            <button class="btn btn-info btn-sm dropdown-toggle" type="button" data-toggle="dropdown">SUB-SERVICES
                                                <!--
                                                <span class="caret"></span></button>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">HTML</a></li>
                                                <li><a href="#">CSS</a></li>
                                                <li><a href="#">JavaScript</a></li>
                                                  </ul>-->
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="form-group">
                                    <input class="form-control" type="text" id="desc" placeholder="Description" required="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="text" id="add" placeholder="address" required="">
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <input class="form-control" type="text" id="st" placeholder="START_TIME" required="">
                                        </div>
                                        <div class="col-sm-6">
                                            <input class="form-control" type="text" id="et" placeholder="END_TIME" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="text" id="sa" placeholder="SLOT_AMOUNT" required="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="text" id="ph" placeholder="PHONE NUMBER" required="">
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <input class="form-control" type="text" id="la" placeholder="LATITUDE" required="">
                                        </div>
                                        <div>
                                            <input class="form-control" type="text" id="lo" placeholder="LONGITUDE" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="file" id="Photo" placeholder="Choose Photo" required="">
                                </div>

                                <input class="btn btn-success" type="button" value="Sign Up" onclick="vendorSignup()" style="width: 100%">
<!--                                <div style=" margin: 40px; text-align: center">
                             <a href="login.jsp"><p style="color: white"><b>Already a Customer? SignIn here!</b></p></a>
        </div>-->
                            </div>
<!--                            <div style=" margin: 40px; text-align: center">
                             <a href="login.jsp"><p style="color: white"><b>Already a Customer? SignIn here!</b></p></a>
        </div>-->
                        </form>
                        <div style=" margin: 40px; text-align: center">
                             <a href="vendor_login_form.jsp"><p style="color: white"><b>Already a Customer? SignIn here!</b></p></a>
        </div>
 
<!--                        <div style=" margin: 40px; text-align: center">
                             <a href="vendor_login_form.jsp"><p style="color: white"><b>Already Registered? SignIn here!</b></p></a>
        </div>-->
                    </div>
                </div>
            </div>

       </section>

        
    </body>
<%@include file="footer.jsp" %>
</html>
