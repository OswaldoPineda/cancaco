$(document).ready(function() {
  function buidCarousel(slides) {
    switch (slides) {
      case '1':
        return [
          {
            breakpoint: 3100,
            settings: {
              slidesToShow: 1
            }
          }
        ];
      case '2':
        return [
          {
            breakpoint: 3100,
            settings: {
              slidesToShow: 2
            }
          },
          {
            breakpoint: 480,
            settings: {
              slidesToShow: 1
            }
          }
        ];
      case '3':
        return [
          {
            breakpoint: 3100,
            settings: {
              slidesToShow: 3
            }
          },
          {
            breakpoint: 600,
            settings: {
              slidesToShow: 2
            }
          },
          {
            breakpoint: 480,
            settings: {
              slidesToShow: 1
            }
          }
        ];
      default:
        return [
          {
            breakpoint: 3100,
            settings: {
              slidesToShow: 6
            }
          },
          {
            breakpoint: 1700,
            settings: {
              slidesToShow: 5
            }
          },
          {
            breakpoint: 1400,
            settings: {
              slidesToShow: 4
            }
          },
          {
            breakpoint: 950,
            settings: {
              slidesToShow: 3
            }
          },
          {
            breakpoint: 800,
            settings: {
              slidesToShow: 2
            }
          },
          {
            breakpoint: 550,
            settings: {
              slidesToShow: 1
            }
          }
        ];
    }
  }
  var slides = $('.carousel').attr('latest');

  $('.carousel').slick({
    infinite: true,
    speed: 300,
    slidesToScroll: 1,
    adaptiveWidth: true,
    responsive: buidCarousel(slides)
  });

});
