Return-Path: <SRS0=oyvj=BT=foss.st.com=prvs=45149136fa=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B653C77B73
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 08:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DFA49C433D2; Tue, 30 May 2023 08:38:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72B71C433EF;
	Tue, 30 May 2023 08:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 72B71C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34U8Ri1s011756;
	Tue, 30 May 2023 10:38:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6XRVWHAypnu32raoYPkLydBCpQf/QSqdlpI2jgGeJuM=;
 b=DBIMMx4p7vAigngOucRzM3KQsG5V2Afxd+sxur5VrsCRnoUouWacwqtUPAuqGqLhori+
 8hjFtEaPLv4dHnRLT6mfnXoY3aKkhRBkVuM81MdaJoKiKHpjx8uR6eORwJdEUeykUWCh
 ZmlKdQAV+x0q//GQTGYKzD1aPydi3EIQxlZYhtX5cb8iUX8SDM9eRJa00jQ7YNWbE8S6
 /PdE2N6tEEhefOboTI50c+LwkEEu+1TfDal2Kg2SMoa6Gz9BT5+XiptWO+XlXh+Rh270
 qyP8q6cdif2TYT9sUgezFixmSG9WybPXgGAFv+gr3oJHRzcjfGfSHT5qoV/OxmeCoVcv tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qvsnnnx46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 May 2023 10:38:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6266410002A;
	Tue, 30 May 2023 10:38:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 39FF321683B;
	Tue, 30 May 2023 10:38:31 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 30 May
 2023 10:38:30 +0200
Message-ID: <879b7689-5663-28b5-9431-2fdd243ffff2@foss.st.com>
Date: Tue, 30 May 2023 10:38:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 02/11] pinctrl: stm32: add stm32mp257 pinctrl support
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, <soc@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <20230529162034.20481-3-alexandre.torgue@foss.st.com>
 <20230529-enrich-clammy-14b498baf09f@spud>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230529-enrich-clammy-14b498baf09f@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_05,2023-05-29_02,2023-05-22_02

Hi Conor

On 5/29/23 20:04, Conor Dooley wrote:
> On Mon, May 29, 2023 at 06:20:25PM +0200, Alexandre Torgue wrote:
>> Add stm32mp257 pinctrl support.
>> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
>> index e0c31c4c8bca..5e5de92ddd58 100644
>> --- a/drivers/pinctrl/stm32/pinctrl-stm32.h
>> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
>> @@ -24,6 +24,9 @@
>>   #define STM32MP_PKG_AB		BIT(1)
>>   #define STM32MP_PKG_AC		BIT(2)
>>   #define STM32MP_PKG_AD		BIT(3)
>> +#define STM32MP_PKG_AI		BIT(8)
>> +#define STM32MP_PKG_AK		BIT(10)
>> +#define STM32MP_PKG_AL		BIT(11)
> 
> Mainly out of curiosity, why have you go duplicate defines for these?

Mainly to fit with available packages for various STM32 MPU. Currently 
MP1 SoCs are available with packages AB/AC/AD and MP2 series with 
AI/AK/AL but in the future we could have package AB/AC/AD/AI available 
for a particular SoC and then I need to anticipate this case.

Cheers
Alex

> 
> Cheers,
> Conor.

