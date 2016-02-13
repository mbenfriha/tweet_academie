$(document).ready(function() {
    /**
     *
     * Formulaire de connexion et d'inscription
     *
     *
     */
    $('.input input').focus(function() {
        $(this).parent('.input').each(function() {
            $('label', this).css({
                "line-height": "18px",
                "font-size": "18px",
                "font-weight": "100",
                "top": "0px"
            });

            $('.spin', this).css({
                "width": "100%"
            });
        });
    }).blur(function() {
        $('.spin').css({
            "width": "0px"
        });

        if ($(this).val() === '') {
            $(this).parent('input').each(function() {
                $('label', this).css({
                    "line-height": "60px",
                    "font-size": "24px",
                    "font-weight": "300",
                    "top": "10px"
                });
            });
        }
    });

    $('.button').on('click', function(e) {
        $("button", this).addClass('active');
    });

    $(".alt-2").on('click', function() {
        if (!$(this).hasClass('material-button')) {
            $(".shape").css({
                "width": "100%",
                "height": "100%",
                "transform": "rotate(0deg)"
            });

            setTimeout(function() {
                $(".overbox").css({
                    "overflow": "initial"
                })
            }, 600);

            $(this).animate({
                "width": "140px",
                "height": "140px"
            }, 500, function() {
                $(".box").removeClass("back");

                $(this).removeClass('active')
            });

            $(".overbox .title").fadeOut(300);
            $(".overbox .input").fadeOut(300);
            $(".overbox .button").fadeOut(300);

            $(".alt-2").addClass('material-buton');
        }
    });

    $(".material-button").on('click', function() {
        if ($(this).hasClass('material-button')) {
            setTimeout(function() {
                $(".overbox").css({
                    "overflow": "hidden"
                });

                $(".box").addClass("back");
            }, 200);

            $(this).addClass('active').animate({
                "width": "700px",
                "height": "1000px"
            });

            setTimeout(function() {
                $(".shape").css({
                    "width": "50%",
                    "height": "50%",
                    "transform": "rotate(45deg)"
                });

                $(".overbox .title").fadeIn(300);
                $(".overbox .input").fadeIn(300);
                $(".overbox .button").fadeIn(300);
            }, 700);

            $(this).removeClass('material-button');
        }

        if ($(".alt-2").hasClass('material-buton')) {
            $(".alt-2").removeClass('material-buton');
            $(".alt-2").addClass('material-button');
        }
    });




    // Material button
    $('button:not(.close-button)').rippleBounce();

    $('#next_step_2').on('click', function(){
        $('#step_1').hide();
        $('#step_2').show();
    });
    $('#preview_step_1').on('click', function(){
        $('#step_2').hide();
        $('#step_1').show();
    });



    /**
     *
     * search user
     *
     *
     */


    $('#searchU').on('keyup', function(e){
       e.preventDefault();
            $.post('http://localhost/Projet_Web_tweet_academie/public/message/search', {searchU: $('#searchU').val()}, function (data, textStatus, xhr) {
                $('#all_message').html(data);
            })
    });


    $('submit_message').on('click', function(e){
        e.preventDefault();
        $.post('http://localhost/Projet_Web_tweet_academie/public/message/send_message', {new_message: $('#message').val(), expediteur_id: }, function (data, textStatus, xhr) {
            $('#all_message').html(data);
        })

    })
});