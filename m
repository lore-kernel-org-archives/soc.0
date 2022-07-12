Return-Path: <SRS0=5J+w=XR=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77ED1C43334
	for <soc@archiver.kernel.org>; Tue, 12 Jul 2022 07:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43E36C341CA; Tue, 12 Jul 2022 07:43:00 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D5EDC385A2
	for <soc@kernel.org>; Tue, 12 Jul 2022 07:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D5EDC385A2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id bp17so4692372lfb.3
        for <soc@kernel.org>; Tue, 12 Jul 2022 00:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OFwV0GnwEWzb8CnqbRyUTGeX9al/d39bPjBKtubmVOM=;
        b=o1W8oqEsbambLrmck9k9jnDD2s/GDAq4FcLrOJ0b8a0giL0LWHLOC/1dvYsgkMBaIN
         6I6f2/CrLsK1iiBRc6HF4NvegXCc1RQXolCUw7xSQElPiF37gzkWQG6QvhMBiW666CzG
         6hNxkqJa+ArJAM2yoFDn8su4Q+nbr76nY4WkHxT1qPBMn/YURgxtLaHmYo6YiZoUL6pz
         SQJf7QO2zQybxlAXiIcf/iBXDZSuvZN4PmWTp0VpCYQAWrwSJTUuCY67UQO5hnRWZAjp
         qecLYLQDcJnk1q9x2KNOi3ydU5XWjtB/jPeSAFN2NCUB1CJTQrWvjgmLoEZ8Gic3JgRk
         luFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OFwV0GnwEWzb8CnqbRyUTGeX9al/d39bPjBKtubmVOM=;
        b=S2IZxVaMmI/7pnA0z3K0rzBjLSQL7BJIZRyqTt1guo4fpMUPdCxW2sI5j1fyppXyvw
         JZ2DETM+VrnwGZjEZ/hMgthDG0G8sOg6P0Lb8vNjtH5whCJ5+m8XwIY0HxhTsyr/Tu7t
         ngfSTLRP04SMhtWBpk2wAfM+5WrLixkqTxSidjeleKIYIqD8OvW9jhcMVQUykeOIjzQZ
         lFlk1kZ0q31AhHTuN0cH3cxOuE7vx9sqIfurjRzow2udaZrb90OaZxuRKyjGOfb19JVD
         Yf9zBWyzQKBV2boCW85unkCIcVyZmQdsqvBxKF4mKVmybq1qY2nkA825H77qzKC0Gf3l
         EvOA==
X-Gm-Message-State: AJIora+QZEaSAo6T279UdhkCb+7z7qJSgsRS25OleTFH5/KH+t+mBoP2
	2GEUjdXZFyimpOtV0K1UiRfbiQ==
X-Google-Smtp-Source: AGRyM1s1uq9FLDTjLnPxNPASCty8gxzyOPR+BzP1K6BIHFjkkiMXm8ZYVxe/EM7Xena5vwvn5pvzug==
X-Received: by 2002:a19:dc4d:0:b0:489:63cb:20c7 with SMTP id f13-20020a19dc4d000000b0048963cb20c7mr13224707lfj.101.1657611777630;
        Tue, 12 Jul 2022 00:42:57 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512200600b00489d6460831sm1487838lfb.266.2022.07.12.00.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 00:42:57 -0700 (PDT)
Message-ID: <7a1199e6-cdfc-d89e-84d9-db43ef135786@linaro.org>
Date: Tue, 12 Jul 2022 09:42:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/3] ARM: dts: imx7d: fixed dts for UC-8210/8220
 hardware
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Jimmy Chen <u7702045@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Cc: Jimmy Chen <jimmy.chen@moxa.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220712045505.4500-1-jimmy.chen@moxa.com>
 <20220712045505.4500-3-jimmy.chen@moxa.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712045505.4500-3-jimmy.chen@moxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/07/2022 06:55, Jimmy Chen wrote:
> fix compatible string reference to fsl.yaml
> change regulator node name
> replace underscore to dash
> replace node name
> remove 'status' attribute from node
> add board compatible and model to ixm7d-moxa-uc-8210.dts
> rearrange 82XX alphabet order in Makefile

This commit description does not make any sense. You messed up commit
description with changelog. Please go through SubmittingPatches doc few
times.

> 
> Signed-off-by: Jimmy Chen <jimmy.chen@moxa.com>
> ---
>  arch/arm/boot/dts/Makefile               |  4 +--
>  arch/arm/boot/dts/imx7d-moxa-uc-8210.dts | 46 +++++++++++-------------
>  arch/arm/boot/dts/imx7d-moxa-uc-8220.dts |  9 +++--
>  3 files changed, 29 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 37db3b60ba43..c9c57626876c 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -747,6 +747,8 @@ dtb-$(CONFIG_SOC_IMX7D) += \
>  	imx7d-flex-concentrator-mfg.dtb \
>  	imx7d-mba7.dtb \
>  	imx7d-meerkat96.dtb \
> +	imx7d-moxa-uc-8210.dtb \
> +	imx7d-moxa-uc-8220.dtb \
>  	imx7d-nitrogen7.dtb \
>  	imx7d-pico-dwarf.dtb \
>  	imx7d-pico-hobbit.dtb \
> @@ -755,8 +757,6 @@ dtb-$(CONFIG_SOC_IMX7D) += \
>  	imx7d-remarkable2.dtb \
>  	imx7d-sbc-imx7.dtb \
>  	imx7d-sdb.dtb \
> -	imx7d-moxa-uc-8210.dtb \
> -	imx7d-moxa-uc-8220.dtb \

There are no such entries. Rest is even weirder...

Best regards,
Krzysztof
