Return-Path: <SRS0=gSPj=SS=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3553CC433EF
	for <soc@archiver.kernel.org>; Thu,  3 Feb 2022 07:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1D77C340F3; Thu,  3 Feb 2022 07:42:12 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0AD8CC340ED
	for <soc@kernel.org>; Thu,  3 Feb 2022 07:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0AD8CC340ED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BD8D640327
	for <soc@kernel.org>; Thu,  3 Feb 2022 07:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1643874130;
	bh=69oC9K6bP5zXfYZ3RPqGsmz6Po3E4WX3hDMRIgEHu/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=Wet2DQz117qs1mJVrv3qagOCaWiv7XM5/C2okUUAQkCG/KOVhTB/015nyqwkaOUu2
	 6hjMkY6lyOFiZpes8yIysMXHrDVpRip0bDN6lguq4sAFvoepFovVSBfWM8w4WpkSB3
	 WZFc/KKeMjJjJMv5YQlUAkoQciBoOoodSJYHr4a6T1a6FSFTQ3tgH57GunpEL3tbLH
	 1MH7oM02tOEZ1SuWqxrPHtslyfK6KW7GOy0W/4i3hBQV4YFdmqA3M9IyU1FxDmC5EB
	 yEUiKFHgUIttypf6gtfV0mgCZLWEvtQobVURB2eK1GwCzLXVlErbcQJyoNdX/tuPJz
	 eu57mjiTRFlUA==
Received: by mail-lf1-f70.google.com with SMTP id w42-20020a0565120b2a00b00432f6a227e0so1102817lfu.3
        for <soc@kernel.org>; Wed, 02 Feb 2022 23:42:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=69oC9K6bP5zXfYZ3RPqGsmz6Po3E4WX3hDMRIgEHu/M=;
        b=OvqK/kmnyhpieTLKSEO6cMiY8KtVWviBJXDSJJ3sKRWWu8m8BGU5CQEHMQLKrOvitG
         ocqjRCqkYnJslRsJCCcAVW7EEq3exAoYzr3J3eQ6AQhAY5+uKj2sJ9WX0+eRegt2g7U3
         m7sGl64apyyqS7a/3DZPweqfLnBzrU/t5RNGIBASd9Buoi1TDRhawPxFlMRxdrjz8WCl
         5Ir3jl/qdHj0ggh9gSXnsK9p7DCQmm9U3O+GTUBy1/7lAEcDAFXgYYUBi/Z1aphMK0O8
         KfQfsgxBg/4lZyR1K2BWyvYmPgdtp2DGId/6bQMS15BIvrJnHIZvinBoOWX0fvlm6G35
         mFqg==
X-Gm-Message-State: AOAM5324SdkD5H7s7eg7+OzMO7Gg152lw5sj0jFFbewPcldtLFLIXhHi
	hxgOOpZigMGOtWZSmT7i8qfZOqv77uzB3R6iOT3GSSXHu1RA29YBGwOUrEtguuQqhEIkf4b+K/j
	gnmKh0LV+QvPAvSmyIkVxBlc=
X-Received: by 2002:a05:6000:10cf:: with SMTP id b15mr28156921wrx.70.1643874119532;
        Wed, 02 Feb 2022 23:41:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwInkGYx0bCKYBNdkDDYX+ptQNyAD6vMUiS8CqzI/xYfseOfTNCURA5lpsX4JtSbcPIAvyzjw==
X-Received: by 2002:a05:6000:10cf:: with SMTP id b15mr28156886wrx.70.1643874119363;
        Wed, 02 Feb 2022 23:41:59 -0800 (PST)
Received: from [192.168.0.80] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id t18sm19832712wri.34.2022.02.02.23.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 23:41:58 -0800 (PST)
Message-ID: <1d549a00-b9f5-d60f-2d5b-798e92139f86@canonical.com>
Date: Thu, 3 Feb 2022 08:41:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] HPE BMC GXP SUPPORT
Content-Language: en-US
To: nick.hawkins@hpe.com, verdun@hpe.com
List-Id: <soc.lore.kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Corey Minyard <minyard@acm.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, Hao Fang <fanghao11@huawei.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Wang Kefeng <wangkefeng.wang@huawei.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <nick.hawkins@hpe.com>
 <20220202165315.18282-1-nick.hawkins@hpe.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220202165315.18282-1-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/02/2022 17:52, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> GXP is the name of the HPE SoC.
> This SoC is used to implement BMC features of HPE servers
> (all ProLiant, Synergy, and many Apollo, and Superdome machines)
> It does support many features including:
> 	ARMv7 architecture, and it is based on a Cortex A9 core
> 	Use an AXI bus to which
> 		a memory controller is attached, as well as
>                  multiple SPI interfaces to connect boot flash,
>                  and ROM flash, a 10/100/1000 Mac engine which
>                  supports SGMII (2 ports) and RMII
> 		Multiple I2C engines to drive connectivity with a host infrastructure
> 		A video engine which support VGA and DP, as well as
>                  an hardware video encoder
> 		Multiple PCIe ports
> 		A PECI interface, and LPC eSPI
> 		Multiple UART for debug purpose, and Virtual UART for host connectivity
> 		A GPIO engine
> This Patch Includes:
> 	Documentation for device tree bindings
> 	Device Tree Bindings
> 	GXP Timer Support
> 	GXP Architecture Support
> 

1. Please version your patchses and document the changes under ---.

2. With your v1 I responded what has to be separate patch. This was
totally ignored here, so no. You have to follow this.

3. Please run checkpatch and be sure there are no warnings.

4. Bindings in dtschema, not in text.

Best regards,
Krzysztof

Best regards,
Krzysztof
