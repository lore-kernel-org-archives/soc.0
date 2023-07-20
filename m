Return-Path: <SRS0=a1zb=DG=gmail.com=groeck7@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC27C04FDF
	for <soc@archiver.kernel.org>; Thu, 20 Jul 2023 13:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60C09C433CD; Thu, 20 Jul 2023 13:30:23 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D2CFC433C7;
	Thu, 20 Jul 2023 13:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4D2CFC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b8b4749013so5635595ad.2;
        Thu, 20 Jul 2023 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689859821; x=1690464621;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qIe8rMdwGK8O6waPW6ElMhYZtqXBgjIAped1KS+Lxj0=;
        b=E36Ey4hpLP1aGERgJzQAv5oQWbjP2dfI/yJ9QSqsCcAZUQqYH2EJuPmluxVpniz94+
         SqRDS4pEtomXHfRXODYYhAlZIxAatRHID9D88YI+tj+w3vKM5JieqRypSlSHOTbf2v95
         PUlca0W45r887uApCqi/zn/yh3GyTCCrBBW1XguZKYFarRPPHvkGdKJALW7+s9TgEir3
         pVPeDdLYxOZSMJ8v3iGIKvATJZHgcVErXIREn7/pOR3ivfvJWVHJWWTf1p+PnK9L0sBz
         4nG3H7SIhmhoYiEqtjnis5Ppnyac+F2VaQ2UY7v0ygr32czvJ80e2mlstFNoj9axpszx
         inAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689859821; x=1690464621;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIe8rMdwGK8O6waPW6ElMhYZtqXBgjIAped1KS+Lxj0=;
        b=aaESWy76KbFwS/jxircsscw+4hFOL7K6tWepigpvowBKs15tC85v3gFH2SPSb+HUHV
         BIdlDzcND+tf9qWKRyeCu+v2djvxv0xlpv5fiwEtmJMbd1Kx9bM9PRkZ4xoEgGwWgT70
         olHzD0waHXCCG40amfjqvcMWNWXJwsxiXqi8SOW5SMnUOUaieIUfmRoP1jNYUarAnarf
         AniGJvY9RAbGl6bQe3G4LhVm29KIDTdywfTu7H5ISApaqmflcN5cFjDo94/SdrZOrnBi
         V8tYA9CgOylIkhDVJDj6ou4Yus++mfrbS+x7IM0QdB8P3nzeJEbLZqZNQ48OcHivmh7M
         5mGg==
X-Gm-Message-State: ABy/qLYFOqvcEuHyD2ORlbSHSznE89K/Y7yoZvXs0GRywy07203iUFrp
	5T7qhcR7/llA7mVN6U5NxrI=
X-Google-Smtp-Source: APBJJlFh1AyFX2+11T9yyn39CZ9ejJo7irpyerH5jDd4rJJqhGrNwsFMVrOCBzL5cXWCBiVM2usEnA==
X-Received: by 2002:a17:903:191:b0:1b8:9b5e:65c8 with SMTP id z17-20020a170903019100b001b89b5e65c8mr25796578plg.4.1689859821611;
        Thu, 20 Jul 2023 06:30:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d12-20020a170902728c00b001b86deba2f9sm1302975pll.284.2023.07.20.06.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 06:30:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1d8cf4f5-3004-3af1-2735-03fde48d69c7@roeck-us.net>
Date: Thu, 20 Jul 2023 06:30:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 32/42] wdt: ts72xx: add DT support for ts72xx
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: nikita.shubin@maquefel.me, Hartley Sweeten
 <hsweeten@visionengravers.com>, Lennert Buytenhek <kernel@wantstofly.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Sebastian Reichel
 <sre@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andy Shevchenko <andy@kernel.org>,
 Michael Peters <mpeters@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org, alsa-devel@alsa-project.org
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-32-3d63a5f1103e@maquefel.me>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230605-ep93xx-v3-32-3d63a5f1103e@maquefel.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/23 04:29, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> Add OF ID match table.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/ts72xx_wdt.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/watchdog/ts72xx_wdt.c b/drivers/watchdog/ts72xx_wdt.c
> index 3d57670befe1..ac709dc31a65 100644
> --- a/drivers/watchdog/ts72xx_wdt.c
> +++ b/drivers/watchdog/ts72xx_wdt.c
> @@ -12,6 +12,7 @@
>    */
>   
>   #include <linux/platform_device.h>
> +#include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/watchdog.h>
>   #include <linux/io.h>
> @@ -160,10 +161,17 @@ static int ts72xx_wdt_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static const struct of_device_id ts72xx_wdt_of_ids[] = {
> +	{ .compatible = "technologic,ts7200-wdt" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ts72xx_wdt_of_ids);
> +
>   static struct platform_driver ts72xx_wdt_driver = {
>   	.probe		= ts72xx_wdt_probe,
>   	.driver		= {
>   		.name	= "ts72xx-wdt",
> +		.of_match_table = ts72xx_wdt_of_ids,
>   	},
>   };
>   
> 

