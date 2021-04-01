Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D6BC43460
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 21:06:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1C62A61104; Thu,  1 Apr 2021 21:06:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0111610FA;
	Thu,  1 Apr 2021 21:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617311175;
	bh=6JRjyfScpf/efWp6V9b8MycI7e5TmvBSvuXzH73BLGk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MRAcNBewsxVKExQTydH1wcfZ/UPLCrYozgb5q8R64P8UuVCmfvHZMB3piXIL48mZz
	 V9ATTySy9X/l2dB02UE+etYnSTH8S59Yq9GoJC6MOgHeVOhaY8Bnnl/BblBNJy4yxk
	 7jqizE/iIwiOVvK/imjmWdNOk/dTzS+013iOQgNp++yU9rfojrggmXpdWTEspy4R/U
	 LFlGnNeuRjgeMQxRy0PLsYAJzpCwJ55DxYUdAhZ7HRGNpd0JWuLGBNSpW05BnVHuzM
	 oIvTzA5O/eR2QFqGf7i2jKC4VdNzGJrhZGpiMtNv63cQX8f3xXddrF5uA/Vl97KN82
	 +17EwXlu5KvMg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH] ARM: configs: ux500: Update for new drivers
Date: Thu,  1 Apr 2021 23:06:04 +0200
Message-Id: <161731114635.662954.4375604729144576675.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301232050.1457397-1-linus.walleij@linaro.org>
References: <20210301232050.1457397-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 2 Mar 2021 00:20:50 +0100, Linus Walleij wrote:
> Some new driver support for the Ux500 devices landed in
> v5.12-rc1 so update the defconfig to use them:
> 
> - TM2 touchkey, used on the Golden and Janice.
> - SPI GPIO, used for the Janice display control.
> - NTC thermistor, used for the HREF temperature
>   sensors.
> - V4L2 flash control that gives support for LED
>   torch to userspaces such as Phosh.
> - The LEDs Flash class and RT8515 Flash/torch LED
>   driver used in all the Samsung mobiles.
> - FSA9480 extcon, used by Janice.
> - BMC150 accelerometer, used by Janice.
> - IIO rescaler, used for thermistors and ALS
>   on Janice.
> - MPU3050 gyroscope driver used by Janice.
> - Yamaha YAS530 magnetometer driver used by Janice.

Applied to arm/defconfig, thanks!

[1/1] ARM: configs: ux500: Update for new drivers
      commit: 907d6d3e41f960a083dc927350b3b531c43c1ce1

       Arnd
