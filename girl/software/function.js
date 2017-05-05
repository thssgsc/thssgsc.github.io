$(function () {
    var scrtime;
    var $ul = $("#con ul");
    var liFirstHeight = $ul.find("li:first").height();//第一个li的高度
    $ul.css({ top: "-" + liFirstHeight - 20 + "px" });//利用css的top属性将第一个li隐藏在列表上方     因li的上下padding:10px所以要-20
    $("#con").hover(function () {
        $ul.pause();//暂停动画
        clearInterval(scrtime);
    }, function () {
        $ul.resume();//恢复播放动画  
        scrtime = setInterval(function scrolllist() {
            //动画形式展现第一个li
            $ul.animate({ top: 0 + "px" }, 1500, function () {
                //动画完成时
                $ul.find("li:last").prependTo($ul);//将ul的最后一个剪切li插入为ul的第一个li
                liFirstHeight = $ul.find("li:first").height();//刚插入的li的高度
                $ul.css({ top: "-" + liFirstHeight - 20 + "px" });//利用css的top属性将刚插入的li隐藏在列表上方  因li的上下padding:10px所以要-20                
            });
        }, 3300);
    }).trigger("mouseleave");//通过trigger("mouseleave")函数来触发hover事件的第2个函数
	
});

$(document).ready(function(){
	$("#send").click(function(){
		var name = $("input#name").val();
        var message = $("input#message").val();
		$.ajax({ url: "notes/writeMessage.jsp", type:"post",data:{name:name, message:message}, success: function(){
                   alert("发送成功");
      }});
						  
	});
	function show(){
			$.ajax({ url: "notes/getMessage.jsp", success: function(feedback){
						
						var messages = feedback.split("\n")
						var count1 = 0, count2 = 0
						for(var i = 0; i <= 20; i ++){

							items = messages[i]
							if(items != ""){

								attrs = items.split("#");
								if(attrs.length >= 2){
																								count1 += 1
									name = attrs[0];
									content = attrs[1];
									date = attrs[2];
									var htmlContent = '<li><div class="div_right"> ' + name + ':' + content + '<div class="twit_item_time">' + date + '</div></div></li>'

									$("#notes").append(htmlContent);
								}
							}
						}
						
						for(var i = count1; i >0  && i > count1 - 17; i --){
						items = messages[i]
							if(items != ""){
								attrs = items.split("#");
								if(attrs.length == 3){
									count2 +=1 
									$("li:first").remove();
								}
							}
						}
						
	
		  }});
	  }


	var t = window.setInterval(show,3000);

})

