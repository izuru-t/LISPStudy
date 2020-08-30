;2020/7/30 ～ 31 学習内容　ファイル読み込み
; 宿題
; ファイル操作を覚えてtailを形にする
; ここからの実行じゃなくてコマンドラインから使える関数にしたい

;一番基本的なファイル読み込み
; Open - Close 
; unwind-protecで例外あっても走る
; format t "~d: ~a~%" i line は ~dにi ~a~%にlineを入れてる
; 記号に騙されるな！string.formatだお
(defun KanamiReadFile (fileName)
    (let ((file (open fileName))
            (aborted t))
        (unwind-protect
            (progn
                (loop for i from 0
                    for line = (read-line file nil nil)
                    while line
                    do (format t "~d: ~a~%" i line)
                )
                (setf aborted nil)
            )
            (close file :abort aborted)
        )
    )
)
(KanamiReadFile "c:/temp/sample.txt")

; with-open-file というマクロ？使うとusingしたみたいに閉じるまで面倒見てくれる
(defun KanamiReadFile2 (fileName)
    (with-open-file (file fileName)
        (unwind-protect
            (loop for i from 0
                for line = (read-line file nil nil)
                while line
                do (format t "~d: ~a~%" i line)
            )
        )
    )
)
(KanamiReadFile2 "c:/temp/sample.txt")

; このコードはサイトからこぴったけどwhileｄで落ちる
; 色々読み込んでどう書いたらいいのか勉強しよう
; 上のコードで特に問題ないけど
; lisp的にはこんな書き方が普通なイメージだから
(defun KanamiReadFile3 (fileName)
    (with-open-file (in fileName)
        (let ((seq (make-array (file-length in) :element-type 'character :fill-pointer t)))
            (while (setf (fill-pointer seq) (read-sequence seq in)) (print seq))
            seq
        )
    )
)
(KanamiReadFile3 "c:/temp/sample.txt")