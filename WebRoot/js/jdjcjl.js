function yanzheng1(datatab2){
		var problem1 = "";
		$("#c11").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro1;
			problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			problem1 += pro1;
			if(document.getElementById("c2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("c3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("c4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("c5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("c6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("c7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("c8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#c1").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#c22").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro2;
			problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			problem1 += pro2;
			if(document.getElementById("c1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("c3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("c4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("c5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("c6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("c7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("c8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#c2").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#c33").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro3;
			problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			problem1 += pro3;
			if(document.getElementById("c1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("c2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("c4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("c5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("c6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("c7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("c8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#c3").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#c44").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro4;
			problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			problem1 += pro4;
			if(document.getElementById("c1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("c2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("c3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("c5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("c6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("c7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("c8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#c4").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#c55").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro5;
			problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			problem1 += pro5;
			if(document.getElementById("c1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("c2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("c3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("c4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("c6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("c7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("c8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#c5").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#c66").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro6;
			problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			problem1 += pro6;
			if(document.getElementById("c1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("c2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("c3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("c4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("c5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("c7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("c8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#c6").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#c77").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro7;
			problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			problem1 += pro7;
			if(document.getElementById("c1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("c2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("c3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("c4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("c5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("c6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("c8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#c7").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#c88").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro8;
			problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			problem1 += pro8;
			if(document.getElementById("c1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("c2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("c3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("c4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("c5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("c6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("c7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#c8").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
	}


	function yanzheng2(datatab2){
		var problem1 = "";
		$("#ch11").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var pro9 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			var pro10 = datatab2[9].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro1;
			problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			problem1 += pro1;
			if(document.getElementById("ch2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ch3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ch4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ch5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ch6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("ch7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("ch8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			if(document.getElementById("ch9").checked){
				problem1 = problem1.replace(new RegExp(pro9, 'gm'),''); 
			}
			if(document.getElementById("ch10").checked){
				problem1 = problem1.replace(new RegExp(pro10, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ch1").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ch2").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ch22").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var pro9 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			var pro10 = datatab2[9].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro2;
			problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			problem1 += pro2;
			if(document.getElementById("ch1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("ch3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ch4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ch5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ch6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("ch7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("ch8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			if(document.getElementById("ch9").checked){
				problem1 = problem1.replace(new RegExp(pro9, 'gm'),''); 
			}
			if(document.getElementById("ch10").checked){
				problem1 = problem1.replace(new RegExp(pro10, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ch3").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ch33").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var pro9 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			var pro10 = datatab2[9].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro3;
			problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			problem1 += pro3;
			if(document.getElementById("ch2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ch1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("ch4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ch5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ch6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("ch7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("ch8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			if(document.getElementById("ch9").checked){
				problem1 = problem1.replace(new RegExp(pro9, 'gm'),''); 
			}
			if(document.getElementById("ch10").checked){
				problem1 = problem1.replace(new RegExp(pro10, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ch4").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ch44").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var pro9 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			var pro10 = datatab2[9].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro4;
			problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			problem1 += pro4;
			if(document.getElementById("ch2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ch3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ch1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("ch5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ch6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("ch7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("ch8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			if(document.getElementById("ch9").checked){
				problem1 = problem1.replace(new RegExp(pro9, 'gm'),''); 
			}
			if(document.getElementById("ch10").checked){
				problem1 = problem1.replace(new RegExp(pro10, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ch5").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ch55").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var pro9 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			var pro10 = datatab2[9].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro5;
			problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			problem1 += pro5;
			if(document.getElementById("ch2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ch3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ch4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ch1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("ch6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("ch7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("ch8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			if(document.getElementById("ch9").checked){
				problem1 = problem1.replace(new RegExp(pro9, 'gm'),''); 
			}
			if(document.getElementById("ch10").checked){
				problem1 = problem1.replace(new RegExp(pro10, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ch6").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ch66").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var pro9 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			var pro10 = datatab2[9].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro6;
			problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			problem1 += pro6;
			if(document.getElementById("ch2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ch3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ch4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ch5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ch1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("ch7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("ch8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			if(document.getElementById("ch9").checked){
				problem1 = problem1.replace(new RegExp(pro9, 'gm'),''); 
			}
			if(document.getElementById("ch10").checked){
				problem1 = problem1.replace(new RegExp(pro10, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ch7").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ch77").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var pro9 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			var pro10 = datatab2[9].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro7;
			problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			problem1 += pro7;
			if(document.getElementById("ch2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ch3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ch4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ch5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ch6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("ch1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("ch8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			if(document.getElementById("ch9").checked){
				problem1 = problem1.replace(new RegExp(pro9, 'gm'),''); 
			}
			if(document.getElementById("ch10").checked){
				problem1 = problem1.replace(new RegExp(pro10, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ch8").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ch88").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var pro9 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			var pro10 = datatab2[9].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro8;
			problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			problem1 += pro8;
			if(document.getElementById("ch2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ch3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ch4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ch5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ch6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("ch7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("ch1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("ch9").checked){
				problem1 = problem1.replace(new RegExp(pro9, 'gm'),''); 
			}
			if(document.getElementById("ch10").checked){
				problem1 = problem1.replace(new RegExp(pro10, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ch9").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ch99").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var pro9 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			var pro10 = datatab2[9].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro9;
			problem1 = problem1.replace(new RegExp(pro9, 'gm'),''); 
			problem1 += pro9;
			if(document.getElementById("ch2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ch3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ch4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ch5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ch6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("ch7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("ch8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			if(document.getElementById("ch1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("ch10").checked){
				problem1 = problem1.replace(new RegExp(pro10, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ch1010").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var pro9 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			var pro10 = datatab2[9].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro10;
			problem1 = problem1.replace(new RegExp(pro10, 'gm'),''); 
			problem1 += pro10;
			if(document.getElementById("ch2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ch3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ch4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ch5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ch6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("ch7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("ch8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			if(document.getElementById("ch9").checked){
				problem1 = problem1.replace(new RegExp(pro9, 'gm'),''); 
			}
			if(document.getElementById("ch1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ch10").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[9].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
	}
	
	function yanzheng3(datatab2){
		var problem1 = "";
		$("#che11").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro1;
			problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			problem1 += pro1;
			if(document.getElementById("che2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("che3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("che4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("che5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("che6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#che1").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#che1").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#che2").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#che3").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#che5").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#che6").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#che4").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#che22").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro2;
			problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			problem1 += pro2;
			if(document.getElementById("che1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("che3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("che4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("che5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("che6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#che33").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro3;
			problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			problem1 += pro3;
			if(document.getElementById("che2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("che1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("che4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("che5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("che6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#che44").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro4;
			problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			problem1 += pro4;
			if(document.getElementById("che2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("che3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("che1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("che5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("che6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#che55").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro5;
			problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			problem1 += pro5;
			if(document.getElementById("che2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("che3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("che4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("che1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("che6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#che66").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro6;
			problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			problem1 += pro6;
			if(document.getElementById("che2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("che3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("che4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("che5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("che1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
	}
	
	
	function yanzheng4(datatab2){
		var problem1 = "";
		$("#chec1").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#chec2").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#chec3").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#chec4").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#chec5").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#chec6").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#chec7").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#chec8").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#chec9").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#chec11").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var pro9 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro1;
			problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			problem1 += pro1;
			if(document.getElementById("chec2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("chec3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("chec4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("chec5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("chec6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("chec7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("chec8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			if(document.getElementById("chec9").checked){
				problem1 = problem1.replace(new RegExp(pro9, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#chec22").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var pro9 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro2;
			problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			problem1 += pro2;
			if(document.getElementById("chec1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("chec3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("chec4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("chec5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("chec6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("chec7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("chec8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			if(document.getElementById("chec9").checked){
				problem1 = problem1.replace(new RegExp(pro9, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#chec33").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var pro9 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro3;
			problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			problem1 += pro3;
			if(document.getElementById("chec2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("chec1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("chec4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("chec5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("chec6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("chec7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("chec8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			if(document.getElementById("chec9").checked){
				problem1 = problem1.replace(new RegExp(pro9, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#chec44").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var pro9 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro4;
			problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			problem1 += pro4;
			if(document.getElementById("chec2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("chec3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("chec1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("chec5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("chec6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("chec7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("chec8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			if(document.getElementById("chec9").checked){
				problem1 = problem1.replace(new RegExp(pro9, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#chec55").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var pro9 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro5;
			problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			problem1 += pro5;
			if(document.getElementById("chec2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("chec3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("chec4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("chec1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("chec6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("chec7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("chec8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			if(document.getElementById("chec9").checked){
				problem1 = problem1.replace(new RegExp(pro9, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#chec66").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var pro9 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro6;
			problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			problem1 += pro6;
			if(document.getElementById("chec2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("chec3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("chec4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("chec5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("chec1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("chec7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("chec8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			if(document.getElementById("chec9").checked){
				problem1 = problem1.replace(new RegExp(pro9, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#chec77").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var pro9 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro7;
			problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			problem1 += pro7;
			if(document.getElementById("chec2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("chec3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("chec4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("chec5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("chec6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("chec1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("chec8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			if(document.getElementById("chec9").checked){
				problem1 = problem1.replace(new RegExp(pro9, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#chec88").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var pro9 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro8;
			problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			problem1 += pro8;
			if(document.getElementById("chec2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("chec3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("chec4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("chec5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("chec6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("chec7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("chec1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("chec9").checked){
				problem1 = problem1.replace(new RegExp(pro9, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#chec99").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var pro9 = datatab2[8].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro9;
			problem1 = problem1.replace(new RegExp(pro9, 'gm'),''); 
			problem1 += pro9;
			if(document.getElementById("chec2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("chec3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("chec4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("chec5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("chec6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("chec7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("chec8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			if(document.getElementById("chec1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
	}
	
	function yanzheng5(datatab2){
		var problem1 = "";
		$("#sh11").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro1;
			problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			problem1 += pro1;
			if(document.getElementById("sh2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("sh3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("sh4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("sh5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("sh6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("sh7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("sh8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#sh1").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#sh1").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#sh2").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#sh3").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#sh4").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#sh5").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#sh6").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#sh7").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#sh8").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#sh22").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro2;
			problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			problem1 += pro2;
			if(document.getElementById("sh1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("sh3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("sh4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("sh5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("sh6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("sh7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("sh8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;		});
		$("#sh33").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro3;
			problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			problem1 += pro3;
			if(document.getElementById("sh2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("sh1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("sh4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("sh5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("sh6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("sh7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("sh8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#sh44").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro4;
			problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			problem1 += pro4;
			if(document.getElementById("sh2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("sh3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("sh1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("sh5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("sh6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("sh7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("sh8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#sh55").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro5;
			problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			problem1 += pro5;
			if(document.getElementById("sh2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("sh3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("sh4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("sh1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("sh6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("sh7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("sh8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#sh66").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro6;
			problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			problem1 += pro6;
			if(document.getElementById("sh2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("sh3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("sh4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("sh5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("sh1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("sh7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("sh8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#sh77").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro7;
			problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			problem1 += pro7;
			if(document.getElementById("sh2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("sh3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("sh4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("sh5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("sh6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("sh1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("sh8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#sh88").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro8;
			problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			problem1 += pro8;
			if(document.getElementById("sh2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("sh3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("sh4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("sh5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("sh6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("sh7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("sh1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
	}
	
	function yanzheng6(datatab2){
		var problem1 = "";
		$("#y11").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro1;
			problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			problem1 += pro1;
			if(document.getElementById("y2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("y3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("y4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("y5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#y22").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro2;
			problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			problem1 += pro2;
			if(document.getElementById("y1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("y3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("y4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("y5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#y33").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro3;
			problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			problem1 += pro3;
			if(document.getElementById("y2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("y1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("y4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("y5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#y44").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro4;
			problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			problem1 += pro4;
			if(document.getElementById("y2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("y3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("y1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("y5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#y55").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro5;
			problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			problem1 += pro5;
			if(document.getElementById("y2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("y3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("y4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("y1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#y1").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#y2").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#y3").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#y4").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#y5").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
	}
	
	function yanzheng7(datatab2){
		var problem1 = "";
		$("#ya11").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro1;
			problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			problem1 += pro1;
			if(document.getElementById("ya2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ya3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ya4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ya5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ya6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ya1").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ya2").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ya3").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ya4").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ya5").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ya6").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ya22").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro2;
			problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			problem1 += pro2;
			if(document.getElementById("ya1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("ya3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ya4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ya5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ya6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ya33").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro3;
			problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			problem1 += pro3;
			if(document.getElementById("ya2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ya1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("ya4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ya5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ya6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ya44").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro4;
			problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			problem1 += pro4;
			if(document.getElementById("ya2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ya3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ya1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("ya5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ya6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ya55").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro5;
			problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			problem1 += pro5;
			if(document.getElementById("ya2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ya3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ya4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ya1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("ya6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ya66").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro6;
			problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			problem1 += pro6;
			if(document.getElementById("ya2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ya3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ya4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ya5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ya1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
	}
	
	function yanzheng8(datatab2){
		var problem1 = "";
		$("#q1").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#q2").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#q3").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#q4").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#q5").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#q11").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro1;
			problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			problem1 += pro1;
			if(document.getElementById("q2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("q3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("q4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("q5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#q22").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro2;
			problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			problem1 += pro2;
			if(document.getElementById("q1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("q3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("q4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("q5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#q33").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro3;
			problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			problem1 += pro3;
			if(document.getElementById("q2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("q1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("q4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("q5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#q44").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro4;
			problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			problem1 += pro4;
			if(document.getElementById("q2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("q3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("q1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("q5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#q55").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro5;
			problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			problem1 += pro5;
			if(document.getElementById("q2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("q3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("q4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("q1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
	}

	function yanzheng9(datatab2){
		var problem1 = "";
		$("#k1").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#k2").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#k3").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#k4").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#k5").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#k6").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#k7").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#k11").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro1;
			problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			problem1 += pro1;
			if(document.getElementById("k2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("k3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("k4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("k5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("k6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("k7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		
		$("#k22").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro2;
			problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			problem1 += pro2;
			if(document.getElementById("k1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("k3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("k4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("k5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("k6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("k7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		
		$("#k33").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro3;
			problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			problem1 += pro3;
			if(document.getElementById("k2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("k1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("k4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("k5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("k6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("k7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		
		$("#k44").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro4;
			problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			problem1 += pro4;
			if(document.getElementById("k2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("k3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("k1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("k5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("k6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("k7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		
		$("#k55").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro5;
			problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			problem1 += pro5;
			if(document.getElementById("k2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("k3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("k4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("k1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("k6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("k7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#k66").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro6;
			problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			problem1 += pro6;
			if(document.getElementById("k2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("k3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("k4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("k5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("k1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("k7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#k66").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro6;
			problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			problem1 += pro6;
			if(document.getElementById("k2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("k3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("k4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("k5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("k7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("k1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		
		$("#k77").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro7;
			problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			problem1 += pro7;
			if(document.getElementById("k2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("k3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("k4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("k5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("k6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("k1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
	}
	
	function yanzheng10(datatab2){
		var problem1 = "";
		$("#chang1").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#chang2").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#chang3").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#chang4").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#chang5").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#chang6").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#chang7").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#chang11").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro1;
			problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			problem1 += pro1;
			if(document.getElementById("chang2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("chang3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("chang4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("chang5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("chang6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("chang7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		
		$("#chang22").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro2;
			problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			problem1 += pro2;
			if(document.getElementById("chang1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("chang3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("chang4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("chang5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("chang6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("chang7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		
		$("#chang33").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro3;
			problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			problem1 += pro3;
			if(document.getElementById("chang2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("chang1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("chang4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("chang5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("chang6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("chang7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		
		$("#chang44").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro4;
			problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			problem1 += pro4;
			if(document.getElementById("chang2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("chang3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("chang1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("chang5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("chang6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("chang7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		
		$("#chang55").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro5;
			problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			problem1 += pro5;
			if(document.getElementById("chang2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("chang3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("chang4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("chang1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("chang6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("chang7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#chang66").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro6;
			problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			problem1 += pro6;
			if(document.getElementById("chang2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("chang3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("chang4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("chang5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("chang1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("chang7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#chang66").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro6;
			problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			problem1 += pro6;
			if(document.getElementById("chang2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("chang3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("chang4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("chang5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("chang7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("chang1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		
		$("#chang77").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro7;
			problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			problem1 += pro7;
			if(document.getElementById("chang2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("chang3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("chang4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("chang5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("chang6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("chang1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
	}
	
	function yanzheng11(datatab2){
		var problem1 = "";
		$("#ping11").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro1;
			problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			problem1 += pro1;
			if(document.getElementById("ping2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ping3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ping4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ping5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ping6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("ping7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("ping8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ping1").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),'');
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ping22").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro2;
			problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			problem1 += pro2;
			if(document.getElementById("ping1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("ping3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ping4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ping5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ping6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("ping7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("ping8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ping2").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ping33").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro3;
			problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			problem1 += pro3;
			if(document.getElementById("ping1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("ping2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ping4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ping5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ping6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("ping7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("ping8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ping3").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ping44").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro4;
			problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			problem1 += pro4;
			if(document.getElementById("ping1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("ping2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ping3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ping5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ping6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("ping7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("ping8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ping4").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ping55").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro5;
			problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			problem1 += pro5;
			if(document.getElementById("ping1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("ping2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ping3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ping4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ping6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("ping7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("ping8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ping5").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ping66").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro6;
			problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			problem1 += pro6;
			if(document.getElementById("ping1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("ping2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ping3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ping4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ping5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ping7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			if(document.getElementById("ping8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ping6").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ping77").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro7;
			problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			problem1 += pro7;
			if(document.getElementById("ping1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("ping2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ping3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ping4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ping5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ping6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("ping8").checked){
				problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ping7").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
		$("#ping88").click(function(){
     		var pro = document.getElementById("jdjcproblem").value;
			var pro1 = datatab2[0].jianchaneirong + ":" + "否" +"\n";
			var pro2 = datatab2[1].jianchaneirong + ":" + "否" +"\n";
			var pro3 = datatab2[2].jianchaneirong + ":" + "否" +"\n";
			var pro4 = datatab2[3].jianchaneirong + ":" + "否" +"\n";
			var pro5 = datatab2[4].jianchaneirong + ":" + "否" +"\n";
			var pro6 = datatab2[5].jianchaneirong + ":" + "否" +"\n";
			var pro7 = datatab2[6].jianchaneirong + ":" + "否" +"\n";
			var pro8 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			problem1 += pro8;
			problem1 = problem1.replace(new RegExp(pro8, 'gm'),''); 
			problem1 += pro8;
			if(document.getElementById("ping1").checked){
				problem1 = problem1.replace(new RegExp(pro1, 'gm'),''); 
			}
			if(document.getElementById("ping2").checked){
				problem1 = problem1.replace(new RegExp(pro2, 'gm'),''); 
			}
			if(document.getElementById("ping3").checked){
				problem1 = problem1.replace(new RegExp(pro3, 'gm'),''); 
			}
			if(document.getElementById("ping4").checked){
				problem1 = problem1.replace(new RegExp(pro4, 'gm'),''); 
			}
			if(document.getElementById("ping5").checked){
				problem1 = problem1.replace(new RegExp(pro5, 'gm'),''); 
			}
			if(document.getElementById("ping6").checked){
				problem1 = problem1.replace(new RegExp(pro6, 'gm'),''); 
			}
			if(document.getElementById("ping7").checked){
				problem1 = problem1.replace(new RegExp(pro7, 'gm'),''); 
			}
			document.getElementById("jdjcproblem").value = problem1;
		});
		$("#ping8").click(function(){
			var pro = document.getElementById("jdjcproblem").value;
			var plm1 = datatab2[7].jianchaneirong + ":" + "否" +"\n";
			var to = pro.replace(new RegExp(plm1, 'gm'),''); 
			document.getElementById("jdjcproblem").value = to;
		});
	}
	