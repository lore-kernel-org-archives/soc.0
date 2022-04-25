Return-Path: <SRS0=ZGDJ=VD=foss.st.com=prvs=011448a4c9=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427D8C433EF
	for <soc@archiver.kernel.org>; Mon, 25 Apr 2022 17:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F30A8C385A9; Mon, 25 Apr 2022 17:21:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7AD6BC385A4;
	Mon, 25 Apr 2022 17:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7AD6BC385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23PBOxh9026633;
	Mon, 25 Apr 2022 19:21:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Aleh7166rh9D1CmXqz7MI/E+eg7HPpeG/MxMJeFQSsM=;
 b=kJsqvJYBRQqqU9XDdwl18vaz1jVFYpTYb47kTfUsHumkTHAzWJibNIrpmP/txG+L7YEq
 3+EH0khKDBLVO6d+JqbJetuBXOaf4wi+mtuVdby3YU04bg1VcDIyCNp3NAcXmtnr7gUv
 p6HVC9c9cYVHgB/pFhcyUHiSEp58LTAii4nMbLG9imoBcutlztv6X3JVUuVr+apeegP6
 kKG/P67N7fjo1RLpftCaIC3aqN10pyKysadS+xCqoDUag2FMtV09ygCksyhnqhXtWCda
 y/yyURSLZhzQfoyp3l7uMzy4XL7qGN5yfHrjjcnWI+mme1xbbZJTZJldA6gTKdJB4LVi kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fm6k92fqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Apr 2022 19:21:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CE57410002A;
	Mon, 25 Apr 2022 19:21:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A982524551E;
	Mon, 25 Apr 2022 19:21:19 +0200 (CEST)
Received: from [10.211.4.234] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 25 Apr
 2022 19:21:18 +0200
Message-ID: <c8f0436d-3389-04bb-089d-aca4b4d8d7fd@foss.st.com>
Date: Mon, 25 Apr 2022 19:21:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/8] dt-bindings: rcc: Add optional external ethernet RX
 clock properties
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Marek Vasut <marex@denx.de>, <arnd@arndb.de>, <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, <soc@kernel.org>,
        Stephen Boyd
	<sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
        <etienne.carriere@st.com>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-2-alexandre.torgue@foss.st.com>
 <7d365d28-66ac-93d4-72b5-87d0b36ba017@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <7d365d28-66ac-93d4-72b5-87d0b36ba017@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-25_09,2022-04-25_03,2022-02-23_01

Hi Marek

On 4/22/22 18:28, Marek Vasut wrote:
> On 4/22/22 17:09, Alexandre Torgue wrote:
>> From: Marek Vasut <marex@denx.de>
>>
>> Describe optional external ethernet RX clock in the DT binding
>> to fix dtbs_check warnings like:
>>
>> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dt.yaml: rcc@50000000: 
>> 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks', 
>> 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> To: devicetree@vger.kernel.org
>> Acked-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml 
>> b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
>> index a0ae4867ed27..7a251264582d 100644
>> --- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
>> @@ -59,6 +59,14 @@ properties:
>>             - st,stm32mp1-rcc
>>         - const: syscon
>> +  clocks:
>> +    description:
>> +      Specifies the external RX clock for ethernet MAC.
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: ETH_RX_CLK/ETH_REF_CLK
>> +
>>     reg:
>>       maxItems: 1
> 
> Should this patch be part of this series, maybe this was re-sent by 
> accident ?

Not by accident. As your patch is already merged in Rob tree (I guess), 
I added it in this series to avoid merge conflict later. I added a late 
note in the cover-letter.

regards
alex
