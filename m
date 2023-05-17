Return-Path: <SRS0=uglC=BG=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E52EC77B7A
	for <soc@archiver.kernel.org>; Wed, 17 May 2023 04:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28777C433A0; Wed, 17 May 2023 04:34:51 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CBBDAC433EF
	for <soc@kernel.org>; Wed, 17 May 2023 04:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CBBDAC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6439df6c268so188307b3a.0
        for <soc@kernel.org>; Tue, 16 May 2023 21:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684298088; x=1686890088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tG1kNE7UYC4wkLWo37BI0qTN7B7iDGV7Ktvk8Nl+rtI=;
        b=MuMlnckAVwMdyNsDsScgi01FUkHiJREx6ygDmlCSAYvvmS3ShaK7bjW6fknneksRan
         Gn8kVbl8VuR04QDcjcOn2IZnJGmGvyU3zvW/c88xIqeULitJJZH1zckUbCGEjZ6OnzNY
         SccIUkQ0mjHOVZhY+pO8e52TMG5owPuhTKBYAAyxQO2Hbyv+n98NDE5vZ3hvvaIkGy3E
         fQ8+2G4hADpDPjI5VuCaB0gvDfMtVanZtS32ty7ZxZB+attc6uabA3/RAs43VTmhYee8
         CIrHZkp1AmUnfoPkzvz5wo1ccJnWqrkvU+2qdLasFp/mal9wglF54LZn881g095OZqmQ
         xDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684298088; x=1686890088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tG1kNE7UYC4wkLWo37BI0qTN7B7iDGV7Ktvk8Nl+rtI=;
        b=RAaetWmj3Mncj8H40quvDdp3Ya1A9B6ghuTlzCxIpC93axAwpY/HU+rmi924SwFjMJ
         BBwm1uVbblgpIS2MxKaVQ3YQFe6pWZr4rT8GADAtEH+hZhA8sQYrJfg0QSDWmVpToJXM
         xD+o+ksPO2YMwTQCzLJM6r9lHABYSAENxJ2Es51rDXDAClPgGAdrI9S/JYxOHdWLMe+E
         fRf0EA52VIKfp466iYfFxgKGDiuMeWxzxRqTEPip/N5EmktjdSIFTh0NG2n1RlYNS/8Y
         XqyZhrnFv00/jv5Gx/YoNlckxo2twZYiwQjDq8uZCgGwyF27n+5Ph+/XprhwVaudwZ6K
         yP4Q==
X-Gm-Message-State: AC+VfDw7qtSDzc9P3g5okMYHifTCSazOgN73ajobm+Hpwt8V/AXoNfDT
	i2Eb9nUJuYmS3bQF6qGn80zLRw==
X-Google-Smtp-Source: ACHHUZ7ZntCzPC6Kae1pDbO6DYSSci6YTuhSOAjEZpHtW1xnkNQFCJpFTJqzEf+yQY02x5W3U6f6sw==
X-Received: by 2002:a05:6a00:c83:b0:64a:5cde:3a8c with SMTP id a3-20020a056a000c8300b0064a5cde3a8cmr24779255pfv.28.1684298088145;
        Tue, 16 May 2023 21:34:48 -0700 (PDT)
Received: from localhost ([122.172.82.60])
        by smtp.gmail.com with ESMTPSA id k18-20020aa792d2000000b0064cca73d911sm1328858pfa.103.2023.05.16.21.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 21:34:47 -0700 (PDT)
Date: Wed, 17 May 2023 10:04:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 12/13] ARM: spear: include "pl080.h" for
 pl080_get_signal() prototype
Message-ID: <20230517043445.qhc6ebfq4pwvgiqh@vireshk-i7>
References: <20230516153109.514251-1-arnd@kernel.org>
 <20230516153109.514251-13-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230516153109.514251-13-arnd@kernel.org>

On 16-05-23, 17:31, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> pl080_get_signal() and pl080_put_signal() are declared in pl080.h
> and defined in pl080.c, but this file is missing an include
> of the header:
> 
> arch/arm/mach-spear/pl080.c:27:5: error: no previous prototype for 'pl080_get_signal'
> arch/arm/mach-spear/pl080.c:62:6: error: no previous prototype for 'pl080_put_signal'
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-spear/pl080.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-spear/pl080.c b/arch/arm/mach-spear/pl080.c
> index d6b8627d2544..47243a8153d0 100644
> --- a/arch/arm/mach-spear/pl080.c
> +++ b/arch/arm/mach-spear/pl080.c
> @@ -16,6 +16,7 @@
>  #include <linux/spinlock_types.h>
>  #include "spear.h"
>  #include "misc_regs.h"
> +#include "pl080.h"
>  
>  static spinlock_t lock = __SPIN_LOCK_UNLOCKED(x);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
