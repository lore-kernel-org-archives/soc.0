Return-Path: <SRS0=2kil=UK=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A186FC433EF
	for <soc@archiver.kernel.org>; Thu, 31 Mar 2022 06:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85FB1C3410F; Thu, 31 Mar 2022 06:34:07 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5808C340ED
	for <soc@kernel.org>; Thu, 31 Mar 2022 06:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5808C340ED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id p15so45926299ejc.7
        for <soc@kernel.org>; Wed, 30 Mar 2022 23:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=c4SmVHsDkudYEyg9IrI8RgsuOT8JSF8xcW5md7xT/Ok=;
        b=ENXGltYC898VuIdpCOFU4AS0J3uxxgmclSA09v8DooceuwBa8oCfEbvMLy+Sh5cObS
         6mZZ0FsD2Ykf/PC/hUbJTVAL/QuojkKWcx+d2g5AGJCto6JjGVhNi3IoIwJiYCCGspUN
         w9+CJ9Imc5wP71XoTIy1XObq2B9J+XAS+bCprS0NWJscD8WKVLX013o/tyqYuG7cIrkd
         TTc/QhT/paqCaA2pu1AMxuOfTW3vfxwheMl3bYEU4HF1F2cUKPU20cPNrc9D/+tEjisS
         jabT3Yf+HXwrjQoFNCNn28Fi1ID8iUN1zRC0A7QmWmLJYB1HBtuy9VBlll2+Kf2bgGzH
         p7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=c4SmVHsDkudYEyg9IrI8RgsuOT8JSF8xcW5md7xT/Ok=;
        b=Oo2drWjFgUr4DiOIbXyIs7uEtqz5Qi49ON5wAU7K0m99lrXK1l/LMvrM+jglPIIoko
         yWL9ydo/EW2yDDQdM150+GVsDiQM0tPY2XeMJGImZYR61Fa3qPtPkAI7vviTq4wpPalW
         gvVz7pBtgbozR9DbBBmFW/aJQOSdX1TE7Gqh1YJAHlqKl5QZojjRyXYkg/9bEvdjKlcD
         D5FEXqlvVmfuIX3Gf9gb4cGsxJIA9Ai8VBdJt7emtgaZLYyW6smZ2tXkr9PGoeysqrX4
         nSZB3NAuC0xab4PYH3Z4OzBn8vvSuiCWbouNwYjZtEu13LK4+NjF9RRdTfuqEX3QMope
         qW7g==
X-Gm-Message-State: AOAM530Lky4Oe336wlBfVqkszwqiBnGKZgM3b8Zq8y9MDY1TNCUQfDLq
	/e0f/Mfsn33qsLIla/sZKldOVw==
X-Google-Smtp-Source: ABdhPJw1hxcxfGo1o86WWmnvS53cQHn9OtNW7zDdd6anzYYBfUrPR2Ackm2vrlixW2tE2YBXYCgXdg==
X-Received: by 2002:a17:907:6d8f:b0:6e0:1512:913b with SMTP id sb15-20020a1709076d8f00b006e01512913bmr3744666ejc.491.1648708445076;
        Wed, 30 Mar 2022 23:34:05 -0700 (PDT)
Received: from [192.168.0.165] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id r3-20020aa7cb83000000b0041b573e2654sm2622587edt.94.2022.03.30.23.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 23:34:04 -0700 (PDT)
Message-ID: <cbe5c963-c727-0fe6-6e03-039c4334f7a9@linaro.org>
Date: Thu, 31 Mar 2022 08:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: add binding for MA35D1 clock
 controller
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, cfli0@nuvoton.com
References: <20220331024256.14762-1-ychuang3@nuvoton.com>
 <20220331024256.14762-2-ychuang3@nuvoton.com>
 <866c6b42-434d-e7db-5319-2256cd7003d7@linaro.org>
In-Reply-To: <866c6b42-434d-e7db-5319-2256cd7003d7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2022 08:29, Krzysztof Kozlowski wrote:
> On 31/03/2022 04:42, Jacky Huang wrote:
>> Add the dt-bindings header for Nuvoton MA35D1, that gets shared
>> between the clock controller and clock references in the dts.
>>
>> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
>> ---
>>  .../dt-bindings/clock/nuvoton,ma35d1-clk.h    | 262 ++++++++++++++++++
>>  1 file changed, 262 insertions(+)
>>  create mode 100644 include/dt-bindings/clock/nuvoton,ma35d1-clk.h
>>
>> diff --git a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
>> new file mode 100644
>> index 000000000000..3634e5edcac5
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
>> @@ -0,0 +1,262 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ OR MIT */
> 
> Can you make it the same license as bindings?
> 
>> +/*
>> + * Copyright (c) 2022 Nuvoton Technology Corporation.
>> + */
>> +
>> +#ifndef __DT_BINDINGS_MA35D1_CLK_H
>> +#define __DT_BINDINGS_MA35D1_CLK_H
>> +
>> +/* Clock Sources */
>> +/* External and Internal oscillator clocks */
>> +#define	HXT		0
> 
> One space after '#define'. Please do not introduce some non-Linux coding
> style.

You also ignored my comments from your v1 (because this is not v1...).
Do not resend without discussion or implementation.

Best regards,
Krzysztof
