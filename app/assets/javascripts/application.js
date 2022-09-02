// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.mask
//= require rails-ujs
//= require activestorage

//= require_tree .
//= require moment
//= require bootstrap-datetimepicker

jQuery(function($){
  // require turbolinks
  $("#cnic").mask("99999-9999999-9");
  $('#datetimepicker5').datetimepicker({
    format: 'YYYY-MM-DD HH:mm:ss',
  });
})

function getTimeRemaining(endtime) {
  const endtimeDate = endtime

  const total = Date.parse(endtimeDate) - Date.parse(new Date());
  if (total <= 0){
    return {
      total: 0,
      days: 0,
      hours: 0,
      minutes: 0,
      seconds: 0,
    };
  }
  const seconds = Math.floor((total / 1000) % 60);
  const minutes = Math.floor((total / 1000 / 60) % 60);
  const hours = Math.floor((total / (1000 * 60 * 60)) % 24);
  const days = Math.floor(total / (1000 * 60 * 60 * 24));
  return {
    total,
    days,
    hours,
    minutes,
    seconds,
  };
}

 function initializeClock(id) {
  const endtime = document.getElementById("auctionEndTime");
  if(endtime) {
    const innerEndtime = endtime.innerText
    const clock = document.getElementById(id);
    const daysSpan = clock.querySelector(".days");
    const hoursSpan = clock.querySelector(".hours");
    const minutesSpan = clock.querySelector(".minutes");
    const secondsSpan = clock.querySelector(".seconds");

    function updateClock() {
      const t = getTimeRemaining(innerEndtime);

      daysSpan.innerHTML = t.days;
      hoursSpan.innerHTML = ("0" + t.hours).slice(-2);
      minutesSpan.innerHTML = ("0" + t.minutes).slice(-2);
      secondsSpan.innerHTML = ("0" + t.seconds).slice(-2);

      if (t.total <= 0) {
        clearInterval(timeinterval);
        alert("Voting Time is Over")
        document.getElementById('votes_final').classList.remove('d-none')
      }
    }

    updateClock();
    const timeinterval = setInterval(updateClock, 1000);
  }
}
