"===============================
" Local Class: LCL_CARRIER
"===============================
"! Flight Carrier -
"! A factory logic ensures that there is only one instance for the same carrier ID.
CLASS lcl_carrier DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.

    "! Factory method - returns an instance of this class.
    "! @parameter i_carrier_id | Three-character identification of the carrier.
    "! @parameter r_result | Reference to the instance - initial if instantiation failed.
    "! @raising zcx_##_failed | Instantiation failed - evaluate the exception text for details.
    CLASS-METHODS get_instance
      IMPORTING i_carrier_id TYPE string
      RETURNING VALUE(r_result) TYPE REF TO lcl_carrier
      RAISING zcx_##_failed.

    "! Search for a <strong>passenger flight</strong> between two airports that
    "! <ul>
    "! <li>lies on or after a given date and</li>
    "! <li>has a minimum number of available seats left</li>
    "!</ul>
    "! @parameter i_airport_from_id | <em>Departure</em> airport
    "! @parameter i_airport_to_id | <em>Arrival</em> airport
    "! @parameter i_from_date | First possible flight date
    "! @parameter i_seats | Minimum number of available seats
    "! @parameter e_flight | Found flight (object reference)
    "! @parameter e_days_later | Number of days after the requested date
    METHODS find_passenger_flight
      IMPORTING
        i_airport_from_id TYPE string
        i_airport_to_id   TYPE string
        i_from_date       TYPE d
        i_seats           TYPE i
      EXPORTING
        e_flight          TYPE REF TO lcl_flight
        e_days_later      TYPE i.

    "! Search for a <strong>cargo flight</strong> between two airports that
    "! <ul>
    "! <li>lies on or after a given date and</li>
    "! <li>has a minimum number of available capacity left</li>
    "!</ul>
    "! @parameter i_airport_from_id | <em>Departure</em> airport
    "! @parameter i_airport_to_id | <em>Arrival</em> airport
    "! @parameter i_from_date | First possible flight date
    "! @parameter i_cargo | Minimum number of available capacity
    "! @parameter e_flight | Found flight (object reference)
    "! @parameter e_days_later | Number of days after the requested date
    METHODS find_cargo_flight
      IMPORTING
        i_airport_from_id TYPE string
        i_airport_to_id   TYPE string
        i_from_date       TYPE d
        i_cargo           TYPE i
      EXPORTING
        e_flight          TYPE REF TO lcl_flight
        e_days_later      TYPE i.

ENDCLASS.


"===============================
" Local Class: LCL_FLIGHT
"===============================
"! Abstract superclass for classes 
"! {@link .lcl_passenger_flight} and 
"! {@link .lcl_cargo_flight}. <br/>
"! Every instance is uniquely identified by attributes
"! {@link .lcl_flight.DATA:carrier_id },
"! {@link .lcl_flight.DATA:connection_id }, and
"! {@link .lcl_flight.DATA:flight_date }.
CLASS lcl_flight DEFINITION ABSTRACT.

  PUBLIC SECTION.
    DATA carrier_id    TYPE string.
    DATA connection_id TYPE string.
    DATA flight_date   TYPE d.

ENDCLASS.
