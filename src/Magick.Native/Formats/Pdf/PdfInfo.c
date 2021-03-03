// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "PdfInfo.h"
#include <stdlib.h>

MAGICK_NATIVE_EXPORT size_t PdfInfo_PageCount(const char *fileName, const char *password, ExceptionInfo **exception)
{
  char
    command[MagickPathExtent],
    message[MagickPathExtent],
    path[MagickPathExtent],
    *sanitize_passphrase;

  MagickBooleanType
    status;

  sanitize_passphrase = SanitizeDelegateString(password);
#if defined(MAGICKCORE_WINDOWS_SUPPORT)
  NTGhostscriptEXE(path, MagickPathExtent);
  (void) FormatLocaleString(command, MagickPathExtent,
    "\"%s\" -q -dQUIET -dSAFER -dBATCH -dNOPAUSE -dNOPROMPT --permit-file-read=\"%s\" -sPDFPassword=\"%s\" -c \"(%s) (r) file runpdfbegin pdfpagecount = quit\"",
#else
  CopyMagickString(path, "gs", MagickPathExtent);
  (void) FormatLocaleString(command, MagickPathExtent,
    "'%s' -q -dQUIET -dSAFER -dBATCH -dNOPAUSE -dNOPROMPT --permit-file-read='%s' -sPDFPassword='%s' -c '(%s) (r) file runpdfbegin pdfpagecount = quit'",
#endif
    path, fileName, sanitize_passphrase, fileName);
  sanitize_passphrase = DestroyString(sanitize_passphrase);

  MAGICK_NATIVE_GET_EXCEPTION;
  *message = '\0';
  status = ExecuteGhostscriptCommand(MagickFalse, command, message, exceptionInfo);
  if ((status == MagickFalse) && (*message != '\0'))
    (void) ThrowMagickException(exceptionInfo, GetMagickModule(), DelegateError,
      "PDFDelegateFailed", "`%s'", message);
  MAGICK_NATIVE_SET_EXCEPTION;
  if (status == MagickFalse)
    return 0;

  return StringToInteger(message);
}