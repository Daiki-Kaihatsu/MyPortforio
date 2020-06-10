# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('#cover-image').click ->
    $('#board_image').click()
    false
    
    
  #画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('#board_image').on 'change', (e) ->
    #なんの画像を読み込むか指定
    file = e.target.files[0]
    reader = new FileReader
    #プレビューする場所を指定
    $preview = $('.board-image')
    t = this
    
    # 画像ファイル以外の場合は何もしない
    if file.type.indexOf('image') < 0
      return false
      
    # ファイル読み込みが完了した際のイベント登録
    reader.onload = do (file) ->
      (e) ->
        
        #既存のプレビューを削除
        $preview.empty()
        
        # .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.attr("src",e.target.result)
        return
    reader.readAsDataURL file
    return
  return


$(document).on 'turbolinks:load', ->
  $('#cover-image-detail').click ->
    $('.board_detail_image').click()
    false

#画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('.board_detail_image').on 'change', (e) ->
    #なんの画像を読み込むか指定
    file = e.target.files[0]
    reader = new FileReader
    #プレビューする場所を指定
    $previewDetail = $('.board-image-detail')
    t = this
    
    # 画像ファイル以外の場合は何もしない
    if file.type.indexOf('image') < 0
      return false
      
    # ファイル読み込みが完了した際のイベント登録
    reader.onload = do (file) ->
      (e) ->
        
        #既存のプレビューを削除
        $previewDetail.empty()
        
        # .prevewの領域の中にロードした画像を表示するimageタグを追加
        $previewDetail.attr("src",e.target.result)
        return
    reader.readAsDataURL file
    return
  return
  
  

  
  
  
$(document).on 'turbolinks:load', ->
  # 追加ボタンを押されたとき
  $('form').on 'click', '.add_field', (event) ->
    console.log(event)
    # 現在時刻をミリ秒形式で取得
    time = new Date().getTime()
    # ヘルパーで作ったインデックス値を↑と置換
    regexp = new RegExp($(this).data('id'), 'g')
    # ヘルパーから渡した fields(HTML) を挿入
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  # 削除ボタンを押されたとき
  $('form').on 'click', '.remove_field', (event) ->
    # 削除ボタンを押したフィールドの _destroy = true にする
    $(this).prev('input[name*=_destroy]').val('true')
    # 削除ボタンが押されたフィールドを隠す
    $(this).closest('div').hide()
    event.preventDefault()