#/bin/sh

if cd flutter; then
    git pull && cd .. ;
else
    git clone https://github.com/flutter/flutter.git;
fi && ls && flutter/bin/flutter doctor && flutter/bin/flutter clean && flutter/bin/flutter config --enable-weif cd flutter; then git pull && cd .. ; else git clone https://github.com/flutter/flutter.git; fi && ls && flutter/bin/flutter doctor && flutter/bin/flutter clean && flutter/bin/flutter config --enable-web

if cd auto_route_library; then
    git pull && cd ..;
else
    git clone https://github.com/cgestes/auto_route_library.git;
fi
