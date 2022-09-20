Return-Path: <SRS0=4tTZ=ZX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F530ECAAD8
	for <soc@archiver.kernel.org>; Tue, 20 Sep 2022 08:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1233CC433B5; Tue, 20 Sep 2022 08:24:42 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A43E7C433C1
	for <soc@kernel.org>; Tue, 20 Sep 2022 08:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A43E7C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id x29so2097843ljq.2
        for <soc@kernel.org>; Tue, 20 Sep 2022 01:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=AlNbthU8WoAO1+07ID0EL9Rhwsa/jvCJk5uxcImshx0=;
        b=zUvBLpP/KOSLV9W1QrqGHccAXW2Fkie3JXiWTkh47lRe9P7pSYfVn9NEcrBz+ihpMv
         7ZwDLv7/10Oqi1BPCCUl9nORKgOl9pDTzu0DMF8LX4u+T1H+CFhwvpb4/4Uafbv0ctCH
         5mL12wc2HARd5uQGkUCdcO+GNnL1h1NCqoDFw0RnLyIlyg/5xKUt/hsAW3wx1ti9Evz2
         eDR6DpnkOlcsmS6HmySTRou2aKJCj5mkY19KVJskUc73rgaZgasMwY52cyPFQp/QeEIJ
         NUdTSi03148aBaiJJj/FKaRBFahJmT8bdH0IhLMuUk7XGfqIe6WqLU/Jo2qWlLVy5OaE
         GuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=AlNbthU8WoAO1+07ID0EL9Rhwsa/jvCJk5uxcImshx0=;
        b=kdRnYGzQzNR+/ka6GiPInOfxLumwwOlHJdu3r1XsEjzCdlKyu7+YvRpqjWMM553QAK
         i8wgVlvoH+012p/Pem/ee/k3yhmjDVE5emhxf2X1oRE7l3sogWGkHRexEqRpN8LpuTys
         v48pzzeyC4/FUqXSdoDL3QqTtKss7gqlqCufchk+OqFPw4I9cvEScXneK31YYTtSwWeZ
         Pf7Kf34xRxr1NQPjekDNlmgP3ue5WVJr5sYtxSuDe08+osqGmFf4hBYWynlcE6eLvXpY
         OWS0vB3lg38xGD+Yr8Fnd47885KszaQrTJqvaBWn3AKIDm6ixpc9FZ6Fbi1vquYTVsUl
         Lgcw==
X-Gm-Message-State: ACrzQf07I+UZzHDj63z79Vgy8KKU/jYgDWDXuichz5jnsmKrfc7UkcZX
	PZz8z3R5PCbsu4Es/Ql5KaB/4w==
X-Google-Smtp-Source: AMsMyM4VkvB9MREeRC5k87kRxbeisv4TJp5U5RiuU05AuCSqwzYhIGwyho6RDYiFHh5lo6YlMxifjg==
X-Received: by 2002:a2e:7309:0:b0:26c:3db7:8fe2 with SMTP id o9-20020a2e7309000000b0026c3db78fe2mr5571053ljc.387.1663662278798;
        Tue, 20 Sep 2022 01:24:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a6-20020a05651c010600b0026c079006bcsm145489ljb.118.2022.09.20.01.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 01:24:38 -0700 (PDT)
Message-ID: <61de4c6c-84e9-345a-495d-4d44d9351d84@linaro.org>
Date: Tue, 20 Sep 2022 10:24:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] greatlakes: dts: Add Facebook greatlakes (AST2600) BMC
Content-Language: en-US
To: Bonnie Lo/WYHQ/Wiwynn <Bonnie_Lo@wiwynn.com>,
 "joel@jms.id.au" <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: "patrickw3@fb.com" <patrickw3@fb.com>, "garnermic@fb.com"
 <garnermic@fb.com>, Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
References: <20220915072304.1438-1-Bonnie_Lo@Wiwynn.com>
 <10176630-3ff7-54f7-8836-779e5a2bf6d4@linaro.org>
 <HK0PR04MB3105F759F43FEDE24C24FB3AF84C9@HK0PR04MB3105.apcprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <HK0PR04MB3105F759F43FEDE24C24FB3AF84C9@HK0PR04MB3105.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/09/2022 09:45, Bonnie Lo/WYHQ/Wiwynn wrote:
