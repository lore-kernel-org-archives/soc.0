Return-Path: <SRS0=pai9=2V=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0CDC433FE
	for <soc@archiver.kernel.org>; Thu, 20 Oct 2022 04:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9F31C433C1; Thu, 20 Oct 2022 04:36:22 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA0BBC433B5
	for <soc@kernel.org>; Thu, 20 Oct 2022 04:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DA0BBC433B5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f54.google.com with SMTP id x31-20020a17090a38a200b0020d2afec803so1936930pjb.2
        for <soc@kernel.org>; Wed, 19 Oct 2022 21:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o17RQhlYUBZsMUmpb8StxU8A9Z3KXwBN0N+ZYEngB1E=;
        b=VtPEHdzhQMEWZw3owOIfjqIu3ZJVH0Wzl/cMEq++H/LvWPcPqd3qbMf1ACg8pFU0tM
         /PJH1dDYxvocWs01HDEzzdsES93RJEa6FiXbRbX6/lHhoZiWrQRx1TLkPgOJnCvVZMPI
         G9XADsRhdhLo7T228yY7PXtoXi7VEWJayJncCQ0r7YuARykYmWK/uPHizwuRYusubjnr
         i/yP6fQtmIwa4Vs6mLxh11CgN2vmXNouV8vq5shWcixAhLiMMsjyCGAYtvGa6LLlY8cr
         WCLyxAXusmezvVr6Nt6lsRhAra18fVI57dFv6RNB0uuxlAQRR14BPtgu91/nM0Oiw8pF
         Fxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o17RQhlYUBZsMUmpb8StxU8A9Z3KXwBN0N+ZYEngB1E=;
        b=a/7Rz4wqun1xaSSiKdGjMjPq6IvcLlnqvfl8J9LZ0XZ+DK9pIf2Y+o2xnPf1bI6HGM
         gixmXyL+zZw7isOiq/V9KtEuXZns0RlYWpkhMZWtVVDw3MTEz9GKeNGWOYgYImQwG3gQ
         /tRuhjvm+DW4k9zxxyz5hBR02LEZ+OOmxyrsqVKfR4xGmVxfwDEh8bJ+6JtOgviVTB4+
         JQflzsMDGtUO7IUj3c8RsA0vnhlB2EQphkJenA+mwJ6FJrKCccJW848nvPPSCbw/Czlk
         pZRvSCP3W7IQqXXXtedQvdfFXNKVThDVKzy4ozMjZ7a4DR91WpMZ9SQSVNRhCLXXY2Ay
         ZENw==
X-Gm-Message-State: ACrzQf2gcab3KLktWFfGcnxUSJHuPvSkcKNutVhKimA0qwGBTVncklOs
	k+QHSThwZx8r/WHwxOwOEeZP3A==
X-Google-Smtp-Source: AMsMyM6JMa9WLiFbvoVx4vYwYCZzPiim1UptyMJUVWSD81py6SUfnrjSxJDxjmTh1qKJOoEy59NARg==
X-Received: by 2002:a17:90b:691:b0:20d:6171:c94 with SMTP id m17-20020a17090b069100b0020d61710c94mr47924799pjz.25.1666240580413;
        Wed, 19 Oct 2022 21:36:20 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id a29-20020aa795bd000000b0056234327070sm12602800pfk.95.2022.10.19.21.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 21:36:10 -0700 (PDT)
Date: Thu, 20 Oct 2022 10:06:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 4/6] clk: spear: Fix CLCD clock definition on SPEAr600
Message-ID: <20221020043605.hyytaxyth2j5xnag@vireshk-i7>
References: <20221019133208.319626-1-kory.maincent@bootlin.com>
 <20221019133208.319626-5-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221019133208.319626-5-kory.maincent@bootlin.com>

On 19-10-22, 15:32, Köry Maincent wrote:
> From: Kory Maincent <kory.maincent@bootlin.com>
> 
> There is no SPEAr600 device named "clcd". Instead, the description of the
> CLCD (color liquid crystal display controller) name is "fc200000.clcd", so
> we should associate the CLCD gateable clock to this device name.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  drivers/clk/spear/spear6xx_clock.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spear/spear6xx_clock.c b/drivers/clk/spear/spear6xx_clock.c
> index c192a9141b86..ee0ed89f2954 100644
> --- a/drivers/clk/spear/spear6xx_clock.c
> +++ b/drivers/clk/spear/spear6xx_clock.c
> @@ -207,7 +207,7 @@ void __init spear6xx_clk_init(void __iomem *misc_base)
>  
>  	clk = clk_register_gate(NULL, "clcd_clk", "clcd_mclk", 0,
>  			PERIP1_CLK_ENB, CLCD_CLK_ENB, 0, &_lock);
> -	clk_register_clkdev(clk, NULL, "clcd");
> +	clk_register_clkdev(clk, NULL, "fc200000.clcd");
>  
>  	/* gpt clocks */
>  	clk = clk_register_gpt("gpt0_1_syn_clk", "pll1_clk", 0, PRSC0_CLK_CFG,

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
