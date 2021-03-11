*** Settings ***
Resource          ../Resource.robot

*** Test Cases ***
001换货售后单生成
    Sleep    2
    店铺运营->售后列表
    #手工新增售后单
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div[2]/button[1]
    Sleep    2
    Selenium2Library.Input Text    //form/div[1]/div/div/input    ${orderId}
    Sleep    2
    Send    {ENTER}
    #售后类型-换货
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div[1]/div/div/div[1]/input
    Sleep    2
    Send    {DOWN}
    Sleep    2
    Send    {DOWN}
    Sleep    2
    Send    {DOWN}
    Sleep    2
    Send    {ENTER}
    Sleep    2
    Selenium2Library.Input Text    //form/div[2]/div[2]/div/div[1]/input    guo
    Sleep    2
    Selenium2Library.Click Button    //form/div[2]/div[4]/div/div[1]/div/div/div[1]/input
    Sleep    2
    Selenium2Library.Click Element    //span[contains(.,'营运因素')]
    Sleep    2
    Selenium2Library.Click Button    //div/div[2]/div/div/div[1]/input
    Sleep    2
    Selenium2Library.Click Element    //span[contains(.,'超卖缺货')]
    Sleep    2
    Selenium2Library.Input Text    //textarea    尺码不对换货
    Sleep    2
    Selenium2Library.Click Element    //li[2]/div/div[1]/label/span/span
    #生成售后单
    Sleep    2
    Selenium2Library.Click Button    //div[2]/button[3]
    #返回列表
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div[2]/button[1]

002查询
    Sleep    2
    Selenium2Library.Input Text    //form/div/div[1]/div/div/div/input    ${orderId}
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div[2]/div[1]/div[2]/button[1]

003售后详情
    #进入详情
    Sleep    2
    Selenium2Library.Click Button    //div[6]/button

004审核通过生成退货单
    #审核通过
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div[2]/button[2]
    #审核售后单选退货仓库及填写备注
    Sleep    2
    Selenium2Library.Click Button    //form/div[1]/div/div/div[1]/input
    Sleep    2
    Selenium2Library.Click Element    //span[contains(.,'郭盲测仓库')]
    Sleep    2
    Selenium2Library.Input Text    //textarea    换货售后单
    #提交审核
    Sleep    2
    Selenium2Library.Click Button    //span/button[2]
    #补充退货信息
    Sleep    2
    Selenium2Library.Click Button    //div[2]/button[5]
    Sleep    2
    Selenium2Library.Click Button    //form/div[1]/div/div/div[1]/input
    Sleep    2
    Selenium2Library.Click Element    //span[contains(.,'顺丰')]
    Sleep    2
    Selenium2Library.Input Text    //form/div[2]/div/div/input    123456789
    Sleep    2
    Selenium2Library.Click Button    //span/button[2]
    #提前换货
    #Sleep    2
    #Selenium2Library.Click Button    //div[2]/button[8]
    #Sleep    2
    #Selenium2Library.Click Button    //div[3]/button[2]
    #返回列表
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div[2]/button[1]

005导出
    #导出
    Sleep    2
    Selenium2Library.Click Button    //div[2]/div[2]/button[2]
    Sleep    2
    Selenium2Library.Click Button    //div/div[3]/button[2]
    #查看导出队列
    Sleep    10
    Selenium2Library.Click Element    //img[contains(@src,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAC40lEQVRYR+2WW4hOURTHf3/KJZEhl8HDTAjlQaI8uTaYwRTFw7zICymXXEIaT5pChqEUSp4kLxS5FDIoPCBeXJJEhsGLRqLQ0vraR2c+05x9vu9hUnad+vrOPmv91tpr/dcWPbzUw/75D/BvZcDMHLgBWAtUAqOBX8AH4C1wFDgtyWJrKzoDZlYNnAWmZBh/ACyX9CoGIgrAzDzaO0BViHQncB94A/QCxgDTgabw253PkPQxCyIWoBWYBVwHFkv63pVhM+sHXATmAq2S5pQNYGbjgBdABzBR0vvujJrZKOApMAiYJOlZd/szM2BmzcBmoEXSpqyI/L2ZHQI2APskbc8FYGaDga3AtPAMDQZqJF2LBFgIXA57vUMeA3eBZklf0jY6ZcDMaoGTwIgiR5+B4ZJ+RAL0BT4BA4v2vwNWpgP5A2BmC4Ar4QOn3wW8lOTOS14ho2OB3YAH6KtOUiFDBQAzqwCeA8OAvZJ2lOyxmw/NbD+wBfD2HC+pIwFYDxwGbgDz8ihZHtCgpN7SM4F1ko4kAGeAFcB8SVfzGM27N3XULtkNCUAb4P1bUe6ZZwEFVfVifC2pKgFoD5U/UpK3TdQyM0+nxSheYjAF0C6pMgHw6vcuyHUEZlaYepIyBS0F4J1wyR9JixKAPYArlguNQ0SN07wAoQh9nviMaJLUmAD4NHsShOMgsE3Sz6xzyANgZn1cmoGNgGvLZEltaSFaGua9+3VNOODCJMlHbpcrBiDcI2rCPJkQDNVKKoherBTflDTbzOqBEyF9LWkAM/PIGoFlkm6HAvURnl5e4KsSFfwLIKhiehj5JWMIkAD4deyUVz7gMBeC9SXA+RCQA5xLAbjTR8C9MFE7SXt09aaq+BiwGvgG9A//J7+PS1qTVTvp96UA9A7R1hU58taql+SX1OiVGyAc0wDgFjA1eHro+i7pa7TnsLEkgADhd4bk5ludR0HLOoK8EWbtLzkDWYZj3/c4wG+mJhowo+FW9AAAAABJRU5ErkJggg==')]
    Sleep    2
    ${fileName1}    Selenium2Library.Get Text    //div/div[2]/div/div[2]/p[1]
    log    ${fileName1}
    Element Should Contain    //div/div[2]/div/div[2]/p[1]    售后单导出
    Sleep    2
    Element Should COntain    //div[3]/div/button    下载
    log    导出任务成功
    #下载
    Sleep    2
    Selenium2Library.Click Button    //div[3]/div/button
    Sleep    2
    Should Exist    D:\\MyData\\guoyn3\\Downloads\\${fileName1}    #OperatingSystem
    log    导出订单下载成功
    Sleep    2
    Remove File    D:\\MyData\\guoyn3\\Downloads\\${fileName1}
    Sleep    2
    Selenium2Library.Click Element    //div[2]/div/div/div[1]/div/div[1]/i
