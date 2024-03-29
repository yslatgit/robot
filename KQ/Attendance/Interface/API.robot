*** Settings ***
Documentation     API
Force Tags
Resource          ../../share_keywords.txt

*** Test Cases ***
Leave days interface
    [Documentation]    请假天数接口
    ${cookies}    Get_GaoQi1_Cookies
    ${api_list}    Get Data From Excel    %{G_RESUORCE}\\接口.xlsx    请假天数接口
    ${len}    Get Length    ${api_list}
    : FOR    ${i}    IN RANGE    1    ${len}
    \    ${response_dict}    POST_REQ    ${api_list[${i}][0]}    ${api_list[${i}][1]}    ${cookies}
    \    ${res}    Compare Two Dict    ${api_list[${i}][2]}    ${response_dict}    ${api_list[${i}][3]}
    \    Should Be Equal As Strings    ${res}    True

Remaining vacation days interface
    [Documentation]    剩余假期天数接口
    ${cookies}    Get_GaoQi1_Cookies
    ${api_list}    Get Data From Excel    %{G_RESUORCE}\\接口.xlsx    剩余假期天数接口
    ${len}    Get Length    ${api_list}
    : FOR    ${i}    IN RANGE    1    ${len}
    \    ${response_dict}    POST_REQ    ${api_list[${i}][0]}    ${api_list[${i}][1]}    ${cookies}
    \    LOG    ${api_list[${i}][2]}
    \    LOG    ${response_dict}
    \    ${res}    Compare Two Dict    ${api_list[${i}][2]}    ${response_dict}    ${api_list[${i}][3]}
    \    Should Be Equal As Strings    ${res}    True

Check the compliance of the application card
    [Documentation]    请假单补签卡合规性校验
    ${cookies}    Get_GaoQi1_Cookies
    ${api_list}    Get Data From Excel    %{G_RESUORCE}\\接口.xlsx    请假单补签卡合规性校验
    ${len}    Get Length    ${api_list}
    : FOR    ${i}    IN RANGE    1    ${len}
    \    ${response_dict}    POST_REQ    ${api_list[${i}][0]}    ${api_list[${i}][1]}    ${cookies}
    \    LOG    ${api_list[${i}][2]}
    \    LOG    ${i+1}
    \    LOG    **${response_dict}
    \    ${res}    Compare Two Dict    ${api_list[${i}][2]}    ${response_dict}    ${api_list[${i}][3]}
    \    Should Be Equal As Strings    ${res}    True

Request data receiving interface
    [Documentation]    请假单数据接收接口
    ${cookies}    Get_GaoQi1_Cookies
    ${api_list}    Get Data From Excel    %{G_RESUORCE}\\接口.xlsx    请假单数据接收接口
    LOG    ${api_list[4][4]}
    ${len}    Get Length    ${api_list}
    : FOR    ${i}    IN RANGE    1    ${len}
    \    ${response_dict}    POST_REQ    ${api_list[${i}][0]}    ${api_list[${i}][1]}    ${cookies}
    \    LOG    ${i+1}
    \    LOG    ${api_list[${i}][2]}
    \    LOG    ${response_dict}
    \    ${res}    Compare Two Dict    ${api_list[${i}][2]}    ${response_dict}    ${api_list[${i}][3]}
    \    Should Be Equal As Strings    ${res}    True
    \    Run Keyword IF    "${i}"=="4" or "${i}"=="18" or "${i}"=="32" or "${i}"=="46" or "${i}"=="60" or "${i}"=="74" or "${i}"=="88" or "${i}"=="102" or "${i}"=="116" or "${i}"=="130" or "${i}"=="144" or "${i}"=="156" or "${i}"=="159" or "${i}"=="166" or "${i}"=="172" or "${i}"=="175" or "${i}"=="182" or "${i}"=="188" or "${i}"=="191" or "${i}"=="198" or "${i}"=="204" or "${i}"=="207" or "${i}"=="214" or "${i}"=="232" or "${i}"=="235" or "${i}"=="238" or "${i}"=="241"    Check Daily Info    ${api_list[${i}][5]}    ${api_list[${i}][4]}

