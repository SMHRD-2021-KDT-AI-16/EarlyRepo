// campland-N3 [dsLQ6cqkcE]
(function() {
  $(function() {
    $(".campland-N3").each(function() {
      const $block = $(this);
      // Swiper
      const swiper = new Swiper(".campland-N3 .contents-swiper", {
        slidesPerView: 1,
        spaceBetween: 0,
        allowTouchMove: false,
        loop: true,
        autoplay: {
          delay: 5000,
        },
        pagination: {
          el: ".campland-N3 .swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".campland-N3 .swiper-button-next",
          prevEl: ".campland-N3 .swiper-button-prev",
        },
      });
      // Swiper Play, Pause Button
      const pauseButton = $block.find('.swiper-button-pause');
      const playButton = $block.find('.swiper-button-play');
      playButton.hide();
      pauseButton.show();
      pauseButton.on('click', function() {
        swiper.autoplay.stop();
        playButton.show();
        pauseButton.hide();
      });
      playButton.on('click', function() {
        swiper.autoplay.start();
        playButton.hide();
        pauseButton.show();
      });
    });
  });
})();
// campland-N6 [GpLQ6CqkE7]
(function() {
  $(function() {
    $(".campland-N6").each(function() {
      const $block = $(this);
      // Swiper
      const swiper = new Swiper(".campland-N6 .contents-swiper", {
        slidesPerView: 1,
        spaceBetween: 0,
        allowTouchMove: false,
        loop: true,
        autoplay: {
          delay: 5000,
        },
        navigation: {
          nextEl: ".campland-N6 .swiper-button-next",
          prevEl: ".campland-N6 .swiper-button-prev",
        },
      });
    });
  });
})();
// campland-N18 [kiLqd3KBLI]
(function() {
  $(function() {
    $(".campland-N18").each(function() {
      const $block = $(this);
      const $calendar = $block.find(".contents-date");
      const weekday = new Array(7);
      weekday[0] = "일";
      weekday[1] = "월";
      weekday[2] = "화";
      weekday[3] = "수";
      weekday[4] = "목";
      weekday[5] = "금";
      weekday[6] = "토";
      // Date Range Picker
      $calendar.dateRangePicker({
        locale: {
          format: "YYYY-MM-DD",
        },
        container: ".campland-N18 .calendar-wrap",
        language: "custom",
        inline: true,
        alwaysOpen: true,
        stickyMonths: true,
        hoveringTooltip: false,
        extraClass: "date-range-picker19",
        SingleMonth: "false",
        separator: " to ",
        getValue: function() {
          if ($(".date-range200").val() && $(".date-range201").val()) return ($(".date-range200").val() + " to " + $(".date-range201").val());
          else return "";
        },
        setValue: function(s, s1, s2) {
          let first = new Date(s1).getDay();
          let last = new Date(s2).getDay();
          console.log(first);
          $(".date-range200").val(s1.replaceAll("-", ".") + weekday[first]);
          $(".date-range201").val(s2.replaceAll("-", ".") + weekday[last]);
        },
        customArrowPrevSymbol: '<i class="icon icon-arrow-left"></i>',
        customArrowNextSymbol: '<i class="icon icon-arrow-right"></i>',
      }).bind("datepicker-first-date-selected", function(event, obj) {
        console.log(obj);
        if ($(".last-date-selected") && !$(".first-date-selected")) {
          setTimeout(function() {
            $(".first-date-selected").parent().addClass("first");
          }, 10);
        } else {
          $("td").removeClass();
        }
      }).bind("datepicker-change", function(event, obj) {
        console.log(obj);
        $(".first-date-selected").parent().addClass("first");
        setTimeout(function() {
          if (!$(".last-date-selected").parent().addClass("last")) {
            $(".last-date-selected").parent().addClass("last");
          } else if ($(".last-date-selected").parent().addClass("last")) {
            $(".first-date-selected").parent().addClass("first");
          }
        }, 10);
      });
      // Amount Count Button Click Event
      $block.find(".contents-amount").each(function() {
        const $this = $(this);
        const $amountNumElement = $this.find(".contents-amount-num span");
        $this.on("click", ".btn-minus", function() {
          let amountNum = parseInt($amountNumElement.text());
          if (amountNum > 1) {
            amountNum--;
          }
          $amountNumElement.text(amountNum);
        });
        $this.on("click", ".btn-plus", function() {
          let amountNum = parseInt($amountNumElement.text());
          amountNum++;
          $amountNumElement.text(amountNum);
        });
      });
    });
  });
})();