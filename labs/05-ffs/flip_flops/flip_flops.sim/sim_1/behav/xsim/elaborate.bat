@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.1 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Thu Mar 10 12:04:46 +0100 2022
REM SW Build 2902540 on Wed May 27 19:54:49 MDT 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto ea6bf7123b56494b90935bdb6fcb6034 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_ff_rst_behav xil_defaultlib.tb_ff_rst -log elaborate.log"
call xelab  -wto ea6bf7123b56494b90935bdb6fcb6034 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_ff_rst_behav xil_defaultlib.tb_ff_rst -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
