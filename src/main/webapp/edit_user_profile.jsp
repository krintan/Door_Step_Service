
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>JSP Page</title>
        <%@include file="Header.jsp"%>



        <script>

            <%
                String email=(String)session.getAttribute("useremail");
            %>
                
             var em="<%=email%>";
            function getvendordata()

            {    
                //alert("getworkingdata");
                var xhttp = new XMLHttpRequest();

                //step 4
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Typical action to be performed when the document is ready:

                        var ans = xhttp.responseText;
                        renderAsHTML(ans);

                    }
                };

                //prepare request Step2
                xhttp.open("GET", "./getuserdata?email=" + em, true);

                //step3
                xhttp.send();


            }

           function renderAsHTML(t)
            {
               // alert("getrenderdata");
                var ans = "";
                var obj = JSON.parse(t);
                var arr = obj["ans"];
                console.log(arr);
                var obj = arr[0];

                document.getElementById("name").value = obj.username;
                document.getElementById("email").value = obj.email;
                //document.getElementById("description").value = obj.Description;
                document.getElementById("ph").value = obj.phoneno;
            }

          function user_edit_profile()
          {
              //alert("user_edit_profile working");
              var name=document.getElementById("name").value;
              var phoneno =document.getElementById("ph").value;
               var em="<%=email%>";
              
               var xhttp = new XMLHttpRequest();

                //step 4
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Typical action to be performed when the document is ready:

                        var ans = xhttp.responseText;
                        //alert(ans);

                    }
                };

                //prepare request Step2
                xhttp.open("GET", "./user_edit_profile?email="+em+"&name="+name+"&phoneno="+phoneno+"", true);

                //step3
                xhttp.send();
              
          }

        </script>

    </head>
    <body onload="getvendordata()">
<%@include file="Navbar.jsp" %><br>
        <section class="appointment" id="appointment">
         
            <div class="test_agile_info py-5">
                <div class="container py-lg-3">
                    <div class="heading text-center">
                        <i class="fas fa-cut"></i>
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase" >Edit your Profile</h3>
                    </div>
                    <div class="contact_grid_right">
                        <form action="#" method="post">
                            <div class="contact_left_grid">
                                
                                
                                
                                 <div class="form-group">
                                     <input class="form-control" type="email"  id="email" placeholder="Email" required="" readonly="">
                                </div>
                                
                                <div class="form-group">
                                    <input class="form-control" type="text"  id="name" placeholder="Username" required="">
                                </div>
                               


<!--                                <div class="form-group">
                                    <input class="form-control" type="text"  id="description" placeholder="Your description" required="">
                                </div>-->



                                <div class="form-group">
                                    <input class="form-control" type="text"  id="ph" placeholder="phone number" required="">
                                </div>



                            </div>
                            <div style="text-align: center">
                            <input class="btn btn-primary" type="button" value="Edit Profile" onclick="user_edit_profile()" style="width: 50%">
                            </div>
                    </div>
                        </form>
                    </div>
                </div>
            </div>

           
        </section>
        <%@include file="footer.jsp" %>
    </body>
</html>



