Return-Path: <SRS0=Va7z=6C=foss.st.com=prvs=040115a464=patrice.chotard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6BDC636D3
	for <soc@archiver.kernel.org>; Mon,  6 Feb 2023 16:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 736F2C4339C; Mon,  6 Feb 2023 16:05:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4DECCC433EF;
	Mon,  6 Feb 2023 16:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4DECCC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 316FmOqm029419;
	Mon, 6 Feb 2023 17:05:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=T/HFB9agaKKElCdlXsx9rPxPdWU7qPvLsh7BPddbfnM=;
 b=Pq+PM+77p64XtnAOm2ccJoG9+iiv8TKQPpT974OPdihA7qGySMmIaYIxzTJlZAtJCKOh
 sZBUO8AHoC/SYLW0x8MC4OtUMuDdV+trjZbixZNO0tnx9LQym4HUw4JcuNvhID0DMK/9
 CsbYj9w3NYxsJcMgBe7/fGwXw0NMzpIzKJDxPdQn6SbdLTsERDPOWQoDUs0T6BWZy0/8
 s8Ue/AsYDZsTh8eFZtueiSFQrrS+4h0o+xeGPglknPUMcMJ/0AP7LbyP4A7g7ToMQeTg
 xoanFtXEiY2xdf+E7SMqaAlYceBcST4TFJi0Wxg26QJX+St6pFfsmLefRC/1gZNi8rsX dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3nhdnqm73t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 17:05:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5A61B10002A;
	Mon,  6 Feb 2023 17:05:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E939226FA9;
	Mon,  6 Feb 2023 17:05:19 +0100 (CET)
Received: from [10.252.11.209] (10.252.11.209) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 6 Feb
 2023 17:05:18 +0100
Message-ID: <a2608fe7-a0e1-aff1-c0e3-412f5b187ac1@foss.st.com>
Date: Mon, 6 Feb 2023 17:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [GIT PULL] STi DT changes for v6.3 #1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
        Olof
 Johansson <olof@lixom.net>, <soc@kernel.org>,
        arm <arm@kernel.org>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <8e05c729-89bc-20f3-acf6-096fb85d7e36@foss.st.com>
 <6f7f9e4b-f48f-44b2-af15-6b2bd80b12cf@app.fastmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <6f7f9e4b-f48f-44b2-af15-6b2bd80b12cf@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.11.209]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01

Hi Arnd

On 2/6/23 11:40, Arnd Bergmann wrote:
> On Fri, Feb 3, 2023, at 14:52, Patrice CHOTARD wrote:
>>
>> The following changes since commit 6d796c50f84ca79f1722bb131799e5a5710c4700:
>>
>>   Linux 6.2-rc6 (2023-01-29 13:59:43 -0800)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/pchotard/sti.git 
>> tags/sti-dt-for-6.3-round1
>>
>> for you to fetch changes up to 4722dd4029c63f10414ffd8d3ffdd6c748391cd7:
>>
>>   ARM: dts: stihxxx-b2120: fix polarity of reset line of tsin0 port 
>> (2023-02-03 14:41:50 +0100)
>>
>> ----------------------------------------------------------------
>> Fix polarity of reset line of tsin0 port for stihxxx-b2120
>>
>> ----------------------------------------------------------------
>> Dmitry Torokhov (1):
>>       ARM: dts: stihxxx-b2120: fix polarity of reset line of tsin0 port
> 
> You've based the branch on top of -rc6, which would force me to
> backmerge the mainline rc into the arm/dt branch. I would
> much prefer not do that unless there is a very important reason.
> 
> On the other hand, this does look like a bugfix that could be
> applied for linux-6.2 and the bugfix branch is already at -rc6
> now, so that would be the easiest way to deal with it.
> 
> Please let me know if this is ok as a bugfix, otherwise please
> resend without the -rc6 dependency.

This is OK as a bug fix.

Sorry for inconvenience.

Thanks
Patrice

> 
>     Arnd
