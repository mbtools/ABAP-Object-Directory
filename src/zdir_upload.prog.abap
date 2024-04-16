REPORT zdir_upload.

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
    CALL FUNCTION 'GUI_UPLOAD'
      EXPORTING
        filename                = |{ p_path }{ p_saprl }_tadir.tab|
        filetype                = 'DAT'
      TABLES
        data_tab                = gt_tadir
      EXCEPTIONS
        file_open_error         = 1
        file_read_error         = 2
        no_batch                = 3
        gui_refuse_filetransfer = 4
        invalid_type            = 5
        no_authority            = 6
        unknown_error           = 7
        bad_data_format         = 8
        header_not_allowed      = 9
        separator_not_allowed   = 10
        header_too_long         = 11
        unknown_dp_error        = 12
        access_denied           = 13
        dp_out_of_memory        = 14
        disk_full               = 15
        dp_timeout              = 16
        OTHERS                  = 17.
    IF sy-subrc = 0.
      DELETE FROM zdir_tadir WHERE saprelease = p_saprl.
      INSERT zdir_tadir FROM TABLE gt_tadir.
      IF sy-subrc = 0.
        WRITE: / 'Saved TADIR successfully' COLOR COL_POSITIVE.
      ELSE.
        WRITE: / 'Error: Saving TADIR' COLOR COL_NEGATIVE, sy-subrc.
      ENDIF.
    ELSE.
      WRITE: / 'Error: Upload TADIR' COLOR COL_NEGATIVE, sy-subrc.
    ENDIF.
  ENDIF.

  IF p_tfdir IS NOT INITIAL.
    CALL FUNCTION 'GUI_UPLOAD'
      EXPORTING
        filename                = |{ p_path }{ p_saprl }_tfdir.tab|
        filetype                = 'DAT'
      TABLES
        data_tab                = gt_tfdir
      EXCEPTIONS
        file_open_error         = 1
        file_read_error         = 2
        no_batch                = 3
        gui_refuse_filetransfer = 4
        invalid_type            = 5
        no_authority            = 6
        unknown_error           = 7
        bad_data_format         = 8
        header_not_allowed      = 9
        separator_not_allowed   = 10
        header_too_long         = 11
        unknown_dp_error        = 12
        access_denied           = 13
        dp_out_of_memory        = 14
        disk_full               = 15
        dp_timeout              = 16
        OTHERS                  = 17.
    IF sy-subrc = 0.
      DELETE FROM zdir_tfdir WHERE saprelease = p_saprl.
      INSERT zdir_tfdir FROM TABLE gt_tfdir.
      IF sy-subrc = 0.
        WRITE: / 'Saved TFDIR successfully' COLOR COL_POSITIVE.
      ELSE.
        WRITE: / 'Error: Saving TFDIR' COLOR COL_NEGATIVE, sy-subrc.
      ENDIF.
    ELSE.
      WRITE: / 'Error: Upload TFDIR' COLOR COL_NEGATIVE, sy-subrc.
    ENDIF.
  ENDIF.

  IF p_tfdir2 IS NOT INITIAL.
    CALL FUNCTION 'GUI_UPLOAD'
      EXPORTING
        filename                = |{ p_path }{ p_saprl }_fupararef.tab|
        filetype                = 'DAT'
      TABLES
        data_tab                = gt_fupararef
      EXCEPTIONS
        file_open_error         = 1
        file_read_error         = 2
        no_batch                = 3
        gui_refuse_filetransfer = 4
        invalid_type            = 5
        no_authority            = 6
        unknown_error           = 7
        bad_data_format         = 8
        header_not_allowed      = 9
        separator_not_allowed   = 10
        header_too_long         = 11
        unknown_dp_error        = 12
        access_denied           = 13
        dp_out_of_memory        = 14
        disk_full               = 15
        dp_timeout              = 16
        OTHERS                  = 17.
    IF sy-subrc = 0.
      DELETE FROM zdir_fupararef WHERE saprelease = p_saprl.
      INSERT zdir_fupararef FROM TABLE gt_fupararef.
      IF sy-subrc = 0.
        WRITE: / 'Saved FUPARAREF successfully' COLOR COL_POSITIVE.
      ELSE.
        WRITE: / 'Error: Saving FUPARAREF' COLOR COL_NEGATIVE, sy-subrc.
      ENDIF.
    ELSE.
      WRITE: / 'Error: Upload FUPARAREF' COLOR COL_NEGATIVE, sy-subrc.
    ENDIF.
  ENDIF.

  IF p_tcdir IS NOT INITIAL.
    CALL FUNCTION 'GUI_UPLOAD'
      EXPORTING
        filename                = |{ p_path }{ p_saprl }_seocompodf.tab|
        filetype                = 'DAT'
      TABLES
        data_tab                = gt_seocompodf
      EXCEPTIONS
        file_open_error         = 1
        file_read_error         = 2
        no_batch                = 3
        gui_refuse_filetransfer = 4
        invalid_type            = 5
        no_authority            = 6
        unknown_error           = 7
        bad_data_format         = 8
        header_not_allowed      = 9
        separator_not_allowed   = 10
        header_too_long         = 11
        unknown_dp_error        = 12
        access_denied           = 13
        dp_out_of_memory        = 14
        disk_full               = 15
        dp_timeout              = 16
        OTHERS                  = 17.
    IF sy-subrc = 0.
      DELETE FROM zdir_seocompodf WHERE saprelease = p_saprl.
      INSERT zdir_seocompodf FROM TABLE gt_seocompodf.
      IF sy-subrc = 0.
        WRITE: / 'Saved SEOCOMPODF successfully' COLOR COL_POSITIVE.
      ELSE.
        WRITE: / 'Error: Saving SEOCOMPODF' COLOR COL_NEGATIVE, sy-subrc.
      ENDIF.
    ELSE.
      WRITE: / 'Error: Upload SEOCOMPODF' COLOR COL_NEGATIVE, sy-subrc.
    ENDIF.
  ENDIF.

  IF p_tcdir2 IS NOT INITIAL.
    CALL FUNCTION 'GUI_UPLOAD'
      EXPORTING
        filename                = |{ p_path }{ p_saprl }_seosubcodf.tab|
        filetype                = 'DAT'
      TABLES
        data_tab                = gt_seosubcodf
      EXCEPTIONS
        file_open_error         = 1
        file_read_error         = 2
        no_batch                = 3
        gui_refuse_filetransfer = 4
        invalid_type            = 5
        no_authority            = 6
        unknown_error           = 7
        bad_data_format         = 8
        header_not_allowed      = 9
        separator_not_allowed   = 10
        header_too_long         = 11
        unknown_dp_error        = 12
        access_denied           = 13
        dp_out_of_memory        = 14
        disk_full               = 15
        dp_timeout              = 16
        OTHERS                  = 17.
    IF sy-subrc = 0.
      DELETE FROM zdir_seosubcodf WHERE saprelease = p_saprl.
      INSERT zdir_seosubcodf FROM TABLE gt_seosubcodf.
      IF sy-subrc = 0.
        WRITE: / 'Saved SEOSUBCODF successfully' COLOR COL_POSITIVE.
      ELSE.
        WRITE: / 'Error: Saving SEOSUBCODF' COLOR COL_NEGATIVE, sy-subrc.
      ENDIF.
    ELSE.
      WRITE: / 'Error: Upload SEOSUBCODF' COLOR COL_NEGATIVE, sy-subrc.
    ENDIF.
  ENDIF.
