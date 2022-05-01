Return-Path: <SRS0=I1DE=VJ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58ECC433F5
	for <soc@archiver.kernel.org>; Sun,  1 May 2022 08:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9709DC385AE; Sun,  1 May 2022 08:36:21 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DDD53C385A9
	for <soc@kernel.org>; Sun,  1 May 2022 08:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DDD53C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id p18so13526135edr.7
        for <soc@kernel.org>; Sun, 01 May 2022 01:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=T37Co2YaIoPdJaFzSuKUExm6NVIOKmiWi9ktB2H7iXc=;
        b=pRNaTUB3lHhU1S9qBs3tRXjsJM8qagB1/eF+S1HB1JhV517rz+YMpK8Yld04gfMAUa
         H4F+LnyxpSs51dQe+CWCH9w1XiU//tLDAc5JBv+/a18uz3J2BtpFllOaKs9RX7AbHgaM
         /Ctbxl9VwVT10mBGnv99RFKzQJqMpz6nu+S0xTHIBMFzH7jvWBX2ZVEXifI1UZhrZzpI
         8IJ0EzfGj8SvRSIsH5k5asWw2bFMHP5NWwQ0nAkZp/9PFSvjZ8fAEYpDsbnL8W5B8c1X
         yafASvFEHszNXWaprcPj/wCNt1WGYNpedKFxwl1gIwHRjI3g0Ebq00pBqSGPI+echDt7
         WrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=T37Co2YaIoPdJaFzSuKUExm6NVIOKmiWi9ktB2H7iXc=;
        b=2+RfTi9b1u5s/4ZEuZrNzzjFW4hripwVyA1CBnQJodrq3Z7+b34C48GzelNLiUUA0S
         7DjFQPbGFR8Jf61yOpAMLU972y48NK2ZvBh46PzP/lEy6gx/qSd0UbvGZBY81ov5sqrb
         LTY/LZizR/+ckviZDqnvVHUTKaAJq3mpkwFjRRJ+9fQT0yqAZC8/EPRynDZ+g1xKOPZU
         JgLl70+U7P6NjyNvmQ9PtW+Y/L1njSReQ5zCuEA8Bj/o0LJREVmBEON6oCrCV5Poqxyr
         OUZOVvpRz+H4A38xo8MXg3lJPULisHv2H2KX1w/VVra6sfSGW/ms8zdliGwPV41tqGhG
         tSaw==
X-Gm-Message-State: AOAM533F87TALEmUZnmwyPqcW0s1rwxGpglbdTF/eW5mnENTKwkC//tX
	QkrW/RIOqwKwLvennltROj5Hgg==
X-Google-Smtp-Source: ABdhPJyjbqMC3Hj6jQ6IPfDo57Yfjo2x2RX+5fmzz3mh2Oi00xy5UmJkCEkiWwOpNvfQpLrbWSiYnA==
X-Received: by 2002:a05:6402:40c9:b0:426:2b19:a4be with SMTP id z9-20020a05640240c900b004262b19a4bemr7923489edb.380.1651394179215;
        Sun, 01 May 2022 01:36:19 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jl25-20020a17090775d900b006f3ef214dc5sm2385905ejc.43.2022.05.01.01.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 May 2022 01:36:18 -0700 (PDT)
Message-ID: <e68f9371-e111-d357-c224-a0067774db73@linaro.org>
Date: Sun, 1 May 2022 10:36:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] arm: hisi: enable Hi3521a soc
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: "Marty E. Plummer" <hanetzer@startmail.com>, Arnd Bergmann
 <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220501051020.2432338-1-hanetzer@startmail.com>
 <20220501051020.2432338-3-hanetzer@startmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220501051020.2432338-3-hanetzer@startmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/05/2022 07:10, Marty E. Plummer wrote:
> Enable Hisilicon Hi3521A/Hi3520DCV300 SoC. This SoC series includes
> hardware mutlimedia codec cores, commonly used in consumer cctv/dvr
> security systems and ipcameras. The arm core is a Cortex A7.
> 
> Add hi3521a.dtsi and hi3521a-rs-dm290e.dts for RaySharp CCTV systems,
> marketed under the name Samsung SDR-B74301N.

Where?

> 
> Signed-off-by: Marty E. Plummer <hanetzer@startmail.com>
> ---
>  arch/arm/boot/dts/Makefile | 2 ++
>  arch/arm/mach-hisi/Kconfig | 9 +++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7c16f8a2b738..535cef3b14ab 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -242,6 +242,8 @@ dtb-$(CONFIG_ARCH_GEMINI) += \
>  	gemini-ssi1328.dtb \
>  	gemini-wbd111.dtb \
>  	gemini-wbd222.dtb
> +dtb-$(CONFIG_ARCH_HI3521A) += \
> +	hi3521a-rs-dm290e.dtb

There is no such DTS.


Best regards,
Krzysztof
