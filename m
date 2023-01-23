Return-Path: <SRS0=6Gkx=5U=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DFDC05027
	for <soc@archiver.kernel.org>; Mon, 23 Jan 2023 15:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DCCBDC4339C; Mon, 23 Jan 2023 15:35:48 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CBF18C433D2
	for <soc@kernel.org>; Mon, 23 Jan 2023 15:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CBF18C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so10902895wma.1
        for <soc@kernel.org>; Mon, 23 Jan 2023 07:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZV/YupdBHfYEgxMNJ/vNSCWnKrdy7rcoPltaDFLsCpE=;
        b=BUMAANqbKkian0KWpTAwTx7mPcxBcConTeVmyWCjq5Kzn8SbuLc4CtuebTKN9J3iMP
         JSv7/gXEkjdu5rBaCy//KstbYcBQBzEZ6IcYzJgWoYafO2igUiY/rbnRs68/9ANW1X3v
         I8vd5jcmZgJylW3o+04nOQ3Mx6DIix6ru33mdEJKdipJIM5JrEFxqsopuvK+Fg3UwQqG
         dX8cSOLrqHfPJjiNtvkTrzbv/1oO5i6VIkMTnL0XVlis7IzvOlybQ6wRvbelmwgkFOpw
         Yh939Cheh5P7ZxSN8E3qZWRSGqb6BimxDLQQqpigOWbzN9TpVm4BLBI4DKaxsHWwI/ZE
         qUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZV/YupdBHfYEgxMNJ/vNSCWnKrdy7rcoPltaDFLsCpE=;
        b=ZDgNvtEp19nNeC0KpXDk1jNxSCO+G7GoOH3mp1/q981a6khjj7rvyZ/5jsIhhVy6Zy
         9vbmRP9b6ff2cRn+l4/40Cndcu7bSZCqN1ncbWmIAbmVT228kNdLVilEaQwtNTNAUDu0
         1GxOMhzxaB7OaDsPQFAl6qADtTRHoYHqBdTt8fR4SkiopxlcdVKy9tT8uI9x2ttlp4SP
         AfpllvRcyV8BKrxdRkQyXXnkkBrIElGFZpNaxQnOQgd2wtiFicZlu0zdT6xGyF+m7E5Z
         kWnp2HvGYbgMMWajk8fX6Pt6TUHWVDGJPPh/49Ot/4ENl6eHh9fLR7H6OAtt78YH9Vkn
         1K0g==
X-Gm-Message-State: AFqh2ko2VGKkiZpyQS3WIFq5Pa6SAlW6cprYYowNKz7esycZn7qWfS6Y
	e11xI1K42Y9qNuqPiFxOsKoqSw==
X-Google-Smtp-Source: AMrXdXv8boPuYWxImbIFEMrMA8f8P8adojZQbCuvYWC6/21kKUR23nqIM4iyDG6Uy1+FC2jzl1Siww==
X-Received: by 2002:a05:600c:4f83:b0:3db:eab:a600 with SMTP id n3-20020a05600c4f8300b003db0eaba600mr21346884wmq.7.1674488146174;
        Mon, 23 Jan 2023 07:35:46 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t13-20020a1c770d000000b003db0ee277b2sm10948154wmi.5.2023.01.23.07.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 07:35:45 -0800 (PST)
Message-ID: <51e31914-6b86-b83b-898e-2d2d31a59620@linaro.org>
Date: Mon, 23 Jan 2023 16:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 2/2] arm: dts: exynos5422: Add device-tree for Samsung
 Galaxy S5 (SM-G900H)
Content-Language: en-US
To: Markuss Broks <markuss.broks@gmail.com>, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20230121201926.46990-1-markuss.broks@gmail.com>
 <20230121201926.46990-3-markuss.broks@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230121201926.46990-3-markuss.broks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/01/2023 21:19, Markuss Broks wrote:
> Samsung Galaxy S5 (SM-G900H) was sold alongside Samsung Galaxy S5
> with Snapdragon SoC, however the Exynos version features a 3G
> capable Intel modem instead of Qualcomm version featuring LTE modem.
> This phone is based on Exynos5422. Currently, the touchscreen,
> USB, eMMC and the PMIC are enabled in the device-tree.
> 
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  arch/arm/boot/dts/Makefile                   |   1 +
>  arch/arm/boot/dts/exynos5422-samsung-k3g.dts | 676 +++++++++++++++++++
>  2 files changed, 677 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos5422-samsung-k3g.dts
> 

I gave it a try but dtbs_check complain:

/home/krzk/dev/linux/linux/out/arch/arm/boot/dts/exynos5422-samsung-k3g.dtb:
pinctrl@13400000: 's2mps11-irq-pin', 'touch-int-pin' do not match any of
the regexes: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$',
'^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[0-9]+'
	From schema:
/home/krzk/dev/linux/linux/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml


Best regards,
Krzysztof

