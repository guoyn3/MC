*** Settings ***
Resource          ../Resource.robot
Resource          ../keyword.txt

*** Test Cases ***
新建其他出入库单
    杀进程-钟
    登录
    库存中心
    库存中心->其他出入库
    #新增
    click element    //*[@class="common-btns-container"]/button[1]
    sleep    2
    #单据类型
    click element    //*[@id="app"]/div/div[2]/div[2]/div[1]/div[2]/div/form/div[1]/div/div/div/div/div[1]/input
    sleep    2
    下拉列表下弹第一个
    #仓库名称
    input text    //*[@id="app"]/div/div[2]/div[2]/div[1]/div[2]/div/form/div[2]/div[1]/div/div/div/div[1]/input    UI专用仓库
    sleep    2
    click element    //span[contains(.,'UI专用仓库')]
    #备注
    input text    //*[@type="textarea"]    UI自动化新建其他出入库单
    #新增商品明细
    click element    //*[@class="common-btns-container"]/button
    sleep    2
    #商品名称
    input text    //*[@class="el-table__body-wrapper is-scroll-left"]/table/tbody/tr/td[1]/div/div/div[1]/input    UI测试商品
    sleep    2
    click element    //span[contains(.,'UI测试商品')]
    #处理数量
    input text    //*[@class="el-table__body-wrapper is-scroll-left"]/table/tbody/tr/td[5]/div/div/input    2
    #生成
    click element    //*[@class="common-fixed-btn-bot-container"]/button[2]/span
    sleep    1
    click element    //span[contains(.,'确定')]
    sleep    1
    #新增成功验证
    element should contain    ${message}    生成成功
    sleep    3
    库存中心->其他出入库
    sleep    2
    #获取单据号
    ${otherStorageId}    get text    //*[@class="el-table__body-wrapper is-scroll-left"]/table/tbody/tr[1]/td[2]/div
    Set Global Variable    ${otherStorageId}

查询&详情
    #输入单据号
    input text    //*[@id="app"]/div/div[2]/div[2]/div/div[1]/form/div/div[1]/div/div/div/input    ${otherStorageId}
    #筛选
    click element    //span[contains(.,'筛选')]
    sleep    2
    element should contain    //*[@class="el-table__body-wrapper is-scroll-left"]/table/tbody/tr[1]/td[2]/div    ${otherStorageId}
    log    查询成功
    #点击详情
    click element    //*[@class="el-table__body-wrapper is-scroll-left"]/table/tbody/tr[1]/td[7]/div/a/button/span
    sleep    4
    #详情页验证
    element should contain    //*[@id="app"]/div/div[2]/div[2]/div[1]/div[1]/div/div[1]/span[2]    ${otherStorageId}
    log    详情页查看成功
    #返回列表页
    click element    //span[contains(.,'返回')]
    sleep    2
    log    返回列表成功

导出
    #导出
    click element    //span[contains(.,'导出')]
    click element    //span[contains(.,'确定')]
    sleep    3
    click element    //*[@id='exportBtn']/img
    sleep    3
    #在规定时间规定频率内执行关键字，直到成功
    Wait Until Keyword Succeeds    20s    2s    click element    //*[@class='list-content']/div[1]/div[3]/div/button/span    #等待下载按钮出现
    ${getFileName}    get text    //*[@class='el-scrollbar__view']/div[2]/div/div[2]/p[1]    #获取导出文件名
    Wait Until Keyword Succeeds    20s    3s    should exist    D:\\MyData\\zhongxl6\\Downloads\\${getFileName}    #本地查找下载的文件
    log    导出成功
    #关闭导出中心
    click element    //*[@class='el-icon-close']
    sleep    2
    Close Browser
