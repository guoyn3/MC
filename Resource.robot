*** Settings ***
Resource          keyword.txt
Library           Selenium2Library
Library           CustomLibrary
Library           ExcelLibrary
Library           AutoItLibrary
Library           DatabaseLibrary
Library           OperatingSystem
Library           Collections
Library           HttpLibrary.HTTP
Library           HttpLibrary
Library           RequestsLibrary
Library           requests
Library           json

*** Variables ***
${login}          http://10.16.94.56/login
${userAccount}    ptadmin
${userPassword}    123456789
${选择店铺}           测试店铺0722
${orderTemplate}    E:\\zhuanxiang\\UI automation\\robotframework\\document\\orderTemplate.xls
${orderTemplate1}    E:\\zhuanxiang\\UI automation\\robotframework\\document\\orderTemplate1.xls
