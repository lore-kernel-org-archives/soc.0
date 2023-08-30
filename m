Return-Path: <SRS0=8gG2=EP=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5122FC83F01
	for <soc@archiver.kernel.org>; Wed, 30 Aug 2023 06:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16AF1C433C9; Wed, 30 Aug 2023 06:56:47 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02570C433C7
	for <soc@kernel.org>; Wed, 30 Aug 2023 06:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 02570C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2bc63e0d8cdso76651941fa.2
        for <soc@kernel.org>; Tue, 29 Aug 2023 23:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693378604; x=1693983404; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FKNC/Ecmczb+pprJRVI/jNOGGup4YFMq8hyWzf6I3EM=;
        b=S88RX9lohb7zTd1ygDMjdDx1Q+eRop2trw2cKV4x65yAv5b1fN9wTalgXZRNjfZExU
         9GSgq/nokuTHFQzHDf+FIBwSr4LKwTb0oY+c1jHCMzUaX0tRTWolT91t5bU3ljhrMRI+
         TkcN3Vsl6/gK/IJOysTN1H7+kEj9mMWivn4AInqUHd51UqxrD5/XpkC2h4V4H4jylTq0
         gV5ryt84HTiS6CfFm7Wh8s/MpaTykUQnoxcRLvmkZL1Iq/yDRTgsOBgI96ko1lnzvSxc
         Z8zisY0daTpByKfbj8UE/wsR7Q5q/JVn0kQoo4KxONI+oNIEW3G+T60pShweiAMAAFaY
         p83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693378604; x=1693983404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FKNC/Ecmczb+pprJRVI/jNOGGup4YFMq8hyWzf6I3EM=;
        b=EZ/xSuAVe7aWRzV+dFEJ4URHEQFfEe+TQn0e56zZmAUFoGjuTV9hQ3ko8gWsZDE47f
         vZh0R3jhZ1Ia+7qawpsqxIpkU1WlxDVRjn0myyIM0EPBZmx3eS+Ki2nlBxNo/18xhFV0
         FEXNO7u655pWuxbd+Oo4PEM+9kUjWP98iq5yBiOlRqYWekCtyRoyl+O58YB+nhYzeHnf
         tf6YCzF3ZakaY4Ll3PskhKvPLqobyI5I+Rji/gCKmbJ/dr+rSXyRVH42xw3adqyhZ6rb
         YqLTPZgi/9Y5oUJsYfvCxYU/IrxSCZdoXq4FO6r5ngjQdOA+gSJ0dYeVn6b1AUT5/giY
         VboQ==
X-Gm-Message-State: AOJu0YwCOHKwlM0AZJ9dmyJf4wStxXNMvYLneAVDVlzacqm3EBb2CerN
	kWD3khEzc1UC58+7CyDbnH2KOA==
X-Google-Smtp-Source: AGHT+IEkicIQuRpUPzDVnA0JHWBk+8C+LPUAUHJor3ONxVqWsbLcrf8WjtNGb6UOKF8JDaWBm8ZWqA==
X-Received: by 2002:a2e:8619:0:b0:2bd:10d3:214 with SMTP id a25-20020a2e8619000000b002bd10d30214mr1105105lji.11.1693378603617;
        Tue, 29 Aug 2023 23:56:43 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id fx19-20020a1709069e9300b0098e0a937a6asm6796450ejc.69.2023.08.29.23.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 23:56:43 -0700 (PDT)
Message-ID: <03729949-1994-6ce1-253b-886a254ac0af@linaro.org>
Date: Wed, 30 Aug 2023 08:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/1] ARM: dts: aspeed: Minerva: Add Facebook Minerva
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
References: <20230830025133.3756506-1-peteryin.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230830025133.3756506-1-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/08/2023 04:51, peteryin wrote:
> Add linux device tree entry related to
> Minerva specific devices connected to BMC SoC.
> 
> Signed-off-by: peteryin <peteryin.openbmc@gmail.com>
> ---
> v1 link : https://lore.kernel.org/all/fb09f5e6-8381-312f-2f1e-f2b471cec68a@linaro.org/
> v2 link : https://lore.kernel.org/lkml/9f499fe5-db59-f4c8-6a50-93725b7287fd@linaro.org/
> 
> Change log:
> 
> v3:
>     1.Fixed commit description.
>     2.Add sgpio line name to sgpioP.
>     3.Add ipmb debug card bus.
> 
> v2:
>     1.Add facebook,minerva-bmc in aspeed.yaml
>     2.Use stdout-path
>     3.Add Makefile
> 
> v1:
>     1. Create minerva dts file.
> 
> ---
>  .../bindings/arm/aspeed/aspeed.yaml           |   1 +
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 384 ++++++++++++++++++
>  3 files changed, 386 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index fb4ce5df2fa0..9d1b26e7ca6b 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -79,6 +79,7 @@ properties:
>                - facebook,elbert-bmc
>                - facebook,fuji-bmc
>                - facebook,greatlakes-bmc
> +              - facebook,minerva-bmc
>                - ibm,everest-bmc
>                - ibm,rainier-bmc
>                - ibm,tacoma-bmc

Nothing improved here. Checkpatch still complains. Bindings are always
separate patches.

Also, this patch does not apply to any tree.

Best regards,
Krzysztof

