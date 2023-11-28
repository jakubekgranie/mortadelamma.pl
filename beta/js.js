function interval(data){
    var countDownDate = new Date(data).getTime();
    var x = setInterval(function() {

    var now = new Date().getTime();

    var distance = countDownDate - now;

    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    document.getElementById("watch").innerHTML = days + ":" + hours + ":" +
    + ":" + minutes + ":" + seconds;

    if (distance < 0) {
        clearInterval(x);
        document.getElementById("demo").innerHTML = "OGLĄDAJ";
    }
    }, 1000);
}