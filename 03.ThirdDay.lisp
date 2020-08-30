;2020/7/29 ～ 30 学習内容　Reverse関数を自作してみる
(setf menu '(tea caffee milk))

;リストのｎ番目の要素を取ってくるよ
(defun nthcar (data index)
    (if (= index 1)
        (car data)
        (nthcar (cdr data) (1- index))
    )
)
;まずは愚直にループしながらリストの反転
(defun KanamiReverse (data)
    (setf index 1)
    (setf result '())
    (loop
        (if (= index (1+ (length data)))
            (return result)
            (progn
                (setf result (cons (nthcar data index) result))
                (setf index (1+ index))
            )
        )
    )
)
(print (KanamiReverse menu))

;再起処理にしてみたよ
; こっちは引数を簡易にするための関数
(defun KanamiReverse2 (data)
    (KanamiReverse2sub '() data 1)
)
; こっちの関数だけでもちゃんとReverseするよ
(defun KanamiReverse2sub (result data index)
    (if (= (length result) (length data))
        result
        (progn
            (setf result (cons (nthcar data index) result))
            (KanamiReverse2sub result data (1+ index))
        )
    )
)
(print (KanamiReverse2 menu))
(print (KanamiReverse2sub '() menu 1))
