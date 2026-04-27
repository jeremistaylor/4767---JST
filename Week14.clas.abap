REPORT z_extension_usage_analysis.

TYPES: BEGIN OF ty_usage,
         obj_name TYPE string,
         obj_type TYPE string,
         calls    TYPE i,
       END OF ty_usage.

DATA: lt_usage TYPE STANDARD TABLE OF ty_usage,
      ls_usage TYPE ty_usage.

"--- Simulated collected usage data (like SCMON/UPL)
lt_usage = VALUE #(
  ( obj_name = 'Z_EXT_ORDER' obj_type = 'CLASS' calls = 120 )
  ( obj_name = 'Z_EXT_INVOICE' obj_type = 'FM' calls = 0 )
  ( obj_name = 'Z_EXT_DELIVERY' obj_type = 'CLASS' calls = 45 )
  ( obj_name = 'Z_OLD_UNUSED' obj_type = 'FM' calls = 0 )
).

WRITE: / '--- Extension Usage Analysis ---'.

LOOP AT lt_usage INTO ls_usage.
  WRITE: / ls_usage-obj_name, ls_usage-obj_type, ls_usage-calls.

  "--- Identify unused extensions (like Custom Code Migration)
  IF ls_usage-calls = 0.
    WRITE: ' -> Candidate for REMOVAL'.
  ELSE.
    WRITE: ' -> Active'.
  ENDIF.

ENDLOOP.

"--- Simple aggregation (total calls)
DATA(lv_total) = REDUCE i( INIT x = 0
                           FOR wa IN lt_usage
                           NEXT x = x + wa-calls ).

WRITE: / '------------------------------'.
WRITE: / 'Total Calls:', lv_total.
