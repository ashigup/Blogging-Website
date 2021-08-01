function likes(pid,uid,temp)
{
   console.log(pid+ "  "+uid);
   d={
           pid:pid,
           uid:uid
       }
   $.ajax({
       url:"likeServlet",
       method:"POST",
       data:d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            $(temp).children().text(" "+data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
   });
}