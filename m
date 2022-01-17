Return-Path: <SRS0=vQSM=SB=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DEBC433F5
	for <soc@archiver.kernel.org>; Mon, 17 Jan 2022 13:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85043C36AEC; Mon, 17 Jan 2022 13:50:31 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 603FEC36AE7
	for <soc@kernel.org>; Mon, 17 Jan 2022 13:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 603FEC36AE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 211DA3F1E2
	for <soc@kernel.org>; Mon, 17 Jan 2022 13:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642427422;
	bh=ePAMBME9OoqmLqu9TGmOOJDOdAhBTNGeiMQzo5Zcwk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=p2L2naqWUq4zjq9/tg6HP3ypMaxh6QA/ZQqPNgq8J+075Lg1ef6dOjX3hmVILJYLG
	 0VLzaro4l9yp9dhARyc3dmmb2HI0YhLaPoblvnOzKSQ1/hWrK8w/Lai3kVdfBOc4i3
	 q9QEZaecc1HECKMtwruxwbJdq9wuE7fDsfiRp3QZ63PkDgJrXgxaXewGOAHMaV1AL2
	 lT5ZZGafpKtbCYLGIW9HdIAcsb7dhPB0fFjr2zdf0HUbRC7fB/j2oEMXHKnv9jHu1q
	 d3esT3Ndf9RiTGP9d3SlYo/pLf4qOITeGZIT5YDzGwaOM+HbIYwLPHbIUyBbzEoBeb
	 VB27KXLEcTGZw==
Received: by mail-ed1-f72.google.com with SMTP id l10-20020a056402124a00b0040186fbe40dso5669284edw.7
        for <soc@kernel.org>; Mon, 17 Jan 2022 05:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ePAMBME9OoqmLqu9TGmOOJDOdAhBTNGeiMQzo5Zcwk8=;
        b=IzPD2Mz7+dM5q/2W870r1TtDXbrgOZWEGLhvum6PbsA+ZeiyCUZdKyDxbc8yQzlZqW
         ctoLnLUJCyIrIf/K+NgVv01DYMsoRHbReYDQnerNzGxNF4TkjbpcKEsGs5y5k1I/399C
         FwG4ii6stM28/YdwH7PkCUHZZibjra/FFSlHAYiu89KWM1hu1Yz605t3Dp1lojLEchbS
         ds+Id+QjjN9IgtgUoLt1zf5rl0sETI0WnFaC+H3672S5rh28QJqvPBu4/8PNSGtqRFPR
         V1Fxp+Zvc7bxscwTo8C7hhHbuAV7x/dy2v06nMrFv9VFAxP/ug0KNghZpNLF/AU/xYGw
         bFQw==
X-Gm-Message-State: AOAM5328hvw1gbTRLVA10S3S7ete5RF6lUS1ZvVainZkBJ8vH0CmiIrp
	B8RRMm+57osZu+QJ9kROFa3d+hW8Kwt5z98roL5K9Y7HMCYHW/XkPic4r4bhUhJmebj2uVthJW3
	NSfSAf9VBkxks9W4qeY73NnY=
X-Received: by 2002:a17:906:5d16:: with SMTP id g22mr5071273ejt.295.1642427419816;
        Mon, 17 Jan 2022 05:50:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxq9DzOXYxEW3Jq0YclwQkYlU99PzXh2g5H9926DHwMIx90PvG8ZqFXXD4IU5OjfMoVVLw8EQ==
X-Received: by 2002:a17:906:5d16:: with SMTP id g22mr5071248ejt.295.1642427419602;
        Mon, 17 Jan 2022 05:50:19 -0800 (PST)
Received: from [192.168.0.38] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id p10sm4535501ejo.14.2022.01.17.05.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 05:50:19 -0800 (PST)
Message-ID: <b8040d39-cd4d-e5b0-8aec-f03c5257d63e@canonical.com>
Date: Mon, 17 Jan 2022 14:50:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 15/23] arm64: dts: fsd: Add initial pinctrl support
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, linus.walleij@linaro.org, catalin.marinas@arm.com,
 robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
 linux-fsd@tesla.com, 'Shashank Prashar' <s.prashar@samsung.com>,
 'Aswani Reddy' <aswani.reddy@samsung.com>
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122417epcas5p47398a5190cdf4c574c6f1762918b549f@epcas5p4.samsung.com>
 <20220113121143.22280-16-alim.akhtar@samsung.com>
 <2927c34e-3259-4e9a-a657-aeeebf9089d2@canonical.com>
 <00ca01d80ba8$6b9b9800$42d2c800$@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <00ca01d80ba8$6b9b9800$42d2c800$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/01/2022 14:44, Alim Akhtar wrote:
> Hi Krzysztof
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@canonical.com]
>> Sent: Thursday, January 13, 2022 6:50 PM
>> To: Alim Akhtar <alim.akhtar@samsung.com>; linux-arm-
>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>> Cc: soc@kernel.org; linux-clk@vger.kernel.org; devicetree@vger.kernel.org;
>> olof@lixom.net; linus.walleij@linaro.org; catalin.marinas@arm.com;
>> robh+dt@kernel.org; s.nawrocki@samsung.com; linux-samsung-
>> soc@vger.kernel.org; pankaj.dubey@samsung.com; linux-fsd@tesla.com;
>> Shashank Prashar <s.prashar@samsung.com>; Aswani Reddy
>> <aswani.reddy@samsung.com>
>> Subject: Re: [PATCH 15/23] arm64: dts: fsd: Add initial pinctrl support
>>
>> On 13/01/2022 13:11, Alim Akhtar wrote:
>>> Add initial pin configuration nodes for FSD SoC.
>>>
>>> Cc: linux-fsd@tesla.com
>>> Signed-off-by: Shashank Prashar <s.prashar@samsung.com>
>>> Signed-off-by: Aswani Reddy <aswani.reddy@samsung.com>
>>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>>> ---
>>>  arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 338
>> +++++++++++++++++++++
>>>  arch/arm64/boot/dts/tesla/fsd.dtsi         |  22 ++
>>>  2 files changed, 360 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
>>> b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
>>> new file mode 100644
>>> index 000000000000..ec8d944af636
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
>>> @@ -0,0 +1,338 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Tesla Full Self-Driving SoC device tree source
>>> + *
>>> + * Copyright (c) 2017-2021 Samsung Electronics Co., Ltd.
>>> + *		https://www.samsung.com
>>> + * Copyright (c) 2017-2021 Tesla, Inc.
>>> + *		https://www.tesla.com
>>> + */
>>> +
>>> +#include <dt-bindings/pinctrl/samsung.h>
>>> +
>>> +&pinctrl_fsys0 {
>>> +
>>
>> No need for empty line.
>>
> Noted
> 
>>> +	gpf0: gpf0 {
>>
>> FYI:
>> It's ok now, but the nodes will have to be renamed to "xxx-gpio-bank" later.
>>
> Have rebased my v2 on your pinmux schema update, so these and below comments are addressed.
> Thanks
> 

OK, but have in mind that -gpio-bank suffix is not needed now. This
depends on support in the pinctrl driver, which will be applied after
the merge window to different tree or branches than DTS is going to.
Therefore if I apply your DTS with "-gpio-bank" to my next/dt64, the
kernel won't find GPIo banks and won't properly boot. The linux-next
will be fine, just my next/dt64 won't be.

If you're fine with it - use "-gpio-bank" suffix. If you prefer my
next/dt64 to have a fully working Tesla SoC DTS, then stick to old node
naming and let's replace it later.

Best regards,
Krzysztof
