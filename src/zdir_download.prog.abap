REPORT zdir_download.

DATA:
  gt_tadir      TYPE TABLE OF zdir_tadir,
  gt_tfdir      TYPE TABLE OF zdir_tfdir,
  gt_fupararef  TYPE TABLE OF zdir_fupararef,
  gt_seocompodf TYPE TABLE OF zdir_seocompodf,
  gt_seosubcodf TYPE TABLE OF zdir_seosubcodf.

PARAMETERS:
  p_saprl  TYPE sysaprl DEFAULT '702',
  p_path   TYPE string LOWER CASE DEFAULT 'C:\SAPworkdir\',
  p_tadir  AS CHECKBOX,
  p_tfdir  AS CHECKBOX,
  p_tfdir2 AS CHECKBOX,
  p_tcdir  AS CHECKBOX,
  p_tcdir2 AS CHECKBOX.

START-OF-SELECTION.

  IF p_tadir IS NOT INITIAL.
    SELECT @p_saprl AS saprelease,
      pgmid, object, obj_name, devclass FROM tadir
      INTO CORRESPONDING FIELDS OF TABLE @gt_tadir
      WHERE devclass NOT LIKE 'Y%' AND devclass NOT LIKE 'Z%' AND devclass NOT LIKE '/MBT%'
      ORDER BY PRIMARY KEY.

    CALL FUNCTION 'GUI_DOWNLOAD'
      EXPORTING
        filename                = |{ p_path }{ p_saprl }_tadir.tab|
        filetype                = 'DAT'
      TABLES
        data_tab                = gt_tadir
      EXCEPTIONS
        file_write_error        = 1
        no_batch                = 2
        gui_refuse_filetransfer = 3
        invalid_type            = 4
        no_authority            = 5
        unknown_error           = 6
        header_not_allowed      = 7
        separator_not_allowed   = 8
        filesize_not_allowed    = 9
        header_too_long         = 10
        dp_error_create         = 11
        dp_error_send           = 12
        dp_error_write          = 13
        unknown_dp_error        = 14
        access_denied           = 15
        dp_out_of_memory        = 16
        disk_full               = 17
        dp_timeout              = 18
        file_not_found          = 19
        dataprovider_exception  = 20
        control_flush_error     = 21
        OTHERS                  = 22.
    IF sy-subrc = 0.
      WRITE: / 'Downloaded TADIR successfully' COLOR COL_POSITIVE.
    ELSE.
      WRITE: / 'Error: Download TADIR' COLOR COL_NEGATIVE, sy-subrc.
    ENDIF.

    CLEAR gt_tadir.
  ENDIF.

  IF p_tfdir IS NOT INITIAL.
    SELECT @p_saprl AS saprelease,
      funcname, pname_main FROM tfdir
      INTO CORRESPONDING FIELDS OF TABLE @gt_tfdir
      WHERE funcname NOT LIKE 'Y%' AND funcname NOT LIKE 'Z%' AND funcname NOT LIKE '/MBT%'
      ORDER BY PRIMARY KEY.

    CALL FUNCTION 'GUI_DOWNLOAD'
      EXPORTING
        filename                = |{ p_path }{ p_saprl }_tfdir.tab|
        filetype                = 'DAT'
      TABLES
        data_tab                = gt_tfdir
      EXCEPTIONS
        file_write_error        = 1
        no_batch                = 2
        gui_refuse_filetransfer = 3
        invalid_type            = 4
        no_authority            = 5
        unknown_error           = 6
        header_not_allowed      = 7
        separator_not_allowed   = 8
        filesize_not_allowed    = 9
        header_too_long         = 10
        dp_error_create         = 11
        dp_error_send           = 12
        dp_error_write          = 13
        unknown_dp_error        = 14
        access_denied           = 15
        dp_out_of_memory        = 16
        disk_full               = 17
        dp_timeout              = 18
        file_not_found          = 19
        dataprovider_exception  = 20
        control_flush_error     = 21
        OTHERS                  = 22.
    IF sy-subrc = 0.
      WRITE: / 'Downloaded TFDIR successfully' COLOR COL_POSITIVE.
    ELSE.
      WRITE: / 'Error: Download TFDIR' COLOR COL_NEGATIVE, sy-subrc.
    ENDIF.

    CLEAR gt_tfdir.
  ENDIF.

  IF p_tfdir2 IS NOT INITIAL.
    SELECT @p_saprl AS saprelease,
      funcname, parameter AS param, paramtype FROM fupararef
      INTO CORRESPONDING FIELDS OF TABLE @gt_fupararef
      WHERE funcname NOT LIKE 'Y%' AND funcname NOT LIKE 'Z%' AND funcname NOT LIKE '/MBT%'
      ORDER BY PRIMARY KEY.

    CALL FUNCTION 'GUI_DOWNLOAD'
      EXPORTING
        filename                = |{ p_path }{ p_saprl }_fupararef.tab|
        filetype                = 'DAT'
      TABLES
        data_tab                = gt_fupararef
      EXCEPTIONS
        file_write_error        = 1
        no_batch                = 2
        gui_refuse_filetransfer = 3
        invalid_type            = 4
        no_authority            = 5
        unknown_error           = 6
        header_not_allowed      = 7
        separator_not_allowed   = 8
        filesize_not_allowed    = 9
        header_too_long         = 10
        dp_error_create         = 11
        dp_error_send           = 12
        dp_error_write          = 13
        unknown_dp_error        = 14
        access_denied           = 15
        dp_out_of_memory        = 16
        disk_full               = 17
        dp_timeout              = 18
        file_not_found          = 19
        dataprovider_exception  = 20
        control_flush_error     = 21
        OTHERS                  = 22.
    IF sy-subrc = 0.
      WRITE: / 'Downloaded FUPARAREF successfully' COLOR COL_POSITIVE.
    ELSE.
      WRITE: / 'Error: Download FUPARAREF' COLOR COL_NEGATIVE, sy-subrc.
    ENDIF.

    CLEAR gt_fupararef.
  ENDIF.

  IF p_tcdir IS NOT INITIAL.
    SELECT @p_saprl AS saprelease,
      clsname, cmpname, exposure, mtddecltyp, attdecltyp, evtdecltyp, typtype FROM seocompodf
      INTO CORRESPONDING FIELDS OF TABLE @gt_seocompodf
      WHERE clsname NOT LIKE 'Y%' AND clsname NOT LIKE 'Z%' AND clsname NOT LIKE '/MBT%'
      ORDER BY PRIMARY KEY.

    CALL FUNCTION 'GUI_DOWNLOAD'
      EXPORTING
        filename                = |{ p_path }{ p_saprl }_seocompodf.tab|
        filetype                = 'DAT'
      TABLES
        data_tab                = gt_seocompodf
      EXCEPTIONS
        file_write_error        = 1
        no_batch                = 2
        gui_refuse_filetransfer = 3
        invalid_type            = 4
        no_authority            = 5
        unknown_error           = 6
        header_not_allowed      = 7
        separator_not_allowed   = 8
        filesize_not_allowed    = 9
        header_too_long         = 10
        dp_error_create         = 11
        dp_error_send           = 12
        dp_error_write          = 13
        unknown_dp_error        = 14
        access_denied           = 15
        dp_out_of_memory        = 16
        disk_full               = 17
        dp_timeout              = 18
        file_not_found          = 19
        dataprovider_exception  = 20
        control_flush_error     = 21
        OTHERS                  = 22.
    IF sy-subrc = 0.
      WRITE: / 'Downloaded SEOCOMPODF successfully' COLOR COL_POSITIVE.
    ELSE.
      WRITE: / 'Error: Download SEOCOMPODF' COLOR COL_NEGATIVE, sy-subrc.
    ENDIF.

    CLEAR gt_seocompodf.
  ENDIF.

  IF p_tcdir2 IS NOT INITIAL.
    SELECT @p_saprl AS saprelease,
      clsname, cmpname, sconame, pardecltyp, parpasstyp, typtype FROM seosubcodf
      INTO CORRESPONDING FIELDS OF TABLE @gt_seosubcodf
      WHERE clsname NOT LIKE 'Y%' AND clsname NOT LIKE 'Z%' AND clsname NOT LIKE '/MBT%'
      ORDER BY PRIMARY KEY.

    CALL FUNCTION 'GUI_DOWNLOAD'
      EXPORTING
        filename                = |{ p_path }{ p_saprl }_seosubcodf.tab|
        filetype                = 'DAT'
      TABLES
        data_tab                = gt_seosubcodf
      EXCEPTIONS
        file_write_error        = 1
        no_batch                = 2
        gui_refuse_filetransfer = 3
        invalid_type            = 4
        no_authority            = 5
        unknown_error           = 6
        header_not_allowed      = 7
        separator_not_allowed   = 8
        filesize_not_allowed    = 9
        header_too_long         = 10
        dp_error_create         = 11
        dp_error_send           = 12
        dp_error_write          = 13
        unknown_dp_error        = 14
        access_denied           = 15
        dp_out_of_memory        = 16
        disk_full               = 17
        dp_timeout              = 18
        file_not_found          = 19
        dataprovider_exception  = 20
        control_flush_error     = 21
        OTHERS                  = 22.
    IF sy-subrc = 0.
      WRITE: / 'Downloaded SEOSUBCODF successfully' COLOR COL_POSITIVE.
    ELSE.
      WRITE: / 'Error: Download SEOSUBCODF' COLOR COL_NEGATIVE, sy-subrc.
    ENDIF.

    CLEAR gt_seosubcodf.
  ENDIF.
