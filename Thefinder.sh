#!/bin/bash
clear
verde='\033[01;32m'
vermelho='\033[01;31m'
branco='\033[01;37m'
amarelo='\033[01;33m'
if [ $(id -u) != 0 ]
then
	echo
	echo
	echo -e "$vermelho EXECUTE O SCRIPT COMO ROOT!"
	echo
	echo
	exit
else
	echo
fi
echo -e $vermelho
echo " ______  __ __    ___  _____  ____  ____   ___      ___  ____  "
sleep 0.2
echo "|      ||  |  |  /  _]|     ||    ||    \ |   \    /  _]|    \ "
sleep 0.2
echo "|      ||  |  | /  [_ |   __| |  | |  _  ||    \  /  [_ |  D  )"
sleep 0.2
echo "|_|  |_||  _  ||    _]|  |_   |  | |  |  ||  D  ||    _]|    / "
sleep 0.2
echo "  |  |  |  |  ||   [_ |   _]  |  | |  |  ||     ||   [_ |    \ "
sleep 0.2
echo "  |__|  |__|__||_____/|__|    |__| |__|__||____/ |_____/|__|__\ "
echo
dir='/usr/bin/nmap'
if [ -e $dir ]
then
	echo
	echo -e "    $verde  [+]$branco NMAP ENCONTRADO"
	echo
else
	echo
	echo -e "   $vermelho [-]$branco NMAP NAO ENCONTRADO"
	exit
fi
echo
echo -e "$verde      [1]$branco -- ESCANEAR A REDE TODA"
echo
echo -e  "$verde      [2]$branco -- ESCANEAR UM ALVO ESPECIFICO"
echo
echo
echo -ne "$verde Informe a opcao desejada:$branco " && read resposta
echo
if [ $resposta -eq 1 ]
then
	echo -ne "$verde Informe o IP do seu roteador: $branco" && read route
	echo
	echo -e "$verde Escaneando a rede toda..."
	echo " Isso pode demorar um pouco..."
	sleep 0.8
	echo -e $amarelo
	nmap $route/24
	echo
	echo -e  "$verde Pronto! Scan concluido! "
	exit
elif [ $resposta -eq 2 ]
then
	echo
	echo -e "$verde      [1]$branco -- SCAN SIMPLES"
	echo
	echo -e "$verde      [2]$branco -- SCAN ELABORADO"
	echo
	echo
	echo -ne "$verde Que tipo de scan voce quer fazer? : $branco" && read scan
elif [ $resposta -gt 2 ]
then
	echo
	echo -e "$vermelho Opcao invalida"
	echo
	echo " Saindo..."
	echo
	exit
elif [ $resposta -lt 1 ]
then
	echo
	echo -e "$vermelho Opcao invalida"
	echo
	echo " Saindo..."
	echo
	exit
fi

if [ $scan -eq 1 ]
then
	echo
	echo -ne "$verde Informe o endereco do alvo:$branco " && read ip
	echo
	echo -e "$verde Escaneando..."
	echo -e " Isso pode demorar um pouco..."
	echo -e $amarelo
	sleep 0.8
	nmap $ip -O
	echo
	echo -e "$verde Pronto! Scan concluido!"
	echo
	exit
elif [ $scan -eq 2 ]
then
	echo
	echo -ne "$verde Informe o endereco do alvo:$branco " && read ip2
	echo
	echo -e "$verde      [1]$branco -- ESCOLHA PORTAS PARA ESCANEAR"
	echo
	echo -e "$verde      [2]$branco -- ESCANEAR TODAS AS PORTAS"
	echo
	echo
	echo -ne "$verde Escolha a opcao:$branco " && read option
elif [ $scan -gt 2 ]
then
	echo
        echo -e "$vermelho Opcao invalida"
        echo
        echo " Saindo..."
        echo
        exit
elif [ $scan -lt 1 ]
then
	echo
        echo -e "$vermelho Opcao invalida"
        echo
        echo " Saindo..."
        echo
        exit
fi

if [ $option -eq 1 ]
then
	echo
	echo -e "$verde      [1]$branco -- ESCANEAR UM INTERVALO DE PORTAS"
	echo
	echo -e "$verde      [2]$branco -- ESCANEAR PORTAS ESPECIFICAS"
	echo
	echo
	echo -ne "$verde Quais serao as portas escaneadas:$branco " && read op2

elif [ $option -eq 2 ]
then
	echo
	echo -e "$verde Escaneando..."
	echo -e " Isso pode demorar um pouco"
	sleep 0.8
	echo -e $amarelo
	nmap $ip2 -sV -O -sS
	echo
	echo -e "$verde Pronto! Scan concluido!"
	exit
elif [ $option -gt 2 ]
then
	echo
        echo -e "$vermelho Opcao invalida"
        echo
        echo " Saindo..."
        echo
        exit
elif [ $option -lt 1 ]
then
	echo
        echo -e "$vermelho Opcao invalida"
        echo
        echo " Saindo..."
        echo
        exit
fi

if [ $op2 -eq 1 ]
then
	echo
	echo -ne "$verde Qual sera o intervalo de portas? Ex:0-443(neste formato):$branco " && read intervalo
	echo
	echo -e "$verde Escaneando..."
	echo -e " Isso pode demorar um pouco..."
	echo
	echo -e $amarelo
	nmap $ip2 -sV -O -sS -p $intervalo
	echo
	echo -e "$verde Pronto! Scan concluido!"
	echo
	exit
elif [ $op2 -eq 2 ]
then
	echo
	echo -ne "$verde Quais serao as portas a serem escaneadas?(Entre virgulas) Ex:22,23,443:$branco " && read intervalo2
	echo
	echo -e "$verde Escaneando..."
	echo -e " Isso pode demorar um pouco..."
	echo
	echo -e $amarelo
	nmap $ip2 -sV -O -sS -p $intervalo2
	echo
	echo -e "$verde Pronto! Scan concluido!"
	echo
elif [ $op2 -gt 2 ]
then
	echo
        echo -e "$vermelho Opcao invalida"
        echo
        echo " Saindo..."
        echo
        exit
elif [ $op2 -lt 1 ]
then
	echo
        echo -e "$vermelho Opcao invalida"
        echo
        echo " Saindo..."
        echo
        exit
fi
