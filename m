Return-Path: <SRS0=k8p0=3K=gmail.com=groeck7@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2FEC433FE
	for <soc@archiver.kernel.org>; Thu, 10 Nov 2022 18:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BAB30C433C1; Thu, 10 Nov 2022 18:47:51 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 67490C433D7;
	Thu, 10 Nov 2022 18:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 67490C433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id d26-20020a05683018fa00b0066ab705617aso1592860otf.13;
        Thu, 10 Nov 2022 10:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=67MozYRSpJPpL2qvP40XMg8+ncMPDhHLkklopg68FPM=;
        b=DGOqQFjBHxx03rJYrbTo40AR5n6tjLUsad66QPFNAFhJ4qyC4ccQz6TyZIbUikxtLG
         dtAu3RYqPELF+BDr1a266RUcVCQG2GmNXf34zJPrHEMVfHOqbrMW+Nhx5STjjW52u2/n
         2lpVQXfEhgTX4ZKKz5zGbhficlSsnhbfTn2e97RNib89wZ6fbkhAp2f5ONcOSEXZ+tvT
         BEnqXLR4KAwT/+07paWO7bUDGEDYqgAPljDbKpL1XINYk3NqHxN9DtTajCLcgz3RjiRR
         rmmL32EY8NVO6Jn+NIFpep0UeAolqUYCM3fU4KdOIAGCR4SdrfGjyEIS4zBVkDMXN3oU
         1qDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=67MozYRSpJPpL2qvP40XMg8+ncMPDhHLkklopg68FPM=;
        b=Vjyrkv7uOxuGUQPDASlMjH57dMEp8QKFEI9IeRWk6m+OrytzkcridjMYiyXzyKEX+9
         6hJHT07lJ+FXYEYHWqwGLoUGC2WCWrKBI0JMAuMCM3rfOLDf8vTLY2FTSF72GF6HDCNF
         wlZQyZ9p9WkOd+8erBlLX3ERm+4zbGENDfWrGNUOh7Hn6x0MPecIbWMKkIuKxe14fweW
         z1Tb9pYqqeQRTcH3/9AAwU6yYu/N4+8fENS45iA0Vrg6dAncaZMSTq5SLtrXJlyysPLs
         GokjLROv5uyLzIzMHT/ab+iaS5pbWl4z1uYySrB2Z0xReKoFIXQ1vpt2MgYHRDvp8YBB
         3tjw==
X-Gm-Message-State: ACrzQf1zZVpSbwO0uPtSzti+6hvARdwTw0vqObeFbw96A5/rTjuZtRY8
	IKL1I0yljK94Po3oZT1NOxw=
X-Google-Smtp-Source: AMsMyM63cAmW6nFvVFkw1Fs/CoJiriADIHk3UOQ3Sq/5CktzIOUZsKXa3bup8iKZeMVs3LUL5N7f3Q==
X-Received: by 2002:a9d:6b90:0:b0:66c:4584:dd91 with SMTP id b16-20020a9d6b90000000b0066c4584dd91mr1891180otq.86.1668106069455;
        Thu, 10 Nov 2022 10:47:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i2-20020a4ac502000000b00480816a5b8csm74846ooq.18.2022.11.10.10.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:47:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Nov 2022 10:47:46 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Steven Rostedt <rostedt@goodmis.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Anna-Maria Gleixner <anna-maria@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Russell King <linux@armlinux.org.uk>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v6 1/6] ARM: spear: Do not use timer namespace for
 timer_shutdown() function
Message-ID: <20221110184746.GA3084458@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 10, 2022 at 01:41:02AM -0500, Steven Rostedt wrote:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> A new "shutdown" timer state is being added to the generic timer code. One
> of the functions to change the timer into the state is called
> "timer_shutdown()". This means that there can not be other functions
> called "timer_shutdown()" as the timer code owns the "timer_*" name space.
> 
> Rename timer_shutdown() to spear_timer_shutdown() to avoid this conflict.
> 
> Link: https://lkml.kernel.org/r/20221106212701.822440504@goodmis.org
> Link: https://lore.kernel.org/all/20221105060155.228348078@goodmis.org/

Looks like those links are obsolete.

Guenter

> 
> Cc: Viresh Kumar <vireshk@kernel.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Anna-Maria Gleixner <anna-maria@linutronix.de>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Julia Lawall <Julia.Lawall@inria.fr>
> Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: soc@kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  arch/arm/mach-spear/time.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-spear/time.c b/arch/arm/mach-spear/time.c
> index e979e2197f8e..5371c824786d 100644
> --- a/arch/arm/mach-spear/time.c
> +++ b/arch/arm/mach-spear/time.c
> @@ -90,7 +90,7 @@ static void __init spear_clocksource_init(void)
>  		200, 16, clocksource_mmio_readw_up);
>  }
>  
> -static inline void timer_shutdown(struct clock_event_device *evt)
> +static inline void spear_timer_shutdown(struct clock_event_device *evt)
>  {
>  	u16 val = readw(gpt_base + CR(CLKEVT));
>  
> @@ -101,7 +101,7 @@ static inline void timer_shutdown(struct clock_event_device *evt)
>  
>  static int spear_shutdown(struct clock_event_device *evt)
>  {
> -	timer_shutdown(evt);
> +	spear_timer_shutdown(evt);
>  
>  	return 0;
>  }
> @@ -111,7 +111,7 @@ static int spear_set_oneshot(struct clock_event_device *evt)
>  	u16 val;
>  
>  	/* stop the timer */
> -	timer_shutdown(evt);
> +	spear_timer_shutdown(evt);
>  
>  	val = readw(gpt_base + CR(CLKEVT));
>  	val |= CTRL_ONE_SHOT;
> @@ -126,7 +126,7 @@ static int spear_set_periodic(struct clock_event_device *evt)
>  	u16 val;
>  
>  	/* stop the timer */
> -	timer_shutdown(evt);
> +	spear_timer_shutdown(evt);
>  
>  	period = clk_get_rate(gpt_clk) / HZ;
>  	period >>= CTRL_PRESCALER16;
> -- 
> 2.35.1