Overtime receipt interface
    [Documentation]    加班单接收接口
    ${cookies}    Get_GaoQi1_Cookies
    ${api_list}    Get Data From Excel    %{G_RESUORCE}\\接口.xlsx    加班单接收接口
    ${len}    Get Length    ${api_list}
    : FOR    ${i}    IN RANGE    1    ${len}
    \    ${response_dict}    POST_REQ    ${api_list[${i}][0]}    ${api_list[${i}][1]}    ${cookies}
    \    LOG    ${api_list[${i}][2]}
    \    LOG    ${i+1}
    \    LOG    ${response_dict}
    \    ${res}    Compare Two Dict    ${api_list[${i}][2]}    ${response_dict}    ${api_list[${i}][3]}
    \    Should Be Equal As Strings    ${res}    True
    \    Run Keyword IF    "${i}"=="4" or "${i}"=="9" or "${i}"=="14" or "${i}"=="17" or "${i}"=="20" or "${i}"=="23" or "${i}"=="28" or "${i}"=="33" or "${i}"=="38" or "${i}"=="41" or "${i}"=="44" or "${i}"=="47"    Check Daily Info    ${api_list[${i}][5]}    ${api_list[${i}][4]}
    \    Run Keyword IF    "${i}"=="50"    Check Daily Info2    ${api_list[${i}][5]}    ${api_list[${i}][4]}
    \    Sleep    0.2

Receiving interface for replacement card
    [Documentation]    补签卡接收接口
    [Tags]
    ${cookies}    Get_GaoQi1_Cookies
    ${api_list}    Get Data From Excel    %{G_RESUORCE}\\接口.xlsx    补签卡接收接口
    ${len}    Get Length    ${api_list}
    : FOR    ${i}    IN RANGE    1    ${len}
    \    ${response_dict}    POST_REQ    ${api_list[${i}][0]}    ${api_list[${i}][1]}    ${cookies}
    \    LOG    ${api_list[${i}][2]}
    \    LOG    ${response_dict}
    \    LOG    ${i}
    \    ${res}    Compare Two Dict    ${api_list[${i}][2]}    ${response_dict}    ${api_list[${i}][3]}
    \    Should Be Equal As Strings    ${res}    True
    \    Run Keyword IF    "${i}"=="3" or "${i}"=="9"    Check Daily Info    ${api_list[${i}][5]}    ${api_list[${i}][4]}

Check the compliance of overtime work order
    [Documentation]    加班单合规性校验
    ${cookies}    Get_GaoQi1_Cookies
    ${api_list}    Get Data From Excel    %{G_RESUORCE}\\接口.xlsx    加班单合规性校验
    ${len}    Get Length    ${api_list}
    : FOR    ${i}    IN RANGE    1    ${len}
    \    ${response_dict}    POST_REQ    ${api_list[${i}][0]}    ${api_list[${i}][1]}    ${cookies}
    \    LOG    ${api_list[${i}][2]}
    \    LOG    ${response_dict}
    \    ${res}    Compare Two Dict    ${api_list[${i}][2]}    ${response_dict}    ${api_list[${i}][3]}
    \    Should Be Equal As Strings    ${res}    True

Clock interface
    [Documentation]    打卡接口
    ${cookies}    Get_GaoQi1_Cookies
    ${api_list}    Get Data From Excel    %{G_RESUORCE}\\接口.xlsx    打卡接口
    LOG    ${api_list[1][3]}
    ${len}    Get Length    ${api_list}
    : FOR    ${i}    IN RANGE    1    ${len}
    \    ${response_dict}    POST_REQ    ${api_list[${i}][0]}    ${api_list[${i}][1]}    ${cookies}
    \    LOG    ${i+1}
    \    LOG    ${api_list[${i}][2]}
    \    LOG    ${response_dict}
    \    ${res}    Compare Two Dict    ${api_list[${i}][2]}    ${response_dict}    ${api_list[${i}][3]}
    \    Should Be Equal As Strings    ${res}    True
    \    Run Keyword If    "${i}"=="2" or "${i}"=="4" or "${i}"=="6"    Check_Clock_Info    ${api_list[${i}][4]}    ${api_list[${i}][5]}
    Sleep    2
    Execute Sql String    delete [tahoe_atnd].[dbo].[sign_data] where equipmentID='123456789';delete [tahoe_sec].[dbo].[tbm_mobiledata] where equipmentID in ('123456789','1234554321') or cusercode in ('sunpeng1','gaoqi1') and calendartime>'2019-07-30 00:00'

