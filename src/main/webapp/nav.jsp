<head>
    <script src="bootstrap-5.3.0-alpha1-dist/bootstrap-5.3.0-alpha1-dist/js/bootstrap.bundle.js" type="text/javascript"></script>
    <style>
        /* Add a red background color to navbar links on hover */
.nav-link:hover, .dropdown-menu:hover .dropdown-item {
  background-color: blacktext;
}
    </style>
</head>
<header>

    <div class="top-bar_sub container-fluid" >
        <div class="top-forms text-left mt-3">
            <!--/nav-->
            <div class="header_top" >
                <nav class="navbar navbar-expand-lg navbar-light bg-light" >
                    <button class="navbar-toggler navbar-toggler-right mx-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas-fa-home"></i> <span class="navbar-toggler-icon"> Convenience Pouch</span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mx-auto">

                            <%
                                   String useremail=(String)session.getAttribute("useremail");
                                   if(useremail != null){
                                                        
                            %>


                            <li class="nav-item">
                                <a class="nav-link scroll" href="#about">Welcome <%=useremail%></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="edit_user_profile.jsp">Edit User Profile</a>
                            </li>
                             <li class="nav-item">
                                <a class="nav-link" href="user_Change_Password.jsp">Change Password</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="user_view_bookings.jsp">View Bookings</a>
                            </li>
                            
                            <li class="nav-item">
                                <a class="nav-link" href="user_logout.jsp">Logout</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#services">Services</a>
                            </li>
                           

                            <%
                                }
                            else{
                            %>

                            <li class="nav-item dropdown ">

                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">User</a>

                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="USER_SIGN_UP.jsp">UserSignup</a></li>
                                    <li><a class="dropdown-item" href="login_form.jsp">UserLogin</a></li>

                                </ul>

                            </li>
                            <!--                            <div class="dropdown" >
                                                            <button class="btn btn-info btn-sm dropdown-toggle" type="button" data-toggle="dropdown">Person
                            
                                                                <span class="caret"></span></button>
                                                            <ul class="dropdown-menu">
                                                                <li><a href="#">USER</a></li>
                                                                <li><a href="#">VENDOR</a></li>
                                                                
                                                            </ul>
                            
                                                        </div>-->



<!--                            <li class="nav-item active">
                                <a class="nav-link" href="login_form.jsp">UserLogin
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>

                            <li class="nav-item active">
                                <a class="nav-link" href="USER_SIGN_UP.jsp">UserSignUp
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>-->


<li class="nav-item dropdown">

                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Vendor</a>

                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="vendor_sign_up.jsp">VendorSignup</a></li>
                                    <li><a class="dropdown-item" href="vendor_login_form.jsp">VendorLogin</a></li>

                                </ul>

                            </li>
                            
                            
                            
                            <li class="nav-item dropdown">

                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Admin</a>

                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="admin_login.jsp">AdminLogin</a></li>
                                    

                                </ul>

                            </li>

                            <li class="nav-item">
                                <a class="nav-link scroll" href="#about">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link scroll" href="#services">Services</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link scroll" href="#team">Team</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link scroll" href="#testimonials">Testimonials</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link scroll" href="#pricing">Pricing</a>
                            </li>
<!--                            <li class="nav-item">
                                <a class="nav-link scroll" href="#appointment">Appointment</a>
                            </li>-->
                            <li class="nav-item">
                                <a class="nav-link scroll" href="#contact">Contact</a>
                            </li>
                            
                            

                            <%
                                }
                            %>

                        </ul>
                    </div>
                            
                </nav>
            </div>
            <!--//nav-->
        </div>
        <div class="logo text-center">
            <a class="navbar-brand" href="index.html">
                <i class="fas fa-home"></i> Convenience Pouch <span> Quality, Speed and Value</span></a> 
        </div>
    </div>
</header>