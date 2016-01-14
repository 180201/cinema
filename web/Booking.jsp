<%--
  Created by IntelliJ IDEA.
  User: Michał
  Date: 2016-01-12
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cinema</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script>

        function finish(){
            var num = null;
            $(".btn-group > button.btn").on("click", function(){
                num = +this.id;
                if($('#'+num).hasClass('btn-success')){
                    $('#'+num).addClass('btn-default');
                    $('#'+num).removeClass('btn-success');
                }
                else{
                    $('#'+num).addClass('btn-success');
                    $('#'+num).removeClass('btn-default');
                }
            });
        }

        var asyncRequest;
        function pushRequest(){
            try
            {
                var moveId = getParameterByName('ID');
                var places = new Array();
                $(".btn-group > button.btn").each(function(i, obj) {
                    if($('#'+i).hasClass('btn-success')) {
                        places.push(i);
                    }
                });

                var parameters = "?move=" + moveId + "&res=" + places;
                var xmlHttpReq = new XMLHttpRequest();

                xmlHttpReq.open("get", "/FinishReservataion" + parameters, true); //this is synchronous to avoid having too many connections open

                xmlHttpReq.setRequestHeader('Content-Type','application/x-www-form-urlencoded');

                xmlHttpReq.onreadystatechange = function(){

                    if(xmlHttpReq.readyState == 4){
                        success = "yes";
//                        alert(xmlHttpReq.responseText);

                    }
                }

                xmlHttpReq.send();
                window.location.href = "/Reservations";

                success = "no";

            }
            catch(exception)
            {
                alert("Request failed");
            }
        }

        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                    results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        $( document ).ready(function() {
            finish();
        });
    </script>
</head>
    <body>
        <ul class="nav nav-pills">
            <li role="presentation" ><a href="Home">Home</a></li>
            <li role="presentation" ><a href="Register">Register</a></li>
            <li role="presentation" ><a href="Login">Login</a></li>
            <li role="presentation" ><a href="Reservations">Reservations</a></li>

        </ul>
        <h1>Select place</h1>
        <%--<form:form modelAttribute="myform" action="result" method="get" >--%>
        <%--<form>--%>
            <div class="btn-group" role="group" aria-label="">
                <button id="11" type="button" class="btn btn-default ">1</button>
                <button id="12" type="button" class="btn btn-default">2</button>
                <button id="13" type="button" class="btn btn-default">3</button>
                <button id="14" type="button" class="btn btn-default">4</button>
                <button id="15" type="button" class="btn btn-default">5</button>
            </div>
            <div class="btn-group" role="group" aria-label="">
                <button id="16" type="button" class="btn btn-default">6</button>
                <button id="17" type="button" class="btn btn-default">7</button>
                <button id="18" type="button" class="btn btn-default">8</button>
                <button id="19" type="button" class="btn btn-default">9</button>
                <button id="110" type="button" class="btn btn-default">10</button>


            </div>
            <br>
            <div class="btn-group" role="group" aria-label="">
                <button id="21" type="button" class="btn btn-default">1</button>
                <button id="22" type="button" class="btn btn-default">2</button>
                <button id="23" type="button" class="btn btn-default">3</button>
                <button id="24" type="button" class="btn btn-default">4</button>
                <button id="25" type="button" class="btn btn-default">5</button>
            </div>
            <div class="btn-group" role="group" aria-label="">
                <button id="26" type="button" class="btn btn-default">6</button>
                <button id="27" type="button" class="btn btn-default">7</button>
                <button id="28" type="button" class="btn btn-default">8</button>
                <button id="29" type="button" class="btn btn-default">9</button>
                <button id="210" type="button" class="btn btn-default">10</button>

            </div>
            <br>
            <div class="btn-group" role="group" aria-label="">
                <button id="31" type="button" class="btn btn-default">1</button>
                <button id="32" type="button" class="btn btn-default">2</button>
                <button id="33" type="button" class="btn btn-default">3</button>
                <button id="34" type="button" class="btn btn-default">4</button>
                <button id="35" type="button" class="btn btn-default">5</button>
            </div>
            <div class="btn-group" role="group" aria-label="">
                <button id="36" type="button" class="btn btn-default">6</button>
                <button id="37" type="button" class="btn btn-default">7</button>
                <button id="38" type="button" class="btn btn-default">8</button>
                <button id="39" type="button" class="btn btn-default">9</button>
                <button id="310" type="button" class="btn btn-default">10</button>

            </div>
            <br><br>
            <div class="btn-group" role="group" aria-label="">
                <button id="41" type="button" class="btn btn-default">1</button>
                <button id="42" type="button" class="btn btn-default">2</button>
                <button id="43" type="button" class="btn btn-default">3</button>
                <button id="44" type="button" class="btn btn-default">4</button>
                <button id="45" type="button" class="btn btn-default">5</button>
            </div>
            <div class="btn-group" role="group" aria-label="">
                <button id="46" type="button" class="btn btn-default">6</button>
                <button id="47" type="button" class="btn btn-default">7</button>
                <button id="48" type="button" class="btn btn-default">8</button>
                <button id="49" type="button" class="btn btn-default">9</button>
                <button id="410" type="button" class="btn btn-default">10</button>

            </div>
            <br>
            <div class="btn-group" role="group" aria-label="">
                <button id="51" type="button" class="btn btn-default">1</button>
                <button id="52" type="button" class="btn btn-default">2</button>
                <button id="53" type="button" class="btn btn-default">3</button>
                <button id="54" type="button" class="btn btn-default">4</button>
                <button id="55" type="button" class="btn btn-default">5</button>
            </div>
            <div class="btn-group" role="group" aria-label="">
                <button id="56" type="button" class="btn btn-default">6</button>
                <button id="57" type="button" class="btn btn-default">7</button>
                <button id="58" type="button" class="btn btn-default">8</button>
                <button id="59" type="button" class="btn btn-default">9</button>
                <button id="510" type="button" class="btn btn-default">10</button>

            </div>
        <br>
            <div class="btn-group" role="group" aria-label="">
                <button id="61" type="button" class="btn btn-default">1</button>
                <button id="62" type="button" class="btn btn-default">2</button>
                <button id="63" type="button" class="btn btn-default">3</button>
                <button id="64" type="button" class="btn btn-default">4</button>
                <button id="65" type="button" class="btn btn-default">5</button>
            </div>
            <div class="btn-group" role="group" aria-label="">
                <button id="66" type="button" class="btn btn-default">6</button>
                <button id="67" type="button" class="btn btn-default">7</button>
                <button id="68" type="button" class="btn btn-default">8</button>
                <button id="69" type="button" class="btn btn-default">9</button>
                <button id="610" type="button" class="btn btn-default">10</button>

            </div>
        <br>
        <button id="send" type="button" class="btn btn-primary" onclick="pushRequest()">Book tickets</button>

        <%--</form>--%>
        <%--<input type="button" onclick="finish()" value="xaxa">--%>
        <%--</form:form>--%>

    </body>
</html>