Frequency query interface
    [Documentation]    班次查询接口
    ${cookies}    Get_GaoQi1_Cookies
    ${api_list}    Get Data From Excel    %{G_RESUORCE}\\接口.xlsx    班次查询接口
    ${len}    Get Length    ${api_list}
    ${url}    Set Variable    ${api_list[1][0]}
    : FOR    ${i}    IN RANGE    1    ${len}
    \    ${response_dict}    POST_REQ    ${url.replace('\\r','').replace('\\n','')}    ${api_list[${i}][1]}    ${cookies}
    \    LOG    ${response_dict}
    \    ${data}    TO json    ${response_dict}
    \    ${len}    Get Length    ${data}
    \    ${res}    DB_Data    ${sql[25][0]}
    \    Should Be Equal As Strings    ${len}    ${res[0][0]}

Query the employee shift interface
    [Documentation]    查询员工班次接口
    ${cookies}    Get_GaoQi1_Cookies
    ${api_list}    Get Data From Excel    %{G_RESUORCE}\\接口.xlsx    查询员工班次接口
    ${len}    Get Length    ${api_list}
    : FOR    ${i}    IN RANGE    1    ${len}
    \    ${response_dict}    POST_REQ    ${api_list[${i}][0]}    ${api_list[${i}][1]}    ${cookies}
    \    LOG    ${api_list[${i}][2]}
    \    LOG    ${response_dict}
    \    ${res}    Compare Two Dict    ${api_list[${i}][2]}    ${response_dict}    ${api_list[${i}][3]}
    \    Should Be Equal As Strings    ${res}    True
    \    Run Keyword IF    "${i}"=="1"    Check Daily Info    ${api_list[${i}][5]}    ${api_list[${i}][4]}

Change the shift interface
    [Documentation]    更改调班接口
    ${cookies}    Get_GaoQi1_Cookies
    ${api_list}    Get Data From Excel    %{G_RESUORCE}\\接口.xlsx    更改调班接口
    ${len}    Get Length    ${api_list}
    : FOR    ${i}    IN RANGE    1    ${len}
    \    ${response_dict}    POST_REQ    ${api_list[${i}][0]}    ${api_list[${i}][1]}    ${cookies}
    \    LOG    ${api_list[${i}][2]}
    \    LOG    ${response_dict}
    \    ${res}    Compare Two Dict    ${api_list[${i}][2]}    ${response_dict}    ${api_list[${i}][3]}
    \    Should Be Equal As Strings    ${res}    True

Mobile platform check recent attendance
    [Documentation]    移动平台查近期考勤
    ${cookies}    Get_GaoQi1_Cookies
    ${api_list}    Get Data From Excel    %{G_RESUORCE}\\接口.xlsx    移动平台查近期考勤
    ${len}    Get Length    ${api_list}
    : FOR    ${i}    IN RANGE    1    ${len}
    \    ${response_dict}    POST_REQ    ${api_list[${i}][0]}    ${api_list[${i}][1]}    ${cookies}
    \    LOG    ${api_list[${i}][2]}
    \    LOG    ${response_dict}
    \    ${res}    Compare Two Dict    ${api_list[${i}][2]}    ${response_dict}    ${api_list[${i}][3]}
    \    Should Be Equal As Strings    ${res}    True

