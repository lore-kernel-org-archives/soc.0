Return-Path: <SRS0=ZqaU=WX=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11593C433EF
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 09:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D168EC3411C; Thu, 16 Jun 2022 09:52:00 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8F6EC34114
	for <soc@kernel.org>; Thu, 16 Jun 2022 09:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8F6EC34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f45.google.com with SMTP id 73-20020a17090a0fcf00b001eaee69f600so1006512pjz.1
        for <soc@kernel.org>; Thu, 16 Jun 2022 02:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Pd3vKUxuz7Neq/KsDVniIvd+pYB4Tm3B3eTO5pzeGQU=;
        b=SlDq10xywGLpgTKhUH0vz5t7ob9J/Q3FoEn6Lu7EjDpni4O1kOmB4nX5w3WdaUUyh3
         aoqxroMy9K/NM687xue8G45rCtWmGAuUpgD5q3WU6Gqf18cjQCH+jAlMFGQBCY3kFZOR
         DNe5Udq2r5+3GxFp/qj/D9JqEqITvcfM1QNgWvE6i3odZTDGHuJyS7LQWVNAXl46MxPT
         Do0fYf5iftTJROvVTe1ykm/uDxCM4pw4CyTXmBr+A5DwTq15vkrYQjgkoddlss2HpuCY
         xCg+vddXZi2zhDJX7Fo9fCBY3HHKiVwA8W144rOs+BCT7UZa5hvFeUnCDLd54YOY9+e+
         TMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Pd3vKUxuz7Neq/KsDVniIvd+pYB4Tm3B3eTO5pzeGQU=;
        b=fzMwfrYY5QSblErysGCMGxUy+A18iOfR2EvNfqiGLXm45+pIOnjwI12nizg9fq4xXN
         X7zASo8FlxYKATZBYBvAj/dyEE6p9hHkS9c7JSHdX5oipC+q+EyY1q65NvLOi5x8TquQ
         a+P0xdLCGoqMF2h4ArqcvW3CZU8HDlINO5ZwmtQr5jVAzkxEBQHWpz09MH6X8EQhehzm
         pwwMG+qlKVYWRxxcg9di7HXmemDKW87BTa5R4GR00lZ4HiCj4RQk5BZul8V4+0oKNUr2
         dR7w3VySipBuNg0MIk3pWWQstRMEG5jRbVoSvn2iLCSgpktJsW1pJ1sNKJomQNjP9TjV
         dKtA==
X-Gm-Message-State: AJIora+imDIiGxf1M/QtMLsLOpi1RE4rLkeIhsmV1F07CaGUYEmEjoUZ
	yva7207iIePbwMt9eVSXZM8dGQ==
X-Google-Smtp-Source: AGRyM1uhUab8hspyAC4ENwVpVPnptGHEppx2G/Up3Tvw1+Ro/aUeS1M2CUAGVRLeVMLEvV73bMO7kA==
X-Received: by 2002:a17:903:1c5:b0:167:71bd:462f with SMTP id e5-20020a17090301c500b0016771bd462fmr4034415plh.65.1655373119282;
        Thu, 16 Jun 2022 02:51:59 -0700 (PDT)
Received: from localhost ([122.162.234.2])
        by smtp.gmail.com with ESMTPSA id g17-20020a639f11000000b004085adf1372sm1250564pge.77.2022.06.16.02.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 02:51:58 -0700 (PDT)
Date: Thu, 16 Jun 2022 15:21:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Liang He <windhl@126.com>
List-Id: <soc.lore.kernel.org>
Cc: vireshk@kernel.org, shiraz.linux.kernel@gmail.com, soc@kernel.org,
	linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm: mach-spear: Add missing of_node_put() in time.c
Message-ID: <20220616095156.clyiogsvrxbmyrd6@vireshk-i7>
References: <20220616093027.3984903-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616093027.3984903-1-windhl@126.com>

On 16-06-22, 17:30, Liang He wrote:
> In spear_setup_of_timer(), of_find_matching_node() will return a
> node pointer with refcount incrementd. We should use of_node_put()
> in each fail path or when it is not used anymore.
> 
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  changelog:
>  
>  v2: use goto-label patch style suggested by Viresh.
>  v1: use plain of_node_put in each fail path.
> 
>  arch/arm/mach-spear/time.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-spear/time.c b/arch/arm/mach-spear/time.c
> index d1fdb6066f7b..c7c17c0f936c 100644
> --- a/arch/arm/mach-spear/time.c
> +++ b/arch/arm/mach-spear/time.c
> @@ -218,13 +218,13 @@ void __init spear_setup_of_timer(void)
>  	irq = irq_of_parse_and_map(np, 0);
>  	if (!irq) {
>  		pr_err("%s: No irq passed for timer via DT\n", __func__);
> -		return;
> +		goto err_put_np;
>  	}
>  
>  	gpt_base = of_iomap(np, 0);
>  	if (!gpt_base) {
>  		pr_err("%s: of iomap failed\n", __func__);
> -		return;
> +		goto err_put_np;
>  	}
>  
>  	gpt_clk = clk_get_sys("gpt0", NULL);
> @@ -239,6 +239,8 @@ void __init spear_setup_of_timer(void)
>  		goto err_prepare_enable_clk;
>  	}
>  
> +	of_node_put(np);
> +
>  	spear_clockevent_init(irq);
>  	spear_clocksource_init();
>  
> @@ -248,4 +250,6 @@ void __init spear_setup_of_timer(void)
>  	clk_put(gpt_clk);
>  err_iomap:
>  	iounmap(gpt_base);
> +err_put_np:
> +	of_node_put(np);
>  }

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
