###
javascriptに記述されるコメントの記述方法
###


#javascriptに記述されないコメントの記述方法

###
 関数定義
hello = ->
    console.log 'hello'
###
hello = ->
    console.log 'hello'
###
引数有
sum = (a,b)->
    a+b
###
sum = (a,b)->
    a+b


#関数の最下層に記述されたものが自動的に返される
#何も返さない場合は以下のようにreturnを記述する 


###
値を返さない関数の定義
voidMethod =  ->
    a=1
    b=2
    c = a+b
    return
###
voidMethod =  ->
    a=1
    b=2
    c = a+b
    return

###
引数にデフォルト値をつける
sayHourlyHelloTo = (name , hour=8) ->
    #["]で文字列を生成する場合「#{value}」と記述すれば変数を展開でき
    greetingMessage  ='こんばんわ。'
    if hour > 3
        greetingMessage  ='おはようございます。'
    else if hour > 12
        greetingMessage  ='こんにちわ。'
    console.log "#{greeting} どうも#{name}さん"
    return
###
sayHourlyHelloTo = (name , hour=8) ->
    #["]で文字列を生成する場合「#{value}」と記述すれば変数を展開でき
    greetingMessage  ='こんばんわ。'
    if hour > 3
        greetingMessage  ='おはようございます。'
    else if hour > 12
        greetingMessage  ='こんにちわ。'
    console.log "#{greeting} どうも#{name}さん"
    return


    #配列の定義


