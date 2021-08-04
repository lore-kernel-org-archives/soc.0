Return-Path: <SRS0=cxHJ=M3=foss.st.com=prvs=2850ef901d=patrice.chotard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB71C4338F
	for <soc@archiver.kernel.org>; Wed,  4 Aug 2021 15:25:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B306760E09; Wed,  4 Aug 2021 15:25:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0BCA60C3F;
	Wed,  4 Aug 2021 15:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0BCA60C3F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 174FLTf9002630;
	Wed, 4 Aug 2021 17:25:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=S9ert6QnYVEygDRWb10g0bL7/eEDQa3oDWEm42+oZ6s=;
 b=UylDzC2ymHe/7lMboKLJCiD1HFOUNh83+4hWNfiK7WpdZyR2CLuujZSu3XNrV6Tt3E3x
 BRCHQvGYH6//NI6qXtKNivNjXWnJnEbWXMBV9MMWmnisQNVNrqd72FeMZMztpnXsUR2z
 q9WwYQl2tLjcRD++azgWr32uv488g5j5ustfnpCg8oslT4bLzowgBJigY0hpoUiZ0uJb
 itPx53GK4gPzA8uUVdBpK/dE1QQx4K+fAyPENdUr1L09T03uWi9geaze7557Zz0ULtT0
 3wvUdUgQe1FhP5sU7eIDtrhL9T8kwT0tpXY69FiM7EBFtwI1ym9aVqs1JgtZUc99j7fq hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 3a7ruwskhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Aug 2021 17:25:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 21AC410002A;
	Wed,  4 Aug 2021 17:25:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F178522D16E;
	Wed,  4 Aug 2021 17:25:45 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 4 Aug
 2021 17:25:45 +0200
Subject: Re: [PATCH 0/4] ARM: dts: sti: remove clk_ignore_unused from bootargs
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Linux ARM
	<linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>, SoC Team
	<soc@kernel.org>
References: <20210803124506.23365-1-patrice.chotard@foss.st.com>
 <CAK8P3a06_vUXghtvp4jTMEc4jV7RW8XmbUmgfrsoH_BSZ+awJQ@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <09ee0256-5f51-513c-52f2-441e0e41aea9@foss.st.com>
Date: Wed, 4 Aug 2021 17:25:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a06_vUXghtvp4jTMEc4jV7RW8XmbUmgfrsoH_BSZ+awJQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-04_03:2021-08-04,2021-08-04 signatures=0

Hi Arnd

On 8/4/21 3:50 PM, Arnd Bergmann wrote:
> On Tue, Aug 3, 2021 at 2:45 PM <patrice.chotard@foss.st.com> wrote:
>>
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Remove clk_ignore_unused from bootargs from STi boards DT.
> 
> The patches look good to me, but I'm not sure what you expect me to do
> here, as you have added soc@kernel.org to Cc:, and other addresses to To:

Sorry, i wasn't aware that soc@kernel.org must only be used for pull request.

> 
> I have dropped them from patchwork for the moment. When you want
> them to be applied to the soc tree, please resend or send a pull request
> to:soc@kernel.org, until then, please leave out that address so it does
> not get into patchwork.
> 
>       Arnd
> 

Yes my intention is to submit a STi pull request with this patchset and another one.

Thanks
Patrice
