Return-Path: <SRS0=OIpR=WH=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91589C433F5
	for <soc@archiver.kernel.org>; Tue, 31 May 2022 15:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D8D0C34114; Tue, 31 May 2022 15:36:22 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C1BBC3411D
	for <soc@kernel.org>; Tue, 31 May 2022 15:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5C1BBC3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id f21so27337727ejh.11
        for <soc@kernel.org>; Tue, 31 May 2022 08:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Lmor8msbWC8RoDOpFJKIyrGyj+A7W9X1XdQfh9y670I=;
        b=YLTH8SZkcOXaBCy5mZKkDcYse9C9OlcolxPNHPxcU56dSH2gNqjvQPin6uEwFyQ/QH
         D80r8XFRbzLhcuFLfyFble0TcfXvRbEYzZ3WaSZB2jsyH30eNtzjkjipcjf/t8kJwEF9
         lMhQH+q018QJzI9qbEbIVq2jZLF0r9Pbko8rOZzK7ikguiiwSOppzZy2eCxi3XXXOppc
         nU3kfd9BW/vAf9jFOv/0wODmJtYZ7Z5s3heH/P59FnyazznR/mzKfAV4e8Hb2HPXAgd5
         aM9ccgEN+RLhKvGGOIitO5atGTMfUM1CtlEZM8bZ+qmqVIVr1T8pVCWjz1wmsVOLvBYu
         g0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Lmor8msbWC8RoDOpFJKIyrGyj+A7W9X1XdQfh9y670I=;
        b=LoawHJmFMtCvBEUQusU8GjojcPwQBer/PpE9hJR8/Gqlo7D1pE85hkGTuzq2YDg8lP
         gAjK3gGTHJ1Yyg/lYqDJYi43/4rfDurO1/ZzQucV0wXYHZQjnvxMp3MpcoUo0NZ6aJdv
         x0MwJO7I1BDSrk86MLXi/RAie3Zi3Rml1wsCBcVQgr7054mkx6IQpfUAeA5n+BVWJ07J
         VzKyoXqcigUzJ06uS182DzCkfha96G6UOJx7pozdeAlJIQZNldks6OxswXcQwyKqNMBZ
         WsyeOsxuDxzl647ePBu5NnHG0nMYLIg/yTmoBGbtM3AB1Z/7AXC3d8skF8f2TdbfP9iM
         RSHg==
X-Gm-Message-State: AOAM530xWblRakXu6hAe5U8JthnNIT6vpPdm4V15YWBaB2veaD50jaYX
	myFZfQSEM+vzRxZYaM1t2oqnHA==
X-Google-Smtp-Source: ABdhPJxm2wlP2EFxtOhD7af0DzEYMu8HyO3kL97zqettcs32QzdM63hOShjdYuP/84npq5pXBxRBUQ==
X-Received: by 2002:a17:907:3d8a:b0:6ff:a9a:bea7 with SMTP id he10-20020a1709073d8a00b006ff0a9abea7mr29701709ejc.134.1654011379585;
        Tue, 31 May 2022 08:36:19 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z5-20020a50f145000000b0042dc460bda6sm5509231edl.18.2022.05.31.08.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 08:36:19 -0700 (PDT)
Message-ID: <b8a770fc-d72d-efd2-a7a0-8bfd44308576@linaro.org>
Date: Tue, 31 May 2022 17:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/3] dts: socfpga: Add Google Chameleon v3 devicetree
Content-Language: en-US
To: =?UTF-8?Q?Pawe=c5=82_Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: Alexandru M Stan <amstan@chromium.org>, SoC Team <soc@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 Dinh Nguyen <dinguyen@kernel.org>
References: <20220530130839.120710-1-pan@semihalf.com>
 <20220530130839.120710-3-pan@semihalf.com>
 <f789afb2-33c5-2b28-5ade-0c76ebb7206f@linaro.org>
 <CAHNYxRw00QraVW0085xO-qzgGJdZ2joukuSYzBQo+yjLnkD=Tw@mail.gmail.com>
 <e4ef2056-c990-b308-a9d5-98f11ac0ba51@linaro.org>
 <CAF9_jYR=sjP9wYW9wyfbrVYO4PDYTfMhjvyyh53U3a3+2Zyw=g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAF9_jYR=sjP9wYW9wyfbrVYO4PDYTfMhjvyyh53U3a3+2Zyw=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/05/2022 16:47, Paweł Anikiel wrote:
