*** Settings ***
Resource          ../Resource.robot
Resource          ../keyword.txt

*** Test Cases ***
新增仓库
    杀进程-钟
    登录
    库存中心
    库存中心->仓库管理
    sleep    2
    #点击新增
    Click Element    //*[@id="app"]/div/div[2]/div[2]/div[1]/div[2]/button/span
    #仓库名称
    ${num}    evaluate    random.randint(0,100)    random
    ${storeName}    catenate    SEPARATOR=    UItest仓库名称    ${num}
    Set Global Variable    ${storeName}
    Input Text    //*[@id="app"]/div/div[2]/div[2]/div[2]/div/div[2]/div/div/form/div/div[1]/div/div/div/input    ${storeName}
    #货主
    Click Element    //*[@id="app"]/div/div[2]/div[2]/div[2]/div/div[2]/div/div/form/div/div[3]/div/div/div/div/input
    sleep    2
    下拉列表下弹第一个
    sleep    2
    #仓库联系人
    Input Text    //*[@id="app"]/div/div[2]/div[2]/div[2]/div/div[2]/div/div/form/div/div[8]/div/div/div/input    UItest仓库联系人
    #联系方式
    Input Text    //*[@id="app"]/div/div[2]/div[2]/div[2]/div/div[2]/div/div/form/div/div[9]/div/div/div/input    13608080808
    #仓库地址
    Click Element    //*[@id="app"]/div/div[2]/div[2]/div[2]/div/div[2]/div/div/form/div/div[10]/div/div/span/span
    sleep    2
    Click Element    //*[@x-placement="top-start"]/ul/li[1]    #省
    sleep    2
    Click Element    //*[@x-placement="top-start"]/ul[2]/li[1]    #市
    sleep    2
    Click Element    //*[@x-placement="top-start"]/ul[3]/li[1]    #区
    #仓库详细地址
    Input Text    //*[@id="app"]/div/div[2]/div[2]/div[2]/div/div[2]/div/div/form/div/div[11]/div/div/div[1]/textarea    美的全球创新中心16栋
    #保存
    Click Element    //*[@id="app"]/div/div[2]/div[2]/div[2]/div/div[2]/div/div/div/button[2]
    sleep    1
    #新增成功验证
    element should contain    ${message}    提交成功

查询
    #输入仓库名称
    Input Text    //*[@id="app"]/div/div[2]/div[2]/div[1]/div[1]/form/div/div[1]/div/div/div/input    ${storeName}
    sleep    1
    #查询
    Click Element    //span[contains(.,'筛选')]
    sleep    2
    element should contain    //*[@id="app"]/div/div[2]/div[2]/div[1]/div[3]/div[1]/div[3]/table/tbody/tr/td[3]/div    ${storeName}
    log    查询成功

编辑
    #编辑按钮
    Click Element    //*[@id="app"]/div/div[2]/div[2]/div[1]/div[3]/div[1]/div[4]/div[2]/table/tbody/tr/td[9]/div/button[1]/span
    sleep    2
    #修改仓库详细地址
    Input Text    //*[@id="app"]/div/div[2]/div[2]/div[2]/div/div[2]/div/div/form/div/div[11]/div/div/div[1]/textarea    美的全球创新中心16栋修改
    sleep    2
    #保存
    Click Element    //*[@id="app"]/div/div[2]/div[2]/div[2]/div/div[2]/div/div/div/button[2]
    sleep    1
    #新增成功验证
    element should contain    ${message}    修改成功
    sleep    3

启用/禁用
    #启用
    Click Element    //*[@id="app"]/div/div[2]/div[2]/div[1]/div[3]/div[1]/div[4]/div[2]/table/tbody/tr/td[9]/div/button[2]/span
    sleep    1
    #验证停用成功
    element should contain    ${message}    启用成功
    sleep    3
    #停用
    Click Element    //*[@id="app"]/div/div[2]/div[2]/div[1]/div[3]/div[1]/div[4]/div[2]/table/tbody/tr/td[9]/div/button[3]/span
    sleep    1
    #验证启用成功
    element should contain    ${message}    停用成功
    close browser
