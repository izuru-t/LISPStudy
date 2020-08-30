;2020/7/31～8/1 学習内容　Tailコマンドっぽいもの
;最初にファイルの行数を得るために一度全行読んでみる
;終わったらもう一度ファイルを読む
;この時は引数で受け取ったrowNumの位置まで出力しない
(defun KanamiTail (fileName rowNum)
    (setf rowCnt 0)
    (with-open-file (file fileName)
        (unwind-protect
            (loop for i from 0
                for line = (read-line file nil nil)
                while line
                do (setf rowCnt (1+ rowCnt))
            )
        )
    )
    (with-open-file (file fileName)
        (unwind-protect
            (loop for i from 0
                for line = (read-line file nil nil)
                while line
                do (if (>= i (- rowCnt rowNum)) (format t "~d: ~a~%" i line))
            )
        )
    )
)
;引数で指定されたファイルをrowNum行目から出力する
;interval分の間隔をあけて
(defun KanamiTail2 (fileName rowNum interval)
    (setf len 0)
    (loop 
        (KanamiTail fileName rowNum)
        (sleep interval)
    )
)
(KanamiTail2 "c:/temp/sample.txt" 5 2)