Mobile platform punch card interface
    [Documentation]    移动平台打卡接口
    ${cookies}    Get_SunPeng1_Cookies
    ${cookies_2}    Get_Gaoqi1_Cookies
    ${cookie_list}    Create List    ${cookies}    ${cookies}    ${cookies_2}    ${cookies}    ${cookies}
    ...    ${cookies}
    ${api_list}    Get Data From Excel    %{G_RESUORCE}\\接口.xlsx    移动平台打卡接口
    ${len}    Get Length    ${api_list}
    : FOR    ${i}    IN RANGE    1    ${len}
    \    ${response_dict}    POST_REQ    ${api_list[${i}][0]}    ${api_list[${i}][1]}    ${cookie_list[${i-1}]}
    \    LOG    ${i+1}
    \    LOG    ${api_list[${i}][2]}
    \    LOG    ${response_dict}
    \    ${res}    Compare Two Dict    ${api_list[${i}][2]}    ${response_dict}    ${api_list[${i}][3]}
    \    Should Be Equal As Strings    ${res}    True
    \    Run Keyword If    "${i}"=="2" or "${i}"=="4" or "${i}"=="6"    Check_Clock_Info    ${api_list[${i}][4]}    ${api_list[${i}][5]}
    Sleep    2
    Execute Sql String    delete [tahoe_atnd].[dbo].[sign_data] where equipmentID='123456789';delete [tahoe_sec].[dbo].[tbm_mobiledata] where equipmentID in ('123456789','1234554321') or cusercode in ('sunpeng1','gaoqi1') and calendartime>'2019-07-30 00:00'

Query the number of anomalies this month
    [Documentation]    查询本月异常数量
    ${cookies}    Get_XiaoDD_Cookies
    ${api_list}    Get Data From Excel    %{G_RESUORCE}\\接口.xlsx    查询本月异常数量
    ${len}    Get Length    ${api_list}
    : FOR    ${i}    IN RANGE    1    ${len}
    \    ${response_dict}    POST_REQ    ${api_list[${i}][0]}    ${api_list[${i}][1]}    ${cookies}
    \    LOG    ${api_list[${i}][2]}
    \    LOG    ${response_dict}
    \    ${res}    Compare Two Dict    ${api_list[${i}][2]}    ${response_dict}    ${api_list[${i}][3]}
    \    Should Be Equal As Strings    ${res}    True

Request data receiving interface group
    [Documentation]    请假单数据接收接口(组合接口)
    [Tags]
    [Setup]    Request Data Initial
    ${cookies}    Get_GaoQi1_Cookies
    ${api_list}    Get Data From Excel    %{G_RESUORCE}\\接口.xlsx    请假组合
    ${len}    Get Length    ${api_list}
    : FOR    ${i}    IN RANGE    1    ${len}
    \    ${response_dict}    POST_REQ    ${api_list[${i}][0]}    ${api_list[${i}][1]}    ${cookies}
    \    LOG    ${i+1}
    \    LOG    ${api_list[${i}][2]}
    \    LOG    ${response_dict}
    \    ${res}    Compare Two Dict    ${api_list[${i}][2]}    ${response_dict}    ${api_list[${i}][3]}
    \    Should Be Equal As Strings    ${res}    True
    \    Run Keyword IF    "${i}"=="4" or "${i}"=="10" or "${i}"=="16" or "${i}"=="22" or "${i}"=="28" or "${i}"=="34" or "${i}"=="40" or "${i}"=="46" or "${i}"=="52" or "${i}"=="58" or "${i}"=="64" or "${i}"=="70" or "${i}"=="76" or "${i}"=="82" or "${i}"=="88"    Check Daily Info2    ${api_list[${i}][5]}    ${api_list[${i}][4]}

*** Keywords ***
Request Data Initial
    ${cookies}    Get_GaoQi1_Cookies
    POST_REQ    http://testkq.tahoecn.com:8800/taiheattendance/overtime/buildOverTimeBill    {"otApply":{"employeeID": "gaoqi1", "leaveID": 0, "beginDateTime": "2019-07-05 08:00","endDateTime": "2019-07-05 23:00","timeLong": \ "4", "leaveTitle": "平常加班","reasons": "工作需要", "applyID": 0 , "applyStatus": 0 }}    ${cookies}
    Sleep    1
    POST_REQ    http://testkq.tahoecn.com:8800/taiheattendance/leave/buildLeaveBill    {"leaveApply":{"employeeID": "gaoqi1","leaveID": "D7E5A634-1C6F-47D1-8A55-7BE3AC4F00F6","beginDateTime": "2019-07-05 08:00","endDateTime": "2019-07-05 12:00","leaveTitle":"请事假","reasons": "家里有事","applyID": 23123 ,"applyStatus": 0 }}    ${cookies}
    Sleep    1
