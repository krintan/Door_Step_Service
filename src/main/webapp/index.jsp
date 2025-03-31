<!--
        Author: W3layouts
        Author URL: http://w3layouts.com
        License: Creative Commons Attribution 3.0 Unported
        License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Barber Beauty Category Flat Bootstrap Responsive Website Template | Home :: W3layouts</title>

        <!--	 Meta tag Keywords 
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <meta charset="utf-8">
                <meta name="keywords" content="Barber Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
                Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
                <script type="application/x-javascript">
                        addEventListener("load", function () {
                                setTimeout(hideURLbar, 0);
                        }, false);
        
                        function hideURLbar() {
                                window.scrollTo(0, 1);
                        }
                </script>
                // Meta tag Keywords 
                
                 Date picker css file  
                <link rel="stylesheet" href="css/jquery-ui.css" />
                 //Date picker css file  
                
                 responsive tabs  for pricing section 
                <link href="css/easy-responsive-tabs.css" rel='stylesheet' type='text/css' />
                 responsive tabs 
                
                 css files 
                <link rel="stylesheet" href="css/bootstrap.css">  Bootstrap-Core-CSS 
                <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />  Style-CSS  
                <link rel="stylesheet" href="css/fontawesome-all.css">  Font-Awesome-Icons-CSS 
                 //css files 
                
                 web-fonts 
                <link href="//fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=devanagari,latin-ext" rel="stylesheet">
                 //web-fonts 
        -->
        <%
               String email2 = (String) session.getAttribute("useremail");
        %>
        <script>
            var em = "<%=email2%>";
            function userShowService()
            {
//                var url = "/userShowService";
//                fetch(url)
//                          .then(response => response.text())
//                          .then(ans => renderAHtml(ans) );
//                  
//            }
//
//            function renderAHtml(ans) {
//                console.log(ans);
//                      alert("rendering");
//              
//            }

                //  var rn=document.getElementById("rn").value;
                //fetch data from server
                //step 1
                var xhttp = new XMLHttpRequest();

                //step 4
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Typical action to be performed when the document is ready:

                        var ans = xhttp.responseText;
                        //  alert(ans);
                        renderAsHTML(ans);

                    }
                };

                //prepare request Step2
                xhttp.open("GET", "./userShowService", true);

                //step3
                xhttp.send();
            }

            function renderAsHTML(t) {
                

                var obj = JSON.parse(t);
                var arr = obj.ans;
                var count = 0;
                var flag = true;
                var res = "";
                for (var i = 0; i < arr.length; i++)
                {
                    var idx = i % 6 + 1;
                    var st = arr[i];
                    if (idx === 1 || idx === 2 || idx === 3 || idx === 7 || idx === 9)
                    {

                        res += "<div class=\"col-lg-2 col-sm-6 col-12 serviceimage1\" style=\"background: url('" + st.photo + "')\"background-size: cover, position: relative, background: no-repeat center;" + idx + "" + "\"> </div>";
                        res += "<div class=\"col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext\">";
                        res += "<h4 style=\"text-align: center\">" + st.servicename + "</h4>";
                        res += "<p class=\"my-3\" >" + st.desc + "</p>";
                        //res+= "<a class=\"bt text-capitalize\" href=\"userShowAllSubServices.jsp?serviceid=" + st.id + "&servicename=" + arr[i].servicename +"\""+ "role=\"button\"> read more <i class=\"fas fa-home\"></i></a>";
                        res += "<a onMouseOver=\"this.style.color='white'\" onMouseOut=\"this.style.color='CYAN'\" style=\"color:#00FFFF\" class=\"bt text-capitalize \" onclick=\"check('" + st.id + "','" + st.servicename + "')\" role=\"button\"> read more <i class=\"fas fa-home\"></i></a>";
                        res += "</div>";

                    } else
                    {
                        res += "<div class=\"col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext\">";
                        res += "<h4>" + st.servicename + "</h4>";
                        res += "<p class=\"my-3\">" + st.desc + "</p>";
                        //res+= "<a class=\"bt text-capitalize\" href=\"userShowAllSubServices.jsp?serviceid=" + st.id + "&servicename=" + arr[i].servicename +"\""+ "role=\"button\"> read more <i class=\"fas fa-home\"></i></a>";
                        res += "<a onMouseOver=\"this.style.color='white'\" onMouseOut=\"this.style.color='CYAN'\" style=\"color:#00FFFF\" class=\"bt text-capitalize \" onclick=\"check('" + st.id + "','" + st.servicename + "')\" role=\"button\"> read more <i class=\"fas fa-home\"></i></a>";
                        res += "</div>";

                        res += "<div class=\"col-lg-2 col-sm-6 col-12 serviceimage1\" style=\"background: url('" + st.photo + "')\"" + idx + "" + "\"> </div>";
                    }


                }

                document.getElementById("servicesRendered").innerHTML = res;

            ������������}
            function check(id, servicename)
            {
               // alert(id);
               // alert(servicename);
                if (em != "null") {
                    window.location.href = "userShowAllSubServices.jsp?serviceid=" + id + "&servicename=" + servicename;
                } else {
                    window.location.href = "login_form.jsp";
                }
            }


    ����</script>



        <%@include file="Header.jsp" %>
    </head>

    <body onload="userShowService()">

        <!--/header-->
        <!--	<header>
                <div class="top-bar_sub container-fluid">
                        <div class="top-forms text-left mt-3">
                                /nav
                                <div class="header_top">
                                        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                                                <button class="navbar-toggler navbar-toggler-right mx-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                                        <span class="navbar-toggler-icon"></span>
                                                </button>
        
                                                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                                        <ul class="navbar-nav mx-auto">
                                                                <li class="nav-item active">
                                                                        <a class="nav-link" href="index.html">Home
                                                                                <span class="sr-only">(current)</span>
                                                                        </a>
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
                                                                <li class="nav-item">
                                                                        <a class="nav-link scroll" href="#appointment">Appointment</a>
                                                                </li>
                                                                <li class="nav-item">
                                                                        <a class="nav-link scroll" href="#contact">Contact</a>
                                                                </li>
        
                                                        </ul>
                                                </div>
                                                
                                        </nav>
                                </div>
                                //nav
                        </div>
                        <div class="logo text-center">
                                <a class="navbar-brand" href="index.html">
                                        <i class="fas fa-cut"></i> Barber <span> Best Hair Salon</span></a> 
                        </div>
                </div>
        </header>-->
        <%@include file="nav.jsp" %>

        <!-- banner -->
        <section class="banner" id="home">
            <div class="callbacks_container">
                <ul class="rslides" id="slider3">
                    <li>
                        <div class="slider-info bg1">
                            <div class="bs-slider-overlay">
                                <div class="banner-text container">
                                    <h5 class="tag text-left mb-3 text-uppercase">We are professional </h5>
                                    <h1 class="movetxt text-left agile-title text-uppercase">The Best Place For </h1>
                                    <h2 class="movetxt text-left mb-3 agile-title text-uppercase">Hair Salon </h2>							
                                    <a class="bt mt-4 text-capitalize scroll" href="#services" role="button"> read more
                                        <i class="fas fa-home"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="slider-info bg2">
                            <div class="bs-slider-overlay">
                                <div class="banner-text container">
                                    <h5 class="tag text-left mb-3 text-uppercase">We are unique</h5>
                                    <h4 class="movetxt text-left agile-title text-uppercase">Your House Cleaning </h4>
                                    <h4 class="movetxt text-left mb-3 agile-title text-uppercase">Our Duty </h4>
                                    <a class="bt mt-4 text-capitalize scroll" href="#services" role="button"> read more
                                        <i class="fas fa-home"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="slider-info bg3">
                            <div class="bs-slider-overlay">
                                <div class="banner-text container">
                                    <h5 class="tag text-left mb-3 text-uppercase">We repair your furniture</h5>
                                    <h4 class="movetxt text-left agile-title text-uppercase">We Give Your Furniture </h4>
                                    <h4 class="movetxt text-left mb-3 agile-title text-uppercase">A Perfect Look </h4>

                                    <a class="bt mt-4 text-capitalize scroll" href="#services" role="button"> read more
                                        <i class="fas fa-home"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="slider-info bg4">
                            <div class="bs-slider-overlay">
                                <div class="banner-text container">
                                    <h5 class="tag text-left mb-3 text-uppercase">We are your electrical doctor</h5>
                                    <h4 class="movetxt text-left agile-title text-uppercase">Your Safety </h4>
                                    <h4 class="movetxt text-left mb-3 agile-title text-uppercase">Is Our Top Priority </h4>
                                    <a class="bt mt-4 text-capitalize scroll" href="#services" role="button"> read more
                                        <i class="fas fa-home"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
        <!--�//banner�-->


        <!-- About -->
        <section class="about py-5" id="about">
            <div class="container py-lg-3 py-2">
                <div class="heading text-center">
                    <i class="fas fa-home"></i>
                    <h3 class="heading mb-sm-5 mb-3 text-uppercase">About us</h3>
                </div>
                <div class="row about-grids">
                    <div class="col-lg-4 about-grid1 mb-lg-0 mb-5" >
                        <h3 class="text-uppercase" >Welcome to </h3>
                        <p class="my-lg-4 my-3">Our technology platform which offers a variety of services at home. Customers use our platform to book services such as beauty treatments, haircuts, massage therapy, cleaning, plumbing, carpentry, appliance repair, etc. These services are delivered in the comfort of their home and at a time of their choosing. We promise our customers a high quality, standardised and reliable service experience.</p>
                        <!--				<a class="bt text-capitalize" href="#services" role="button"> read more
                                                                <i class="fas fa-home"></i>
                                                        </a>-->
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="about-grid2 p-5">
                            <h3 style='text-align: center'>We are Expert in </h3>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="about-grid3 p-5">
                            <h3 style='text-align: center'>Home Service's</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--�//About�-->


        <!-- services -->
        <section class="services py-5" id="services">
            <div class="container-fluid">
                <div class="heading text-center">
                    <i class="fas fa-home"></i>
                    <h3 class="heading mb-sm-2 text-uppercase">What We Do</h3>
                    <h3 class="heading mb-sm-5 mb-3 text-uppercase bg-primary">OUR SERVICES</h3>
                </div>
                <div  id="servicesRendered" class="row service-grids">

                    <!--			<div class="col-lg-2 col-sm-6 col-12 serviceimage1">
                                                    
                                            </div>
                                            <div class="col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext">
                                                    <h4>Classic Hair cut</h4>
                                                    <p class="my-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero.</p>
                                                    <a class="bt text-capitalize" href="#" role="button"> read more
                                                            <i class="fas fa-cut"></i>
                                                    </a>
                                            </div>-->

                    <!--			<div class="col-lg-2 col-sm-6 col-12 serviceimage2">
                                                    
                                            </div>
                                            <div class="col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext">
                                                    <h4>Beard Waxing</h4>
                                                    <p class="my-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero.</p>
                                                    <a class="bt text-capitalize" href="#" role="button"> read more
                                                            <i class="fas fa-cut"></i>
                                                    </a>
                                            </div>
                                            <div class="col-lg-2 col-sm-6 col-12 serviceimage3">
                                                    
                                            </div>
                                            <div class="col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext">
                                                    <h4>Hair Coloring</h4>
                                                    <p class="my-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero.</p>
                                                    <a class="bt text-capitalize" href="#" role="button"> read more
                                                            <i class="fas fa-cut"></i>
                                                    </a>
                                            </div>
                                            <div class="col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext">
                                                    <h4>Straightening</h4>
                                                    <p class="my-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero.</p>
                                                    <a class="bt text-capitalize" href="#" role="button"> read more
                                                            <i class="fas fa-cut"></i>
                                                    </a>
                                            </div>
                                            <div class="col-lg-2 col-sm-6 col-12 serviceimage3">
                                                    
                                            </div>
                                            <div class="col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext">
                                                    <h4>Beard Trim</h4>
                                                    <p class="my-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero.</p>
                                                    <a class="bt text-capitalize" href="#" role="button"> read more
                                                            <i class="fas fa-cut"></i>
                                                    </a>
                                            </div>
                                            <div class="col-lg-2 col-sm-6 col-12 serviceimage1">
                                                    
                                            </div>
                                            <div class="col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext">
                                                    <h4>Clean Shave</h4>
                                                    <p class="my-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero.</p>
                                                    <a class="bt text-capitalize" href="#" role="button"> read more
                                                            <i class="fas fa-cut"></i>
                                                    </a>
                                            </div>-->
                    <!--			<div class="col-lg-2 col-sm-6 col-12 serviceimage2">
                                                    
                                            </div>-->
                </div>
            </div>
        </section>
        <!-- //services -->

        <!-- Team -->
        <section class="barbers py-5" id="team">
            <div class="container py-lg-3 py-2">
                <div class="heading text-center">
                    <i class="fas fa-home"></i>
                    <h3 class="heading mb-sm-5 mb-3 text-uppercase">Top Vendors</h3>
                </div>
                <div class="row barber-grids">
                    <div class="col-lg-3 col-sm-6 mb-lg-0 mb-5 text-center">
                        <div class="barber-grid1">
                            <img src="images/barber1.jpg" class="img-fluid" alt=""/>
                        </div>
                        <h4 class="mt-3">David</h4>
                        <p>Barber</p>
                        <div class="heading text-center">
                            <i class="fas fa-cut"></i><br>
                            <span class="heading">User Rating</span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star"></span>
                            <!--                            User Rating <span class="fa fa-star"></span>-->
                        </div>


                        <!--				<div class="social mt-2">
                                                                <ul class="d-flex justify-content-center">
                                                                        <li class="mr-1"><a href="#"><span class="fab fa-facebook-f"></span></a></li>
                                                                        <li class="mr-1"><a href="#"><span class="fab fa-twitter"></span></a></li>
                                                                        <li class=""><a href="#"><span class="fab fa-linkedin-in"></span></a></li>
                                                                </ul>
                                                        </div>-->
                    </div>
                    <div class="col-lg-3 col-sm-6 mb-lg-0 mb-5 text-center">
                        <div class="barber-grid1">
                            <img src="images/barber2.jpg" class="img-fluid" alt=""/>
                        </div>
                        <h4 class="mt-3">James</h4>
                        <p>Carpenter</p>
                        <div class="heading text-center">
                            <i class="fas fa-wrench"></i><br>
                            <span class="heading">User Rating</span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star"></span>
                        </div>
                        <!--				<div class="social mt-2">
                                                                <ul class="d-flex justify-content-center">
                                                                        <li class="mr-1"><a href="#"><span class="fab fa-facebook-f"></span></a></li>
                                                                        <li class="mr-1"><a href="#"><span class="fab fa-twitter"></span></a></li>
                                                                        <li class=""><a href="#"><span class="fab fa-linkedin-in"></span></a></li>
                                                                </ul>
                                                        </div>-->
                    </div>
                    <div class="col-lg-3 col-sm-6 mb-md-0 mb-5 text-center">
                        <div class="barber-grid1">
                            <img src="images/barber3.jpg" class="img-fluid" alt=""/>
                        </div>
                        <h4 class="mt-3">Robert</h4>
                        <p>Therapist</p>
                        <div class="heading text-center">
                            <i class="fas fa-user-md"></i><br>
                            <span class="heading">User Rating</span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star"></span>
                        </div>
                        <!--				<div class="social mt-2">
                                                                <ul class="d-flex justify-content-center">
                                                                        <li class="mr-1"><a href="#"><span class="fab fa-facebook-f"></span></a></li>
                                                                        <li class="mr-1"><a href="#"><span class="fab fa-twitter"></span></a></li>
                                                                        <li class=""><a href="#"><span class="fab fa-linkedin-in"></span></a></li>
                                                                </ul>
                                                        </div>-->
                    </div>
                    <div class="col-lg-3 col-sm-6 text-center">
                        <div class="barber-grid1">
                            <img src="images/barber4.jpg" class="img-fluid" alt=""/>
                        </div>
                        <h4 class="mt-3">Charles</h4>
                        <p>Electrician</p>
                        <div class="heading text-center">
                            <i class="fas fa-tv"></i><br>
                            <span class="heading">User Rating</span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star"></span>
                        </div>
                        <!--				<div class="social mt-2">
                                                                <ul class="d-flex justify-content-center">
                                                                        <li class="mr-1"><a href="#"><span class="fab fa-facebook-f"></span></a></li>
                                                                        <li class="mr-1"><a href="#"><span class="fab fa-twitter"></span></a></li>
                                                                        <li class=""><a href="#"><span class="fab fa-linkedin-in"></span></a></li>
                                                                </ul>
                                                        </div>-->
                    </div>
                </div>
            </div>
        </section>
        <!-- //Team -->

        <!-- testimonials -->
        <div class="testimonials" id="testimonials">
            <div class="test_agile_info py-5">
                <div class="container py-lg-3">
                    <div class="heading text-center">
                        <i class="fas fa-cut"></i>
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase">Customers Words</h3>
                    </div>
                    <ul id="flexiselDemo1">			
                        <li>
                            <div class="wthree_testimonials_grid_main">
                                <div class="wthree_testimonials_grid">
                                    <p>Great haircuts, fantastic mani and pedi services, love the atmosphere.Pricing is more than reasonable.Highly recommend!</p>
                                    <h5>Mark Henry</h5>
                                    <div class="wthree_testimonials_grid_pos">
                                        <img src="images/t1.jpg" alt=" " class="img-responsive" />
                                    </div>
                                </div>

                            </div>
                        </li>
                        <li>
                            <div class="wthree_testimonials_grid_main">
                                <div class="wthree_testimonials_grid">
                                    <p>Research shows that the effectiveness of therapy hinges on the relationship between therapist and patient.Great therapist and felt continually nurtured. Therapeutic listening and reflection throughout the session show caring and connection.</p>
                                    <h5>Linda Carl</h5>
                                    <div class="wthree_testimonials_grid_pos">
                                        <img src="images/t2.jpg" alt=" " class="img-responsive" />
                                    </div>
                                </div>

                            </div>
                        </li>
                        <li>
                            <div class="wthree_testimonials_grid_main">
                                <div class="wthree_testimonials_grid">
                                    <p>Solid understanding of water distribution and disposal systems.Friendly with a great deal of patience.Appreciable work!!</p>
                                    <h5>Michael Paul</h5>
                                    <div class="wthree_testimonials_grid_pos">
                                        <img src="images/t3.jpg" alt=" " class="img-responsive" />
                                    </div>
                                </div>

                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- //testimonials -->

        <!-- pricing -->
        <section class="py-5" id="pricing">
            <div class="container">
                <div class="heading text-center">
                    <i class="fas fa-home"></i>
                    <h3 class="heading mb-sm-5 mb-3 text-uppercase">Our Pricing</h3>
                </div>
                <!--/tabs-->
                <div class="responsive_tabs">
                    <div id="horizontalTab">
                        <ul class="resp-tabs-list">
                            <li>Salon</li>
                            <li>Therapy</li>
                            <li>Cleaning</li>
                            <li>Repairs</li>
                        </ul>
                        <div class="resp-tabs-container">
                            <!--/tab_one-->
                            <div class="tab1">
                                <div class="tab-info">
                                    <div class="row tab-grids">
                                        <div class="col-md-6">
                                            <h3>Women Hair Cut <span class="price"> <span>&#8377;</span>300</span></h3>
                                            <p class="mt-3">Women get a haircut to achieve a better appearance that they are comfortable with keeping hair healthy.</p>
                                        </div>
                                        <div class="col-md-6 mt-md-0 mt-3">
                                            <h3>Beard/Shave <span class="price"> <span>&#8377;</span>200</span></h3>
                                            <p class="mt-3">Carefully curating your beard with regular trimming and cutting will ensure that your beard looks full and healthy.</p>
                                        </div>
                                        <div class="col-md-6 mt-md-5 mt-3">
                                            <h3>Facials <span class="price"> <span>&#8377;</span>500</span></h3>
                                            <p class="mt-3">A facial is a skin care treatments for the face, including steam, extraction, peels, and massage.</p>
                                        </div>
                                        <div class="col-md-6 mt-md-5 mt-3">
                                            <h3>Men Hair Cut <span class="price"> <span>&#8377;</span>200</span></h3>
                                            <p class="mt-3">Men get a haircut to achieve a better appearance and new style that they are comfortable with keeping hair healthy.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--//tab_one-->
                            <!--/tab_two-->
                            <div class="tab2">

                                <div class="tab-info">
                                    <div class="row tab-grids">
                                        <div class="col-md-6">
                                            <h3>Body Massage<span class="price"> <span>&#8377;</span>800</span></h3>
                                            <p class="mt-3">It includes stress, pain relief and beauty retreat services with Body massage.</p>
                                        </div>
                                        <div class="col-md-6 mt-md-0 mt-3">
                                            <h3>Head Massage <span class="price"> <span>&#8377;</span>500</span></h3>
                                            <p class="mt-3">It includes relief and beauty retreat services with Head & Shoulder massage.</p>
                                        </div>
                                        <div class="col-md-6 mt-md-5 mt-3">
                                            <h3>Foot Massage <span class="price"> <span>&#8377;</span>600</span></h3>
                                            <p class="mt-3">It includes stress, pain relief and beauty retreat services with Foot massage.</p>
                                        </div>
                                        <div class="col-md-6 mt-md-5 mt-3">
                                            <h3>Face Massage <span class="price"> <span>&#8377;</span>500</span></h3>
                                            <p class="mt-3">It includes stress, pain relief and beauty retreat services with Face massage.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--//tab_two-->
                            <!--/tab_three-->
                            <div class="tab3">

                                <div class="tab-info">
                                    <div class="row tab-grids">
                                        <div class="col-md-6">
                                            <h3>Sanitization<span class="price"><span>&#8377;</span>500</span></h3>
                                            <p class="mt-3">Maintain cleanliness of restrooms, kitchen, and break rooms and sanitize all work areas.</p>
                                        </div>
                                        <div class="col-md-6 mt-md-0 mt-3">
                                            <h3>Intense Cleaning <span class="price"> <span>&#8377;</span>800</span></h3>
                                            <p class="mt-3">Cleaner cleans the hard surfaces in a bathroom, such as tiles, drainage pipes, deep cleansing of tubs.</p>
                                        </div>
                                        <div class="col-md-6 mt-md-5 mt-3">
                                            <h3>Basic Cleaning<span class="price"> <span>&#8377;</span>500</span></h3>
                                            <p class="mt-3">It includes dusting, mopping, sweeping, vacuuming, and cleaning smudges off windows and doors.</p>
                                        </div>
                                        <div class="col-md-6 mt-md-5 mt-3">
                                            <h3>Sofa & Carpet <span class="price"> <span>&#8377;</span>600</span></h3>
                                            <p class="mt-3">It is performed to remove stains, dirt, and allergens from carpets by dry-cleaning, and vacuuming.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--//tab_three-->
                            <!--/tab_four-->
                            <div class="tab4">

                                <div class="tab-info">
                                    <div class="row tab-grids">
                                        <div class="col-md-6">
                                            <h3>Toilet & Drainage<span class="price"> <span>&#8377;</span>400</span></h3>
                                            <p class="mt-3">Installation and replacement of one connection hose to connect inlet and outlet of pipe.</p>
                                        </div>
                                        <div class="col-md-6 mt-md-0 mt-3">
                                            <h3>Wooden Repairs <span class="price"> <span>&#8377;</span>500</span></h3>
                                            <p class="mt-3">Carpentry is a skilled trade and a craft that can be acquired through apprenticeship training and practise.</p>
                                        </div>
                                        <div class="col-md-6 mt-md-5 mt-3">
                                            <h3>Electric Repairs<span class="price"> <span>&#8377;</span>500</span></h3>
                                            <p class="mt-3">Installs and repairs wiring and fixtures in buildings & conduits and pipes to house electrical wires and cables.</p>
                                        </div>
                                        <div class="col-md-6 mt-md-5 mt-3">
                                            <h3> Leakage Repair <span class="price"> <span>&#8377;</span>300</span></h3>
                                            <p class="mt-3">Repair includes drill and taps, adjusting, packing, bonnets, flanges, thread leaks and connectors.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--//tab_four-->
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </div>
                <!--//tabs-->
                <div class="clearfix"> </div>
            </div>
        </section>
        <!--�//pricing�-->


        <!-- contact map and address -->
        <section class="contact py-5" id="contact">
            <div class="container">
                <div class="heading text-center">
                    <i class="fas fa-cut"></i>
                    <h3 class="heading mb-sm-5 mb-3 text-uppercase">Locate Us</h3>
                </div>
                <div class="contact-main-grid">
                    <div class="contact-map">
                      <!--  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d83998.94722638946!2d2.277020320550042!3d48.85883773941345!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e66e1f06e2b70f%3A0x40b82c3688c9460!2sParis%2C+France!5e0!3m2!1sen!2sin!4v1524720355592"></iframe>  -->
                    <img src="https://www.mapsofindia.com/maps/punjab/amritsar-map.jpg" width="800" alt="Amritsar Map">
                    </div>
                    <div class="contact-info">
                        <div class="mb-5">
                            <h4 class="mb-3">Address</h4>
                            <p><span class="fas fa-map mr-2"></span>Amritsar, The Holy City, PUNJAB</p>
                            <p>INDIA</p>
                            <p><span class="fas fa-phone mr-2"></span> +919872874365</p>
                            <p><span class="fas fa-envelope mr-2"></span> <a href="mailto:name@example.com"> tanima@gmail.com</a> </p>
                        </div>
                        <div class="">
                            <h4 class="mb-3">Opening Hours</h4>
                            <p><span class="fas fa-clock mr-2"></span> Monday to Friday : 9am - 6pm</p>
                            <p><span class="fas fa-clock mr-2"></span> Saturday and Sunday : 10am - 4pm</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- contact map and address -->

        <!-- Appointment -->
        <!--<section class="appointment" id="appointment">
                <div class="test_agile_info py-5">
                        <div class="container py-lg-3">
                                <div class="heading text-center">
                                        <i class="fas fa-cut"></i>
                                        <h3 class="heading mb-sm-5 mb-3 text-uppercase">Make an Appointment</h3>
                                </div>
                                <div class="contact_grid_right">
                                        <form action="#" method="post">
                                                <div class="contact_left_grid">
                                                        <div class="form-group">
                                                                <input class="form-control" type="text" name="Name" placeholder="Your Name" required="">
                                                        </div>
                                                        <div class="form-group">
                                                                <input class="form-control" type="email" name="Email" placeholder="Your Email" required="">
                                                        </div>
                                                        <div class="form-group">
                                                                <input class="form-control" type="text" name="phone" placeholder="Phone Number" required="">
                                                        </div>
                                                        <div class="form-group">
                                                                <input id="datepicker" name="Text" type="text" placeholder="Date Of Appointment" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'mm/dd/yyyy';}" required="">
                                                        </div>
                                                        <div class="form-group">
                                                                <textarea id="textarea" placeholder="Your Message Here"></textarea>
                                                        </div>
                                                        <input class="form-control" type="submit" value="Make An Appointment">
                                                </div>
                                        </form>
                                </div>
                        </div>
                </div>
        </section>-->
        <!-- //Appointment -->

        <!-- footer section -->
        <!--
        <section class="newsletter text-center py-5">
                <div class="container py-lg-3">
                        <div class="logo mb-5 text-center">
                                <a class="navbar-brand" href="index.html">
                                        <i class="fas fa-cut"></i> Barber <span> Best Hair Salon</span></a> 
                        </div>
                        <div class="subscribe_inner">
                                <i class="fas fa-cut"></i>
                                <h4 class="mb-4">Subscribe Us</h4>
                                <p class="mb-4">Subscribe to our Newsletter to get latest offers from our Barber. </p>
                                <form action="#" method="post" class="subscribe_form">
                                        <input class="form-control" type="email" placeholder="Enter Your Email..." required="">
                                        <button type="submit" class="btn1 btn-primary submit"><i class="fas fa-paper-plane" aria-hidden="true"></i></button>
                                </form>
                                <div class="social mt-5">
                                        <ul class="d-flex mt-4 justify-content-center">
                                                <li class="mx-2"><a href="#"><span class="fab fa-facebook-f"></span></a></li>
                                                <li class="mx-2"><a href="#"><span class="fab fa-twitter"></span></a></li>
                                                <li class="mx-2"><a href="#"><span class="fas fa-rss"></span></a></li>
                                                <li class="mx-2"><a href="#"><span class="fab fa-linkedin-in"></span></a></li>
                                                <li class="mx-2"><a href="#"><span class="fab fa-google-plus"></span></a></li>
                                        </ul>
                                </div>
                        </div>
                        <div class="copyright mt-5">
                                <p>� 2018 Barber. All Rights Reserved | Design by	<a href="http://w3layouts.com/">W3layouts</a> </p>
                        </div>
                </div>
        </section>-->
        <!-- //footer section -->

        <!-- js-scripts -->		

        <!-- js -->
        <!--	<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
                <script type="text/javascript" src="js/bootstrap.js"></script>  Necessary-JavaScript-File-For-Bootstrap  
                 //js 
                
                 script for responsive tabs 
                <script src="js/easy-responsive-tabs.js"></script>
                <script>
                        $(document).ready(function () {
                                $('#horizontalTab').easyResponsiveTabs({
                                        type: 'default', //Types: default, vertical, accordion           
                                        width: 'auto', //auto or any width like 600px
                                        fit: true, // 100% fit in a container
                                        closed: 'accordion', // Start closed if in accordion view
                                        activate: function (event) { // Callback function if tab is switched
                                                var $tab = $(this);
                                                var $info = $('#tabInfo');
                                                var $name = $('span', $info);
                                                $name.text($tab.text());
                                                $info.show();
                                        }
                                });
                                $('#verticalTab').easyResponsiveTabs({
                                        type: 'vertical',
                                        width: 'auto',
                                        fit: true
                                });
                        });
                </script>
                // script for responsive tabs 
                
                 Flexisel-js for-testimonials 
                <script type="text/javascript">
                        $(window).load(function() {
                                $("#flexiselDemo1").flexisel({
                                        visibleItems:1,
                                        animationSpeed: 1000,
                                        autoPlay: false,
                                        autoPlaySpeed: 3000,    		
                                        pauseOnHover: true,
                                        enableResponsiveBreakpoints: true,
                                        responsiveBreakpoints: { 
                                                portrait: { 
                                                        changePoint:480,
                                                        visibleItems: 1
                                                }, 
                                                landscape: { 
                                                        changePoint:640,
                                                        visibleItems:1
                                                },
                                                tablet: { 
                                                        changePoint:768,
                                                        visibleItems: 1
                                                }
                                        }
                                });
                                
                        });
                </script>
                <script type="text/javascript" src="js/jquery.flexisel.js"></script>
                 Flexisel-js for-testimonials 
                
                 Calendar js for date picker
                <script src="js/jquery-ui.js"></script>
                <script>
                        $(function () {
                                $("#datepicker,#datepicker1,#datepicker2,#datepicker3").datepicker();
                        });
                </script>
                 //Calendar 
        
                 Banner Responsiveslides 
                <script src="js/responsiveslides.min.js"></script>
                <script>
                        // You can also use "$(window).load(function() {"
                        $(function () {
                                // Slideshow 4
                                $("#slider3").responsiveSlides({
                                        auto: true,
                                        pager: true,
                                        nav: false,
                                        speed: 500,
                                        namespace: "callbacks",
                                        before: function () {
                                                $('.events').append("<li>before event fired.</li>");
                                        },
                                        after: function () {
                                                $('.events').append("<li>after event fired.</li>");
                                        }
                                });
        
                        });
                </script>
                 // Banner Responsiveslides 
        
                 start-smoth-scrolling 
                <script src="js/SmoothScroll.min.js"></script>
                <script type="text/javascript" src="js/move-top.js"></script>
                <script type="text/javascript" src="js/easing.js"></script>
                <script type="text/javascript">
                        jQuery(document).ready(function($) {
                                $(".scroll").click(function(event){		
                                        event.preventDefault();
                                        $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
                                });
                        });
                </script>
                 here stars scrolling icon 
                <script type="text/javascript">
                        $(document).ready(function() {
                                /*
                                        var defaults = {
                                        containerID: 'toTop', // fading element id
                                        containerHoverID: 'toTopHover', // fading element hover id
                                        scrollSpeed: 1200,
                                        easingType: 'linear' 
                                        };
                                */
                                                                        
                                $().UItoTop({ easingType: 'easeOutQuart' });
                                                                        
                                });
        </script>-->

        <%@include file="footer.jsp" %>
        <!-- //here ends scrolling icon -->
        <!-- start-smoth-scrolling -->

        <!-- //js-scripts -->

    </body>
</html>
