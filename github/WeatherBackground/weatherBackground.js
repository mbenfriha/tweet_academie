


$(document).ready(function() {
    navigator.geolocation.getCurrentPosition(function(position) {
        loadWeather(position.coords.latitude+','+position.coords.longitude); //load weather using your lat/lng coordinates
    });
});

function loadWeather(location, woeid) {
    $.simpleWeather({
        location: ('Lyon'),
        woeid: woeid,
        unit: 'c',
        success: function(weather) {

            console.log(weather.currently);
           var weather1 = weather.currently;
            $('body').css('background-repeat', 'no-repeat').css('background-size', 'cover');

            if (weather1 == 'Fair') {
                console.log('beau');
                $('body').css("background-image", "url(http://sosduneterrienneendetresse.s.o.pic.centerblog.net/8wjw3746.jpg)");
            }

            else if (weather1 == 'Light Snow') {
                console.log('beau');
                $('body').css("background-image", "url(http://www.resizup.com/images/2015/02/10/pont-usa-hiver-new-york-neige-ville.jpg)");
            }
            else if (weather1 == 'Fair/Windy') {
                console.log('beau');
                $('body').css("background-image", "url(http://www.resizup.com/images/2015/02/10/pont-usa-hiver-new-york-neige-ville.jpg)");
            }

        },
        error: function(error) {
            $("#weather").html('<p>'+error+'</p>');
        }
    });
}




