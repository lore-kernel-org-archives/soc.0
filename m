Return-Path: <SRS0=s/o+=G6=quicinc.com=quic_kathirav@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C27BC197A0
	for <soc@archiver.kernel.org>; Fri, 17 Nov 2023 10:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4184C433C9; Fri, 17 Nov 2023 10:39:46 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C1B6DC433C8;
	Fri, 17 Nov 2023 10:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C1B6DC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AHAEYen023803;
	Fri, 17 Nov 2023 10:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+wlLWERdyh1V2l0dbvC4AkCsnH/C0llbRtQsBwCpQ/Y=;
 b=I+SIMXqx1lb+nNotIjA7a3jDM+EgPbr8/Ydwt18NfbI6CJRCc7F90pjdzLflJogP3lHD
 SRq6V2WrgdDmo8J7ew3HPSC7q+nOeAt4+m4x2U+Lo6RGT/jhrKPl6BKzT23DL9VUbxBq
 s67GE51jLQKv1cVdoilmEHxwMCyQKPSS2euXwJp2TpCJsxjcpyIGgkO/11cTYMLyPmf2
 6jWg92Qcwipm3UN44bMZ0QfYQHynavR2+L7i8drrssER+ed56XmOpcQFHvNH93PilsKU
 Xq3tEN6Dk81GadWlqHz/a1/n0DDv+XzAVcMwKT3drU9Py/APM8JM68aaVwo2EEwBGq/O JA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udrvs1rv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 10:39:44 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AHAdhCF008152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 10:39:43 GMT
Received: from [10.216.60.57] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 17 Nov
 2023 02:39:41 -0800
Message-ID: <29426416-0f3f-49ab-b56b-e24835a4eeb7@quicinc.com>
Date: Fri, 17 Nov 2023 16:09:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] More Qualcomm ARM64 DeviceTree updates for v6.7
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, <soc@kernel.org>
References: <20231025200053.1015821-1-andersson@kernel.org>
 <169833903088.20019.12289470905688863245.git-patchwork-notify@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <169833903088.20019.12289470905688863245.git-patchwork-notify@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LOJpF0iKEQ6yF2roC2UvJJhukJwwjxYa
X-Proofpoint-ORIG-GUID: LOJpF0iKEQ6yF2roC2UvJJhukJwwjxYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_08,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=994
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170078



On 10/26/2023 10:20 PM, patchwork-bot+linux-soc@kernel.org wrote:
> Hello:
> 
> This pull request was applied to soc/soc.git (for-next)
> by Arnd Bergmann <arnd@arndb.de>:
> 
> On Wed, 25 Oct 2023 13:00:52 -0700 you wrote:
>> The following changes since commit 33e9032a1875bb1aee3c68a4540f5a577ff44130:
>>
>>    arm64: dts: qcom: apq8016-sbc: Add missing ADV7533 regulators (2023-09-27 16:07:27 -0700)
>>
>> are available in the Git repository at:
>>
>>    https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.7-2
>>
>> [...]
> 
> Here is the summary with links:
>    - [GIT,PULL] More Qualcomm ARM64 DeviceTree updates for v6.7
>      https://git.kernel.org/soc/soc/c/a6e72119e645

Bjorn / Arnd,

Changes part of this pull request is queued for v6.8? I don't see my 
changes in v6.7-rc1 which are part of this PR. Please help to clarify or 
let me know if I missed something.

Thanks,
Kathiravan.


> 
> You are awesome, thank you!
