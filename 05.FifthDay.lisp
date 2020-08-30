;2020/7/31�`8/1 �w�K���e�@Tail�R�}���h���ۂ�����
;�ŏ��Ƀt�@�C���̍s���𓾂邽�߂Ɉ�x�S�s�ǂ�ł݂�
;�I������������x�t�@�C����ǂ�
;���̎��͈����Ŏ󂯎����rowNum�̈ʒu�܂ŏo�͂��Ȃ�
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
;�����Ŏw�肳�ꂽ�t�@�C����rowNum�s�ڂ���o�͂���
;interval���̊Ԋu��������
(defun KanamiTail2 (fileName rowNum interval)
    (setf len 0)
    (loop 
        (KanamiTail fileName rowNum)
        (sleep interval)
    )
)
(KanamiTail2 "c:/temp/sample.txt" 5 2)
