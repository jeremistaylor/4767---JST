CLASS zcl_7302_week_3_project DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_7302_week_3_project IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  TYPES: BEGIN OF st_employee,
           employee_id TYPE i,
           first_name  TYPE string,
           last_name   TYPE string,
           department  TYPE string,
           salary      TYPE p LENGTH 8 DECIMALS 2,
         END OF st_employee.

  DATA gt_employees TYPE SORTED TABLE OF st_employee
                    WITH UNIQUE KEY employee_id.

  INSERT VALUE #( employee_id = 1 first_name = 'Alex'
                  last_name = 'Morgan' department = 'IT'
                  salary = '75000' ) INTO TABLE gt_employees.

  INSERT VALUE #( employee_id = 2 first_name = 'Jamie'
                  last_name = 'Smith' department = 'HR'
                  salary = '62000' ) INTO TABLE gt_employees.

  INSERT VALUE #( employee_id = 3 first_name = 'Taylor'
                  last_name = 'Brown' department = 'Finance'
                  salary = '80000' ) INTO TABLE gt_employees.

  out->write( '--- Employee List ---' ).
  LOOP AT gt_employees INTO DATA(gs_emp).
    out->write(
      |{ gs_emp-employee_id } { gs_emp-first_name } |
      && |{ gs_emp-last_name } { gs_emp-department }|
    ).
  ENDLOOP.

  READ TABLE gt_employees
       WITH KEY employee_id = 2
       INTO DATA(gs_found).

  IF sy-subrc = 0.
    out->write(
      |Found: { gs_found-first_name } { gs_found-last_name }|
    ).
  ENDIF.
  ENDMETHOD.
ENDCLASS.