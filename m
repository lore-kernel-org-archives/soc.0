Return-Path: <SRS0=rS6K=A2=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15033C77B7F
	for <soc@archiver.kernel.org>; Fri,  5 May 2023 06:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD439C433A1; Fri,  5 May 2023 06:18:19 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 00D9AC433EF
	for <soc@kernel.org>; Fri,  5 May 2023 06:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 00D9AC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-64389a44895so1232959b3a.1
        for <soc@kernel.org>; Thu, 04 May 2023 23:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683267496; x=1685859496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2cpNnZUMjxe8omI5N7a3yxPaft5joAL0ch8TrhFB8Z8=;
        b=KggfgirWJGkp7qmBLEOljOsiAwzZXpaW2VuvMX+isJXSmxtXh2V0abiogt8OHDlF0R
         /4A00chD4UN4bShQ25HS8gLCSVWDrX/SnmwSkgNiZPa2rrOs/VxoLuyx3Y4G1ZW+v64B
         F1eUB6ShLnHykX9chUKMoTaTKjRjY214k1WfBxr6cUqyNBMwfhQGBT8AebUkmOQFkoqt
         zPrjlVTFNe3jQTS8WH1cDVVLaO4vuKDrnarMcysZnleayX5K35gQG+Y9v6X73jrNcKtg
         LvUgkScNpfbxymaE8DI5BnkNmEh7ckrp97uLw67+WpWATrnAdUSmciBj3FwMcG6OxTYy
         IgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683267496; x=1685859496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cpNnZUMjxe8omI5N7a3yxPaft5joAL0ch8TrhFB8Z8=;
        b=QpxEevM0YtpTKAMlkQXAjzNx7g1sf7nbGc3PjQhrqyLMlMoct8sx4kf20/VvJViAYO
         9CPOXdx9DPHt2hEZykwOXM1PHEss7rhN8GK4YOr5ezDx9sBDFHBvlaJ9ebfrn29CcfE0
         5QC4s7XeQb8yLSG24V078PNSJr4tPyo0I4GixnuuBGLc6P+DpINgnYL7eubW3KaMgQs2
         u0FIfQFyWUVjvEr6Pp0gG2YmrV4yBLbjl+0Q/wzQFVL23MO7TNOy0+5/V4/EtzVVL8Mi
         188Ny5yn936LucYWKDEgiZ3J5SyKJ5Qe7dplJV/utvRQ0MxHhTVLCKnbZxeWkZjtpOjh
         YeoA==
X-Gm-Message-State: AC+VfDw3DlOgseGgiPDyoceAiMXVfOP5Yd3xv2KyJ2XeWniwsNsfuari
	W36HsVzllPvcs5eObbk9GRQE8w==
X-Google-Smtp-Source: ACHHUZ4PLkadb3fwQqdgi8WHpXvUUAVWN2Jptu1Jc5PeyEviOACTLxDsTzBDAOk6BLAw4YsLxzKBOg==
X-Received: by 2002:a05:6a20:7295:b0:ef:205f:8184 with SMTP id o21-20020a056a20729500b000ef205f8184mr651085pzk.13.1683267496411;
        Thu, 04 May 2023 23:18:16 -0700 (PDT)
Received: from localhost ([122.172.85.8])
        by smtp.gmail.com with ESMTPSA id h16-20020aa786d0000000b0063b8f33cb81sm798014pfo.93.2023.05.04.23.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 23:18:15 -0700 (PDT)
Date: Fri, 5 May 2023 11:48:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Joel Stanley <joel@jms.id.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Lars Persson <lars.persson@axis.com>,
	Scott Branden <sbranden@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Baruch Siach <baruch@tkos.co.il>, Wei Xu <xuwei5@hisilicon.com>,
	Jean-Marie Verdun <verdun@hpe.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Peter Rosin <peda@axentia.se>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Thierry Reding <thierry.reding@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>, Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Marek Vasut <marex@denx.de>, Qin Jian <qinjian@cqplus1.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Paul Barker <paul.barker@sancloud.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Javier Martinez Canillas <javier@dowhile0.org>,
	Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@axis.com
Subject: Re: [PATCH 4/4] ARM: dts: Move .dts files to vendor sub-directories
Message-ID: <20230505061813.pu36aup2p5yqcpuh@vireshk-i7>
References: <20230504-arm-dts-mv-v1-0-2c8e51a2b6c4@kernel.org>
 <20230504-arm-dts-mv-v1-4-2c8e51a2b6c4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504-arm-dts-mv-v1-4-2c8e51a2b6c4@kernel.org>

On 04-05-23, 22:29, Rob Herring wrote:
>  arch/arm/boot/dts/st/Makefile                      |   73 +
>  arch/arm/boot/dts/{ => st}/spear1310-evb.dts       |    0
>  arch/arm/boot/dts/{ => st}/spear1310.dtsi          |    0
>  arch/arm/boot/dts/{ => st}/spear1340-evb.dts       |    0
>  arch/arm/boot/dts/{ => st}/spear1340.dtsi          |    0
>  arch/arm/boot/dts/{ => st}/spear13xx.dtsi          |    0
>  arch/arm/boot/dts/{ => st}/spear300-evb.dts        |    0
>  arch/arm/boot/dts/{ => st}/spear300.dtsi           |    0
>  arch/arm/boot/dts/{ => st}/spear310-evb.dts        |    0
>  arch/arm/boot/dts/{ => st}/spear310.dtsi           |    0
>  arch/arm/boot/dts/{ => st}/spear320-evb.dts        |    0
>  arch/arm/boot/dts/{ => st}/spear320-hmi.dts        |    0
>  arch/arm/boot/dts/{ => st}/spear320.dtsi           |    0
>  arch/arm/boot/dts/{ => st}/spear320s.dtsi          |    0
>  arch/arm/boot/dts/{ => st}/spear3xx.dtsi           |    0
>  arch/arm/boot/dts/{ => st}/spear600-evb.dts        |    0
>  arch/arm/boot/dts/{ => st}/spear600.dtsi           |    0

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
