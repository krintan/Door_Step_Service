<%-- 
    Document   : showAllVendors
    Created on : 24-Apr-2023, 11:45:43 am
    Author     : Dell
--%>

    <html>
        <head>
            <%@include file="Header.jsp"%>
            
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
            <%
                String name=request.getParameter("name");
             %>
            <script>
            var name="<%=name%>";
            function showAllVendors()
            {    
                //alert(name);
               // alert('<%=name%>');
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
                       // alert(ans);
                        renderAsHTML(ans);

                    }
                };

                //prepare request Step2
                xhttp.open("GET", "./showAllVendors?name=<%=name%>", true);

                //step3
                xhttp.send();
            }

            function renderAsHTML(t) {
               //alert(t);
                var ans = "";
               var obj=JSON.parse(t);
               var arr=obj["ans"];
                console.log(arr);
               for(var i=0;i<arr.length;i++)
               {
                     var service = arr[i];
                    ans += "<div class=\"col-lg-3 col-sm-6 mb-lg-0 mb-5 text-center\">";
                    ans += "<div class=\"barber-grid1\">";
                     ans += "<img src="+service.photo+" class=\"img-fluid\" alt=\"\" style=\"width:250px;height:300px\"/>";
//                    ans += "<img src="+service.photo+" class=\"img-fluid\" alt=\"\"/>";
                    ans += "</div>";
                   ans += "<a href=\"single_vendor.jsp?Email="+service.Vendor_Email+"\"><h4 class=\"mt-3\">" + service.Vendorname + "</h4>";
                    ans += "<p>" + service.Description + "</p>";
                    ans += "<div class=\"social mt-2\">";
                    ans += "<ul class=\"d - flex justify - content - center\">";
                   
                    ans += "</ul>";
                    ans += "</div>";
                    ans += "</div>";
                
               }
              
                document.getElementById("servicesRendered").innerHTML = ans;
            }


        </script>

        </head>
        <body onload="showAllVendors()">
            
            <%@include file="Navbar.jsp" %>
            
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
						<a class="bt mt-4 text-capitalize scroll" href="#about" role="button"> read more
							<i class="fas fa-cut"></i>
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
						<h4 class="movetxt text-left agile-title text-uppercase">Your Hair Beauty </h4>
						<h4 class="movetxt text-left mb-3 agile-title text-uppercase">Our Duty </h4>
						<a class="bt mt-4 text-capitalize scroll" href="#about" role="button"> read more
							<i class="fas fa-cut"></i>
						</a>
					</div>
					</div>
				</div>
			</li>
			<li>
				<div class="slider-info bg3">
					<div class="bs-slider-overlay">
					<div class="banner-text container">
						<h5 class="tag text-left mb-3 text-uppercase">We make your hair</h5>
						<h4 class="movetxt text-left agile-title text-uppercase">We Make Your Hair </h4>
						<h4 class="movetxt text-left mb-3 agile-title text-uppercase">Look Perfect </h4>
						
						<a class="bt mt-4 text-capitalize scroll" href="#about" role="button"> read more
							<i class="fas fa-cut"></i>
						</a>
					</div>
					</div>
				</div>
			</li>
			<li>
				<div class="slider-info bg4">
					<div class="bs-slider-overlay">
					<div class="banner-text container">
						<h5 class="tag text-left mb-3 text-uppercase">We make stylish hair</h5>
						<h4 class="movetxt text-left agile-title text-uppercase">Rea Man's to go </h4>
						<h4 class="movetxt text-left mb-3 agile-title text-uppercase">Real Beards </h4>
						<a class="bt mt-4 text-capitalize scroll" href="#about" role="button"> read more
							<i class="fas fa-cut"></i>
						</a>
					</div>
					</div>
				</div>
			</li>
		</ul>
	</div>
</section>
<!-- //banner -->
            
             <section class="barbers py-5" id="team">
            <div class="container py-lg-3 py-2">
                <div class="heading text-center">
                    <i class="fas fa-home"></i>
                    <h3 class="heading mb-sm-5 mb-3 text-uppercase">vendors of <%=name%></h3>
                </div>
                <div class="row barber-grids" id="servicesRendered">


                </div>
            </div>
        </section>
            
<!--            <div id="servicesRendered">
                
            </div>
            -->
             <%@include file="footer.jsp" %>
        </body>
    </html>

