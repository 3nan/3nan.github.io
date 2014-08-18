class Hoge
  constructor: () ->
    @someInstanceProp = [1,2,3]  # インスタンス変数

  someInstanceMethod: ->         # インスタンスメソッド
    @callAnotherInstanceMethod() # インスタンスメソッドを呼ぶ
    alert @someInstanceProp      # ==> "hoge"

  @someClassProp: "hogehoge"     # クラス変数
  @someClassMethod: ->           # クラスメソッド
    @callAnotherClassMethod()    # 同一クラスのクラスメソッドを呼ぶ
    alert @someClassProp         # ==> "hogehoge"

h1 = new Hoge()
alert h1.someInstanceProp # => [1,2,3]
h1.someInstanceProp.reverse()
alert h1.someInstanceProp # => [3,2,1]

h2 = new Hoge()
alert h2.someInstanceProp # => [1,2,3]