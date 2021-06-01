Return-Path: <nsaenz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FD0C4708F
	for <soc@archiver.kernel.org>; Tue,  1 Jun 2021 09:43:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 132526136E; Tue,  1 Jun 2021 09:43:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7CCF601FF;
	Tue,  1 Jun 2021 09:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622540613;
	bh=qlJI01KJ0TTGsYoAHunzAq6G5S1oyHceEVrUWUNT/Rc=;
	h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
	b=QMTmM+1Cv1EngwvVQDxzQeB4PTlN1b+zrjj0GcOuaOZ6plBGlDAJXCZOY4l92LAPf
	 Q4hmySykGYZOUHeyiQVp5BUkLdeTLZeKh9hL+fUI9ZBTnsrPXYUCWLvD8n0Q0J18LZ
	 Z/WR0AOfLwOVa+UWsmHV6k0hQ0g3AaaQEFtLwmyggNq5mAXAYQBravWKUlNj93MJry
	 HgO0GHio//TaC1xi0n8t8NYSjjeatpMad0N1V5+6c1T+ZUg1LTEhf6+KuDEuogqXXk
	 ilo9o5mhoVEy0vyeMZnfzBZboxiQRKFUhbqWftorW0cAd8IkEsLHH/lsgp6UlOOxPb
	 CobY9rCXbAZag==
Message-ID: <e61ba6f5b906fd26a61e9c79ef4dcf4792a364d7.camel@kernel.org>
Subject: Re: [PATCH 2/6] watchdog: bcm2835_wdt: consider
 system-power-controller property
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>,  Olof
 Johansson <olof@lixom.net>, soc@kernel.org, Wim Van Sebroeck
 <wim@linux-watchdog.org>,  Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
Date: Tue, 01 Jun 2021 11:43:27 +0200
In-Reply-To: <1622366775-5309-3-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
	 <1622366775-5309-3-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 2021-05-30 at 11:26 +0200, Stefan Wahren wrote:
> Until now all Raspberry Pi boards used the power off function of the SoC.
> But the Raspberry Pi 400 uses gpio-poweroff for the whole board which
> possibly cannot register the poweroff handler because the it's
> already registered by this watchdog driver. So consider the
> system-power-controller property for registering, which is already
> defined in soc/bcm/brcm,bcm2835-pm.txt .
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  drivers/watchdog/bcm2835_wdt.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
> index dec6ca0..9490717 100644
> --- a/drivers/watchdog/bcm2835_wdt.c
> +++ b/drivers/watchdog/bcm2835_wdt.c
> @@ -205,9 +205,13 @@ static int bcm2835_wdt_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> 
> -	if (pm_power_off == NULL) {
> -		pm_power_off = bcm2835_power_off;
> -		bcm2835_power_off_wdt = wdt;
> +	if (of_device_is_system_power_controller(pdev->dev.parent->of_node)) {
> +		if (!pm_power_off) {
> +			pm_power_off = bcm2835_power_off;
> +			bcm2835_power_off_wdt = wdt;
> +		} else {
> +			dev_info(dev, "Poweroff handler already present!\n");

nit: shoudln't this be a warning?

Other than that,

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Regards,
Nicolas


