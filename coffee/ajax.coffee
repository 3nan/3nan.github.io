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
  playerInfo = $('ul.playerInfo').css('list-style':'none')
  loadingBox = $('div.loadingBox').hide().css('height':300)
  loadingBox.find('p').css
    'display':'block'
    'margin':'50px auto 10px'
  $('div.contentViewer').css('height':600)

  ###
  # リンクをクリックすると主人公の画像、名前、台詞をサーバーから取得する
  ###
  $('a.callJojoAjax').click ->
    ###URLを取得する####
    url = "json/#{$(this).data('jojo')}.json"
    ### ajax通信開始 ###
    $.ajax
      'url':url
      'dataType':'json'
      'beforeSend':->
        playerInfo.hide()
        loadingBox.show()
      
        return
      'success':(data ,status ,xhr) ->

        jsonData = data
        ###画像を追加###
        playerInfo.find('li.img').append ->
          jqImg = $(@).find('img').css('width':300)
          return $('<img/>').css('width':300) if jqImg == null || jqImg.length == 0

        ###
        # 取得したJsonを加工して表示する
        # プリロード
        ###
        $("<img>").attr("src", jsonData.image )

        ###1秒後に表示####
        setTimeout ->
          ###画像を設定###
          playerInfo.find('li.img').find('img').attr 'src',->
            jsonData.image
          ###名前と台詞セット###
          playerInfo.find('li.name span.content').text(jsonData.name)
          playerInfo.find('li.serif span.content').html(jsonData.discription)

          ###表示領域とローディング領域を表示・非表示###
          playerInfo.show()
          loadingBox.hide()

          return
        ,1500
        return
      'error'   :(XMLHttpRequest ,textStatus, errorThrown) ->
        loadingBox.hide()
        alert('なんらかのエラーが発生しました。'+textStatus)
        console.log XMLHttpRequest
        return
        
    ###falseを返すことでクリック時のよけいな画面移動を抑える###
    return false
  return
  
    
  