Return-Path: <SRS0=CIG8=JJ=foss.st.com=patrice.chotard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E6CC433ED
	for <soc@archiver.kernel.org>; Mon, 12 Apr 2021 10:19:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1D99A61354; Mon, 12 Apr 2021 10:19:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C32A6134F
	for <soc@kernel.org>; Mon, 12 Apr 2021 10:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C32A6134F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=patrice.chotard@foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13CAGEDt020722;
	Mon, 12 Apr 2021 12:19:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=YJkcntAZUXkIgNIIrAREWE1IbHO+eVFlSLGHgdZHNeI=;
 b=Z0WGRoFU3q+IPxELbd8wub9WE78/OqzQ7022qaUQsDwPGuGJlrNvSEw4HF6fFvmRboM4
 PDxjks6K1okKU7kaVQxWc9kYBj9JzJ2MCxw0mJl5fm9MvMMSmLV1R+Hh/6bR099Eyl+E
 Jh4hw+yLxi7xCdTc899PiSkxA/RA0mcbwt13B062yrIBBCNoCzRTYm5G9Gh2mAxKfRI1
 Yv27PVB2DS6Eg0dgR1ysF2D69jzWGW9wQwiFoPW0PWuWnEKOPNZETaaM+NV4ReK8TcJI
 VU3/OprC/GFPmzEj7HyTHNeRVBiUeZ6KIqQyfPyuSIU47I/BnrFgp4I7HZeT4g+mPuYm hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 37uv9md613-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Apr 2021 12:19:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3001710002A;
	Mon, 12 Apr 2021 12:19:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B898231DD0;
	Mon, 12 Apr 2021 12:19:36 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Apr
 2021 12:19:35 +0200
Subject: Re: [Linux-stm32] [RESEND PATCH 0/3] MAINTAINERS: update
 STMicroelectronics email
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
        Arnd Bergmann
	<arnd@arndb.de>
CC: <linux-stm32@st-md-mailman.stormreply.com>
References: <20210216074929.29033-1-patrice.chotard@foss.st.com>
 <1cd91834-6df8-a655-a3b1-0e16f5fe470d@foss.st.com>
Message-ID: <52c32145-7f29-8944-58dc-dc2fb406ffb0@foss.st.com>
Date: Mon, 12 Apr 2021 12:19:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1cd91834-6df8-a655-a3b1-0e16f5fe470d@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-12_09:2021-04-12,2021-04-12 signatures=0

Hi

I think this series has been forgotten, any chance to see it merged into v5.13 ?

Thanks
Patrice


On 3/11/21 4:24 PM, Patrice CHOTARD wrote:
> Hi 
> 
> It's just a gentle reminder to not forgot this series.
> 
> Thanks
> 
> Patrice
> 
> On 2/16/21 8:49 AM, patrice.chotard@foss.st.com wrote:
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> This series:
>>   _ Update st.com to foss.st.com email for some maintainers.
>>   _ Remove Vincent Abriou as STI/STM DRM driver
>>   _ Add Alain Volmat as STM32 I2C/SMBUS driver maintainer
>>
>> Patrice Chotard (3):
>>   MAINTAINERS: Update some st.com email addresses to foss.st.com
>>   MAINTAINERS: Remove Vincent Abriou for STM/STI DRM drivers.
>>   MAINTAINERS: Add Alain Volmat as STM32 I2C/SMBUS maintainer
>>
>>  MAINTAINERS | 31 +++++++++++++++----------------
>>  1 file changed, 15 insertions(+), 16 deletions(-)
>>
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
> 
