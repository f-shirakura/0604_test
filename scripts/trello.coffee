#移動してみる
Trello = require("node-trello")

module.exports = (robot) ->
  robot.hear /^want (.*)/i, (msg) ->
    #タイトルの格納はできている
    title = "#{msg.match[1]}"

    t = new Trello(process.env.HUBOT_TRELLO_KEY, process.env.HUBOT_TRELLO_TOKEN)
    t.post "/1/cards", {name: title, idList: process.env.HUBOT_TRELLO_TODO}, (err, data) ->
      if err
        #エラーの表示はされる
        msg.send "「#{title}」 の保存に失敗しました。"
        return
      msg.send "「#{title}」 をTrelloに保存しました。"
