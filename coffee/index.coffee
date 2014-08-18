$ ->

  colorCode = "#117221"
  ###リストの初期化：リストの色を変える###
  $('ul.jsSample li,ul.jsSample2 li').each ->
    $(@).css
      'color':colorCode
      'cursor':'pointer'
    
    return

  ###
  #リストをクリックしたら、
  #span.contentにある文言が表示されるjavascript
  ####

  ###選択された要素を保管するパラメータ###
  jsSampleListElement = null
  $('ul.jsSample li').click ->
    ###以前選択されていたリストの色を元に戻す###
    jsSampleListElement.css('color':colorCode) if jsSampleListElement? and jsSampleListElement.length > 0
    ###選択されたリストを保存###
    jsSampleListElement = $(@).css('color':'red')
    ### クリックしたリストのspan.contentにある文言取得(cssで非表示にされている)###
    strText = jsSampleListElement.find('span.content').text()
    
    ## 取得した文言をcontantViewer クラスをもつdivの中に記述
    $('div.contentViewer p').text(strText)
    return

      
  ###
  #リストをクリックしたら、
  #span.titleのdata-contentの値を表示するjavascript
  ####
  $('ul.jsSample2 li').click ->

      ###色を全て変える###
      $(@).parent().find('li').each ->
        $(@).css('color':colorCode)
        return

      
      ###クリックしたリストのspan.titleにあるdata取得###
      dataList = $(@).css('color':'red').find('span.title').data()

      ###dataオブジェクトからcontetntを取得###
      strText          = dataList.content
      ###dataオブジェクトから選択した回数を取得###
      numSelectedCount = dataList.selectedCount + 1
      $(@).find('span.title').text ->
        ###無名関数で処理を定義して値を返す###
        ###リストの文言が[タイトル：選択回数]####
        dataList.title + ':' + numSelectedCount
        ###
        # その後numSelectedCountを保存
        # chromeのデバッグではhtmlが変更されたあとの値が反映されているのだが
        # $(xxx).data('xxxxx',value)という関数で変更された値はhtmlには反映されないので
        # debugしながら見てみよう。
        ###
      .data('selectedCount',numSelectedCount)
      ### 取得した文言をcontantViewer2 クラスをもつdivの中に記述###
      $('div.contentViewer2 p').text(strText)
      return


    ###
    # 配列からリストul.jsSample3を作成する。
    # 連想配列を作成（名前と画像名をもつ）
    ###
    imgList =
      'img1' :
        'name' : '画像１'
        'imgFileName'  : 'jojo'
      'img2' :
        'name' : '画像２'
        'imgFileName'  : 'dio' 

    ###
    # for loopでリストul.jsSample3を作成
    ###
    for _key ,_value of imgList
      ###listのjqueryObjectを作成し中にspanタグと文言を入れる###
      jqList = $('<li></li>').css('cursor':'pointer').html("<span class='title'>#{_value.name}</span>")
      ###spanタグに画像のURLとIDをdataの要素として追加###
      jqList.find('span.title').data({'img':"images/#{_value.imgFileName}.jpg",'id':"jojolist-#{_key}" })
      ###ul.jsSample3にリストを追加する###
      $('ul.jsSample3').append(jqList)

    ###
    #リストのをクリックしたら、
    #span.titleのdata-imgの画像を表示するjavascript
    ####
    $('ul.jsSample3 li').click ->
      ###画像の表示領域を取得###
      jqContentViewer = $('div.contentViewer3')
      ###色を全て変える###
      $(@).parent().find('li').each ->
        $(@).css('color':colorCode)
        return

      
      ###クリックしたリストのspan.titleにあるdata取得###
      dataList2 = $(@).css('color':'red').find('span.title').data()

      ###dataオブジェクトから画像URLをを取得###
      imgUrl  = dataList2.img
     
      ###画像の表示領域に画像(jqueryImgObject)を追加###
      jqContentViewer.append ->
        ###画像の表示領域にあるはずの画像(jqueryImgObject)を取得###
        jqImg = $(@).find('img')
        ###存在しないときはjqueryImgObjectを生成しリターン###
        return $('<img/>') if jqImg.length == 0

      ###画像URLを設定###
      ### 取得した画像タグをcontantViewer3 クラスをもつdivの中(画像の表示領域)に記述###
      jqContentViewer.find('img').attr('src',imgUrl)
      return
      
    return
