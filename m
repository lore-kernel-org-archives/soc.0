Return-Path: <SRS0=75W9=EI=gmail.com=jernej.skrabec@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72319C3DA6F
	for <soc@archiver.kernel.org>; Wed, 23 Aug 2023 19:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 57D82C433CA; Wed, 23 Aug 2023 19:14:05 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5EDAAC433C7;
	Wed, 23 Aug 2023 19:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5EDAAC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99bcf2de59cso778013166b.0;
        Wed, 23 Aug 2023 12:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692818042; x=1693422842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCIrAxFDF25mzcKHeRcgDzkO8YOJQLUfVKMU+Ywn+CI=;
        b=F0m1dC0r1D9CfIev6pc24EaKzGxk0UuGNnqavKUqIieO1QM7EZ7130J/Dl71vD6cck
         b4tEURRXTFB8K8kYrJunVHW9jBttCV6oOn8MVoJC79gH1IKNI19yDUYtMafAbmCqjXGD
         jVl603iPiqILuA4/TICEL/jjU1Zfbn8GRo7IvKdaiiAVALYvHyo8QXpiqsHXR3TLXa0H
         BMTTH8pb0RyPS7pzI0xuKr4OWTzNw+a/EX5nYDengR5UprSeu/PNWdOWKKpalqT87OfD
         yS2EFWh9G3CbcUle03vyDcSzD2TgQgsnuyYnmsRhV0Z/we7N8WB/AHWK+LsXaMGpdm0x
         eX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692818042; x=1693422842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCIrAxFDF25mzcKHeRcgDzkO8YOJQLUfVKMU+Ywn+CI=;
        b=WFIrjmjgLToca2IRon0wHG8CEnevwleQ9HmjtIuYZW81fBjTSRah7FB+mNpOnWIc9E
         WgRMip7CDIBzQTzfgSPeCeKVNt4kvosBCDXOoaprdS11tVmTyI/7TLuhXvFeaib4OwdU
         FDLkJi33MFViUZqYgRbAq7yIMK9ziTPP6yu6dBu/dKMn0oVIaFhXefM0Va8v1Q/9IOKV
         VZHz5dHBfvvU473ityEWJXsPwJzmR3o0R5jDzG3BW0gmLgYlHUi6Y8dOrtiVSKCr5UQy
         v6gO2thNp/ET13oyp1iCuw1j5tjX/AyzBoLFaIv1fHp0qZVxfheGfcOM2Q1708y/xEqn
         XMTA==
X-Gm-Message-State: AOJu0YzD4fgw2ooXA6RCgBKHMd1ohdyiIAFJZhlLCvA9mpzZSVATcuWQ
	/q/8/BedZ2v1Mv/kiKFosSk=
X-Google-Smtp-Source: AGHT+IFbojcSnWWb57HEiIyw8RL+IR9XS37Wm62sPrbcTpWpKP2WmF6c9EcbiBXGI99RpkWM2z7iJQ==
X-Received: by 2002:a17:906:cc2:b0:99d:f560:5d3c with SMTP id l2-20020a1709060cc200b0099df5605d3cmr11357511ejh.23.1692818042131;
        Wed, 23 Aug 2023 12:14:02 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id f15-20020a170906084f00b0099cf9bf4c98sm10059758ejd.8.2023.08.23.12.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 12:14:01 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [PATCH 1/2] ARM: dts: use capital "OR" for multiple licenses in SPDX
Date: Wed, 23 Aug 2023 21:13:59 +0200
Message-ID: <4504114.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20230823085146.113562-1-krzysztof.kozlowski@linaro.org>
References: <20230823085146.113562-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 23. avgust 2023 ob 10:51:45 CEST je Krzysztof Kozlowski napisal(a):
> Documentation/process/license-rules.rst and checkpatch expect the SPDX
> identifier syntax for multiple licenses to use capital "OR".  Correct it
> to keep consistent format and avoid copy-paste issues.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Rebased on next-20230822, so might not apply cleanly.  What does not
> apply, can be skipped and I will fix it after next RC.
> ---
>  arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts | 2 +-
>  arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi                  | 2 +-
>  arch/arm/boot/dts/allwinner/sunxi-d1s-t113-mangopi-mq-r.dtsi  | 2 +-

For Allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  arch/arm/boot/dts/nxp/imx/imx6dl-b105pv2.dts                  | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6dl-b105v2.dts                   | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6dl-b125pv2.dts                  | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dts                   | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts                   | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6dl-b1x5pv2.dtsi                 | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6dl-b1x5v2.dtsi                  | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6dl-emcon-avari.dts              | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi                    | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6q-emcon-avari.dts               | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-emcon-avari.dtsi            | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi                  | 2 +-
>  arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dts              | 2 +-
>  arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi           | 2 +-



