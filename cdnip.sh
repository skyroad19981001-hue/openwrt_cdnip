#!/bin/bash
export LANG=en_US.UTF-8
point=443
IP_ADDR=ipv4
x_email="your_email@example.com"  # 修改为默认邮箱
hostname="(NO_name)"
zone_id="your_zone_id_here"  # 修改为默认值
api_key="your_api_key_here"  # 修改为默认API KEY
pause=true
clien=9

CFST_URL_R=""

CFST_N=200
CFST_T=4
CFST_DN=20  # 修改为20个域名
CFST_TL=200
CFST_TLL=50
CFST_SL=0
telegramBotToken="your_telegram_bot_token_here"  # 修改为默认BotToken
telegramBotUserId="your_telegram_user_id_here"  # 修改为默认UserID

CFST_SPD=-dd
ymorip=1
domain="xmly8849.dpdns.org"
subdomain="cf20"
ymoryms=1
token=""
sleepTime=26
tgapi="api.telegram.org"

# 新增：20个域名和对应的IP解析
domains=(
    "domain1.com" "domain2.com" "domain3.com" "domain4.com" "domain5.com"
    "domain6.com" "domain7.com" "domain8.com" "domain9.com" "domain10.com"
    "domain11.com" "domain12.com" "domain13.com" "domain14.com" "domain15.com"
    "domain16.com" "domain17.com" "domain18.com" "domain19.com" "domain20.com"
)

ips=(
    "IP1" "IP2" "IP3" "IP4" "IP5"
    "IP6" "IP7" "IP8" "IP9" "IP10"
    "IP11" "IP12" "IP13" "IP14" "IP15"
    "IP16" "IP17" "IP18" "IP19" "IP20"
)

# 遍历20个域名并执行解析操作
for i in ${!domains[@]}; do
    echo "解析 ${domains[$i]} 到 ${ips[$i]}"
    # 你可以在这里添加实际的域名解析命令，例如使用 dig
    # 示例：dig +short ${domains[$i]}  # 这会返回域名的IP
done

tgaction(){
    if [[ -z ${telegramBotToken} ]]; then
       echo "未配置TG推送"
    else
       message_text=$pushmessage
       MODE='HTML'
       URL="https://${tgapi}/bot${telegramBotToken}/sendMessage"
       res=$(timeout 20s curl -s -X POST $URL -d chat_id=${telegramBotUserId} -d parse_mode=${MODE} -d text="${message_text}")
       if [ $? == 124 ]; then
          echo 'TG_api请求超时,请检查网络是否重启完成并是否能够访问TG'
       fi
       resSuccess=$(echo "$res" | jq -r ".ok")
       if [[ $resSuccess = "true" ]]; then
          echo "TG推送成功";
       fi
    fi
}