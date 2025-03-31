<!DOCTYPE html>
<html lang="en">

    <head>

        <%@include file="Header.jsp"  %>


        <% 
            String  serviceid=(String)request.getParameter("serviceid");
            String servicename=(String)request.getParameter("servicename");
            
        %>

        <script>
            var servicename = encodeURIComponent("<%=servicename%>");
            var serviceid = "<%=serviceid%>";
            function userShowAllSubService()
            {
//               
                //alert(servicename);
                var xhttp = new XMLHttpRequest();
                //step 4
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Typical action to be performed when the document is ready:


                        var ans = xhttp.responseText;

                        renderAsHtml(ans);
                    }
                };
                //prepare request Step2
//                console.log(serviceid);
                xhttp.open("GET", "./userShowAllSubService?serviceid=" +<%=serviceid%>, true);
                //step3
                xhttp.send();
            }

//            function renderAsHTML(t) {
//                alert(t);
//                alert(servicename);
//                var ans = "";
//                var obj = JSON.parse(t);
//                var arr = obj.ans;
//                console.log(arr);
//                for (var i = 0; i < arr.length; i++)
//                {
//
//                    var service = arr[i];
//                    ans += "<div class=\"col-lg-3 col-sm-6 mb-lg-0 mb-5 text-center\">";
//                    ans += "<div class=\"barber-grid1\">";
//                    ans += "<img src=\"" + service.photo + "\"class=\"img-fluid\" alt=\"\"/>";
//                    ans += "</div>";
//                    ans += "<a href=\"showAllVendors.jsp?name="+service.subservicename+"\"><h4 class=\"mt-3\">"+service.subservicename+"</h4>";
//                    ans += "<p>" + service.desc + "</p>";
//                    ans += "<div class=\"social mt-2\">";
//                    ans += "<ul class=\"d - flex justify - content - center\">";
//                    ans += "<li class=\"mr-1\"><a href=\"#\"><span class=\"fab fa-facebook-f\"></span></a></li>";
//                    ans += "<li class=\"mr-1\"><a href=\"#\"><span class=\"fab fa-twitter\"></span></a></li>";
//                    ans += "<li class=\"\"><a href=\"#\"><span class=\"fab fa-linkedin-in\"></span></a></li>";
//                    ans += "</ul>";
//                    ans += "</div>";
//                    ans += "</div>";
//                }
//
//
//                document.getElementById("subservicesrendering").innerHTML = ans;
//            }
   function renderAsHtml(ans) {
           // alert(ans);
                var mainobj = JSON.parse(ans);
                var arr = mainobj.ans;
                console.log(arr);
                var s = ``;
                for (var i = 0; i < arr.length; i++) {
                    var obj = arr[i];
                    s = s + `<div class="col-sm-4 mb-3 ">
        <div class="card " style="width:400px;height:600px">
                    <img class="card-img-top" src="myuploads/`+obj.photo+`" alt="Card image" style="width:400px;height:300px">
                    <div class="card-body">
                      <h4 class="card-title">`+obj.subservicename+`</h4>
                      <p class="card-text">`+obj.desc+`</p><br>
                      <a href="showAllVendors.jsp?id=`+serviceid+`&name=`+obj.subservicename+`" class="btn btn-primary">See Vendors</a>
                    </div>
                    </div>
                  </div>`;
                                  }
                document.getElementById("subservicesrendering").innerHTML = s;


}
        </script>


    </head>

    <body onload="userShowAllSubService()">

            <%@include file="Navbar.jsp" %>
             <section class="banner " id="home">
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
        <!-- Team -->
        <section class="barbers py-5" id="team">
            <div class="container py-lg-3 py-2">
                <div class="heading text-center">
                    <i class="fas fa-home"></i>
                    <h3 class="heading mb-sm-5 mb-3 text-uppercase">Sub Services Of <%= servicename %></h3>
                </div>
<!--                <div class="row" id="subservicesrendering">


                </div>-->
            </div>
        </section>
        <!-- //Team -->
        <div class="row " id="subservicesrendering" style="padding-left: 60px" >


                </div>

        <%@include file="footer.jsp" %>

    </body>
</html>
