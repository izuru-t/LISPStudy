;2020/7/27 ～ 28 学習内容　Lispの基本
;変数宣言！！
(setf menu '(tea coffee milk))
;リストの1番目を取得
(print (car menu))
;2番目以降すべてを取得
(print (cdr menu))
;リストの先頭に追加
(print (cons 'juice menu))
;リストの3番目を取得
(print (car (cdr (cdr menu))))
;リストの1番目を置き換える
(print (cons 'juice (cdr menu)))
;リストの1番目と2番目の間に追加する
(print (cons (car menu) (cons 'juice (cdr menu))))
;リストの2番目を除外する
(print (cons (car menu) (cdr (cdr menu))))
;リストの1番目と2番目を入れ替える
(print (cons (car (cdr menu)) (cons (car menu) (cdr (cdr menu)))))
