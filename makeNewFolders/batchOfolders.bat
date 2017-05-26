@echo off

rem::: \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
rem::: BATCH-O-FOLDERS
rem::: Author: Mario Rodriguez APM - Technology
rem::: Date: May 25, 2017
rem::: Version 1.0
rem::: /////////////////////////////////////////////////////////////////////

rem::: \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
rem::: This batch file can be ran to create a range of consecutive positive
rem::: integer numbered folders with sub-directories.

rem::: To change the names of the sub-directories, change the variables under
rem::: sub_generate_subFolders.
rem::: /////////////////////////////////////////////////////////////////////

rem::: \\\\\\\\\\\\\\\\\\\\\BEGIN ACTUAL SCRIPT////////////////////////////

SETLOCAL ENABLEDELAYEDEXPANSION

echo.
echo ##############################################################
echo.
echo           Welcome to the Project Folder Generator
echo.
echo ##############################################################
echo.
echo.

rem::: #################### Start Request User Input #####################

SET /P startNum=Please enter the Starting number for the folder sequence: || SET startNum="NothingChosen"
echo.
SET /P stopNum=Please enter the Stop number for the folder sequence: || SET stopNum="NothingChosen"
echo.
rem::: #################### End Request User Input #######################

rem::: ############### Start simple validation of user input ###############

rem::: __startNum validation__
IF %startNum% == "NothingChosen" goto :sub_error_noStart
IF %startNum% LSS 0 goto :sub_error_startNum_less_0

rem::: __stopNum validation__
IF %stopNum%=="NothingChosen" goto :sub_error_noStop
IF %stopNum% LSS %startNum% goto :sub_error_stopNum_less_startNum

rem::: __actionable test call if validation passes__
IF %startNum% GEQ %stopNum% goto :sub_generate_folders

rem::: ############### End simple validation of user input ###############

rem:::**************** Folder Generation Algorithms *******************

rem::: Generate Parent Folders

echo.
echo Creating Folders...
echo.

:sub_generate_folders
  for /l %%i in (%startNum%, 1, %stopNum%) do md "%%i"
  echo.
  echo The Following Directories Have Been Created:
  echo.
  for /f "usebackq tokens=*" %%a in (`dir /b /a:d`) do (
    echo Created Directory: %%a
  )
  goto :sub_generate_subFolders

rem:::---------------------------------------------------------------

rem::: Generate Child Folders
:sub_generate_subFolders

  rem::: Update the veriables below to change the sub-directory names
  SET child1="Quotes"
  SET child2="Testfits"
  SET child3="Name1"
  SET child4="Name2"
  SET child5="Name3"

  echo.
  echo Creating Sub-Folders...
  echo.

  echo.
  echo The Following Sub-Directories Have Been Created:
  echo.

  for /f "usebackq tokens=*" %%a in (`dir /b /a:d`) do (

    rem::: enter the directory
    pushd %%a
    echo In Directory: %%a
    md %child1% %child2%
    rem::: leave the directory
    popd
  )

rem:::-----------------------------------------------------------------

  rem::: success output message.
    :success
    echo.
    echo ##############################################################
    echo.
    echo Success
    echo Folders %startNum% through %stopNum% have been created.
    echo Use 'tree' command to validate folder structure creation.
    echo.
    echo ##############################################################
    goto :eof

rem:::**************** Folder Generation Algorithms ********************

rem::: simple error handling subprocesses

:sub_error_noStart
  echo.
  echo Nothing was entered for Starting number. Please enter Start number. Try again.
  echo.
  goto  :eof

:sub_error_noStop
  echo.
  echo Nothing was entered for Stoping number. Please enter Stop number. Try agian.
  echo.
  goto  :eof

:sub_error_startNum_less_0
  echo.
  echo Starting Number Must Be A Positive Integer. Please try again.
  echo.
  goto  :eof

:sub_error_stopNum_less_startNum
  echo Starting number must be less than Stop number. Try again.
  goto  :eof

rem::: \\\\\\\\\\\\\\\\\\\\\END ACTUAL SCRIPT////////////////////////////

ENDLOCAL
