(load "tile.lisp")

(defun add_to_board(element vector side)
    (cond 
          ( (or (equal side "L") (null vector) ) 
            (print_board (cons element vector))
            (cons element vector))
          ( (equal side "R")
             (print_board (cons vector (list element)))
             (cons vector (list element)))
          ( t
            ))
)

(defun print_board(vector)
   (terpri)(terpri)(terpri)
   (princ "                       L ")
   (print_tiles vector)
   (princ "R")
   (terpri)(terpri)(terpri)
)

(defun check_left_rules(element vector)
    (cond
        ( ( or (null vector) 
          (equal (first (rest element)) (first (first vector)) )
          (equal (first element) (first(first vector)) )) 
          t)
        (t 
          nil
        ))

)

(defun check_available_moves(board hand)
    (cond
        ( (null hand)
          (princ "No available moves")
          nil )
        ( (check_left_rules (first hand) board)
          t)
        (t 
          (check_available_moves board (rest hand)))
    
    )
)