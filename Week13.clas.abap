* Define a structure (similar to a database table row)
TYPES: BEGIN OF ty_airline,
         airline_id   TYPE string,
         airline_name TYPE string,
         country      TYPE string,
       END OF ty_airline.

* Internal table of airlines
DATA: gt_airlines TYPE STANDARD TABLE OF ty_airline,
      gs_airline  TYPE ty_airline.

*---------------------------------------------------------------------*
* Populate internal table
*---------------------------------------------------------------------*
INITIALIZATION.

  gs_airline-airline_id   = 'LH'.
  gs_airline-airline_name = 'Lufthansa'.
  gs_airline-country      = 'Germany'.
  APPEND gs_airline TO gt_airlines.

  gs_airline-airline_id   = 'UA'.
  gs_airline-airline_name = 'United Airlines'.
  gs_airline-country      = 'USA'.
  APPEND gs_airline TO gt_airlines.

  gs_airline-airline_id   = 'DL'.
  gs_airline-airline_name = 'Delta Airlines'.
  gs_airline-country      = 'USA'.
  APPEND gs_airline TO gt_airlines.

*---------------------------------------------------------------------*
* Display data
*---------------------------------------------------------------------*
START-OF-SELECTION.

  WRITE: / '--- Airline List ---'.

  LOOP AT gt_airlines INTO gs_airline.
    WRITE: / 'ID:', gs_airline-airline_id,
             'Name:', gs_airline-airline_name,
             'Country:', gs_airline-country.
  ENDLOOP.

*---------------------------------------------------------------------*
* Simple filter logic (like a WHERE clause)
*---------------------------------------------------------------------*
  WRITE: /,
         / '--- Airlines from USA ---'.

  LOOP AT gt_airlines INTO gs_airline WHERE country = 'USA'.
    WRITE: / gs_airline-airline_name.
  ENDLOOP.

*---------------------------------------------------------------------*
* Count entries (aggregation concept similar to CDS)
*---------------------------------------------------------------------*
  DATA(lv_count) = lines( gt_airlines ).

  WRITE: /,
         / 'Total Airlines:', lv_count.
