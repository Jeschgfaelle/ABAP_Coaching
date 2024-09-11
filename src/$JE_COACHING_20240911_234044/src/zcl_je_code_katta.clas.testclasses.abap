*"* use this source file for your ABAP unit test classes
CLASS ltcl_code_katta DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.
  PUBLIC  SECTION.
    DATA mr_cut TYPE REF TO zcl_je_code_katta.
  PRIVATE SECTION.
    METHODS:
      for_one_reurn_one FOR TESTING RAISING cx_static_check,
      for_two_return_two FOR TESTING RAISING cx_static_check,
      for_three_return_fizz FOR TESTING RAISING cx_static_check,
      for_five_return_buzz FOR TESTING RAISING cx_static_check,
      for_fifthteen_return_fizzbuzz FOR TESTING RAISING cx_static_check,
      return_table_for_seven FOR TESTING RAISING cx_static_check,
      setup,
      teardown.

ENDCLASS.


CLASS ltcl_code_katta IMPLEMENTATION.

  METHOD setup.
    mr_cut = NEW zcl_je_code_katta( ).
  ENDMETHOD.

  METHOD teardown.
    CLEAR mr_cut.
  ENDMETHOD.

  METHOD for_one_reurn_one.

    DATA(lv_exp) = |1|. "expected output
    DATA(lv_act) = mr_cut->fizzbuzz( 1 ). "actual output

    cl_abap_unit_assert=>assert_equals( msg = |Error| exp = lv_exp act = lv_act ).

  ENDMETHOD.

  METHOD for_two_return_two.

    DATA(lv_exp) = |2|.
    DATA(lv_act) = mr_cut->fizzbuzz( 2 ).

    cl_abap_unit_assert=>assert_equals( msg = |Error| exp = lv_exp act = lv_act ).

  ENDMETHOD.

  METHOD for_three_return_fizz.

    DATA(lv_exp) = |FIZZ|.
    DATA(lv_act) = mr_cut->fizzbuzz( 3 ).

    cl_abap_unit_assert=>assert_equals( msg = |Error| exp = lv_exp act = lv_Act ).

  ENDMETHOD.

  METHOD for_five_return_buzz.

    DATA(lv_exp) = |BUZZ|.
    DATA(lv_act) = mr_cut->fizzbuzz( 5 ).

    cl_abap_unit_assert=>assert_equals( msg = |Error| exp = lv_exp act = lv_act ).

  ENDMETHOD.

  METHOD for_fifthteen_return_fizzbuzz.

    DATA(lv_Exp) = |FIZZBUZZ|.
    DATA(lv_act) = mr_Cut->fizzbuzz( 15 ).

    cl_abap_unit_assert=>assert_equals( msg = |Error| exp = lv_exp act = lv_act ).

  ENDMETHOD.

  METHOD return_table_for_seven.

   DATA lt_exp type table of string.
   DATA(lt_act) = mr_cut->table_until_number( 7 ).

   lt_exp = value #( ( |1| ) ( |2| ) ( |FIZZ| ) ( |4| ) ( |BUZZ| ) ( |FIZZ| ) ( |7| ) ).

   cl_abap_unit_assert=>assert_equals( msg = |Error| exp = lt_exp act = lt_act ).

  ENDMETHOD.

ENDCLASS.
