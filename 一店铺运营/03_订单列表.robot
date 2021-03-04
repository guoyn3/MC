*** Settings ***
Resource          ../Resource.robot

*** Test Cases ***
001订单生成-导入
    Sleep    2
    店铺运营
    Sleep    2
    店铺运营->订单列表
    #选择店铺
    Sleep    2
    Selenium2Library.Input Text    //div[2]/div/div[1]/div/div/div/input    ${选择店铺}
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div/div[1]/div/div/button[1]
    Sleep    2
    Selenium2Library.Click Button    //table/tbody/tr/td[4]/div/button
    Sleep    2
    #构造导入订单文件-店铺运营
    #导入订单
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div[2]/button[1]
    sleep    2
    Selenium2Library.Click Button    //form/div[1]/div/div/div/button
    sleep    2
    Win Wait    打开    #等待含有打开的窗口出现
    #选择文件
    Sleep    2
    Control Set Text    \    \    Edit1    ${orderTemplate1}
    #点击打开按钮上传
    Sleep    2
    Control Click    \    \    Button1
    #刷新列表
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div[2]/div[1]/div[2]/button[1]
    Sleep    2
    ${order}    Selenium2Library.Get Text    //div[2]/div[1]/div/div[1]/div/label/span[2]/span
    log    ${order}
    log    ${orderId}
    Sleep    2
    Should Contain    ${order}    ${orderId}
    log    订单导入成功
    Sleep    2
    Remove File    ${orderTemplate1}

002查询
    #通过订单号查询订单
    Sleep    2
    Selenium2Library.Input Text    //form/div/div[1]/div/div/div/input    ${orderId}
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div[2]/div[1]/div[2]/button[1]
    Sleep    2
    Element Should Contain    //div[2]/div[1]/div/div[1]/div/label/span[2]/span    ${orderId}
    log    查询成功

003详情
    #-----进入订单详情-----
    Sleep    2
    Selenium2Library.Click Button    //div[5]/button[5]
    #锁仓
    Sleep    2
    Selenium2Library.Click Element    //td[12]/span
    Sleep    2
    Selenium2Library.Click Button    //span/div/div[1]/input
    Sleep    2
    Selenium2Library.Click Element    //span[contains(.,'郭盲测仓库')]
    Sleep    2
    Selenium2Library.Click Button    //td[12]/span/button[1]

004审核
    Sleep    2
    Selenium2Library.Click Button    //div[2]/button[2]
    Sleep    2
    Selenium2Library.Click Button    //div[3]/button[2]

005发货
    Sleep    2
    Selenium2Library.Click Button    //div[2]/button[7]
    #填写物流信息
    Sleep    2
    Selenium2Library.Click Button    //form/div[2]/div/div/div[1]/input
    Sleep    2
    Selenium2Library.Click Element    //span[contains(.,'顺丰')]
    Sleep    2
    Selenium2Library.Input Text    //form/div[3]/div/div/input    123456
    Sleep    2
    Selenium2Library.Click Button    //div/div[3]/span/button[2]
    #返回订单列表
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div[2]/div[2]/button[1]
    #重新查询列表
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div[2]/div[1]/div[2]/button[1]
    Sleep    2
    Element Should Contain    //div[2]/div[1]/div/div[6]/span[2]    已发货
    log    发货成功

006导出订单
    #导出
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div[2]/button[2]
    Sleep    2
    Selenium2Library.Click Button    //div/div[3]/button[2]
    #查看导出队列
    Sleep    10
    Selenium2Library.Click Element    //img[contains(@src,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAC40lEQVRYR+2WW4hOURTHf3/KJZEhl8HDTAjlQaI8uTaYwRTFw7zICymXXEIaT5pChqEUSp4kLxS5FDIoPCBeXJJEhsGLRqLQ0vraR2c+05x9vu9hUnad+vrOPmv91tpr/dcWPbzUw/75D/BvZcDMHLgBWAtUAqOBX8AH4C1wFDgtyWJrKzoDZlYNnAWmZBh/ACyX9CoGIgrAzDzaO0BViHQncB94A/QCxgDTgabw253PkPQxCyIWoBWYBVwHFkv63pVhM+sHXATmAq2S5pQNYGbjgBdABzBR0vvujJrZKOApMAiYJOlZd/szM2BmzcBmoEXSpqyI/L2ZHQI2APskbc8FYGaDga3AtPAMDQZqJF2LBFgIXA57vUMeA3eBZklf0jY6ZcDMaoGTwIgiR5+B4ZJ+RAL0BT4BA4v2vwNWpgP5A2BmC4Ar4QOn3wW8lOTOS14ho2OB3YAH6KtOUiFDBQAzqwCeA8OAvZJ2lOyxmw/NbD+wBfD2HC+pIwFYDxwGbgDz8ihZHtCgpN7SM4F1ko4kAGeAFcB8SVfzGM27N3XULtkNCUAb4P1bUe6ZZwEFVfVifC2pKgFoD5U/UpK3TdQyM0+nxSheYjAF0C6pMgHw6vcuyHUEZlaYepIyBS0F4J1wyR9JixKAPYArlguNQ0SN07wAoQh9nviMaJLUmAD4NHsShOMgsE3Sz6xzyANgZn1cmoGNgGvLZEltaSFaGua9+3VNOODCJMlHbpcrBiDcI2rCPJkQDNVKKoherBTflDTbzOqBEyF9LWkAM/PIGoFlkm6HAvURnl5e4KsSFfwLIKhiehj5JWMIkAD4deyUVz7gMBeC9SXA+RCQA5xLAbjTR8C9MFE7SXt09aaq+BiwGvgG9A//J7+PS1qTVTvp96UA9A7R1hU58taql+SX1OiVGyAc0wDgFjA1eHro+i7pa7TnsLEkgADhd4bk5ludR0HLOoK8EWbtLzkDWYZj3/c4wG+mJhowo+FW9AAAAABJRU5ErkJggg==')]
    Sleep    2
    ${fileName}    Selenium2Library.Get Text    //div/div[2]/div/div[2]/p[1]
    log    ${fileName}
    Element Should Contain    //div/div[2]/div/div[2]/p[1]    订单导出
    Sleep    2
    Element Should COntain    //div[3]/div/button    下载
    log    导出任务成功
    #下载
    Sleep    2
    Selenium2Library.Click Button    //div[3]/div/button
    Sleep    2
    Should Exist    D:\\MyData\\guoyn3\\Downloads\\${fileName}    #OperatingSystem
    log    导出订单下载成功
    Sleep    2
    Remove File    D:\\MyData\\guoyn3\\Downloads\\${fileName}
    Sleep    2
    Selenium2Library.Click Element    //div[2]/div/div/div[1]/div/div[1]/i
