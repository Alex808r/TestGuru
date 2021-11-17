document.addEventListener('turbolinks:load', function () {
    let timer = document.querySelector('.timer');

    if (timer) { startTimer(timer) }
})

function startTimer(timer) {
    // convert minutes to milliseconds
    let startTime = new Date(timer.dataset.time_start).getTime();
    let duration = parseInt(timer.dataset.duration)*60*1000;
    let endTime = new Date(startTime + duration).getTime();

    const timerInterval = setInterval(function () {
        let currentTime = new Date().getTime();
        let timeLeft = endTime - currentTime;

        if (timeLeft <= 0) {
            clearInterval(timerInterval);
            //document.getElementsByClassName("submit")[0].click()
            document.form.submit[0].click()
        } else {
            let minutes = parseInt(timeLeft / 60000);
            let seconds = parseInt(timeLeft % 60000) / 1000;

            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds.toFixed(0) : seconds.toFixed(0);

            timer.innerHTML = minutes + ':' + seconds;
        }
    }, 1000);
}
