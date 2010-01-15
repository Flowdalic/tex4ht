
Rem 
Rem 
Rem   htcontext.bat                                  Version 1.1
Rem   Copyright (C) 2003--2009               Eitan M. Gurari
Rem   Copyright 2009 TeX Users Group
Rem 
Rem   This work may be distributed and/or modified under the
Rem   conditions of the LaTeX Project Public License, either
Rem   version 1.3 of this license or (at your option) any
Rem   later version. The latest version of this license is
Rem   in
Rem     http://www.latex-project.org/lppl.txt
Rem   and version 1.3 or later is part of all distributions
Rem   of LaTeX version 2003/12/01 or later.
Rem 
Rem   This work has the LPPL maintenance status "maintained".
Rem 
Rem   The Current Maintainer of this work
Rem   is the TeX4ht Project.
Rem 
Rem                                          tex4ht@tug.org
Rem                               http://www.tug.org/tex4ht
Rem 
Rem 


        call texexec --arg="ht-1=%2" --use=tex4ht --dvi --nobackend %5 %1 
        tex4ht %1 -ic:/tex4ht/texmf/tex4ht/ht-fonts/%3 -ec:/tex4ht/texmf/tex4ht/base/win32/tex4ht.env
        t4ht %1 %4 -ec:/tex4ht/texmf/tex4ht/base/win32/tex4ht.env 



