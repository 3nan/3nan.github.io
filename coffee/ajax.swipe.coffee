$ ->
    mySwiper = $('.swiper-container').swiper
        #オプションをここに:
        mode:'horizontal'
        loop: true
        grabCursor:true

        onSlideChangeStart:->
            $('.profile').find('dd').css('opacity':0)
            false
        onSlideChangeEnd: (swiper)->
            $(swiper.activeSlide()).callJojoAjax()
            return 

    $.fn.callJojoAjax  =  ->
        jqProfile = $('.profile')
       
        @.each ->
            console.log $(@)
            jqDiv = @
            url = "json/#{$(@).data('id')}.json"
            jqImg = $(jqDiv).find('img')
            #console.log jqImg
            if  jqImg.length>0
                
                jqProfile.find('dl.name dd').css('opacity':100).text($(jqDiv).data().name)
                jqProfile.find('dl.description dd').css('opacity':100).html($(jqDiv).data().description)
                return false
                
            $.ajax
                'url' : url
                'dataType' : 'json'
                ###ajax通信前の処理###
                'beforeSend' : ->
                    $(jqDiv).text('LODING...')
                    return
                ###成功時の処理###
                'success' : (data ,status ,xhr) ->
                    jsonData = data
                    console.log jsonData.image
                    ###画像を追加###
                    #alert $('<img>').attr('src', jsonData.image).html()
                    $(jqDiv).append ->
                        jqImg2 = $(@).text(' ').find('img').attr('src',jsonData.image)
                        console.log jqImg2
                        unless  jqImg2.length > 0
                            return $('<img/>').css
                                'width':580
                                'margin':'auto'
                                'display':'block'
                            .attr('src',jsonData.image) 


                    $(jqDiv).data
                        'name':jsonData.name
                        'description':jsonData.discription
                    jqProfile.find('dl.name dd').css('opacity':100).text($(jqDiv).data().name)
                    jqProfile.find('dl.description dd').css('opacity':100).html($(jqDiv).data().description)
    
                    return
                ###失敗時の処理###
                'error'   : (XMLHttpRequest ,textStatus, errorThrown) ->
                
                    alert('なんらかのエラーが発生しました。')
                    console.log(XMLHttpRequest)
                    return
            return

            ###falseを返す###
        return false

    $(mySwiper.activeSlide()).callJojoAjax()
    console.log mySwiper
    return