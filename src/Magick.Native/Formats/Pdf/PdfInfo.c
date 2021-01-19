// Copyright 2013-2021 Dirk Lemstra <https://github.com/dlemstra/Magick.Native/>
//
// Licensed under the ImageMagick License (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
//
//   https://www.imagemagick.org/script/license.php
//
// Unless required by applicable law or agreed to in writing, software distributed under the
// License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either express or implied. See the License for the specific language governing permissions
// and limitations under the License.

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
  sanitize_passphrase=DestroyString(sanitize_passphrase);

  MAGICK_NATIVE_GET_EXCEPTION;
  status = ExecuteGhostscriptCommand(MagickFalse, command, message, exceptionInfo);
  MAGICK_NATIVE_SET_EXCEPTION;
  if (status == MagickFalse)
    return 0;

  return StringToInteger(message);
}