*** Settings ***
Resource          ../Resource.robot
Resource          ../keyword.txt

*** Test Cases ***
选择店铺
    杀进程-钟
    登录
    店铺运营
    店铺运营->商品列表
    #输入店铺名称
    input text    //*[@class='el-input el-input--mini']/input    测试店铺0722
    #搜索
    click element    //span[contains(.,'搜索')]
    sleep    2
    #选择
    click element    //*[@class='el-dialog__body']/div/div[1]/div[3]/table/tbody/tr[1]/td[4]/div/button/span
    sleep    3
    #验证店铺选择成功
    element should contain    //*[@class="shop-name"]/button/span    测试店铺0722
    log    店铺选择成功

新建商品
    #新建商品
    click element    //span[contains(.,'新建商品')]
    sleep    4
    #所属类目
    click element    //*[@class="el-form el-form--label-left"]/div[2]/div[1]/div/div/span[1]/div/div[1]/input
    sleep    2
    下拉列表下弹第一个
    click element    //*[@class="el-form el-form--label-left"]/div[2]/div[1]/div/div/span[2]/div/div[1]/input
    sleep    2
    下拉列表下弹第一个
    click element    //*[@class="el-form el-form--label-left"]/div[2]/div[1]/div/div/span[3]/div/div[1]/input
    sleep    2
    下拉列表下弹第一个
    #商品名称
    ${num}    evaluate    random.randint(0,100)    random
    ${itemName}    catenate    SEPARATOR=    SPU商品名称    ${num}
    Set Global Variable    ${itemName}
    input text    //*[@class="el-form el-form--label-left"]/div[2]/div[2]/div/div/div/div[1]/input    ${itemName}
    #发货时间
    input text    //*[@class="el-form el-form--label-left"]/div[2]/div[3]/div/div/div/div/input    1
    #商品描述
    input text    //*[@class="el-form el-form--label-left"]/div[2]/div[4]/div/div/div/div/input    商品描述
    #规格名
    click element    //*[@class="el-form el-form--label-left"]/div[2]/div[5]/div[1]/div/div/div/div[1]/div[1]/div[2]/div/div/div/div[1]/input
    sleep    2
    下拉列表下弹第一个
    #规格值
    input text    //*[@class="el-form el-form--label-left"]/div[2]/div[5]/div[1]/div/div/div/div[1]/div[2]/div[2]/div/div/div/input    10月1日
    sleep    2
    click element    //*[@class="el-form el-form--label-left"]/div[2]/div[5]/div[1]/div/div/div/div[1]/div[2]/div[1]/span    #点击空白处
    sleep    4
    #滚动条按一定像素值滚动
    execute javascript    document.documentElement.scrollTop=1000
    #选择规格明细
    click element    //span[contains(.,'选择')]
    sleep    2
    #输入商品名称
    input text    //*[@class="el-form el-form--label-left"]/div/div[2]/div/div/div/input    UI测试商品
    click element    //span[contains(.,'筛选')]
    sleep    2
    #选择商品
    click element    //*[@id="app"]/div/div[2]/div[2]/div[3]/div/div[2]/div[2]/div[1]/div[3]/table/tbody/tr/td[1]/div/label/span/span
    sleep    1
    #确定
    click element    //*[@id="app"]/div/div[2]/div[2]/div[3]/div/div[3]/span/button[2]/span
    sleep    2
    input text    //*[@id="app"]/div/div[2]/div[2]/div[1]/form/div[2]/div[5]/div[2]/div/div/div/div[1]/div[3]/table/tbody/tr/td[8]/div/div/div[2]/div/input    1    #输入划线价
    input text    //*[@id="app"]/div/div[2]/div[2]/div[1]/form/div[2]/div[5]/div[2]/div/div/div/div[1]/div[3]/table/tbody/tr/td[9]/div/div/div[2]/div/input    2    #输入零售价
    sleep    4
    #滚动条按一定像素值滚动
    execute javascript    document.documentElement.scrollTop=0
    Send    {DOWN}
    sleep    0.5
    Send    {DOWN}
    sleep    0.5
    Send    {DOWN}
    sleep    0.5
    Send    {DOWN}
    #滚动条滚到页面底部
    #上传主图
    click element    //*[@class="el-form el-form--label-left"]/div[4]/div[1]/div/div/div/input
    sleep    2
    win wait    打开    #等待含有打开的窗口出现
    #选择文件
    control set text    \    \    Edit1    F:\\Python\\MC\\商品规格明细.jpg
    sleep    2
    #点击打开按钮上传
    control click    \    \    Button1
    sleep    3
    #提交
    click element    //*[@class="el-button letter-spacing el-button--primary el-button--small"]/span
    sleep    1
    #验证提交
    element should contain    ${message}    提交成功
    滚动条滚到页面顶部
    sleep    2

编辑&详情
    #输入商品名称
    input text    //*[@class="el-form el-form--label-left"]/div/div[2]/div/div/div/input    ${itemName}
    #点击筛选
    click element    //span[contains(.,'筛选')]
    sleep    2
    #点击编辑
    click element    //*[@class="el-table__fixed-right"]/div[2]/table/tbody/tr/td[8]/div/button[3]/span
    sleep    3
    #修改商品描述
    ${spuDes}    catenate    SEPARATOR=    修改spu    ${itemName}    的商品描述
    input text    //*[@class="el-form el-form--label-left"]/div[2]/div[4]/div/div/div/div/input    ${spuDes}
    sleep    1
    #点击提交
    click element    //*[@class="el-button letter-spacing el-button--primary el-button--small"]
    sleep    1
    #验证提交成功
    element should contain    ${message}    提交成功
    #点击筛选
    click element    //span[contains(.,'筛选')]
    sleep    2
    #点击详情
    click element    //*[@class="el-table__fixed-right"]/div[2]/table/tbody/tr/td[8]/div/button[1]/span
    sleep    2
    #验证商品描述和修改一致
    element should contain    //*[@class="el-form el-form--label-left"]/div[2]/div[4]/div/div/div/span    ${spuDes}
    #返回
    click element    //*[@class="el-button letter-spacing el-button--default el-button--small"]
    sleep    1

