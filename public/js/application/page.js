$('document').ready(function(){
    $('.close').click(function (){
        $('.alert-danger').fadeOut("slow");
    });
});

$('#form').submit(function (event) {

    var postData = $(this).serializeArray();
    $('#domain').val('');
    $('.alert-info').delay(1000).fadeIn("slow");

    $.ajax(
        {
            url : "/restart",
            type: "POST",
            data : postData,
            success:function(data, textStatus, jqXHR)
            {
                $('.alert-info').fadeOut("slow");
                $('.alert-success').delay(1000).fadeIn("slow");
                $('.alert-success').delay(5000).fadeOut("slow");

            },
            error: function(jqXHR, textStatus, errorThrown)
            {
                $('#error').text('Something went wrong... ' + jqXHR.responseText);
                $('.alert-info').fadeOut("slow");
                $('.alert-danger').delay(1000).fadeIn("slow");
            }
        });
    event.preventDefault();
});