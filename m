Return-Path: <SRS0=27v0=6U=gmail.com=musashino.open@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F76C61DA4
	for <soc@archiver.kernel.org>; Fri, 24 Feb 2023 12:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9075DC4339C; Fri, 24 Feb 2023 12:29:14 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70B91C433D2;
	Fri, 24 Feb 2023 12:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 70B91C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id c23so11422969pjo.4;
        Fri, 24 Feb 2023 04:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677241753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bJXP4s/YvViKiDkI4nbGZvqqhmXqSAWSFntwmLVwg+s=;
        b=g/og4gQoLJEhDfgQMl/nTu6Z7ZqHM77eC/InWYgcK7eH6hy8t0GGKi3GWmrHSSRrCZ
         cd2HAYa6bukqJStBOCR3ZlHOo7IK0frC6vZnxTvMApy6wl6Bkzjh2IfIMSyB1lL7VQWh
         d0GbY0JPrYrq11eb/pXPHr9AGuLXs8mnJb2MOx1AQGmsSIY0Kg6EqUkYFJ2Q/7efF2gP
         +juMHFkQyA2uxpSwU8cbtJDRyPkmzWCHXXB1SlH7dPj7okLu60uhjJVvtNYB7Evj4VBr
         3Ge7YKI29lUOz8oxnyC88+D0CV/FAB3GXN8nakMaxtB/vAy7U9FF0dTNydf0BwwhcD8I
         EHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677241753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bJXP4s/YvViKiDkI4nbGZvqqhmXqSAWSFntwmLVwg+s=;
        b=lQ8/gy/UBnAU1IXKJxeo/KXVa1b5B317TA0tDcsqESUrpzH8yhR8tSnjmCownQ42Ya
         xQ+6Gcmf59fuyKc/B3M/NATnkJV52/pAWVDQMXVQ1oADEcyhTcs83O/zUauSOA1CcY8x
         WI7jBZz2Nejfv27XAgr3Nx7WNOD+aO5O+4uhNtr+2KJlGaTwMxVPYbM48SZIbghTnCuS
         WpgsHu8dEHWjZrVkaSgFviyXOekdOtXDzb4G0pUcBMsmlUkP175E2DG8ye9qG6zlk8ak
         9GazeZKuONdSZbXR+l1kZLTZ9z//EUj9NECiGjvw+IOTNoSJgqyp8uylwdRS2x3BwsBJ
         n73Q==
X-Gm-Message-State: AO0yUKWF84umLLNdwliu6cMk2dXkCGSCpWJ7I1XmuCtfsAz3kIn5XJvT
	lNqGZ0n7puQSyoajrgsu2Po=
X-Google-Smtp-Source: AK7set/hA+rvXQ6woDP6nwf2/FlLoD/HcKPhyeCLfGyVUihMSsMpe4oIBBYBfP3tKzW93nmPOmNARQ==
X-Received: by 2002:a05:6a20:a004:b0:cc:ca9:4fde with SMTP id p4-20020a056a20a00400b000cc0ca94fdemr7457370pzj.33.1677241752862;
        Fri, 24 Feb 2023 04:29:12 -0800 (PST)
Received: from [192.168.1.39] (M014008005000.v4.enabler.ne.jp. [14.8.5.0])
        by smtp.gmail.com with ESMTPSA id i13-20020aa787cd000000b005abbfa874d9sm8015852pfo.88.2023.02.24.04.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 04:29:12 -0800 (PST)
Message-ID: <e9da7a1e-d48f-014b-a0a7-841c77feb12f@gmail.com>
Date: Fri, 24 Feb 2023 21:28:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] ARM: dts: mvebu: add device tree for IIJ SA-W2
 appliance
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20230223132502.2045-1-musashino.open@gmail.com>
 <20230223132502.2045-2-musashino.open@gmail.com>
 <76395d89-1c56-12b2-b6f7-e77603019b70@linaro.org>
Content-Language: en-US
From: INAGAKI Hiroshi <musashino.open@gmail.com>
In-Reply-To: <76395d89-1c56-12b2-b6f7-e77603019b70@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

thank you for the comment.

