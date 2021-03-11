*** Settings ***
Resource          ../Resource.robot

*** Test Cases ***
001订单生成-手动新建
    构造订单号
    #杀进程
    #登录
    Sleep    2
    交易中心
    Sleep    2
    交易中心->订单列表
    #手动新建订单
    Sleep    2
    Selenium2Library.Click Button    //div[2]/button[7]
    Sleep    2
    Selenium2Library.Input Text    //form/div/div/div/div/div/input    ${newOrderId}
    Sleep    2
    Selenium2Library.Click Button    //div[2]/button[2]
    #填写订单信息
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div/div/div/div/div[1]/input
    Sleep    2
    Selenium2Library.Click Element    //*[contains(text(),'经销订单')]
    Sleep    2
    Selenium2Library.Input Text    //div/div[3]/div/div/div/div/div[1]/input    微商城-测试店铺0722
    Sleep    0.5
    Send    {down}
    Sleep    0.5
    Send    {enter}
    #收货人
    Sleep    2
    Selenium2Library.Input Text    //div/div[4]/div[1]/div/div/div/input    guo123
    Sleep    2
    Selenium2Library.Input Text    //div[4]/div[2]/div/div/div/div[1]/div/div[1]/input    15111111111
    #收货地址省市区
    #省
    Sleep    2
    Selenium2Library.Click Button    //div[5]/div[1]/div/div/div[1]/div[1]/div/div/div[1]/input
    Sleep    0.5
    Send    {down}
    Sleep    0.5
    Send    {enter}
    #市
    Sleep    2
    Selenium2Library.Click Button    //div[5]/div[1]/div/div/div[1]/div[2]/div/div/div[1]/input
    Sleep    0.5
    Send    {down}
    Sleep    0.5
    Send    {enter}
    #区
    Sleep    2
    Selenium2Library.Click Button    //div[5]/div[1]/div/div/div[1]/div[3]/div/div/div[1]/input
    Sleep    0.5
    Send    {down}
    Sleep    0.5
    Send    {enter}
    Sleep    2
    Selenium2Library.Input Text    //div/div[5]/div[1]/div/div/div[2]/div/div/textarea    美的创新中心
    Sleep    2
    Selenium2Library.Input Text    //div[6]/div[1]/div/div/div/input    昵称郭
    Sleep    2
    #支付方式
    Selenium2Library.Input Text    //div/div[2]/div/div[6]/div[2]/div/div/div/div[1]/input    微信支付
    Sleep    0.5
    Send    {down}
    Sleep    0.5
    Send    {enter}
    #配送方式
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div/div[7]/div[1]/div/div/div/div[1]/input
    Sleep    0.5
    Send    {down}
    Sleep    0.5
    Send    {down}
    Sleep    0.5
    Send    {enter}
    #添加商品
    Sleep    0.5
    Send    {DOWN}
    Sleep    0.5
    Send    {DOWN}
    Sleep    0.5
    Send    {DOWN}
    Sleep    0.5
    Send    {DOWN}
    Sleep    0.5
    Send    {DOWN}
    Sleep    0.5
    Send    {DOWN}
    Sleep    0.5
    Send    {DOWN}
    Sleep    0.5
    Send    {DOWN}
    Sleep    0.5
    Send    {DOWN}
    Sleep    0.5
    Send    {DOWN}
    Sleep    2
    Selenium2Library.Click Button    //form/div/div[4]/div/div/button[2]
    Sleep    2
    Selenium2Library.Input Text    //form/div/div[2]/div/div/div/input    郭商品A
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div[2]/div/div[2]/div[1]/div/button[1]
    Sleep    2
    Selenium2Library.Click Element    //div[3]/table/tbody/tr/td[1]/div/label/span
    Sleep    2
    Selenium2Library.Click Button    //div/div[3]/span/button[2]
    #选择发票
    Sleep    2
    Selenium2Library.Click Element    //div/div/div/div/div/label[2]/span[1]/span
    Sleep    2
    Selenium2Library.Click Button    //div/div[2]/div[2]/div[1]/button[2]

002查询
    #通过订单号查询订单
    Sleep    2
    Selenium2Library.Input Text    //form/div/div[1]/div/div/div/input    ${newOrderId}
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div[1]/div/div[2]/button[1]
    Sleep    2
    Element Should Contain    //div[2]/div[1]/div/div[1]/div/label/span[2]/span    ${newOrderId}
    log    查询成功

