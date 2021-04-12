Return-Path: <SRS0=CIG8=JJ=foss.st.com=patrice.chotard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3909C433B4
	for <soc@archiver.kernel.org>; Mon, 12 Apr 2021 16:27:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 873E4613E8; Mon, 12 Apr 2021 16:27:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3275613EC
	for <soc@kernel.org>; Mon, 12 Apr 2021 16:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3275613EC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=patrice.chotard@foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13CGQIJT029160;
	Mon, 12 Apr 2021 18:27:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5KDL4+wCL/RdEldQijS3CgPsT7I4YVF6zQxSMq/morU=;
 b=ugOAcuft2aUQCAUioP4D+MJ41O+4Ho7dnag/F0nzVxrCpIZavKbbkAQ7nm23WBRhnNBB
 Wf7oXeV3qx6dr+IPnEdVpSflHpLK/YAwdKQeV8jCkIFgHtkKClLPiu2vc4CmILhI51Rv
 295hQK/v4ps8EAlHOtEfriwo2hBkEFrmPShztjb84AjL5sDxrYnwfXyPJaD3PnIxkmLZ
 ARfcPKBq0V9AFXkEmx1/mC1lmJLQ/tC33+bC/gszIpRfhGvvmahpb86z6brb4Ojhda3E
 dIxK2dS/kDm3GIDE9rXYWDLEu7DeV4SUW3QTSPDNjTF5qFXNmht7b3OA6iCtmfdBAGMs kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 37vrp58dsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Apr 2021 18:27:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 777AD10002A;
	Mon, 12 Apr 2021 18:27:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 66253232C79;
	Mon, 12 Apr 2021 18:27:25 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Apr
 2021 18:27:25 +0200
Subject: Re: [Linux-stm32] [RESEND PATCH 0/3] MAINTAINERS: update
 STMicroelectronics email
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        SoC Team
	<soc@kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20210216074929.29033-1-patrice.chotard@foss.st.com>
 <1cd91834-6df8-a655-a3b1-0e16f5fe470d@foss.st.com>
 <52c32145-7f29-8944-58dc-dc2fb406ffb0@foss.st.com>
 <CAK8P3a1upDuztHd0pH_dM+OpMp8WtiMPAZN8p=9xxtCSVJGZMw@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <2a3edcb1-df18-fed9-c91c-1e014033004c@foss.st.com>
Date: Mon, 12 Apr 2021 18:27:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1upDuztHd0pH_dM+OpMp8WtiMPAZN8p=9xxtCSVJGZMw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-12_11:2021-04-12,2021-04-12 signatures=0



On 4/12/21 3:48 PM, Arnd Bergmann wrote:
> On Mon, Apr 12, 2021 at 12:19 PM Patrice CHOTARD
> <patrice.chotard@foss.st.com> wrote:
>>
>> Hi
>>
>> I think this series has been forgotten, any chance to see it merged into v5.13 ?
> 
> It's in -rc7, but it appears that my email reply went missing when I merged it.
> 
>       Arnd
> 

Perfect, thanks for confirmation ;-) 

Patrice