On 2023/02/23 23:17, Krzysztof Kozlowski wrote:
> On 23/02/2023 14:25, INAGAKI Hiroshi wrote:
>> Add device tree for Internet Initiative Japan Inc. (IIJ) SA-W2 appliance.
>>
>> Specification:
>>
>> - SoC         : Marvell Armada 380 88F6810
>> - RAM         : DDR3 256 MiB
>> - Flash       : SPI-NOR 32 MiB
>> - WLAN        : 2x Mini PCI-E slots
>>    - 2.4 GHz   : Atheros AR9287
>>    - 5 GHz     : Qualcomm Atheros QCA9880
>> - Ethernet    : 5x 10/100/1000 Mbps
>>    - Switch    : Marvell 88E6172
>> - LEDs        : 12x
>> - Buttons     : 1x
>> - Serial      : "CONSOLE" port (RJ-45, RS-232C level)
>>    - port      : ttyS0
>>    - settings  : 115200 8n1
>>    - assignment: 1:NC , 2:NC , 3:TXD, 4:GND,
>>                  5:GND, 6:RXD, 7:NC , 8:NC
>> - USB         : 2x USB 2.0 Type-A
>>    - Hub       : SMCC USB2514B
>> - Power       : DC Input or PoE Input
>>    - DC        : 12 VDC, 3 A
>>    - PoE       : 802.3f
>>      - module  : Silvertel Ag9712-2BR
>> - Bootloader  : PMON2000 based
>> - Stock OS    : NetBSD based
>>
>> Image header for stock bootloader:
>>
>> 0x00 - 0x07: Identifier      , ascii, "SEIL2015"
>> 0x08 - 0x57: Copyright       , ascii
>> 0x58 - 0x5b: Checksum (CRC32), hex
>> 0x5c - 0x5f: Version Format  , hex  , 0x00000001
>> 0x60 - 0x63: Major Version   , hex
>> 0x64 - 0x67: Minor Version   , hex
>> 0x68 - 0x87: Release Version , ascii
>> 0x88 - 0x8b: Xor Key?        , hex  , 0x00000000 (if not encoded)
>> 0x8c - 0x8f: Data Length     , hex
>>
>>    example:
>>
>>    Identifier     : "SEIL2015"
>>    Copyright      : "ARM OpenWrt Linux-5.15.94"
>>    Checksum       : 0xd575759f (calculated from kernel data)
>>    Version Format : 0x00000001
>>    Major Version  : 0x00000009
>>    Minor Version  : 0x00000063
>>    Release Version: "r22151-318ed84c8d"
>>    Xor Key?       : 0x00000000
>>    Data Length    : 0x35312d33 (length of kernel data)
>>
>> Signed-off-by: INAGAKI Hiroshi <musashino.open@gmail.com>
>> ---
>>   arch/arm/boot/dts/Makefile                 |   1 +
>>   arch/arm/boot/dts/armada-380-iij-sa-w2.dts | 391 +++++++++++++++++++++
>>   2 files changed, 392 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/armada-380-iij-sa-w2.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index efe4152e5846..19119a3f4f1e 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -1523,6 +1523,7 @@ dtb-$(CONFIG_MACH_ARMADA_370) += \
>>   dtb-$(CONFIG_MACH_ARMADA_375) += \
>>   	armada-375-db.dtb
>>   dtb-$(CONFIG_MACH_ARMADA_38X) += \
>> +	armada-380-iij-sa-w2.dtb \
>>   	armada-381-netgear-gs110emx.dtb \
>>   	armada-382-rd-ac3x-48g4x2xl.dtb \
>>   	armada-385-atl-x530.dtb\
>> diff --git a/arch/arm/boot/dts/armada-380-iij-sa-w2.dts b/arch/arm/boot/dts/armada-380-iij-sa-w2.dts
>> new file mode 100644
>> index 000000000000..beeecbb0f5f8
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/armada-380-iij-sa-w2.dts
>> @@ -0,0 +1,391 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
>> +/*
>> + * Device Tree file for Internet Initiative Japan Inc. SA-W2 Appliance
>> + *
>> + * Copyright (c) 2023, INAGAKI Hiroshi <musashino.open@gmail.com>
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/leds/common.h>
>> +#include "armada-380.dtsi"
>> +
>> +/ {
>> +	model = "IIJ SA-W2";
>> +	compatible = "iij,sa-w2", "marvell,armada380";
> It would be nice to start documenting the board compatibles, at least
> for new boards.

So...how do I do that?

>
> Best regards,
> Krzysztof
>

Regards,
Hiroshi
