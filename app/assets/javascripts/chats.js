$(document).ready(function(){
	PrivatePub.subscribe("/chats/index", function(data, channel) {
	$("#chat").append(data.chat_message);
	});
});