> Hi Krzysztof,
> 
> I revise the device tree as following and resend the mail.
> It create a new mail thread " [PATCH] ARM: dts: aspeed: greatlakes: Add Facebook greatlakes (AST2600) BMC".
> Kindly to correct me, if there is any problem.
> 
>> Use subject prefixes matching the subsystem (git log --oneline -- ...).
>>
>>>
>>> Add linux device tree entry related to greatlakes specific devices
>>> connected to BMC SoC.
>>
>> Please wrap commit message according to Linux coding style / submission
>> process:
>> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.b
>> ootlin.com%2Flinux%2Fv5.18-rc4%2Fsource%2FDocumentation%2Fprocess%2
>> Fsubmitting-patches.rst%23L586&amp;data=05%7C01%7CBonnie_Lo%40wiw
>> ynn.com%7C1dee8dcb540a49522fb608da98cdba6f%7Cda6e0628fc834caf9dd
>> 273061cbab167%7C0%7C0%7C637990306620286314%7CUnknown%7CTWFp
>> bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
>> 6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=mC2E3dJbuYgXklS%2Fw8s2w%2
>> BKH%2BZ3CsZSndFTgPBjyvpw%3D&amp;reserved=0
>>
> 
> I have add " ARM: dts: aspeed: greatlakes:".
> 
>>>
>>> Signed-off-by: Bonnie Lo <Bonnie_Lo@wiwynn.com>
>>> ---
>>>  arch/arm/boot/dts/Makefile                    |   1 +
>>>  .../dts/aspeed-bmc-facebook-greatlakes.dts    | 248
>> ++++++++++++++++++
>>
>> Missing documentation of board compatible (bindings) as first patch.

Why did you ignore it?

>>
>>>  2 files changed, 249 insertions(+)
>>>  create mode 100644
>>> arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
>>>
>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>> index 05d8aef6e5d2..40fa906ab17f 100644
>>> --- a/arch/arm/boot/dts/Makefile
>>> +++ b/arch/arm/boot/dts/Makefile
>>> @@ -1580,6 +1580,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>>         aspeed-bmc-asrock-e3c246d4i.dtb \
>>>         aspeed-bmc-asrock-romed8hm3.dtb \
>>>         aspeed-bmc-bytedance-g220a.dtb \
>>> +       aspeed-bmc-facebook-greatlakes.dtb \
>>
>> Wrong order.
> 
> I have reordered it.
> 
>>
>>>         aspeed-bmc-facebook-bletchley.dtb \
>>>         aspeed-bmc-facebook-cloudripper.dtb \
>>>         aspeed-bmc-facebook-cmm.dtb \
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
>>> b/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
>>> new file mode 100644
>>> index 000000000000..f011cc4d370f
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
>>> @@ -0,0 +1,248 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later // Copyright 2022
>>> +Facebook Inc.
>>> +
>>> +/dts-v1/;
>>> +#include "aspeed-g6.dtsi"
>>> +#include <dt-bindings/gpio/aspeed-gpio.h> #include
>>> +<dt-bindings/i2c/i2c.h> #include <dt-bindings/leds/leds-pca955x.h>
>>> +
>>> +/ {
>>> +       model = "AST2600 EVB";
>>
>> Wrong name.
> 
> I have revies the model name " Facebook Greatlakes BMC ".
> 
>>
>>> +       compatible = "aspeed,ast2600";
>>
>> Missing board compatible.
>>
> 
> I add board compatible " facebook,greatlakes-bmc"

And what is the output of the checkpatch?

> 
>>> +
>>> +       aliases {
>>> +               serial4 = &uart5;
>>> +       };
>>> +
>>> +       chosen {
>>> +               stdout-path = &uart5;
>>> +               bootargs = "console=ttyS4,57600n8 root=/dev/ram rw
>>> + vmalloc=384M";
>>
>> Bootargs usually do not belong to mainline DTS.
> 
> Removed.

I still saw bootargs.

(...)

>>>
>>> WIWYNN PROPRIETARY This email (and any attachments) contains
>> proprietary or confidential information and is for the sole use of its intended
>> recipient. Any unauthorized review, use, copying or distribution of this email
>> or the content of this email is strictly prohibited. If you are not the intended
>> recipient, please notify the sender and delete this email immediately.
>>
>> This means we cannot take this patch. Proprietary and/or confidential
>> patches cannot be merged.
>>
>> Please license the patch as you wrote in SPDX header.
>>
>> Best regards,
>> Krzysztof
> WIWYNN PROPRIETARY
> This email (and any attachments) contains proprietary or confidential information and is for the sole use of its intended recipient. Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited. If you are not the intended recipient, please notify the sender and delete this email immediately.

Your company is still adding proprietary license. Since I am not
intended recipient, I will remove your messages.

Best regards,
Krzysztof
