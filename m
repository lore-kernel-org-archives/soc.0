Return-Path: <SRS0=mgGi=FL=foss.st.com=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AEDC433FE
	for <soc@archiver.kernel.org>; Mon,  7 Dec 2020 16:22:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4745923788; Mon,  7 Dec 2020 16:22:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B0432376F;
	Mon,  7 Dec 2020 16:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B0432376F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexandre.torgue@foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B7GIVqT031181;
	Mon, 7 Dec 2020 17:22:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=y+PNVJJBn0KI39vmSABLyFjcVpK/gNAkRW6pZXLpmgA=;
 b=QdVqBVHpVg9o02W/MMtbg9dakoc13LT+DH3R54J+j8YOU627fSNNlih+N3mAyBQjgc5B
 pa9/tKjfJbObokUEiL/foLqBmoJUTtdwCv7AjwmovD25/0WcFcI0RKXBaL7YioJAbqJY
 2L0gEL8O8KCPnrOs7dOyLTLkK/1V2fMjaWPF/j2rWsWsLGNShrgEpjocMyjvFgdRe7AX
 lFdRnTTbs5jAkPM0veZmFp6dLcX8PGVUAdn9kxhtuBbhUewL8Pic6iyG1okiH0MUEnIw
 CeUP7SDwlwxhVulqSIgIIBdldlhnIhZUrPU4tthreqDWwPavpAL9Y3NvrSb7Om8q0PLp Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 3583mu3djy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Dec 2020 17:22:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1FD1810002A;
	Mon,  7 Dec 2020 17:22:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 03B9A269357;
	Mon,  7 Dec 2020 17:22:22 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Dec
 2020 17:22:21 +0100
Subject: Re: [GIT PULL] STM32 DT changes for v5.11 #1
To: Arnd Bergmann <arnd@kernel.org>
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
 <bb576e8d-cf11-4f3d-6b9c-6944e6795c2a@foss.st.com>
 <CAK8P3a11yRgy9x-cHNDsuYfLPcg0YFs92T+BxzfNisOqjNCjNw@mail.gmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <3bc1fce7-0c51-38a9-407b-5aa105d1162b@foss.st.com>
Date: Mon, 7 Dec 2020 17:20:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a11yRgy9x-cHNDsuYfLPcg0YFs92T+BxzfNisOqjNCjNw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-07_11:2020-12-04,2020-12-07 signatures=0

Hi Arnd

On 12/2/20 2:32 PM, Arnd Bergmann wrote:
> On Wed, Dec 2, 2020 at 12:00 PM Alexandre TORGUE
> <alexandre.torgue@foss.st.com> wrote:
>> On 11/27/20 8:42 PM, Arnd Bergmann wrote:
>>> On Fri, Nov 27, 2020 at 9:54 AM Alexandre TORGUE
>>> <alexandre.torgue@foss.st.com> wrote:
>>>>
>>>> Please consider this first round of STM32 DT updates for v5.11. As usual
>>>> main changed concern MPU part. Various fixes have been done, a new board
>>>> has been added for DH and USB type C support has been added for ST DK
>>>> boards.
>>>
>>> Out of curiosity, what is your impression of the state of the MCU port?
>>>
>>> It seems to me that STM32H7/STM32F7 is by far the most active NOMMU
>>> platform in mainline Linux (with some activity for j2 and recently rv64), but
>>> it's also much less active than it was a few years ago and slowly winding down
>>> further, presumably as other OSs are getting better and full-featured MPUs
>>> are getting almost as cheap.
>>
>> There is 2 kinds of activity around our MCU products: one coming from ST
>> team (as most of peripherals are common with our MPU, changes done for
>> MPU are reported to MCU). And another coming from external people using
>> those MCU boards (few people).
>> There are still improvements to do for those platforms like adding dma
>> support on cortex-M7 (which implies to use dedicated MPU region ...) but
>> I don't have as much time as I would like to work on this subject so it
>> is still pending.
>> I would say that stm32 mcu linux support continues to survive with
>> incoming patches and at rhythm of the incoming patches.
> 
> Ok, thanks for the background!
> 
>>> I also tried to find modern distro support, but I couldn't find anything that
>>> has the elf-fdpic changes that were merged into mainline gcc, instead
>>> it seems any user space is either on binfmt-flat or using elf-fdpic with
>>> ancient patched compilers that can build user space but no longer
>>> build the kernel (which now requires gcc-4.9 or higher), so I wonder if
>>> I'm looking in the wrong places, or if this just doesn't work.
>>
>> Some STM32 MCU are supported in buildroot (not all), using u-boot as
>> bootloader and binfmt-flat for user space. Concerning fdpic, IIRC
>> support has been added in buildroot but we don't use it yet for our STM32.
>>
>>> Overall, is this something where you only support existing users for
>>> as long as they are around, or do you keep seeing new products based
>>> on STM32F4/F7/H7?
>>
>> I just continue to support existing users and I don't plan to push
>> another STM32 MCU.
>>
>> Do you think we should better promote/support NOMMU
>> platform in  mainline?
> 
> No, I think what you do is absolutely appropriate given the current
> state: keep the existing users happy but minimise the work needed
> for that.
> 
> It would however be good if you could let everyone know once
> you notice a further decrease in interest over time, as I think we
> do want to retire NOMMU kernels eventually, and confine the users
> to stable kernels once there are few enough of them. Out of the
> remaining NOMMU architectures, this is what I observe:
> 
> - ARM: most activity is on stm32, once this one gets retired, the
>    other ones can probably go as well
> 
> -  m68k: actively maintained, but aging: the newest NOMMU
>     chip (MCF537x) is from 2007.
> 
> - SuperH: SH2/SH2A is practically dead, minimal J2 support
>    was added in 2016, apparently it is still work-in-progress
>    but progressing slowly
> 
> - riscv: K210 support was only added in 2020 and is
>    actively being worked on at the moment, as there are
>    very few affordable RISC-V systems at all. This might
>    change as soon as one can easily buy a cheap RV64
>    board with an MMU.
> 
> - microblaze: NOMMU support to be removed in v5.11 or v5.12
> 
> - h8300: there is talk of removing the architecture
> 
> - c6x: still (barely) maintained, but I could find no indication of
>    actual users
> 
> - xtensa: one defconfig has MMU disabled, but has always
>    failed to build as far as I can tell. Max has an out-of-tree
>    patch series for the ESP32, but has not updated it since
>    v5.6.
> 
> Overall, there is clearly still enough going on to keep it around
> for a while, but not much that anyone gets excited about.
> If you ever stop testing and updating the STM32 MCU platform,
> I think we should ask the other maintainers if any of the
> remaining platforms are important enough to keep NOMMU
> supported at all, or if one of the future LTS releases should be
> planned as the last  one to have a NOMMU option.

So let's continue like that for now. I'll keep you aware if I get new 
inputs on my side and if we observe some PR without MCU patches we could 
reconsider the question.

Cheers
Alex



>        Arnd
> 
