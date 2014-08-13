$ ->

    ###
    #リストのタイトルをクリックしたら、
    #リストの詳細が表示されるjavascript
    ####
    $('ul.jsSample li').click ->
       
        # クリックしたリストのspan.contentにある文言取得(cssで非表示にされている)
        _text = $( @).find('span.content').text()
        
        #取得した文言をcontantView クラスをもつdivの中に記述する
        $('div.contentViewer').text(_text)
        false


    return false
