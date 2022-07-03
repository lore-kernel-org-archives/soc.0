Return-Path: <SRS0=LbBh=XI=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E019C43334
	for <soc@archiver.kernel.org>; Sun,  3 Jul 2022 03:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CF442C341D2; Sun,  3 Jul 2022 03:57:34 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E0BC7C385A2
	for <soc@kernel.org>; Sun,  3 Jul 2022 03:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E0BC7C385A2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f47.google.com with SMTP id 73-20020a9d084f000000b00616b04c7656so5096541oty.3
        for <soc@kernel.org>; Sat, 02 Jul 2022 20:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dQGA0bu3AQWCuC1GbwRKa+75S+e6lFO1n+xYI6b2Lfw=;
        b=tZaTCT5agJ/W5MTY4ChPtc1XDLJKp4CctBpnrCUIhKNgpN1H67etzBdwWcVgqTh3p5
         Rpws6+KCerTtj8KDgj208++uOAUUNYbZwIshCcigdKA1eDiRz/QItFe1rMw5+GiscOar
         FrzEPYhzQinS0Z91zyAbjw85CcRTp2ENtnixsfT6WRN+TNRS0m0FM6MNH1rMOOCyJxsC
         5P51RWagk0utaomYGvqdFoITuFnEhDzq2tWG4Glt2KJgrHX/T3lrPdg/lUIzBClJzInl
         r208u28GA8/rpcp88qsLSJJlP4Ui0QQT6y6QxDAa5Nnm0OjV33BJKsy7H06YpCqUhiI8
         y4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dQGA0bu3AQWCuC1GbwRKa+75S+e6lFO1n+xYI6b2Lfw=;
        b=pIRe47ohzjc9mX54keoL8u6JsuMFCpTC8e/i7N22087n9kC3SEeSHXf5q86ACizTTX
         nGMDw5yMFz6yt95IbdNPUXzOziADUd97HIzQsL3bpdgkddCw2DRonTOH8EC8pFaWALfn
         lI+XEb+37wU9VSbdaGtm7lRiT4x6XxXQunGupgU6rf9lgf8qPlLo93mL8Q7FLfE4apmD
         bGOCjD50MXk1lbftVL3HhYHCB1mkHxOSapr2Y7AwEBz7mgv9/BVe1BntJZN9SlM76az+
         vytyb1c3DHTckDTO2G/ZOs/YXJ7olKiflLpx3GMPJz+oTNBwCDQrYK00aN1KzOY1qkXi
         r0aw==
X-Gm-Message-State: AJIora9wPyFMEMvGyJbgjiUztZDyQa0ZSaYBQwKvDq4szmpfpdcR3+iP
	47ZjBBLqesCPKngbARxftthmIg==
X-Google-Smtp-Source: AGRyM1unb+4uUOF604hLcm6sxUx99v9VtXWGjmIJ3dnzzgB49ZjQEqsHZ3kaRUHP0jg6yWxEYqFcqQ==
X-Received: by 2002:a05:6830:1b79:b0:616:af56:2fe7 with SMTP id d25-20020a0568301b7900b00616af562fe7mr9513926ote.262.1656820653608;
        Sat, 02 Jul 2022 20:57:33 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:33 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	arm@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Cc: Li Yang <leoyang.li@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Joel Stanley <joel@jms.id.au>,
	Thierry Reding <thierry.reding@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	linux-tegra@vger.kernel.org,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	linux-gpio@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Heiko Stuebner <heiko@sntech.de>,
	Nishanth Menon <nm@ti.com>,
	Peter Rosin <peda@axentia.se>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Wei Xu <xuwei5@hisilicon.com>,
	openbmc@lists.ozlabs.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-omap@vger.kernel.org,
	linux-input@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Andy Gross <agross@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: (subset) [PATCH v3 00/40] dt-bindings: input: gpio-keys: rework matching children
Date: Sat,  2 Jul 2022 22:56:27 -0500
Message-Id: <165682055968.445910.13332143476289618470.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:52:24 -0700, Krzysztof Kozlowski wrote:
> Merging
> =======
> 1. dt-bindings: rebased on top of Rob's:
>    https://lore.kernel.org/all/20220608211207.2058487-1-robh@kernel.org/
> 
> 2. DTS patches are independent. They can be picked up directly by sub-arch
>    maintainers, by Arnd or Olof, or eventually by me (if you wish).
> 
> [...]

Applied, thanks!

[25/40] ARM: dts: qcom: align gpio-key node names with dtschema
        commit: 9c17baaa97c89379cbd89e36115b7fb6aba43518

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
