Return-Path: <nathan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4245C2BD09
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 03:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5DE15C4AF0C; Mon, 15 Jul 2024 03:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70506C4AF0B;
	Mon, 15 Jul 2024 03:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721013845;
	bh=g1YDApc2ccKhd98RAf7V5ixKA8mgR5MTL5rSwC3fDPw=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=e+LFJA+qsaoKSOzHGccIX1l9cgOZzK6Sq/cmqfZCnvy0VP3upzoxmUtAGRrmeRtcJ
	 9HLxRRVKKAcyfyx30SIM2kioFCAGuKlYh9/lVs7qAuuPew85QUD+scSEa3WfxCj1t2
	 h0OZxdyW5uAHpGwLCqVyUJtpIeIfUPbHQ+lm8eh/tNinYovTmVIf17xbHtpYUzO0Pt
	 JGA3ik3K6wAsYyLEey3ZnzTQipeQAPwuS1DMXdQ2XpcwOebqny2WVx0H9XhCTIKA9H
	 DswBKMNTkoun/1yPQLi6bdW0b6KasCmK3nwwEfxk9yP7bmsQ5sbnfKJN14KiWbw+Mu
	 H1LDGZZppqLtA==
Date: Sun, 14 Jul 2024 20:24:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v12 4/8] platform: cznic: turris-omnia-mcu: Add support
 for poweroff and wakeup
Message-ID: <20240715032402.GA2968547@thelio-3990X>
References: <20240617152606.26191-1-kabel@kernel.org>
 <20240617152606.26191-5-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240617152606.26191-5-kabel@kernel.org>

Hi Marek,

On Mon, Jun 17, 2024 at 05:26:02PM +0200, Marek Behún wrote:
> Add support for true board poweroff (MCU can disable all unnecessary
> voltage regulators) and wakeup at a specified time, implemented via a
> RTC driver so that the rtcwake utility can be used to configure it.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
...
> diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
> index d95e7c83c7ae..c1e719235517 100644
> --- a/drivers/platform/cznic/Kconfig
> +++ b/drivers/platform/cznic/Kconfig
> @@ -18,10 +18,14 @@ config TURRIS_OMNIA_MCU
>  	depends on I2C
>  	select GPIOLIB
>  	select GPIOLIB_IRQCHIP
> +	select RTC_CLASS
>  	help
>  	  Say Y here to add support for the features implemented by the
>  	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.
>  	  The features include:
> +	  - board poweroff into true low power mode (with voltage regulators
> +	    disabled) and the ability to configure wake up from this mode (via
> +	    rtcwake)
>  	  - GPIO pins
>  	    - to get front button press events (the front button can be
>  	      configured either to generate press events to the CPU or to change

I am seeing the following Kconfig warning from ARCH=s390 allmodconfig:

WARNING: unmet direct dependencies detected for RTC_CLASS
  Depends on [n]: !S390 [=y]
  Selected by [m]:
  - TURRIS_OMNIA_MCU [=m] && CZNIC_PLATFORMS [=y] && (MACH_ARMADA_38X || COMPILE_TEST [=y]) && I2C [=m] && OF [=y] && WATCHDOG [=y]

because of:

menuconfig RTC_CLASS
    bool "Real Time Clock"
    default n
    depends on !S390

which appears to have ultimately come from commit 9556fb73edfc ("[S390]
Kconfig: unwanted menus for s390."). No other driver appears to
unconditionally select this (I only see it selected within
arch/*/Kconfig), so it does not look like this has come up before.
Should s390 be excluded from the COMPILE_TEST dependency?

Cheers,
Nathan

