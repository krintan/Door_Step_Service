
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>JSP Page</title>
        <%
       String email= (String)session.getAttribute("useremail");
       
        %>
        
        <%@include file="Header.jsp" %>
        <script>
            var em = "<%=email%>";

            function viewbookings()

            {

               // alert(em);

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Typical action to be performed when the document is ready:

                        var ans = xhttp.responseText;
                       // alert(ans);
                        renderslots(ans);

                    }
                };

                //prepare request Step2
                xhttp.open("GET", "./viewbookings?useremail=" + em, true);

                //step3
                xhttp.send();

            }

            function renderslots(ans)
            {

//alert(ans);
                var mainobj = JSON.parse(ans);
                console.log(mainobj);
                var arr = mainobj["ans"];
                var count = 1;
                
                var output='<h1> Your Bookings </h1>';
                 output += '<table class="table table-hover" width=500 border=1>';
                output += ' <tr>';
                output += ' <th>index number</th>';
                output += '<th>Total Price</th>';
                output += '<th>Payment Type</th>';

                output += '<th>status</th>';
                output += '</tr>';
                
                for (var i = 0; i < arr.length; i++) {
                    var obj = arr[i];
                    output += '<tr>';

                         
                          output += '<td>' + count + '</td>';
                        output += '<td>' + obj.totalprice + '</td>';
                        output += '<td>' + obj.paymenttype + '</td>';
                        output += '<td>' + obj.status + '</td>';
                       
                       count++;

                    output += '</tr>';

                }
                output += '</table>';
              //  alert(output);
                document.getElementById("wow").innerHTML = output;




            }


        </script>




    </head>
    <body onload="viewbookings()">
        
        <%@include file="Navbar.jsp" %><br><br><br><br>
        <div class="container" style="text-align: center" >
        <div id="wow">

        </div>
       </div>
        
<%@include file="footer.jsp" %>

    </body>
</html>



