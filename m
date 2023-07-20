Return-Path: <SRS0=bVBU=DG=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC38CEB64DA
	for <soc@archiver.kernel.org>; Thu, 20 Jul 2023 17:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 934A5C433CA; Thu, 20 Jul 2023 17:17:17 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 641CBC433C8;
	Thu, 20 Jul 2023 17:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 641CBC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-666edfc50deso756136b3a.0;
        Thu, 20 Jul 2023 10:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689873435; x=1690478235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J0uAt1FpVvgdk69DWGVo/B/WilumnjHo3ckls2wQj2c=;
        b=MK+qmNNORXwB0I5M1ECJrML+kKdViRer5kBwEH13jqFqWPrvH9qpVwD+NCq/1d018c
         dmHLfc1tu6kO/ikoIBoIR1krTQBsGZ3+q9u5v3XSZyYbOkyC67YXvHVlcxgsQWsqZgtm
         4SH2TD93EzA0VP1rFamx/Cxpixhc1xvinZAjcekhOe3ngbMxphygvDdsOviDfTtnsbmZ
         umZ7UPenNo+uzSz1TkMIjeWQt9QLKY1ACnKSlpgNnzP7MRX/LNX+PoEOdVdbQQ+Lidiy
         cOGFq119CJN/FS7RftR/9pmwUsBDbw0jIdcDb2SJf2KjVezldwj7jUFTSW8pAI6VW6KZ
         ONLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689873435; x=1690478235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0uAt1FpVvgdk69DWGVo/B/WilumnjHo3ckls2wQj2c=;
        b=dU3sW/LdSySSHnSlUogEt7JgF0bImtbj3S0zI7ct5J4ZDxZYMCGUCl3u5fVyGfviS9
         On0IIq58I42uT6nBPVPUzkjqlv7sjOjkK420AbNaQGijk/w/2LmJoRiqF3Qmu+nbHqSt
         sNwoDIUPHzUoYxqPDMesIVXytGo5xS4DLbjsCl5hzVAj/2Raga2MYxER+u4+myJREtdJ
         0SmoyFES4J5Dfaa2PjPuYzIBm+ZIEDJZfKVK3hFiVkhsrCran8lbzLzFyJUavIMCTr5e
         8zi0yRPfVaK15dlT4qYvPz0iaamsbS0mJbmVmPW0SfArc06h3FU/G4cV1jKThzUHX1GP
         FKhA==
X-Gm-Message-State: ABy/qLZB1oFbZdh7xnXdKCpVyxmcgXe1D5FHGNVDCimaLajoNz3h0L15
	YcBgvTPTVkswZQGY129tj9I=
X-Google-Smtp-Source: APBJJlEkTI4A4ZrOCc+WXlC2nBipWy2JSRmd1c5HMwU8MruA6yjpC2qz2tfZemAEl4HUzSYjKYO5qQ==
X-Received: by 2002:a05:6a00:24d1:b0:668:8ad5:778f with SMTP id d17-20020a056a0024d100b006688ad5778fmr10559001pfv.17.1689873434754;
        Thu, 20 Jul 2023 10:17:14 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e754:74d1:c368:67a2])
        by smtp.gmail.com with ESMTPSA id h18-20020a62b412000000b00682a75a50e3sm1502944pfn.17.2023.07.20.10.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 10:17:14 -0700 (PDT)
Date: Thu, 20 Jul 2023 10:17:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: nikita.shubin@maquefel.me
List-Id: <soc.lore.kernel.org>
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
	Lennert Buytenhek <kernel@wantstofly.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Lukasz Majewski <lukma@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Sebastian Reichel <sre@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Mark Brown <broonie@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michael Peters <mpeters@embeddedts.com>,
	Kris Bahnsen <kris@embeddedts.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	netdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
	linux-input@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 28/42] input: keypad: ep93xx: add DT support for
 Cirrus EP93xx
Message-ID: <ZLlsFTe2nvFw698l@google.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-28-3d63a5f1103e@maquefel.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605-ep93xx-v3-28-3d63a5f1103e@maquefel.me>

On Thu, Jul 20, 2023 at 02:29:28PM +0300, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> - drop flags, they were not used anyway
> - add OF ID match table
> - process "autorepeat", "debounce-delay-ms", prescale from device tree
> - drop platform data usage and it's header
> - keymap goes from device tree now on
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

This is awesome, thank you!

>  
>  #include <linux/bits.h>
>  #include <linux/module.h>
> +#include <linux/of.h>

Are you sure you need this? I think the only OF-specific structure that
is being used is of_device_id, which comes from mod_devicetable.h that
you include below.

Otherwise:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please feel free to merge with the rest of the series.

Thanks.

-- 
Dmitry
