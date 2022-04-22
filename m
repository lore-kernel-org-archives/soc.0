Return-Path: <SRS0=RS4j=VA=foss.st.com=prvs=01113bea48=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147B4C433F5
	for <soc@archiver.kernel.org>; Fri, 22 Apr 2022 16:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D39C3C385A8; Fri, 22 Apr 2022 16:23:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC901C385A0;
	Fri, 22 Apr 2022 16:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CC901C385A0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23MEpQ9i028200;
	Fri, 22 Apr 2022 18:23:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Tz26t0AEffOCF28o5Wo7UmIZsHLJeggiP4B5JFJg+Zg=;
 b=owHoJCPIopVgvMeN3/8z8Z9eGsj6w1DEtBRojS8tGJMoncZyZ+n1UOMMVfhruvn6KPg8
 hkf577hLz1C6B+nrVS4jOdQMJ3umiTR7u0NV34UQAtiVX0Helh2c9YelGGlNEZGjAtVf
 CP0yyXfxfwa8u055Kmwr6Zkyo4za5NEK1F4wLFK0rRA+VefMxFCS8GkEe/vi3XNlcTHt
 jAhIHTYkTvZSC8CUxugEGtPWl47/3JFXujhjYnU70f9ann6Ul1ubAIhz6zu4oygCorsO
 K/HVoiYoq7MISMNv3VB7v6DwEYDdOCym0y9HQpG8XIJxyUL1Ocz2Omh5eIJuuhROgKeI ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fkskgtdv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Apr 2022 18:23:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9BB8810002A;
	Fri, 22 Apr 2022 18:23:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8F14D23BDF1;
	Fri, 22 Apr 2022 18:23:26 +0200 (CEST)
Received: from [10.48.0.142] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 18:23:26 +0200
Message-ID: <d731e89f-feef-fa7d-d2e7-0d1f9af118cd@foss.st.com>
Date: Fri, 22 Apr 2022 18:23:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 5/8] ARM: stm32: select OPTEE on MPU family
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, <arnd@arndb.de>,
        <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        <soc@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, Marek Vasut <marex@denx.de>,
        <etienne.carriere@st.com>,
        "Pengutronix Kernel
 Team" <kernel@pengutronix.de>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-6-alexandre.torgue@foss.st.com>
 <3d5969cc-2210-3c7c-01c8-3f5c3789e54b@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <3d5969cc-2210-3c7c-01c8-3f5c3789e54b@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_04,2022-04-22_01,2022-02-23_01

Hi Ahmad,

On 4/22/22 17:37, Ahmad Fatoum wrote:
> Hello Alex,
> 
> On 22.04.22 17:09, Alexandre Torgue wrote:
>> Select CONFIG_OPTEE for STM32MP15 and STM32MP13 by default. Final
>> activation will done thanks to device tree.
>>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>
>> diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
>> index 98145031586f..b322cf2a136f 100644
>> --- a/arch/arm/mach-stm32/Kconfig
>> +++ b/arch/arm/mach-stm32/Kconfig
>> @@ -6,6 +6,8 @@ menuconfig ARCH_STM32
>>   	select HAVE_ARM_ARCH_TIMER if ARCH_MULTI_V7
>>   	select ARM_GIC if ARCH_MULTI_V7
>>   	select ARM_PSCI if ARCH_MULTI_V7
>> +	select TEE if ARCH_MULTI_V7
>> +	select OPTEE if ARCH_MULTI_V7
> 
> Users may want to use OPTEE as a module without it being a SCMI provider
> or not use OPTEE at all. I'd prefer you drop this patch and leave it
> to users to configure their kernel appropriately.
> 

Yes, I can understand, I did this one too quickly forgetting that every 
multi_v7config users will inherit of this config.

thanks
Alex

> Cheers,
> Ahmad
> 
> 
>>   	select ARM_AMBA
>>   	select ARCH_HAS_RESET_CONTROLLER
>>   	select CLKSRC_STM32
> 
> 
> 
> 

