function send_ajax(url,method,data,content_response,callback){
    $.ajax({
        url: url,
        method:method,
        data:data,
        dataType: "JSON",
        success: function(response){
            if(content_response){
                content_response.html(response);
            }
            if(callback){
                callback(response);
            }
        },
        error:function(err){
            console.log(err);
            waiting_for_a_response(false);
        }
    });
}
