*** Settings ***
Resource          ../Resource.robot
Resource          ../keyword.txt

*** Test Cases ***
店铺库存列表
    杀进程-钟
    登录
    库存中心
    库存发布->店铺库存列表
    #输入店铺
    click element    //*[@id="app"]/div/div[2]/div[2]/div[1]/div[1]/form/div/div[1]/div/div/div/div[1]/span/span/i    #删除默认店铺
    sleep    2
    input text    //*[@class="el-row"]/div[1]/div/div/div/div[1]/input    微商城-sit
    sleep    2
    click element    //span[contains(.,'微商城-sit')]
    sleep    2
    Comment    execute javascript    document.querySelector("common-container has-bottom-fixed").scrollTop=1000
    Comment    #输入商品名称
    Comment    input text    //*[@id="app"]/div/div[2]/div[2]/div[1]/div[1]/form/div/div[2]/div/div/div/input    UI测试商品
    #筛选
    click element    //span[contains(.,'筛选')]
    sleep    2
    #详情
    click element    //*[@class='el-table__body-wrapper is-scroll-left']/table/tbody/tr[1]/td[8]/div/button[1]/span
    sleep    3
    #获取仓库可销售库存
    ${stockCnt}    get text    //*[@id="app"]/div/div[2]/div[2]/div[1]/div[5]/div/div[3]/table/tbody/tr/td[3]/div
    #编辑本店铺分配库存
    click element    //*[@class="el-icon-edit button-text"]
    sleep    3
    Comment    execute javascript    document.querySelector("common-container").scrollTop=1000
    #选择共享模式
    click element    //*[@class="el-radio-group"]/label[1]/span[1]/span
    Comment    #点击调整库存
    Comment    click element    //span[contains(.,'调整库存')]
    Comment    sleep    3
    Comment    #删除店铺分配数量
    Comment    click element    //*[@class='el-table__body-wrapper is-scroll-left']/table/tbody/tr[1]/td[2]/div/div/div/input
    Comment    send    ^a
    Comment    #输入店铺分配数量
    Comment    input text    //*[@class='el-table__body-wrapper is-scroll-left']/table/tbody/tr[1]/td[2]/div/div/div/input    ${stockCnt}
    Comment    sleep    3
    Comment    Comment    滚动条滚到页面底部
    Comment    sleep    2
    #确定
    click element    //*[@id="app"]/div/div[2]/div[2]/div[4]/div/div[3]/span/button[2]/span
    sleep    1
    element should contain    //*[@class="el-message el-message--success"]/p    操作成功！
    #详情页查看日志
    click element    //span[contains(.,'查看日志')]
    sleep    2
    #日志中调整后库存验证
    element should contain    //*[@id="app"]/div/div[2]/div[2]/div[3]/div/div[2]/div[1]/div/div[3]/table/tbody/tr[1]/td[3]/div    ${stockCnt}
    #关闭日志弹框
    click element    //*[@id="app"]/div/div[2]/div[2]/div[3]/div/div[1]/button/i
    Close Browser
