Return-Path: <SRS0=f0J1=SP=phrozen.org=john@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4560DC433EF
	for <soc@archiver.kernel.org>; Mon, 31 Jan 2022 13:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F97AC340EE; Mon, 31 Jan 2022 13:12:48 +0000 (UTC)
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3492AC340E8;
	Mon, 31 Jan 2022 13:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3492AC340E8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1400:f600:38a4:8fb:af3f:40b1]
	by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <john@phrozen.org>)
	id 1nEWU3-0006KS-Hy; Mon, 31 Jan 2022 14:12:39 +0100
Message-ID: <e3ac8800-e0b8-7c7b-a5b9-e32dfa795731@phrozen.org>
Date: Mon, 31 Jan 2022 14:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v9 03/13] ARM: Add basic support for Airoha EN7523 SoC
Content-Language: en-GB
To: Robert Marko <robert.marko@sartura.hr>, Felix Fietkau <nbd@nbd.name>
List-Id: <soc.lore.kernel.org>
Cc: Luka Perkov <luka.perkov@sartura.hr>, Russell King
 <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>
References: <20220130145116.88406-1-nbd@nbd.name>
 <20220130145116.88406-4-nbd@nbd.name>
 <CAKQ-crhDHXZptWr5rO5Rb9JttQREoPqE4YO-6nzC2OWc-z06_g@mail.gmail.com>
 <04c91b4e-e7c8-ac6a-f60a-0453a49122fa@nbd.name>
 <CA+HBbNE5nRmFAR44gYMW+Uqi_5e4s+4wBGoQTUbnhC0Pdkc6iw@mail.gmail.com>
From: John Crispin <john@phrozen.org>
In-Reply-To: <CA+HBbNE5nRmFAR44gYMW+Uqi_5e4s+4wBGoQTUbnhC0Pdkc6iw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31.01.22 14:00, Robert Marko wrote:
> On Mon, Jan 31, 2022 at 1:57 PM Felix Fietkau <nbd@nbd.name> wrote:
>>
>>
>> On 31.01.22 11:51, Luka Perkov wrote:
>>> Hello Felix,
>>>
>>> On Sun, Jan 30, 2022 at 3:56 PM Felix Fietkau <nbd@nbd.name> wrote:
>>>>
>>>> From: John Crispin <john@phrozen.org>
>>>>
>>>> EN7523 is an armv8 based silicon used inside broadband access type devices
>>>> such as xPON and xDSL. It shares various silicon blocks with MediaTek
>>>> silicon such as the MT7622.
>>>>
>>>> Add basic support for Airoha EN7523, enough for booting to console.
>>>>
>>>> The UART is basically 8250-compatible, except for the clock selection.
>>>> A clock-frequency value is synthesized to get this to run at 115200 bps.
>>>>
>>>> Signed-off-by: John Crispin <john@phrozen.org>
>>>> Signed-off-by: Bert Vermeulen <bert@biot.com>
>>>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>>>> ---
>>>> index 000000000000..ea23b5abb478
>>>> --- /dev/null
>>>> +++ b/arch/arm/mach-airoha/airoha.c
>>>> @@ -0,0 +1,16 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +/*
>>>> + * Device Tree support for Airoha SoCs
>>>> + *
>>>> + * Copyright (c) 2022 Felix Fietkau <nbd@nbd.name>
>>>> + */
>>>> +#include <asm/mach/arch.h>
>>>> +
>>>> +static const char * const airoha_board_dt_compat[] = {
>>>> +       "airoha,en7523",
>>>> +       NULL,
>>>> +};
>>>> +
>>>> +DT_MACHINE_START(MEDIATEK_DT, "Airoha Cortex-A53 (Device Tree)")
>>>
>>> Since this is Cortex-A53 core is there a reason why this is not placed
>>> within arm64 directory?
>>   From what I can tell, it's a stripped-down core that only runs in
>> 32-bit mode.
> 
> Hmm, this is new for me that you could do that to an ARMv8 (A53) core.
> I know that you can run ARMv7 code but not that you can reduce it to
> 32 bit only.
> 
> Regards,
> Robert

the bootrom and vendor bootloader do not support 64bit more.
	John
