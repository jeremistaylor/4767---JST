CLASS zcl_7302_week_2_project DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_7302_week_2_project IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
      DATA celsius     TYPE p LENGTH 6 DECIMALS 2 VALUE '-273.15'.
    DATA fahrenheit  TYPE p LENGTH 6 DECIMALS 2.
    DATA kelvin      TYPE p LENGTH 6 DECIMALS 2.

    fahrenheit = ( celsius * 9 / 5 ) + 32.
    kelvin     = celsius + '273.15'.

    out->write( |Celsius:     { celsius     NUMBER = USER } °C| ).
    out->write( |Fahrenheit:  { fahrenheit  NUMBER = USER } °F| ).
    out->write( |Kelvin:      { kelvin      NUMBER = USER } K | ).

  ENDMETHOD.
ENDCLASS.