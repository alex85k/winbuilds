setlocal
call settings.bat

git clone --depth 1 https://github.com/wdas/SeExpr.git seexpr

cd seexpr

xcopy windows7\SeExpr src\SeExpr /s /e /y
xcopy windows7\SeExprEditor src\SeExprEditor /s /e /y

cmake %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1%
%ER%
%MSBUILDINSTALL%
%ER%

cd ..
