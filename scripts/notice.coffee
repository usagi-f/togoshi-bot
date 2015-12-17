cronJob = require('cron').CronJob
random = require('hubot').Response::random

module.exports = (robot) ->
  ticketClose = new cronJob('0 50 18 * * 5', () ->
    room = room: '#general'
    post = random [
      '<!channel> 今日は花金。チケットクローズよろしくゴシ。'
      '<!channel> 今週もお疲れ様ゴシ。チケットクローズして帰るゴシ。'
      '<!channel> ビール飲み行こ。あ、最後にチケットクローズするゴシ。'
      '<!channel> チケクロよろおね。'
      '<!channel> Today is Friday, so please close the ticket!'
    ]
    robot.send room, post
    start: true
    timeZone: 'Asia/Tokyo'
  )
  ticketClose.start()

  ordinary = new cronJob('0 0 19 * * 1-5', () ->
    room = room: '#general'
    post = random [
      '<!channel> 定時になったゴシ。リソース:normal:以下の人は早く帰るゴシ。'
      '<!channel> It is hard for me to get out from work because everyone thinks that we should work overtime. We might start changing the idea that it is natural for us to work without overtime.'
      '<!channel> 定時になりました。これからお帰りの方も、残業する方もお疲れ様です。'
      '<!channel> 定時。帰る。'
    ]
    robot.send room, post
    start: true
    timeZone: 'Asia/Tokyo'
  )
  ordinary.start()

  companyDailyClose = new cronJob('0 0 19 10 * *', () ->
    room = room: '#general'
    post = random [
      '<!channel> 明日はカンパニーの月次提出日ゴシ。日時提出は今のうち終わらせておくゴシ。'
    ]
    robot.send room, post
    start: true
    timeZone: 'Asia/Tokyo'
  )
  companyDailyClose.start()

  companyMonthlyClose = new cronJob('0 55 9 11 * *', () ->
    room = room: '#general'
    post = random [
      '<!channel> 今日はカンパニーの月次提出日ゴシ。朝のうちに出しておくゴシ。'
    ]
    robot.send room, post
    start: true
    timeZone: 'Asia/Tokyo'
  )
  companyMonthlyClose.start()

  newyearsEve = new cronJob('0 0 23 31 12 *', () ->
    room = room: '#general'
    post = '<!channel> 今年もお世話になったゴシ。みなさま良いお年をゴシ。さて、「笑ってはいけない」見よっと。'
    robot.send room, post
    start: true
    timeZone: 'Asia/Tokyo'
  )
  newyearsEve.start()

  newyear = new cronJob('0 0 7 1 1 *', () ->
    room = room: '#general'
    post = '<!channel> あけましておめでとうゴシ。今年もよろしくお願いしまゴシ。'
    robot.send room, post
    start: true
    timeZone: 'Asia/Tokyo'
  )
  newyear.start()
