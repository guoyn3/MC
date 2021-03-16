*** Settings ***
Resource          ../Resource.robot

*** Test Cases ***
001查询
    Sleep    2
    店铺运营->退货单
    Sleep    2
    Selenium2Library.Input Text    //div[2]/div/div/div/input    ${orderId}
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div[2]/div[1]/div[2]/button[1]
    Element Should Contain    //div[2]/div[1]/div/div[2]/span[2]    ${orderId}
    log    查询退货单ok

002入库
    Sleep    2
    Selenium2Library.Click Button    //div[9]/button
    Sleep    2
    Selenium2Library.Click Button    //div[3]/div/div[2]/div/button[2]
    Sleep    2
    Element Should Contain    //div/div[4]/span[2]    已退货
    log    入库ok

003查看退货单详情
    Sleep    2
    Selenium2Library.Click Button    //div[8]/button
    Sleep    2
    Element Should Contain    //div[2]/div[4]/div/div[1]/span    查看实际入库信息
    log    查看详情ok
    Sleep    2
    Selenium2Library.Click Button    //div[4]/div/div[1]/button

004查看换货订单
    Sleep    2
    店铺运营->订单列表
    Sleep    2
    Selenium2Library.Click Button    //form/div/div[1]/div/div/div/div/div/div[1]/input
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
    Send    {ENTER}
    Sleep    2
    Selenium2Library.Input Text    //form/div/div[1]/div/div/div/input    ${orderId}
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div[2]/div[1]/div[2]/button[1]
    Sleep    2
    Element Should Contain    //div[3]/div[1]/div[2]/div[1]/div/div[2]/span[2]    换货订单
    ${换货订单号}    Selenium2Library.Get Text    //div/label/span[2]/span
    log    退货入库生成换货订单号，换货订单号为：${换货订单号}
    #关闭浏览器
    Close Browser
