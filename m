Return-Path: <SRS0=ZqaU=WX=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C09FC433EF
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 06:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30ABBC341C0; Thu, 16 Jun 2022 06:06:09 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5DFBBC34114
	for <soc@kernel.org>; Thu, 16 Jun 2022 06:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5DFBBC34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f175.google.com with SMTP id z14so384889pgh.0
        for <soc@kernel.org>; Wed, 15 Jun 2022 23:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tFNNWBV1JwdjHL2prY8/fO/Im7Us5TFxYzhpaCO//zQ=;
        b=wTvGlVeyaYvcuomaOTVvYAp9OewZ3hUW5qJ+0r60n/Vot9b6CEqm1hQ+cc4rdV9szQ
         2vQNXNm9zAGFnYgFwkA2gWaZP7uzsNNYDSy2lIHG332A1usd/oIS9eYjgSTLDzmTVtut
         6xAVBoqkqt0Sw7YF5rC8Ciw6rOClp8lm5u2seYN6B5QX+dZ/g+ZS/4NSQA4VevYK1NDf
         Ja2FiUbjGEFpt394//5TIMECzEl8RLHR9pMHWztahRRH1/preISjHonaa8lAvsc/scBK
         DAWIL3dTz0IO7yeR4UID3hw2eGJsxDEWvwYAaUzy1GvsAJlkhdbRwCZ8CkoA6UFUd5hi
         xOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tFNNWBV1JwdjHL2prY8/fO/Im7Us5TFxYzhpaCO//zQ=;
        b=lIatdq0yb3exMwisinDL83Q2Ej4z3ns9cg/ANqfFkJujYDsa+vc4SKilEkx2bMwK+O
         ZRh6fZTUF31Z+0ZF6fIhTBNQeow/KvvJ2uOuzhdULdULbrfygPby+5au6Hzn4ODxxeu+
         42fYZiJQltnRrDE7e9rbEy7TW4E7mchGDw8pqmpRYgLhWyRx45q4AdQKqOEMGPWrVO7P
         SeORjuSkPE/S70XQy1226LOjbxFFhd9ORPifYlJWf2RnlfoqwSO+hA39UkiaXsQKdSWp
         rhGlnix1Fk6YRnbCWidFl78JR3VY3BqwJTohRQdMArgIW69fQqwrrij5x3kTN80RU4jI
         soIw==
X-Gm-Message-State: AJIora8tWCvU+vB3QAVouaSz1I/9iL3aUzGAw1b1EAI4dzqVh8UGr022
	4F2DslYegVz+rfvCAAAyQ/VT3A==
X-Google-Smtp-Source: AGRyM1t56y1brgraV4Sa61pENGIETGkOWiC7Z2PTRF71blSxFIFMKJWRHUd4QMe92IHZyNkvMjWcBQ==
X-Received: by 2002:a05:6a00:198e:b0:51c:3511:4aff with SMTP id d14-20020a056a00198e00b0051c35114affmr3268042pfl.20.1655359567572;
        Wed, 15 Jun 2022 23:06:07 -0700 (PDT)
Received: from localhost ([122.162.234.2])
        by smtp.gmail.com with ESMTPSA id fa17-20020a17090af0d100b001eae908b67dsm726639pjb.15.2022.06.15.23.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 23:06:07 -0700 (PDT)
Date: Thu, 16 Jun 2022 11:36:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Liang He <windhl@126.com>
List-Id: <soc.lore.kernel.org>
Cc: vireshk@kernel.org, shiraz.linux.kernel@gmail.com, soc@kernel.org,
	linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch: arm: mach-spear: Add missing of_node_put() in
 time.c
Message-ID: <20220616060605.jtbgai74w4f7ddyh@vireshk-i7>
References: <20220615123912.3965902-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615123912.3965902-1-windhl@126.com>

On 15-06-22, 20:39, Liang He wrote:
> In spear_setup_of_timer(), of_find_matching_node() will return a
> node pointer with refcount incrementd. We should use of_node_put()
> in each fail path or when it is not used anymore.
> 
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  arch/arm/mach-spear/time.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-spear/time.c b/arch/arm/mach-spear/time.c
> index d1fdb6066f7b..a1b6635b4ecb 100644
> --- a/arch/arm/mach-spear/time.c
> +++ b/arch/arm/mach-spear/time.c
> @@ -217,16 +217,20 @@ void __init spear_setup_of_timer(void)
>  
>  	irq = irq_of_parse_and_map(np, 0);
>  	if (!irq) {
> +		of_node_put(np);
>  		pr_err("%s: No irq passed for timer via DT\n", __func__);
>  		return;
>  	}
>  
>  	gpt_base = of_iomap(np, 0);
>  	if (!gpt_base) {
> +		of_node_put(np);
>  		pr_err("%s: of iomap failed\n", __func__);
>  		return;
>  	}
> -
> +	
> +	of_node_put(np);
> +	
>  	gpt_clk = clk_get_sys("gpt0", NULL);
>  	if (IS_ERR(gpt_clk)) {
>  		pr_err("%s:couldn't get clk for gpt\n", __func__);

Since this routine already have error labels, for consistence it would be better
to add another one "err_put_np" and use goto to that ?

-- 
viresh
