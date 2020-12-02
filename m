Return-Path: <SRS0=Iefh=FG=foss.st.com=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154C3C64E7C
	for <soc@archiver.kernel.org>; Wed,  2 Dec 2020 11:02:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C54D42222A; Wed,  2 Dec 2020 11:02:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 730C3221FB;
	Wed,  2 Dec 2020 11:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 730C3221FB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexandre.torgue@foss.st.com
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B2Av8Pi018684;
	Wed, 2 Dec 2020 12:01:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8qjveVABJQqJ9WY7XH8g9MbnLHgI/mcblC2MJUgSUe8=;
 b=buVMJIIkvs8RxSPPCVFHuV9X6VkPJLCLam8OK6BUqGbEuv5G5UZ8Z6TQX5zM0/xci0uV
 4Zca8Okf4hJhthKInVvChbyIPHeY+elGnaIWfbUlCLGgkJpWhFnic7FEa73hsSfsAR9C
 rXYZ/Zh5b1I741ui5mbrrqfMQCLxv8y+MPpH/npjvP3gWamFNkoAAV0xKITjZ+ViKZzG
 NiT5wcP/eArWe4zOyzPTCGcAV4dzp77+8We9x2cUtNjR2lf8OEYAsfAY32xCtZs5i9Rf
 kG8zOPSL5f35MgzS9iSmCmszfk7FwfoK7dMPyvky2AyB14I3Nwr8vDFPvd3up8B7R3pp VQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 355w3e2pu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Dec 2020 12:01:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 20EEB100038;
	Wed,  2 Dec 2020 12:01:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0AB0624A99C;
	Wed,  2 Dec 2020 12:01:57 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Dec
 2020 12:01:56 +0100
Subject: Re: [GIT PULL] STM32 DT changes for v5.11 #1
To: Arnd Bergmann <arnd@kernel.org>,
        Alexandre TORGUE
	<alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>,
        arm-soc
	<arm@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Marek Vasut
	<marex@denx.de>, Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <873c17a5-28d5-9261-f691-1b917611c932@foss.st.com>
 <CAK8P3a1o6Dt0wakXB=sUC-t9DkFqSe=ZwSMYtYKsoZNaNfXUew@mail.gmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <bb576e8d-cf11-4f3d-6b9c-6944e6795c2a@foss.st.com>
Date: Wed, 2 Dec 2020 12:00:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1o6Dt0wakXB=sUC-t9DkFqSe=ZwSMYtYKsoZNaNfXUew@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-02_04:2020-11-30,2020-12-02 signatures=0

Hi Arnd

On 11/27/20 8:42 PM, Arnd Bergmann wrote:
> On Fri, Nov 27, 2020 at 9:54 AM Alexandre TORGUE
> <alexandre.torgue@foss.st.com> wrote:
>>
>> Please consider this first round of STM32 DT updates for v5.11. As usual
>> main changed concern MPU part. Various fixes have been done, a new board
>> has been added for DH and USB type C support has been added for ST DK
>> boards.
> 
> Out of curiosity, what is your impression of the state of the MCU port?
> 
> It seems to me that STM32H7/STM32F7 is by far the most active NOMMU
> platform in mainline Linux (with some activity for j2 and recently rv64), but
> it's also much less active than it was a few years ago and slowly winding down
> further, presumably as other OSs are getting better and full-featured MPUs
> are getting almost as cheap.

There is 2 kinds of activity around our MCU products: one coming from ST 
team (as most of peripherals are common with our MPU, changes done for 
MPU are reported to MCU). And another coming from external people using 
those MCU boards (few people).
There are still improvements to do for those platforms like adding dma 
support on cortex-M7 (which implies to use dedicated MPU region ...) but 
I don't have as much time as I would like to work on this subject so it 
is still pending.
I would say that stm32 mcu linux support continues to survive with 
incoming patches and at rhythm of the incoming patches.

> I also tried to find modern distro support, but I couldn't find anything that
> has the elf-fdpic changes that were merged into mainline gcc, instead
> it seems any user space is either on binfmt-flat or using elf-fdpic with
> ancient patched compilers that can build user space but no longer
> build the kernel (which now requires gcc-4.9 or higher), so I wonder if
> I'm looking in the wrong places, or if this just doesn't work.

Some STM32 MCU are supported in buildroot (not all), using u-boot as 
bootloader and binfmt-flat for user space. Concerning fdpic, IIRC 
support has been added in buildroot but we don't use it yet for our STM32.

> Overall, is this something where you only support existing users for
> as long as they are around, or do you keep seeing new products based
> on STM32F4/F7/H7?

I just continue to support existing users and I don't plan to push 
another STM32 MCU.

Do you think we should better promote/support NOMMU platform in  mainline?

regards
Alex

> 
>> Due to company IT changes, for upstream "process" my mail address in no
>> longer alexandre.torgue@st.com but alexandre.torgue@foss.st.com. Let me
>> know if it causes issue for tag signature. On my side I updated GPG key
>> with this new address and it seems ok.
> 
> It's no problem on my end, thanks for letting me know.
> 
>         Arnd
> 
