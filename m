Return-Path: <SRS0=Ts3h=UQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762C9C433F5
	for <soc@archiver.kernel.org>; Wed,  6 Apr 2022 07:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44EFFC385A9; Wed,  6 Apr 2022 07:15:01 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62636C385A1
	for <soc@kernel.org>; Wed,  6 Apr 2022 07:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 62636C385A1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id dr20so2330592ejc.6
        for <soc@kernel.org>; Wed, 06 Apr 2022 00:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ItLT2iWRQ8MK455HPWYXz8o5FEVTFaa0PW9WN5W7PWQ=;
        b=aljVglaiorKfLr8hIxisEour0ptMG48CK1Bco7fzAXebuy++7+j30VgUqeBNWNdapT
         46/oBIK5ME7783f1qbqsbxF5x372/E+eU6rexLJ3siZ4UM45XdYoJ8n8w31/ArgK1aNk
         uwAEQrHoYEM0WjRO1nd1VUEwecsGsuQ1oi5AAOjZiNcyShoav28NWybX7c8Oa+tJbMez
         Mey+ABS6X67p4P5xSubdsTVUfYEFFabbavXous5101XE2chjMSSJAY5XDxyGP1N/xccQ
         JHURGWS09J+gDo3OLTrPKlNqcW6azIrdVUp/cCMhfqs+syP26YHknSOBGxCrRJue8I7e
         mA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ItLT2iWRQ8MK455HPWYXz8o5FEVTFaa0PW9WN5W7PWQ=;
        b=C+VkWajMZAJl22tbi9xaYye3F8nItSJ1id26VwkLRkJ/GnYco4Dbirj40CI25+4MSm
         E16XKRmvh3EH8aFp2PArW8u/yY2mLOtluUmk1tzvKup5rDNv0XfLVWSqsh3w5skzxZsk
         sRPm9qWFyI8dNePmQe9tSQkBSjzK+NHvlLFEf5kuQ88P/fxuIUq8QRQLDpbYOmqpFVpb
         QWeAtuYNLykBwAcDYc/ly4Rmz/p7nxTFdcO1MzrP+yZMln5/BYOvErQRz/sl82OZHjI/
         YPKAMfkgU1n1QTLFeCVlQxdMTktli7g5uy67Vz8KBkVE3mnKSDcR4+uHKebKiyqgNryg
         6eQg==
X-Gm-Message-State: AOAM531duVZd/zm9O4HIirpLwcdyhcqmTh4pN3Wxxhz+jTI37kh8n7HK
	5JvAw6KX74eA1zZ6HH+z3K1ngw==
X-Google-Smtp-Source: ABdhPJxkVzG6YeLl1AHfVOPZW8vCgyulJy2IwvFDrOQZC3HKys5OOJ6wApTj/h6GZDOZpaKoaF2krQ==
X-Received: by 2002:a17:906:dc92:b0:6e4:a93b:8958 with SMTP id cs18-20020a170906dc9200b006e4a93b8958mr7148361ejc.403.1649229298612;
        Wed, 06 Apr 2022 00:14:58 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id n6-20020aa7c786000000b00410d2403ccfsm7531111eds.21.2022.04.06.00.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Apr 2022 00:14:58 -0700 (PDT)
Message-ID: <bba99b9d-6960-f6e8-0ee4-0b5fe8a5601d@linaro.org>
Date: Wed, 6 Apr 2022 09:14:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] arm64: dts: nuvoton: Add initial support for MA35D1
Content-Language: en-US
To: Jacky Huang <ychuang3@nuvoton.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "olof@lixom.net" <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "soc@kernel.org" <soc@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20220307091923.9909-1-ychuang3@nuvoton.com>
 <20220307091923.9909-4-ychuang3@nuvoton.com>
 <2669852c-5bb6-1edf-bf58-ea815f54d50f@kernel.org>
 <ef8efda1-e985-0684-470f-7acf9b8a5e93@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ef8efda1-e985-0684-470f-7acf9b8a5e93@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/04/2022 04:58, Jacky Huang wrote:
>>> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
>>> index 639e01a4d855..28e01442094f 100644
>>> --- a/arch/arm64/boot/dts/Makefile
>>> +++ b/arch/arm64/boot/dts/Makefile
>>> @@ -30,3 +30,4 @@ subdir-y += synaptics
>>>   subdir-y += ti
>>>   subdir-y += toshiba
>>>   subdir-y += xilinx
>>> +subdir-y += nuvoton
>>> diff --git a/arch/arm64/boot/dts/nuvoton/Makefile b/arch/arm64/boot/dts/nuvoton/Makefile
>>> new file mode 100644
>>> index 000000000000..e1e0c466bf5e
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/nuvoton/Makefile
>>> @@ -0,0 +1,2 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +dtb-$(CONFIG_ARCH_NUVOTON) += ma35d1-evb.dtb
>> ARCH_NUVOTON does not exist.
> 
> I would add the following to end of arch/arm64/Kconfig.platforms,

Don't add things at the end of files but rather in respective place
without messing the order.

> and 
> add the
> modification to this patch series.
> 
> config ARCH_MA35D1
>      bool "Nuvoton MA35D1 SOC Family"

We do not add options for specific SoCs, but for entire families, so
ARCH_NUVOTON is correct.

>      select PINCTRL
>      select PINCTRL_MA35D1
>      select PM
>      select GPIOLIB
>      select SOC_BUS
>      select VIDEOMODE_HELPERS
>      select FB_MODE_HELPERS
>      help
>        This enables support for Nuvoton MA35D1 SOC Family.
> 
> 
>>> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-evb.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-evb.dts
>>> new file mode 100644
>>> index 000000000000..38e4f734da0f
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-evb.dts
>>> @@ -0,0 +1,23 @@
>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>> +/*
>>> + * Device Tree Source for MA35D1 Evaluation Board (EVB)
>>> + *
>>> + * Copyright (C) 2021 Nuvoton Technology Corp.
>>> + */
>>> +
>>> +/dts-v1/;
>>> +#include "ma35d1.dtsi"
>>> +
>>> +/ {
>>> +       model = "Nuvoton MA35D1-EVB";
>>> +
>>> +       chosen {
>>> +               bootargs = "console=ttyS0,115200n8";
>> No bootargs. "chosen", please.
> 
> OK, I would modify it as:
> 
> chosen {
>          stdout-path = "serial0:115200n8";
>      };
> 
> 
>>> +       };
>> You need compatible and bindings.
> 
> I will add the compatible here
> compatible = "nuvoton,ma35d1-evb", "nuvoton,ma35d1"
> 
> And, I should create a new binding file 
> Documentation/devicetree/bindings/arm/nuvoton.yaml to this patch series.
> And the property would be:
> 
> properties:
>    compatible:
>      description: Nuvoton MA35D1-EVB
>      items:
>        - const: nuvoton,ma35d1-evb
>        - const: nuvoton,ma35d1
> 
> 
> Is it OK?

Yes



Best regards,
Krzysztof
