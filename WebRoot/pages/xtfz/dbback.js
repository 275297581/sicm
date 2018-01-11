	$(document).ready(function(){
		 querydbs(1);
     });
     var dbs;
     function querydbs(index){
     	/* $.blockUI();*/
     	var param = {index:index,Rand:Math.random()};
		var url="/querydbbackup";
		$.getJSON(url,param,function(data){
			/* $.unblockUI();*/
			if(index ==1){
				var pager =spager(data.count);
				pager.onclick = function(index){
					 pagerselect(index);
				};
			}
			dbs = data.dbbacks; 
			var htmls="";
			 for(var i = 0 ; i < dbs.length;i++){
				htmls +="<tr>"+
				"<td class='tab3'>"+(i+1)+"</td>"+
				"<td class='tab3'>"+dbs[i].filename+"</td>"+ 
				"<td class='tab3'>"+dbs[i].backtime+"</td>"+ 
				"<td class='tab3'>"+dbs[i].filesize+"</td>"+
				"<td class='tab3'><input type='image' src='/icon/delete.gif'  title='删除' onmousedown='removedb("+i+")'>&nbsp;&nbsp;"+
				"<input type='image' src='/icon/retrun.png'  title='还原备份' onmousedown='dbreturn("+i+")'></td>"+
				"</tr>"; 
			}
		  $('#trs').html(htmls);
		  stab();	
		});
	}
	function pagerselect(index){
		querydbs(index);
	}
	function  backup(){
		$("#xtbfbt").attr("disabled","true");
		$("#box").show();
		var sname = $("#sname").val();
		var param = {sname:sname,Rand:Math.random()};
		var url="/backupdb";
		/* $.blockUI();*/
		$.getJSON(url,param,function(data){
			/* $.unblockUI();*/
			querydbs(1);
			$("#box").hide();
			$("#xtbfbt").removeAttr("disabled");
			alert(data.mess);
		});
	}
	function dbreturn(i){
		if(window.confirm("确定要还原该系统备份吗？")){
			var url="/returndb";
			/* $.blockUI();*/
			var param = {sname:dbs[i].filename,Rand:Math.random()};
			$.getJSON(url,param,function(data){
				/* $.unblockUI();*/
				alert(data.mess);
			});
		}
	}
	function removedb(i){
		if(window.confirm("确定要删除该系统备份吗？")){
			var url="/deletedb"; 
			var param = {sname:dbs[i].filename};
			$.getJSON(url,param,function(data){ 
				querydbs(1);
			});
		}
	}