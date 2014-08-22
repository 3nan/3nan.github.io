$ ->

    ### 
    #
    # Json データからジョジョの情報を取ってくる。
    # プログラムで動的に取ってこれないのですでに作成されているjsonファイルしか取れないが
    # phpでやってるのはDBなどからデータをとってきてそれを動的にjsonファイルを作成しているだけである
    #
    ###

    ###
    # 初期表示
    # いろいろと設定を行い,全て非表示
    ####
    jqPlayerInfo = $('ul.playerInfo').css('list-style':'none')
    jqLoadingBox = $('div.loadingBox').hide().css('height':300)
    jqLoadingBox.find('p').css
        'display':'block'
        'margin':'50px auto 10px'
    $('div.contentViewer').css('height':600)

    ###
    # # リンクをクリックすると主人公の画像、名前、台詞をサーバーから取得する
    ###
    $('a.callJojoAjax').click ->
        ###URLを取得する####
        url = "json/#{$(@).data('jojo')}.json"
        ### ajax通信開始 ###
        
        $.ajax
            'url' : url
            'dataType' : 'json'
            ###ajax通信前の処理###
            'beforeSend' : ->
                jqPlayerInfo.hide()
                jqLoadingBox.show()
                return
            ###成功時の処理###
            'success' : (data ,status ,xhr) ->
                jsonData = data
                ###画像を追加###
                jqPlayerInfo.find('li.img').append ->
                    jqImg = $(@).find('img').css('width':300).attr('src' , jsonData.image)
                    return $('<img/>').css('width':300).attr('src' , jsonData.image) if jqImg == null || jqImg.length == 0

                ###1.5秒後に表示####
                setTimeout ->
                    ###名前と台詞セット###
                    jqPlayerInfo.find('li.name span.content').text(jsonData.name)
                    jqPlayerInfo.find('li.serif span.content').html(jsonData.discription)

                    ###表示領域とローディング領域を表示・非表示###
                    jqPlayerInfo.show()
                    jqLoadingBox.hide()

                    return
                ,1500
                return
            ###失敗時の処理###
            'error'   : (XMLHttpRequest ,textStatus, errorThrown) ->
                jqLoadingBox.hide()
                alert('なんらかのエラーが発生しました。')
                console.log(XMLHttpRequest)
                return

        ###falseを返す###
        return false
    return