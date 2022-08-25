Return-Path: <SRS0=o3NM=Y5=gmail.com=jernej.skrabec@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77416ECAA2B
	for <soc@archiver.kernel.org>; Thu, 25 Aug 2022 19:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 478A5C433D7; Thu, 25 Aug 2022 19:48:58 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53FF3C433C1;
	Thu, 25 Aug 2022 19:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 53FF3C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id a4so25932806wrq.1;
        Thu, 25 Aug 2022 12:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=EEQaOMPMio1TV/1T2nsXijwtVuTW2Re2GSl+fTHb2hE=;
        b=EOSwTGoA0nee7KFDbY0hqShMabo5lvAZLhzj+GVpXhf++Nzj9OmUn1OmWPoyWldHhh
         dbnv+/P4Q5eGuNwR8TRpA5vnA71y/Ce1/+KcGBQ6tdxjU8neWPGCvfemSOgYsxBw8wWD
         /r9CrCVNubmy7oRWc7HuFASont4/bo0USnvpHoPD4sH8l2EyTnNC/e/T0T/K21K+q93v
         ZgCFsmmoNiygJD27wzIH2Y0gk2krAVmjCcEsgBCs8+912zcjpv5PrvliOdMBJuwshUXM
         5AuVZDl8hY1dUgNxix/rwOXM95rTapj4RVl6B2/HXjH88mM8Vf/D4YhYMVe3E0VrWWyE
         q9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=EEQaOMPMio1TV/1T2nsXijwtVuTW2Re2GSl+fTHb2hE=;
        b=LO/upxOc6rvhTMjG5cNuLPZpTOlWuLAsN+z3FY3YWTOA/6RdeIYCgTpuVqMFNnfbxy
         xfRmikZc2k7QqAg1QttN47g5/AMM5EAqaNr/+bxNtDnGSQpEiZCa9W3DE7V4N40YXhYU
         OFhK+TCWB34tU0hvKa/ZjAcgykG6GqBNIh+U6UqLpDZA7AJsM62xqe2wHRHVqrx0MtRa
         v28u7Pq3RLHQozL8Sr9dGWCcKtAtuvYnWuLG5Y4sG4gL3DH//r3BIbVHeT+VTquZqVta
         isilrs0mOb0dXRWxIvEjjj8OeDMpcemQOI/6XQe+UpVgyCkasTn+J8q1VuKMMtZjggw1
         hl8A==
X-Gm-Message-State: ACgBeo0p4wiTOyjMu7AE09oSKwXfFQWzXK1KwHnW24uRX8m6cXZn1jlj
	b0j7xBIH5m2+6Md2pFN0w9Q=
X-Google-Smtp-Source: AA6agR6a+jB85i972kXbhLkKKpllW7496fpWqVVpOsWOvIO65uvf0tz0QQyG4Bto1DkO00QbeWBtGA==
X-Received: by 2002:a5d:514d:0:b0:225:3507:79e6 with SMTP id u13-20020a5d514d000000b00225350779e6mr3063920wrt.85.1661456935527;
        Thu, 25 Aug 2022 12:48:55 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id f5-20020a5d4dc5000000b002235eb9d200sm120536wru.10.2022.08.25.12.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 12:48:54 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Russell King <linux@armlinux.org.uk>, Florian Fainelli <f.fainelli@gmail.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-oxnas@groups.io, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, arnd@arndb.de, 
	olof@lixom.net, soc@kernel.org, Stefan Hansson <newbie13xd@gmail.com>
Cc: Stefan Hansson <newbie13xd@gmail.com>
Subject: Re: [RESEND PATCH] ARM: configs: replace CONFIG_NO_HZ=y with CONFIG_NO_HZ_IDLE=y
Date: Thu, 25 Aug 2022 21:48:52 +0200
Message-ID: <2642863.mvXUDI8C0e@kista>
In-Reply-To: <20220825162034.5901-1-newbie13xd@gmail.com>
References: <20220825162034.5901-1-newbie13xd@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 25. avgust 2022 ob 18:20:35 CEST je Stefan Hansson napisa=
l(a):
> According to https://www.kernel.org/doc/html/latest/timers/no_hz.html,
> CONFIG_NO_HZ=3Dy should be replaced by CONFIG_NO_HZ_IDLE=3Dy for newer
> kernels, so let's reflect that in the 32-bit ARM defconfigs.
>=20
> Signed-off-by: Stefan Hansson <newbie13xd@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> # Samsung
> ---
>  arch/arm/configs/bcm2835_defconfig       | 2 +-
>  arch/arm/configs/cm_x300_defconfig       | 2 +-
>  arch/arm/configs/davinci_all_defconfig   | 2 +-
>  arch/arm/configs/dove_defconfig          | 2 +-
>  arch/arm/configs/exynos_defconfig        | 2 +-
>  arch/arm/configs/ezx_defconfig           | 2 +-
>  arch/arm/configs/hisi_defconfig          | 2 +-
>  arch/arm/configs/imx_v4_v5_defconfig     | 2 +-
>  arch/arm/configs/imx_v6_v7_defconfig     | 2 +-
>  arch/arm/configs/integrator_defconfig    | 2 +-
>  arch/arm/configs/lpc32xx_defconfig       | 2 +-
>  arch/arm/configs/magician_defconfig      | 2 +-
>  arch/arm/configs/milbeaut_m10v_defconfig | 2 +-
>  arch/arm/configs/moxart_defconfig        | 2 +-
>  arch/arm/configs/multi_v5_defconfig      | 2 +-
>  arch/arm/configs/multi_v7_defconfig      | 2 +-
>  arch/arm/configs/mv78xx0_defconfig       | 2 +-
>  arch/arm/configs/mvebu_v5_defconfig      | 2 +-
>  arch/arm/configs/mxs_defconfig           | 2 +-
>  arch/arm/configs/omap1_defconfig         | 2 +-
>  arch/arm/configs/omap2plus_defconfig     | 2 +-
>  arch/arm/configs/orion5x_defconfig       | 2 +-
>  arch/arm/configs/oxnas_v6_defconfig      | 2 +-
>  arch/arm/configs/pcm027_defconfig        | 2 +-
>  arch/arm/configs/pxa168_defconfig        | 2 +-
>  arch/arm/configs/pxa910_defconfig        | 2 +-
>  arch/arm/configs/pxa_defconfig           | 2 +-
>  arch/arm/configs/qcom_defconfig          | 2 +-
>  arch/arm/configs/s5pv210_defconfig       | 2 +-
>  arch/arm/configs/shmobile_defconfig      | 2 +-
>  arch/arm/configs/sunxi_defconfig         | 2 +-

=46or sunxi:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  arch/arm/configs/tegra_defconfig         | 2 +-
>  arch/arm/configs/vt8500_v6_v7_defconfig  | 2 +-
>  arch/arm/configs/xcep_defconfig          | 2 +-
>  34 files changed, 34 insertions(+), 34 deletions(-)



