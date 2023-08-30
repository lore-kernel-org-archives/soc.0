Return-Path: <SRS0=8gG2=EP=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45499C6FA8F
	for <soc@archiver.kernel.org>; Wed, 30 Aug 2023 09:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 051B6C433C8; Wed, 30 Aug 2023 09:45:05 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9A00AC433C7
	for <soc@kernel.org>; Wed, 30 Aug 2023 09:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9A00AC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9a5e1812378so58214866b.2
        for <soc@kernel.org>; Wed, 30 Aug 2023 02:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693388700; x=1693993500; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GinLhIkYK1eux6i+cjheW/SanM1hfGzP7zFFV4Pq7CI=;
        b=kgBVmK9ju9DQFqJMvz5kGT6myjvVyGRgyBRpcfxEmAjsV90YH+vwztu/0C/A2HaEOG
         zZodEqbAz/w7D6B9lihzcCuEfL1FH9e3hghDhxViIrhDv7+//VmpxeYIXYb5D5wr0iZO
         0O2B4VP6LbcbCA7dwKIAJ0IVE8OWO3bmbDcWfj9HBqKJ58grzVHY7w6Z6T+Lvx3caXqR
         SyMbeLlgtCGI3m1DWJ/9pUnmV32fxgtLKop+38Jj2+LajABo7tKTPbAsUhNxOjbsTNam
         o5DIcavO+BIr6IKYh8Kk0bY4sSFbrGn8D0RmVKeANvKTIwr2l+NQQspMivlvs5+W5cCd
         DyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693388700; x=1693993500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GinLhIkYK1eux6i+cjheW/SanM1hfGzP7zFFV4Pq7CI=;
        b=iyYH56DiKaJrsOEc62W40mOvcfBCQ1lAkCf4We+K436SO9HMh46U4ZbO1pJ6iMsQzF
         FW4TbS/dv06bHswMo+PUBfuhXbTSbuWHOuuQeQ7Jq9IUXO0piXOSHlYClybtZfRsrx1i
         xHAkaBWFWgRF1Bc0ILAUJh9TGlGBsGftmwP//YG7ucHTzp1uFwSENJhlUstBFr/2clpK
         3w+dHpzMXzNgWcPlPPCMvJ1qBlpH5sZ/7iH2DelQICgAGSfYwzrSdwQIit1XVZkPNDlU
         dEz4BS5htKKysTi3fVuIzyLrYCgNeZ5OQWzoJGWBd6KzH1DwcXfq7TLd39SkxdCh/aO3
         NJqQ==
X-Gm-Message-State: AOJu0YzHnBKMj18BMmaPRnXSqaPdRZo3BNtUjVwrR+1OQIACdeQ6+WAV
	Su7QeKwWjUppOx4W4WaoRo/E3w==
X-Google-Smtp-Source: AGHT+IErP0xuXzSAW/p+xjsBaBQUM/72RL+nvycu+pslby5SCw0FQTJk9JH2ZdMQgx3+rxaEkK5Myw==
X-Received: by 2002:a17:906:3152:b0:9a5:874a:9745 with SMTP id e18-20020a170906315200b009a5874a9745mr1129087eje.26.1693388700643;
        Wed, 30 Aug 2023 02:45:00 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id a8-20020a1709066d4800b0098e422d6758sm6930455ejt.219.2023.08.30.02.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 02:44:59 -0700 (PDT)
Message-ID: <b9cbe9be-b03e-6c7a-d06c-b75b012b5b25@linaro.org>
Date: Wed, 30 Aug 2023 11:44:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 1/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva
 (AST2600) BMC
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: peteryin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: cosmo.chou@quantatw.com, potin.lai@quantatw.com, daniel-hsu@quantatw.com
References: <20230830090212.3880559-1-peteryin.openbmc@gmail.com>
 <20230830090212.3880559-2-peteryin.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230830090212.3880559-2-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/08/2023 11:02, peteryin wrote:
> Add linux device tree entry related to
> Minerva specific devices connected to BMC SoC.
> 
> Signed-off-by: peteryin <peteryin.openbmc@gmail.com>

To clarify: your full name or known identity is "peteryin"?

> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 385 ++++++++++++++++++
>  2 files changed, 386 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 9e1d7bf3cff6..edb0b2105333 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1604,6 +1604,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-facebook-wedge400.dtb \
>  	aspeed-bmc-facebook-yamp.dtb \
>  	aspeed-bmc-facebook-yosemitev2.dtb \
> +	aspeed-bmc-facebook-minerva.dtb \

Nothing improved here.

>  	aspeed-bmc-ibm-bonnell.dtb \
>  	aspeed-bmc-ibm-everest.dtb \
>  	aspeed-bmc-ibm-rainier.dtb \


> +	"","","","","","","","",
> +	/*O0-O3 line 224-231*/
> +	"","","","","","","","",
> +	/*O4-O7 line 232-239*/
> +	"","","","","","","","",
> +	/*P0-P3 line 240-247*/
> +	"","","","","","","","",
> +	/*P4-P7 line 248-255*/
> +	"","","","","","","","";
> +};
> +

Nor here.

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