> On Tue, May 31, 2022 at 11:11 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 31/05/2022 03:20, Alexandru M Stan wrote:
>>> Hello Krzysztof
>>>
>>> On Mon, May 30, 2022 at 11:56 AM Krzysztof Kozlowski
>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>>
>>>> On 30/05/2022 15:08, Paweł Anikiel wrote:
>>>>> Add devicetree for the Google Chameleon v3 board.
>>>>>
>>>>> Signed-off-by: Paweł Anikiel <pan@semihalf.com>
>>>>> Signed-off-by: Alexandru M Stan <amstan@chromium.org>
>>>>
>>>> Your SoB chain looks odd. Who did what here?
>>>
>>> Sorry about this.
>>>
>>> It was mainly Pawel but I did some small changes at some point before
>>> it landed in our tree (particularly the GPIOs).
>>
>> Then usually Paweł should be the owner of the patch, not you.
>> Alternatively it could be also co-developed.
>>
>>>
>>>>
>>>>> ---
>>>>>  arch/arm/boot/dts/Makefile                    |  1 +
>>>>>  .../boot/dts/socfpga_arria10_chameleonv3.dts  | 90 +++++++++++++++++++
>>>>>  2 files changed, 91 insertions(+)
>>>>>  create mode 100644 arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>>>> index 023c8b4ba45c..9417106d3289 100644
>>>>> --- a/arch/arm/boot/dts/Makefile
>>>>> +++ b/arch/arm/boot/dts/Makefile
>>>>> @@ -1146,6 +1146,7 @@ dtb-$(CONFIG_ARCH_S5PV210) += \
>>>>>       s5pv210-torbreck.dtb
>>>>>  dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
>>>>>       socfpga_arria5_socdk.dtb \
>>>>> +     socfpga_arria10_chameleonv3.dtb \
>>>>>       socfpga_arria10_socdk_nand.dtb \
>>>>>       socfpga_arria10_socdk_qspi.dtb \
>>>>>       socfpga_arria10_socdk_sdmmc.dtb \
>>>>> diff --git a/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts b/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
>>>>> new file mode 100644
>>>>> index 000000000000..988cc445438e
>>>>> --- /dev/null
>>>>> +++ b/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
>>>>> @@ -0,0 +1,90 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>> +/*
>>>>> + * Copyright 2022 Google LLC
>>>>> + */
>>>>> +/dts-v1/;
>>>>> +#include "socfpga_arria10_mercury_aa1.dtsi"
>>>>> +
>>>>> +/ {
>>>>> +     model = "Google Chameleon V3";
>>>>> +     compatible = "google,chameleon-v3",
>>>>
>>>> You miss here enclustra compatible.
>>>
>>> Does this make sense? I don't expect this device tree to boot/work on
>>> an enclustra motherboard. It's only really compatible with a
>>> "chameleon-v3".
>>
>> You also do not expect it to boot on altr,socfpga, do you?
>>
>> If I understood correctly, this board has physically Mercury AA1 SoM, so
>> that compatible should be there.
> 
> Yes, you understood correctly.
> I looked at a similar device - the Cyclone V MCV (SoM) and the MCVEVK
> (base board):
> arch/arm/boot/dts/socfpga_cyclone5_mcv.dtsi

This one is clearly incorrect, so using it as example is wrong.

> arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dts

Since it is based on wrong MCV, then no wonder it's the same.

> And there is no denx,mcv compatible anywhere, only denx,mcvevk.
> Also, devicetree bindings documentation lists denx,mcvevk under
> "Cyclone 5 boards", and, unless you consider the MCV to be a board,
> there isn't a good place to put denx,mcv (same story with mercury+
> aa1/chameleon).

socfpga are not the best example... upstreaming looks incomplete or even
incorrect, like this case of Enclustra SOM. Much better examples are
FSL-based SoMs. Although some of them are also not in the best shape.

Still someone might prefer to skip SoM compatible arguing that it cannot
be a separate final product. Sure, but also SoC cannot be a separate
product. Having SoM compatible allows to match against it and find
common hardware parts.

In any case you want to remove here parts of bindings (so affect ABI),
to which I do not agree.

>> Let me clarify - please use generic node names, as asked by Devicetree
>> specification (2.2.1. Node Name Requirements). There is also list of
>> some examples in the spec, but you can use some other generic node name.
>>
>> Several bindings also require it.
> 
> Do you mean something like this?
> ssm2603: audio-codec@1a {
> u80: gpio@21 {

Yes.


Best regards,
Krzysztof
