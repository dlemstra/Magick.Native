# Copyright Dirk Lemstra https://github.com/dlemstra/Magick.NET.
# Licensed under the Apache License, Version 2.0.

. $PSScriptRoot\..\..\tools\windows\utils.ps1

build "src\ImageMagick\imagemagick-windows\Configure\Configure.sln" "Configuration=Release,Platform=x64"
