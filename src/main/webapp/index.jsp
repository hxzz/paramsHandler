<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<title>WebSocket</title>
<script src="<%=path%>/js/sockjs-0.3.4.js"></script>
<script src="<%=path%>/js/stomp.js"></script>
<script src="<%=path%>/js/jquery-1.7.2.min.js"></script>

<script type="text/javascript">
var contextPath = "<%=request.getContextPath()%>";
var stompClient = null;
	function getModelList(){
		$.ajax({
			type : "POST",
			url : contextPath + '/systemmodel/list'
	});
	}
	
	function startModeling(){
		location.href="systemmodel/modeling"+"?id=000000001"
/* 		var data = {
				"modelname":"GroupTest",
				"id":"000000005"
			   	  		};
			$.ajax({
				type : "POST",
				url : contextPath + '/systemmodel/modeling',
				data : data,
				success : function(data) {
					
				}
			}); */
	}
	
	function connect() {
		var socket = new SockJS('/paramsHandler/stomp');
		stompClient = Stomp.over(socket);
		stompClient.connect({}, function(frame) {
			//setConnected(true);
//			console.log('Connected: ' + frame);
			stompClient.subscribe('/topic/modelacceptor', function(model) {
				console.log(model.body);
			});
			
			stompClient.subscribe('/topic/greetings', function(greeting) {
				console.log(greeting.body);
				//showGreeting(greeting);
				//console.log(greeting);
				//console.log(greeting.body);
			});
		});
	}

	function paramsChange(){  
		var contextPath = "<%=request.getContextPath()%>";
		var data = {
			   	   "cmd":"generate",
			   	   "jobID":"dbnsaldbsalihu695865732",
			   	   "params":{
			   	   		"id":"000000001",
			   	   		"params":[
			   	   		  		{"name":"长","type":"d","values":["10"]},
			   					{"name":"宽","type":"d","values":["10"]},
			   					{"name":"高","type":"d","values":["10"]}
			   	   		]
			   	   },
			   	"path":"/home/mzl/develop_tools/hxModels/vrml/"
			   

		};
		
		stompClient.send("/app/paramschange", {}, JSON.stringify(data)); 
	}

	
	function paramsChange1(){  
		var contextPath = "<%=request.getContextPath()%>";
		var data = {
			   	   "cmd":"generate",
			   	   "jobID":"dbnsaldbsalihu695865732",
			   	   "params":{
			   	   		"id":"000000001",
			   	   		"params":[
			   	   		  		{"name":"长","type":"d","values":["10"]},
			   					{"name":"宽","type":"d","values":["10"]},
			   					{"name":"高","type":"d","values":["10"]}
			   	   		]
			   	   },
			   	   "path":"/home/mzl/develop_tools/hxModels/vrml/"
			   

		};
			$.ajax({
				type : "POST",
				url : contextPath + '/systemmodel/000000005',
				dataType : "json",
				contentType : "application/json",
				data : JSON.stringify(data),

				success : function(data) {
					  console.log(data);
				}
			});
		}
	
	function paramsChange2(){  
		var contextPath = "<%=request.getContextPath()%>";
		var data = {
				"modelname":"GroupTest",
				
			   	  		};
			$.ajax({
				type : "POST",
				url : contextPath + '/systemmodel/list',
				data : data,
				success : function(data) {
					  console.log(data);
				}
			});
		}

</script>
</head>
<body onload="connect()">
	<noscript>
		<h2 style="color: #ff0000">Seems your browser doesn't support
			Javascript! Websocket relies on Javascript being enabled. Please
			enable Javascript and reload this page!</h2>
	</noscript>
	<div>
		<div>
			<button id="getModelList" onclick="getModelList();">获取模型列表</button>
			<!-- <button id="startModeling" onclick="startModeling();">startModeling</button> -->
			
			<button id="change" onclick="paramsChange()">调整模型</button>
		</div>
		<div>${roews[0].id }</div>
	</div>
</body>
</html>