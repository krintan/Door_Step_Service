<!DOCTYPE html>
<html lang="en">
<head>
   
    <script>
            function userShowService()
            {
                 var url = "./userShowService";
                  
                fetch(url, {method: "POST"} )
                          .then(response => response.text())
                          .then(ans => renderAsHtml(ans) );

                             
            }
            function renderAsHtml(ans)
            {
                 //alert(ans);
                 ans = ans.trim();
                 var mainobj = JSON.parse(ans);
                 var arr = mainobj.ans;
                 var res = "";
                 
                 for (var i = 0; i < arr.length/2; i++)
                 {
                        var idx=i+1;
                        var st = arr[i];
                        res+="<div class=\"col-lg-2 col-sm-6 col-12 serviceimage"+idx+""+"\"> </div>";
                        res+="<div class=\"col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext\">";
                        res+="<h4>"+st.servicename+"</h4>";
                        res+="<p class=\"my-3\">"+st.desc+"</p>";
                        res+= "<a class=\"bt text-capitalize\" href=\"userShowAllSubServices.jsp?serviceid=" + st.id + "&servicename=" + arr[i].servicename +"\""+ "role=\"button\"> read more <i class=\"fas fa-home\"></i></a>";
                        res+="</div>";
                }
                
                for (var i = arr.length/2; i < arr.length; i++)
                 {      
                     
                        var idx=i+1;
                        var st = arr[i];
                        res+="<div class=\"col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext\">";
                        res+="<h4>"+st.servicename+"</h4>";
                        res+="<p class=\"my-3\">"+st.desc+"</p>";
                        res+= "<a class=\"bt text-capitalize\" href=\"userShowAllSubServices.jsp?serviceid=" + st.id + "&servicename=" + arr[i].servicename +"\""+ "role=\"button\"> read more <i class=\"fas fa-home\"></i></a>";
                        res+="</div>";
                        res+="<div class=\"col-lg-2 col-sm-6 col-12 serviceimage"+idx+""+"\"> </div>";
                        
                }
            document.getElementById("service").innerHTML= res;
        }
                 
            
        </script>
<title>Vendor Side</title>
	
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
	 //web-fonts -->
	<%@include file="Header.jsp" %>
</head>

<body>


<div id="v1"> 
<%@include file="vendor_navbar.jsp" %>

</div>
<br><br><br><br><br> <br><br>
<section class="services py-5" id="services">
	<div class="container-fluid">
		<div class="heading text-center">
			<i class="fas fa-home"></i>
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase" style="text-decoration: saddlebrown">WHAT WE OFFER</h3>
		</div>
        </div> 

	<div class="container py-lg-3 py-2">
		<div class="heading text-center">
			
			
		</div>
		<div class="row about-grids">
			<div class="col-lg-4 about-grid1 mb-lg-0 mb-5">
				<div class="about-grid2 p-5" style="text-align:center">
                                    <a href="vendor_EditProfile.jsp"><h3>Edit <br> Profile</h3></a>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
                            <div class="about-grid2 p-5" style="text-align:center">
                                <a href="vendor_AddPhotos.jsp"><h3>Add <br> Photo</h3></a>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="about-grid2 p-5" style="text-align:center">
                                    <a href="vendor_ManageBookings.jsp"><h3>Manage <br> Booking</h3></a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- //About -->


<%@include file="footer.jsp" %>


</body>
</html>