上下架
    #点击筛选
    click element    //span[contains(.,'筛选')]
    sleep    2
    #点击上架
    click element    //*[@class="el-table__fixed-right"]/div[2]/table/tbody/tr/td[8]/div/button[2]/span
    sleep    2
    #快速设置
    click element    //*[@id="app"]/div/div[2]/div[2]/div/div[7]/div/div[2]/form/div[1]/div/div/div/div/label/span[1]/span
    click element    //*[@id="app"]/div/div[2]/div[2]/div/div[7]/div/div[3]/span/button[2]/span    #确定
    sleep    2
    #上架成功校验
    ${text}    get text    //*[@class="el-table__fixed-right"]/div[2]/table/tbody/tr/td[8]/div/button[2]/span
    should contain    ${text}    下架
    #点击筛选
    click element    //span[contains(.,'筛选')]
    sleep    2
    #点击下架
    click element    //*[@class="el-table__fixed-right"]/div[2]/table/tbody/tr/td[8]/div/button[2]/span
    sleep    2
    #快速设置
    click element    //*[@id="app"]/div/div[2]/div[2]/div/div[7]/div/div[2]/form/div[1]/div/div/div/div/label/span[1]/span
    click element    //*[@id="app"]/div/div[2]/div[2]/div/div[7]/div/div[3]/span/button[2]/span    #确定
    sleep    2
    #下架成功校验
    ${text}    get text    //*[@class="el-table__fixed-right"]/div[2]/table/tbody/tr/td[8]/div/button[2]/span
    should contain    ${text}    上架

批量上下架
    #点击筛选
    click element    //span[contains(.,'筛选')]
    sleep    2
    #批量选择
    click element    //*[@id="app"]/div/div[2]/div[2]/div/div[3]/div/div[2]/table/thead/tr/th[1]/div/label/span/span
    sleep    3
    #点击批量上架
    click element    //span[contains(.,'批量上架')]
    click element    //*[@id="app"]/div/div[2]/div[2]/div/div[7]/div/div[2]/form/div[1]/div/div/div/div/label/span[1]/span    #快速设置
    click element    //*[@id="app"]/div/div[2]/div[2]/div/div[7]/div/div[3]/span/button[2]/span    #确定
    sleep    2
    #上架成功校验
    ${text}    get text    //*[@class="el-table__fixed-right"]/div[2]/table/tbody/tr/td[8]/div/button[2]/span
    should contain    ${text}    下架
    #点击筛选
    click element    //span[contains(.,'筛选')]
    sleep    2
    #批量选择
    click element    //*[@id="app"]/div/div[2]/div[2]/div/div[3]/div/div[2]/table/thead/tr/th[1]/div/label/span/span
    sleep    3
    #点击批量下架
    click element    //span[contains(.,'批量下架')]
    click element    //*[@id="app"]/div/div[2]/div[2]/div/div[7]/div/div[2]/form/div/div/div/div/div/label/span[1]/span    #快速设置
    click element    //*[@id="app"]/div/div[2]/div[2]/div/div[7]/div/div[3]/span/button[2]    #确定
    sleep    2
    #下架成功校验
    ${text}    get text    //*[@class="el-table__fixed-right"]/div[2]/table/tbody/tr/td[8]/div/button[2]/span
    should contain    ${text}    上架
    #重置
    click element    //span[contains(.,'重置')]

导出
    #点击筛选
    click element    //span[contains(.,'筛选')]
    sleep    2
    #导出
    click element    //*[@class="common-btns-container"]/button[5]/span
    sleep    1
    click element    //*[@class="el-button el-button--default el-button--small el-button--primary "]
    sleep    1
    #点击导出中心
    click element    //*[@id='exportBtn']/img
    #在规定时间规定频率内执行关键字，直到成功
    Wait Until Keyword Succeeds    60s    2s    click element    //*[@class='list-content']/div[1]/div[3]/div/button/span    #等待下载按钮出现
    ${getSkuFileName}    get text    //*[@class='el-scrollbar__view']/div[2]/div[1]/div[2]/p[1]    #获取导出文件名
    Wait Until Keyword Succeeds    20s    3s    should exist    D:\\MyData\\zhongxl6\\Downloads\\${getSkuFileName}    #本地查找下载的文件
    log    导出成功
    #关闭导出中心
    click element    //*[@class='el-icon-close']
    sleep    2

导入
    #点击导入
    click element    //*[@class="common-btns-container"]/button[4]/span
    sleep    2
    click element    //*[@class="el-upload el-upload--text"]    #导入按钮
    sleep    2
    win wait    打开    #等待含有打开的窗口出现
    #选择文件
    control set text    \    \    Edit1    F:\\Python\\rfscripts\\MeicloudMC\\mallProductTemplate.xls
    sleep    2
    #点击打开按钮上传
    control click    \    \    Button1
    Wait Until Keyword Succeeds    20s    1s    element should contain    ${message}    导入成功

选择总部商品
    #点击选择总部商品
    click element    //span[contains(.,'选择总部商品')]
