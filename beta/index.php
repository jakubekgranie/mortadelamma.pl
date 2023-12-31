<!DOCTYPE html>
<html lang="pl">
    <head>
        <meta name="charset" content="UTF-8">
        <link href="css-mortadelamma.css" rel="stylesheet">
        <script type="text/javascript">
            function animationForwarder(identifier, identifier2, anim_id, wait_time = 0){
                if(identifier != 'skip')
                    document.getElementById(identifier).classList.add(anim_id);
                setTimeout(() => {document.getElementById(identifier2).classList.add(anim_id)}, wait_time);
            }
            window.onload = () => {
            let ids = ["mm", "mm4", "mm5", "mm6"]; //ids
            let func = [() => {animationForwarder("mm2", "mm3", "anim-fadeInTT", 100)}, 
                        () => {animationForwarder("skip", "mm4", "anim-fadeInTT", 100)}, 
                        () => {animationForwarder("skip", "mm5", "anim-fadeInTT", 100)},
                        () => {animationForwarder("skip", "mm6", "anim-fadeInTT", 100)}
                    ]; //animations

            function callback(entries, observer, index){
                entries.forEach((entry) => {
                    if(entry.isIntersecting){
                        func[index]();
                        observer.disconnect();
                    }
                })
            }
            let observeDataSmall = {
                root: null,
                rootMargin: "0px",
                threshold: 0.4,
            };
            ids.forEach((value, index) => {
                let observer = new IntersectionObserver((entries, observer) => {
                    callback(entries, observer, index);
                }, observeDataSmall);
                observer.observe(document.getElementById(value));
            });
                }
                var countDownDate = new Date("Dec 1, 2023 12:37:25").getTime();
                var x = setInterval(function() {
                    var now = new Date().getTime();

                    var distance = countDownDate - now;

                    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                    document.getElementById("watch").innerHTML = days + ":" + hours + ":" + minutes + ":" + seconds;

                    if (distance < 0) {
                        clearInterval(x);
                        document.getElementById("demo").innerHTML = "OGLĄDAJ";
                    }
                }, 1000);
        </script>
        <meta name="author" content="Jakub Namyślak, Michał Opałka">
        <meta name="description" content="Mortadela MMA to portal dedykowany najmięsistszym walkom w uniwersum!">
        <meta name="owner" content="Jakub Namyślak, Michał Opałka">
        <meta name="coverage" content="Worldwide">
        <meta name="rating" content="General">
        <meta name='HandheldFriendly' content='True'>
        <meta name='copyright' content='Jakub Namyślak, Michał Opałka'>

        <link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png">
        <link rel="manifest" href="site.webmanifest">
        <link rel="mask-icon" href="safari-pinned-tab.svg" color="#5bbad5">
        <meta name="msapplication-TileColor" content="#62061f">
        <meta name="theme-color" content="#410101">

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=PT+Sans+Narrow&family=Raleway&display=swap" rel="stylesheet">
        <link rel="stylesheet" media="screen" href="https://fontlibrary.org//face/archicoco" type="text/css">

        <title>MORTADELA MMA</title>
    </head>
    <body>
        <nav class="nav fx fx-jc-spb fx-ai-c bs-bb">
            <a href="../" class="nav-button-text fx fx-ai-c fx-jc-c h-100p">
                <img class="nav-logo standard-drop-shadow" src="RESOURCES/mortadela.png" alt="logo">
                <span class="fx fx-ai-c fx-jc-c nav-logo-text ff-archicoco gradient-text mortadela-text-gradient">M MMA</span>
            </a>
            <div class="button-cont fx h-100p">
                <a class="nav-button nav-button-text ff-ptsans gradient-text nav-button-watch nav-button-anim pos-rel fx fx-ai-c fx-jc-c h-100p mg-r-0p75" href="https://www.youtube.com/@m1choo"><p id="watch">OBEJRZYJ</p></a>
                <a class="nav-button nav-button-text ff-ptsans c-white nav-button-anim pos-rel fx fx-ai-c fx-jc-c h-100p mg-r-0p75"><p>EVENTY</p></a>
                <a class="nav-button nav-button-text ff-ptsans c-white nav-button-anim pos-rel fx fx-ai-c fx-jc-c h-100p mg-r-0p75"><p>ZAWODNICY</p></a>
                <a class="nav-button nav-button-text ff-ptsans c-white nav-button-anim pos-rel fx fx-ai-c fx-jc-c h-100p"><p>ZAREJESTRUJ</p></a>
            </div>
        </nav>
        <header class="h-100vh pos-rel">
            <div class="fx h-100p">
                <div class="header-side sides-static side-1"></div>
                <div class="header-side sides-static side-2"></div>
                <div class="header-side side-abs-background side-abs h-100vh pos-abs"></div>
                <div class="header-side sides-static side-3 side-abs h-100vh pos-abs"></div>
            </div>
            <div id="mm" class="mmma-header-blob fx-dir-c pos-abs fx fx-ai-c fx-jc-c">
                <img id="mm2" class="header-image standard-drop-shadow op-0" src="RESOURCES/mamm0n2.png" alt="logo">
                <p id="mm3" class="nav-button-watch ff-archicoco gradient-text standard-drop-shadow op-0">MORTADELA MMA</p>
            </div>
        </header>
        <main class="standard-section bs-bb fx fx-ai-c fx-jc-c fx-dir-c">
            <div id="mm4" class="fx fx-ai-c fx-jc-c fx-dir-c op-0">
                <?php
                    $servername = 'localhost';
                    $username = 'inputoutput';
                    $password = '123';
                    $dbname = 'mortadelamma';

                    $conn = mysqli_connect($servername, $username, $password, $dbname);
                    $sql = "SELECT pelna_nazwa_gali, opis_gali FROM gale ORDER BY data_gali;";
                    $result = mysqli_query($conn, $sql);
                    while($row = mysqli_fetch_array($result)){
                        echo "<h1 class='mg-none standard-header ff-archicoco'>".$row["pelna_nazwa_gali"]."</h1>";
                        echo "<p class='c-white standard-paragraph'>".$row['opis_gali']."</p>";
                        break;
                    }
                    mysqli_close($conn);
                ?>
            </div>
            <hr class="hr">
            <h1 id="mm5" class='mg-none standard-header ff-archicoco op-0'>NASZE DUMY</h1>
            <div id="mm6" class="fx fx-ai-c op-0">
                <div class="fx fx-ai-c fx-jc-c fx-dir-c mg-r-2vw">
                    <img class="zawodnik" src="../zawodnikos/jakubcz.png">
                    <p class="standard-paragraph c-white">Jakub Czerniak</p>
                </div>
                <div class="fx fx-ai-c fx-jc-c fx-dir-c mg-r-2vw">
                    <img class="zawodnik" src="../zawodnikos/tomaszr.png">
                    <p class="standard-paragraph c-white">Tomasz Róg</p>
                </div>
                <div class="fx fx-ai-c fx-jc-c fx-dir-c mg-r-2vw">
                    <img class="zawodnik" src="../zawodnikos/olivers.png">
                    <p class="standard-paragraph c-white">Oliver Skiba</p>
                </div>
                <div class="fx fx-ai-c fx-jc-c fx-dir-c mg-r-2vw">
                    <img class="zawodnik" src="../zawodnikos/maksj.png">
                    <p class="standard-paragraph c-white">Maks Janiszewski</p>
                </div>
            </div>
        </main>
        <footer class="footer fx fx-ai-c fx-jc-c">
            <p class="standard-paragraph">Jakub Namyślak i Michał Opałka</p>
        </footer>
    </body>
</html>