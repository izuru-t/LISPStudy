;2020/7/28 ～ 29 学習内容　Length関数を自作してみる
(setf menu '(tea coffee milk))
;まずは自分が知ってるコードの書き方で書いてみる
;　愚直にifとloopでぐりぐり
(defun KanamiLength (data)
  (setf len 1)
  (setf tmp data)
  (loop
    (if (null (car tmp)) (return (setf len 0)))
    (if (cdr tmp) (setf len (+ len 1)) (return len))
    (setf tmp (cdr tmp))
  )
  (return-from KanamiLength len)
)
(print (kanamilength menu))

;再起処理にしたらもっと短くなるよね！！
(defun KanamiLength2 (data)
  (if (null data) (return-from KanamiLength2 0))
  (1+ (KanamiLength2 (cdr data)))
)
(print (KanamiLength2 menu))

;ここでハツネツ先生からの暖かいご指導が
;　return-fromはめったに書かない。（普通いらない）
;　ifは式だから三項演算子みたいな動きをイメージしたらよい
(defun Ha2Ne2Length (data)
  (if (null data)
   0
   (1+ (Ha2Ne2Length (cdr data)))
  )
)
(print (Ha2Ne2Length menu))

;それとは別にLISPらしく書こうと思ったらcondというのが出てきた
;　ExcelのCountIfsみたいな複数条件対応マクロらしい
;　今回の場合、true / false の2つしかありえないから
;　cond使うほうが可読性低く感じる
;　今後の活躍に期待
(defun KanamiLength3 (data)
  (cond ((null data) 0)
    (t (1+ (KanamiLength3 (cdr data))))
  )
)
(print (KanamiLength3 menu))

;(setf len (+ len 1)) と (setf len (1+ len)) は同じ
;というか初回以外はsetfいらないっぽい
;(1+ len)でもインクリメントされた
; インクリメント(incf x) デクリメント(decf x) 
