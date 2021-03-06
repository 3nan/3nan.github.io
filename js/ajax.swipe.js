// Generated by CoffeeScript 1.7.1
$(function() {
  var mySwiper;
  mySwiper = $('.swiper-container').swiper({
    mode: 'horizontal',
    loop: true,
    grabCursor: true,
    onSlideChangeStart: function() {
      $('.profile').find('dd').css({
        'opacity': 0
      });
      return false;
    },
    onSlideChangeEnd: function(swiper) {
      $(swiper.activeSlide()).callJojoAjax();
    }
  });
  $.fn.callJojoAjax = function() {
    var jqProfile;
    jqProfile = $('.profile');
    this.each(function() {
      var jqDiv, jqImg, url;
      console.log($(this));
      jqDiv = this;
      url = "json/" + ($(this).data('id')) + ".json";
      jqImg = $(jqDiv).find('img');
      if (jqImg.length > 0) {
        jqProfile.find('dl.name dd').css({
          'opacity': 100
        }).text($(jqDiv).data().name);
        jqProfile.find('dl.description dd').css({
          'opacity': 100
        }).html($(jqDiv).data().description);
        return false;
      }
      $.ajax({
        'url': url,
        'dataType': 'json',

        /*ajax通信前の処理 */
        'beforeSend': function() {
          $(jqDiv).text('LODING...');
        },

        /*成功時の処理 */
        'success': function(data, status, xhr) {
          var jsonData;
          jsonData = data;
          console.log(jsonData.image);

          /*画像を追加 */
          $(jqDiv).append(function() {
            var jqImg2;
            jqImg2 = $(this).text(' ').find('img').attr('src', jsonData.image);
            console.log(jqImg2);
            if (!(jqImg2.length > 0)) {
              return $('<img/>').css({
                'width': 580,
                'margin': 'auto',
                'display': 'block'
              }).attr('src', jsonData.image);
            }
          });
          $(jqDiv).data({
            'name': jsonData.name,
            'description': jsonData.discription
          });
          jqProfile.find('dl.name dd').css({
            'opacity': 100
          }).text($(jqDiv).data().name);
          jqProfile.find('dl.description dd').css({
            'opacity': 100
          }).html($(jqDiv).data().description);
        },

        /*失敗時の処理 */
        'error': function(XMLHttpRequest, textStatus, errorThrown) {
          alert('なんらかのエラーが発生しました。');
          console.log(XMLHttpRequest);
        }
      });

      /*falseを返す */
    });
    return false;
  };
  $(mySwiper.activeSlide()).callJojoAjax();
  console.log(mySwiper);
});
