Return-Path: <SRS0=zugq=3F=gmail.com=groeck7@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB1CC4332F
	for <soc@archiver.kernel.org>; Sat,  5 Nov 2022 14:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0818EC433D7; Sat,  5 Nov 2022 14:05:59 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD6D4C433C1;
	Sat,  5 Nov 2022 14:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BD6D4C433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-13d9a3bb27aso7565249fac.11;
        Sat, 05 Nov 2022 07:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Bw328y2bVSAsU6M+b6Cqflfx2UQ2J4p0Zb/NQFKXJ8=;
        b=S34IWwxCPFjK3gTNiS+7/ui94MFPB5mi1t+pWqvcgwfcOdSeFSwiAKrBJOOJKwh5C0
         arTFR38OjfsJdLcM6Rv94GH56yEZ9TRfxQYQgc0CEi3mC8C3fm/hiuhP7eQQjAOdmJ6M
         +kbMnKKDMtOl95UhO+SB60NCGX6YoGz8W8rEjQrLFaUvXckvd+LkIfkXFcq3bSb4kic0
         lUwdQDdQka484e6pkgx9eegVIiJjBDtlnoExNz1rMPoI6POBy9pWo9MbV9aL2UEzBiHM
         OuNrDHvwACgi4w9PDw+RiuaKezVnIu32dR61YJfsjg2HLOHK7ogeRkAXw0QUAutaBBHZ
         P4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Bw328y2bVSAsU6M+b6Cqflfx2UQ2J4p0Zb/NQFKXJ8=;
        b=W0qtFbClvH99FGrbE5SkUEgOxOFA+ptp+FelzctacIextevvY37LXxgm5MF6P+ziFQ
         dktGuPio1HfwA6rIY8nFjU/L1F+lSZYxgz6b9TNEPdpTP7n595gFDqs/Bgnf826D+wD8
         xwsXjLcbSBmaVRjLCOlqIy9TH9KD0nTsVH8nP3A0dP65SkEqYWsK2AO6m7P2Xw+39t8j
         0jPJwr2LpeIYBL+S+Xw0GTUpjQDNerY/Ji1qp1AQlZ0WoqMfbloArV4dm+TNyJHYDRw0
         YqPvsLS/F1MMYStl/tE0Z3W6l7gC7oFYqnIeMn90IC9L13f1Hgq/RxN1pywDscNwaIck
         XLRw==
X-Gm-Message-State: ACrzQf2Ov8jyZByZtDrS266yVWtWrzNAKDkx2H5+g0xORUXzBuem/arh
	J6uHed7Ux0G6A5iCM7gVl0k=
X-Google-Smtp-Source: AMsMyM4O2xKxqglPQbMZ6j5scgQkj5CrqrKDHWc9w3V01Uf2BG/n3UTYNm7zcvvx8yCZB7S0ibZ2sA==
X-Received: by 2002:a05:6870:7682:b0:13b:ba8f:413d with SMTP id dx2-20020a056870768200b0013bba8f413dmr353354oab.236.1667657156815;
        Sat, 05 Nov 2022 07:05:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o198-20020a4a2ccf000000b004968311a31asm625577ooo.39.2022.11.05.07.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 07:05:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 5 Nov 2022 07:05:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Steven Rostedt <rostedt@goodmis.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Anna-Maria Gleixner <anna-maria@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Russell King <linux@armlinux.org.uk>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4a 02/38] ARM: spear: Do not use timer namespace for
 timer_shutdown() function
Message-ID: <20221105140553.GC1606271@roeck-us.net>
References: <20221105060024.598488967@goodmis.org>
 <20221105060155.228348078@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105060155.228348078@goodmis.org>

On Sat, Nov 05, 2022 at 02:00:26AM -0400, Steven Rostedt wrote:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> A new "shutdown" timer state is being added to the generic timer code. One
> of the functions to change the timer into the state is called
> "timer_shutdown()". This means that there can not be other functions
> called "timer_shutdown()" as the timer code owns the "timer_*" name space.
> 
> Rename timer_shutdown() to evt_timer_shutdown() to avoid this conflict.
> 
> Cc: Viresh Kumar <vireshk@kernel.org>
> Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: soc@kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Nitpick: I would have called it spear_timer_shutdown(). POV, so

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/arm/mach-spear/time.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-spear/time.c b/arch/arm/mach-spear/time.c
> index e979e2197f8e..9629b8fae85f 100644
> --- a/arch/arm/mach-spear/time.c
> +++ b/arch/arm/mach-spear/time.c
> @@ -90,7 +90,7 @@ static void __init spear_clocksource_init(void)
>  		200, 16, clocksource_mmio_readw_up);
>  }
>  
> -static inline void timer_shutdown(struct clock_event_device *evt)
> +static inline void evt_timer_shutdown(struct clock_event_device *evt)
>  {
>  	u16 val = readw(gpt_base + CR(CLKEVT));
>  
> @@ -101,7 +101,7 @@ static inline void timer_shutdown(struct clock_event_device *evt)
>  
>  static int spear_shutdown(struct clock_event_device *evt)
>  {
> -	timer_shutdown(evt);
> +	evt_timer_shutdown(evt);
>  
>  	return 0;
>  }
> @@ -111,7 +111,7 @@ static int spear_set_oneshot(struct clock_event_device *evt)
>  	u16 val;
>  
>  	/* stop the timer */
> -	timer_shutdown(evt);
> +	evt_timer_shutdown(evt);
>  
>  	val = readw(gpt_base + CR(CLKEVT));
>  	val |= CTRL_ONE_SHOT;
> @@ -126,7 +126,7 @@ static int spear_set_periodic(struct clock_event_device *evt)
>  	u16 val;
>  
>  	/* stop the timer */
> -	timer_shutdown(evt);
> +	evt_timer_shutdown(evt);
>  
>  	period = clk_get_rate(gpt_clk) / HZ;
>  	period >>= CTRL_PRESCALER16;
> -- 
> 2.35.1