003详情
    #-----进入订单详情-----
    Sleep    2
    Selenium2Library.Click Button    //div[5]/button[5]
    #锁仓
    #Sleep    2
    #Selenium2Library.Click Element    //table/tbody/tr/td[12]/span/i
    #Sleep    2
    #Selenium2Library.Click Button    //span/div[1]/div[1]/input
    #Sleep    2
    #Selenium2Library.Click Element    //span[contains(.,'郭盲测仓库')]
    #Sleep    2
    #Selenium2Library.Click Button    //span/div[2]/button[1]

004虚拟发货
    Sleep    2
    Selenium2Library.Click Button    //div[2]/button[11]
    Sleep    2
    Selenium2Library.Click Button    //div/div[3]/button[2]
    log    虚拟发货成功

005导出订单
    #返回列表
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div[2]/button[1]
    #导出
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div[2]/button[2]
    Sleep    2
    Selenium2Library.Click Button    //div/div[3]/button[2]
    #查看导出队列
    Sleep    10
    Selenium2Library.Click Element    //img[contains(@src,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAC40lEQVRYR+2WW4hOURTHf3/KJZEhl8HDTAjlQaI8uTaYwRTFw7zICymXXEIaT5pChqEUSp4kLxS5FDIoPCBeXJJEhsGLRqLQ0vraR2c+05x9vu9hUnad+vrOPmv91tpr/dcWPbzUw/75D/BvZcDMHLgBWAtUAqOBX8AH4C1wFDgtyWJrKzoDZlYNnAWmZBh/ACyX9CoGIgrAzDzaO0BViHQncB94A/QCxgDTgabw253PkPQxCyIWoBWYBVwHFkv63pVhM+sHXATmAq2S5pQNYGbjgBdABzBR0vvujJrZKOApMAiYJOlZd/szM2BmzcBmoEXSpqyI/L2ZHQI2APskbc8FYGaDga3AtPAMDQZqJF2LBFgIXA57vUMeA3eBZklf0jY6ZcDMaoGTwIgiR5+B4ZJ+RAL0BT4BA4v2vwNWpgP5A2BmC4Ar4QOn3wW8lOTOS14ho2OB3YAH6KtOUiFDBQAzqwCeA8OAvZJ2lOyxmw/NbD+wBfD2HC+pIwFYDxwGbgDz8ihZHtCgpN7SM4F1ko4kAGeAFcB8SVfzGM27N3XULtkNCUAb4P1bUe6ZZwEFVfVifC2pKgFoD5U/UpK3TdQyM0+nxSheYjAF0C6pMgHw6vcuyHUEZlaYepIyBS0F4J1wyR9JixKAPYArlguNQ0SN07wAoQh9nviMaJLUmAD4NHsShOMgsE3Sz6xzyANgZn1cmoGNgGvLZEltaSFaGua9+3VNOODCJMlHbpcrBiDcI2rCPJkQDNVKKoherBTflDTbzOqBEyF9LWkAM/PIGoFlkm6HAvURnl5e4KsSFfwLIKhiehj5JWMIkAD4deyUVz7gMBeC9SXA+RCQA5xLAbjTR8C9MFE7SXt09aaq+BiwGvgG9A//J7+PS1qTVTvp96UA9A7R1hU58taql+SX1OiVGyAc0wDgFjA1eHro+i7pa7TnsLEkgADhd4bk5ludR0HLOoK8EWbtLzkDWYZj3/c4wG+mJhowo+FW9AAAAABJRU5ErkJggg==')]
    #Sleep    2
    #Wait Until Keyword Succeeds    20s    10s    Selenium2Library.Click Button    //div[1]/div[3]/div/button
    Sleep    2
    ${fileName}    Selenium2Library.Get Text    //div/div[2]/div/div[2]/p[1]
    log    ${fileName}
    Element Should Contain    //div[1]/div[2]/p[1]    订单导出
    Sleep    2
    Element Should COntain    //div[1]/div[3]/div/button    下载
    log    导出任务成功
    #下载
    Sleep    2
    Selenium2Library.Click Button    //div[1]/div[3]/div/button
    Sleep    2
    Should Exist    D:\\MyData\\guoyn3\\Downloads\\${fileName}    #OperatingSystem
    log    导出订单下载成功
    Sleep    2
    Remove File    D:\\MyData\\guoyn3\\Downloads\\${fileName}
    Sleep    2
    Selenium2Library.Click Element    //div[2]/div/div/div[1]/div/div[1]/i
