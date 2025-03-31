
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>JSP Page</title>
       
      
              <%@include file="Header.jsp" %>
        <script>

            <%
                String vendoremail=(String)session.getAttribute("Vendor_Email");  
            %>

            var vem = "<%=vendoremail%>";
            
             function addPhoto()
            {
                //alert("adding photo");
                var url = "./vendorAddPhotos";
                var photo = document.getElementById("photo").files[0];


//                if (document.getElementById("photo").files.length == 0)
//                {
//                    Swal.fire({
//                        icon: 'error',
//                        title: 'Oops...',
//                        text: 'Select Gym Photo!'
//                    });
//                } else {


                    var formdata = new FormData();
                    formdata.append("vendoremail", vem);
                    formdata.append("photo", photo);


                    fetch(url, {method: "POST", body: formdata})
                            .then(response => response.text())
                            .then(ans => renderAddedPhotos(ans));
               // }
            }
            
             function renderAddedPhotos(ans)
            {
                //alert(ans);
                if (ans == "success")
                {
                    Swal.fire({
                        icon: 'sucsess',
                        title: 'Done...',
                        text: 'Photo Added Successfully!'
                    });
                    document.getElementById("vendorpic").reset();
                   vendorShowPhotos();
                } 
                else
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Error Occured !'
                    });
                }
            }

            
            function vendorShowPhotos()
            {
               // alert(vem);

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Typical action to be performed when the document is ready:

                        var ans = xhttp.responseText;
                        //alert(ans);
                        renderphotos(ans);

                    }
                };

                //prepare request Step2
                xhttp.open("GET", "./vendorShowPhotos?email=" + vem, true);

                //step3
                xhttp.send();

            }

            function renderphotos(ans)
            {
                ans = ans.trim();
                var mainobj = JSON.parse(ans);
                var arr = mainobj["ans"];
               //  alert(arr);
                 
                var ren = "";
                ren += "<div class=\"row\" >";
                for (var i = 0; i < arr.length; i++)
                {
                    var st = arr[i];

                    ren += "<div class=\"col-sm-2\" style=\"text-align: center; padding: 5px; margin: 1px; \" >";
                    ren += "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px; height: 150px \" src=\'" + st.photo + "\' ><br><br>";
                    ren += "<input type=\"button\" value=\"Delete\" class=\"btn btn-success\" onclick=\"deleteVendorPhoto('" + st.photoid + "')\" ><br>";
                    ren += "</div>";
                }
                ren += "</div>";
                document.getElementById("showaddedphotos").innerHTML = ren;

            }


             function deleteVendorPhoto(photoid)
             {
                 // alert(photoid);

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Typical action to be performed when the document is ready:

                        var ans = xhttp.responseText;
                      //  alert(ans);
                        deletePhoto(ans);

                    }
                };

                //prepare request Step2
                xhttp.open("GET", "./deleteVendorPhoto?photoid=" +photoid, true);

                //step3
                xhttp.send();
             }
             
              function deletePhoto(ans)
            {
                if (ans === "success")
                {
                    Swal.fire({
                        icon: 'sucsess',
                        title: 'Done...',
                        text: 'Photo Removed Successfully!'
                    });
                   vendorShowPhotos();
                } else
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Error While Deleting !'
                    });
                    
                    alert("photo not deleted");
                }
            }
             
             
        </script>

    </head>
    <body onload="vendorShowPhotos()">
       
<div id="v1"> 
<%@include file="vendor_navbar.jsp" %>

</div>
       <br><br><br><br><br><br><br><br>
       <section class="services py-5"  >
            
            <div class="container-fluid">
		<div class="heading text-center">
			<i class="fas fa-home"></i>
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase" style="text-decoration: saddlebrown">WHAT WE OFFER</h3>
		</div>
        </div> 
            
         <div class="classes-overlay-bg animate-this">
            <!--    <img src="../images/banner2.jpg"  width="200px" height="200px" alt="Overlay">   -->
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="classes-title">
                            <h2 class="h2-title">Add Your Working Photos</h2>
                        </div>
                    </div>
                </div>

                <div id="login" style="border: 2px solid black; border-radius: 10px;background-color: white; padding: 10px">

                    <form autocomplete="off" id="vendorpic"  >

                        <div class="form-group">
                            <label><b>Choose Photo</b></label><br>
                            <input style="border: 2px solid black; border-radius: 10px" id="photo" type="file" >
                        </div><br>

                        <div id="pass-info" class="clearfix"></div>
                        <input type="button" value="Add Photo" onclick="addPhoto()" class="btn btn-success">

                    </form>

                </div>
            </div>
            <hr>
            <div class="container" ><hr><br>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="classes-title">
                            <h2 class="h2-title">Your Added Photos</h2>
                        </div>
                    </div>
                </div>
                <div id="showaddedphotos" style="border: 2px solid black; border-radius: 10px;background-color: white; padding: 10px" >

                </div>
            </div>

        </section>

        <!--Footer Start-->

        <%--<%@include file="footer.jsp"  %>--%>

        <!--Footer End-->


        <!-- modal-search-end -->

<!--         Jquery JS Link 
        <script src="assets/js/jquery.min.js"></script>

         Bootstrap JS Link 
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/popper.min.js"></script>

         Custom JS Link 
        <script src="assets/js/custom.js"></script>

         Slick Slider JS Link 
        <script src="assets/js/slick.min.js"></script>

         Wow Animation JS 
        <script src="assets/js/wow.min.js"></script>

        Bg Moving Js
        <script src="assets/js/bg-moving.js"></script>

        Magnific Popup JS
        <script src="assets/js/magnific-popup.js"></script>
        <script src="assets/js/custom-magnific-popup.js"></script>

        Progress Bar JS
        <script src="assets/js/custom-progress-bar.js"></script>

        Scroll Count JS
        <script src="assets/js/custom-scroll-count.js"></script>

        BAck To Top JS
        <script src="assets/js/back-to-top.js"></script>
-->





    </body>
</html>

