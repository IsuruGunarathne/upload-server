@echo off

title Python upload server 1.0

echo --------------------------------------------------------------------------
echo[
echo 			      Python upload server
echo[
echo --------------------------------------------------------------------------
echo[
echo ** This application requires Python to be installed on the Server
echo[
echo * Files in the Uploads folder are accessible on the local network

echo --------------------------------------------------------------------------
echo[

python get-pip.py

cd Uploads
pip install uploadserver
pip install qrcode

echo[
FOR /F "tokens=4 delims= " %%i in ('route print ^| find " 0.0.0.0"') do set localIp=%%i
echo Server IP Address on WIFI is: %localIp%
echo Address to access : %localIp%:8000

echo[
echo Scan the qr bellow to access if Server is connected to WIFI

qr --ascii "http://%localIp%:8000/"


for /f "tokens=3 delims=: " %%i  in ('netsh interface ip show config name^="Ethernet" ^| findstr "IP Address" ^| findstr [0-9]') do set IP=%%i
echo Server IP Address on Ethernet is: %IP%
echo Address to access when server is on Ethernet : %IP%:8000

echo[
echo Scan the qr bellow to access if Server is connected to Ethernet

qr --ascii "http://%IP%:8000/"

echo Press ctrl+C twice to exit 
echo[
echo[
python -m uploadserver

pause

