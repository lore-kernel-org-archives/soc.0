Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A6AC56202
	for <soc@archiver.kernel.org>; Mon, 23 Nov 2020 16:51:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DC23D221F8; Mon, 23 Nov 2020 16:51:18 +0000 (UTC)
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8E2C02100A;
	Mon, 23 Nov 2020 16:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606150278;
	bh=IJLsfoiBXLZdNhTBNGvXW4kWo9aqLbAR3Z4WPpZb1rQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lUmq0IK7PLLXYu/ReMk9UlTAqPFnD75ayfPxEIN5LlF+kxxXE7KFpwgFDyYMDQKcj
	 lMKw2p/rVqZca+b55hbB13dMZLycjAi4HV2SwmIh0BFneHgZ1qt9c7OVMLvHHNZOaO
	 23bZTBOPDnMufrvvztEqRuHsxdzbhH+0ubSuZ9Rg=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH] ARM: config: ux500: Update U8500 defconfig
Date: Mon, 23 Nov 2020 17:51:08 +0100
Message-Id: <160615024268.69722.7470097751906035307.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201105134510.1417639-1-linus.walleij@linaro.org>
References: <20201105134510.1417639-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 5 Nov 2020 14:45:10 +0100, Linus Walleij wrote:
> This updates the defconfig for the U8500 platform with
> some of the changes from the v5.9 and v5.10 kernel
> cycles:
> 
> - No need to select the schedutil cpufreq governor
>   because it is the default now.
> - Enable the CY8CTMA140 touchscreen as used on the
>   Samsung Skomer GT-S7710.
> - Enable the Samsung S6E63M0 DSI panel as used on
>   the Samsung Golden GT-I8810.
> - Enable the KTD253 backlight as used on the Samsung
>   Skomer GT-S7710.
> - Drop CONFIG_USB as we only use the gadget mode of
>   the MUSB driver.
> - Add selection of the CONFIG_LEDS_LP55XX_COMMON
>   lest the LP5521 LEDs will not work.
> - Move the config entry for CONFIG_DEBUG_FS.

Applied to arm/defconfig, thanks!

[1/1] ARM: config: ux500: Update U8500 defconfig
      commit: a65183ff1535ed15c28c526f6b69ed03c21d34b4

       Arnd
