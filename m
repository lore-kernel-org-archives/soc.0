Return-Path: <SRS0=j838=XJ=foss.st.com=prvs=31841a1f41=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC57C43334
	for <soc@archiver.kernel.org>; Mon,  4 Jul 2022 07:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5CED1C341CF; Mon,  4 Jul 2022 07:52:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B056EC3411E;
	Mon,  4 Jul 2022 07:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B056EC3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2647eOVW026847;
	Mon, 4 Jul 2022 09:52:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=90rBVkywbc4yedzfSXCh4wXU9NTyZeI/HyxQ3VaQqIg=;
 b=8YoK6FsikK5REcfYcJGxKfvz2QvQ1KE8RwXyv73Nz6rBT+Mj5lwQ38KfTPqm0xgqlgo4
 UVbtrLke1/KSafSOy8v71n6xmDAN7MFEn9/mFiL1HZ7FHFgFEHEi/LlBu1/Jy7+w9rYa
 oUOXAf1PtZhtfQXN1/0qK9G/UQ7lLiPDaQCAY+2S9x7JBvhGXXnzanadPvkh6QbAUAIq
 WuTvbEaabB6+69lJwOxOe00dVseHhygCV0LILx7RUT+71P5yci5fI1ICEjary8C0TAf/
 1JLhHfr6CmletR79krIqWLkBS5HBXOx8hl7UL8704u7fe11x0Byc1wyrtUHatVAAfNAy NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h2b5a8sjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Jul 2022 09:52:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 582D710002A;
	Mon,  4 Jul 2022 09:52:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3FFE02128BE;
	Mon,  4 Jul 2022 09:52:46 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 4 Jul
 2022 09:52:45 +0200
Message-ID: <a1b80bbf-11a6-d5f7-ce40-04a644039eaa@foss.st.com>
Date: Mon, 4 Jul 2022 09:52:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [GIT PULL] STM32 DT fixes for v5.19 #2
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
        SoC
 Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <85e47007-bfba-7a64-db75-893b0d20d025@foss.st.com>
 <CAK8P3a2OC=G-gw_Nny-ATj5dHtVcLrGHTK9qvs+QPUw52RWxhw@mail.gmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <CAK8P3a2OC=G-gw_Nny-ATj5dHtVcLrGHTK9qvs+QPUw52RWxhw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-04_07,2022-06-28_01,2022-06-22_01

On 7/1/22 15:25, Arnd Bergmann wrote:
> On Fri, Jul 1, 2022 at 2:05 PM Alexandre TORGUE
> <alexandre.torgue@foss.st.com> wrote:
>>
>> Hi ARM SoC maintainers,
>>
>> Please consider this second round of STM32 DT fixes for v5.19 cycle. It
>> mainly concerns fixes for SCMI version of ST boards introduced in v5.19-rc1.
>>
>> The following changes since commit ea3414e1249ea35bc02debe28d4cbfeb6261657c:
>>
>>     ARM: dts: stm32: move SCMI related nodes in a dedicated file for
>> stm32mp15 (2022-06-07 17:22:21 +0200)
>>
>> are available in the Git repository at:
> 
> Hi Alex,
> 
> I get a merge conflict because I had picked up the "ARM: dts: stm32: move SCMI
> related nodes in a dedicated file for stm32mp15" commit from the mailing
> list, so it now has a different commit ID from the one you are based on.
> 
> As far as I can tell, the patches are identical, but since the files
> are modified
> further in your tree, this confuses the git merge algorithm and leads to a
> somewhat ugly git history with two identical commits if I fix it up.
> 
> Can you rebase this pull request on top of v5.19-rc4 and resend?
> (note: don't rebase the non-fixes pull requests unless you have to).

Hi Arnd,

No pb, I'm going to send a v2. If it is not an issue for you, I would 
prefer to rebase also the stm32-next to avoid conflicts during the merge 
on your side.

Alex

> 
>        Arnd

