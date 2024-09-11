CLASS zcl_je_code_katta DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: tty_stringtable TYPE STANDARD TABLE OF string WITH DEFAULT KEY.

    METHODS fizzbuzz
      IMPORTING iv_number         TYPE i
      RETURNING VALUE(r_fizzbuzz) TYPE string.

    METHODS table_until_number
      IMPORTING iv_number          TYPE i
      RETURNING VALUE(rt_fizzbuzz) TYPE tty_stringtable.
ENDCLASS.



CLASS zcl_je_code_katta IMPLEMENTATION.


  METHOD table_until_number.

    DO iv_number TIMES.

      APPEND fizzbuzz( sy-index ) TO rt_fizzbuzz.

    ENDDO.


  ENDMETHOD.


  METHOD fizzbuzz.

    r_fizzbuzz = COND #( WHEN iv_number MOD 3 = 0 AND iv_number MOD 5 = 0 THEN 'FIZZBUZZ'
                         WHEN iv_number MOD 3 = 0 THEN 'FIZZ'
                         WHEN iv_number MOD 5 = 0 THEN 'BUZZ'
                         ELSE condense( CONV string( iv_number ) ) ). "yagni = you aint gonna need it

  ENDMETHOD.

ENDCLASS.
