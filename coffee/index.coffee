$ ->

  $('ul.jsSample li,ul.jsSample2 li').each ->
    $(@).css 'color':"#457"
    return

  ###
  #リストのタイトルをクリックしたら、
  #リストの詳細が表示されるjavascript
  ####
  $('ul.jsSample li').click ->

      #色を全て変える
      $('ul.jsSample li').each ->
        $(@).css 'color':"#457"
        return
        ## クリックしたリストのspan.contentにある文言取得(cssで非表示にされている)

      strText = $(@).css('color':'red').find('span.content').text()

      ## 取得した文言をcontantView クラスをもつdivの中に記述
      $('div.contentViewer p').text(strText)
      return

      
  ###
  #リストのタイトルをクリックしたら、
  #spanのdata-contentの値を表示するjavascript
  ####
  $('ul.jsSample2 li').click ->

      ###色を全て変える###
      $('ul.jsSample2 li').each ->
        $(@).css 'color':"#457"
        return

      
      ###クリックしたリストのspan.titleにあるdata取得###
      dataList = $(@).css('color':'red').find('span.title').data()

      ###dataオブジェクトからcontetntを取得###
      strText          = dataList.content
      _selectedCount = dataList.selectedCount + 1
      $(@).find('span.title')
      .text ->
        ###無名関数で処理を定義して値を返す###
        $(@).text() + ':' + numSelectedCount
        ###その後numSelectedCountを保存###
      .data('selectedCount',numSelectedCount)
      ### 取得した文言をcontantView クラスをもつdivの中に記述###
      $('div.contentViewer2 p').text(strText)
      return


    ###
    # 配列からリストを作成する。
    # 名前と画像を設定
    ###
    imgList =
    'img1' :
      'name' :'画像１'
      'img':'jojo'
    'img2' :
      'name' :'画像２'
      'img':'dio'

    ###
    # for loopでリストをさくせい
    ###
    for _key ,_value of imgList
      ###listのjqueryObjectを作成し中にspanタグと文言を入れる###
      jqList = $('<li></li>').html("<span class='title'>#{_value.name}</span>")
      ###spantagに画像を属性として追加###
      jqList.find('span.title').data({'img':"images/#{_value.img}.jpg",'id':"jojolist-#{_key}" })
      ###データを加工された画像を追加###
      $('ul.jsSample3').append(jqList)

    ###
    #リストのタイトルをクリックしたら、
    #spanのdata-imgの画像を表示するjavascript
    ####
    $('ul.jsSample3 li').click ->
      ###画像の表示領域を取得###
      jqContentViewer = $('div.contentViewer3')
      ###色を全て変える###
      $('ul.jsSample3 li').each ->
        $(@).css 'color':"#457"
        return

      
      ###クリックしたリストのspan.titleにあるdata取得###
      dataList2 = $(@).css('color':'red').find('span.title').data()

      ###dataオブジェクトから画像をを取得###
      imgUrl  = dataList2.img
     
      ###画像の表示領域に画像を追加###
      jqContentViewer.append ->
        ###存在しないときはjQueryImgObjectを追加###
        jqImg = $(@).find('img')
        if jqImg.length == 0
          return $('<img/>')
        return 


      ###画像URLを設定###
      jqContentViewer.find('img').attr('src',imgUrl)
      return
      
    return
