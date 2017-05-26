@echo off

rem::: \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
rem::: CREATE SUBFOLDERS
rem::: Author: Mario Rodriguez APM - Technology
rem::: Date: May 25, 2017
rem::: /////////////////////////////////////////////////////////////////////

SETLOCAL

for /f "usebackq tokens=*" %%a in (`dir /b /a:d`) do (

  rem:::Enter the directory
  pushd %%a

  echo In Directory: %%a
  rem:::Make Children
    md Quotes Testfits
  rem::: leave the directory
  popd
  )

ENDLOCAL
