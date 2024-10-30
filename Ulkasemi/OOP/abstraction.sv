// virtual class cant access directly

virtual class prototype:

    pure virtual function car(int x);
        ;
        
    endfunction


endclass


class test extetnds prototype:

    pure virtual function car(int x);
        ;
        
    endfunction


endclass