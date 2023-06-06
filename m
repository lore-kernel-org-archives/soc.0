Return-Path: <SRS0=W2tu=B2=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB14C7EE2A
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 19:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8DA5C4339B; Tue,  6 Jun 2023 19:15:33 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9FF79C433D2
	for <soc@kernel.org>; Tue,  6 Jun 2023 19:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9FF79C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-558cf19575dso1863713eaf.3
        for <soc@kernel.org>; Tue, 06 Jun 2023 12:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686078931; x=1688670931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yuPtWZvp2QpKXhFtUsbMkf/CJ0DL6f0lTisyz0LpYrs=;
        b=Nn/LfaLNGwNoKYxkJX2B0EavoB/Fj4u7tESdR2M762voP98S8mYso1BX1oK0+panaH
         xiAQei3U7qdBZTlnRjxJDZIVA9kUBffKCGg37Eu+Ew8XRQfnslXHT9iYnsWMq3y83Z9G
         l3bTr7rnDN9/cN+3jqn7N8wTj//AuEpTazVz5C2os7U25mmZxkhIugjXryY83KHosWsU
         HV0qPyZal7C9QEo0ixbIYZqxkKlwhsLr1k9n7NEkA70aoblIQDttPu40keCYqAr34uJk
         dfB/vj6ZIxfZ6yP+MmETaoJSRvaTWRsXpCoaHU3RdcowMMnIzDGBzLc8gS5tEAn1DVZB
         DbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686078931; x=1688670931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuPtWZvp2QpKXhFtUsbMkf/CJ0DL6f0lTisyz0LpYrs=;
        b=KOa0PD6XlUHSq5kl1EdtJU2sXbze3sB2JNhoSGAebJPrnkpoFG2fxfaEudXj3ZVK6T
         vsvQwYpZvu2jXOThfAzK3QwQD7A9AG1ZIuStJzEefKEbVjXyeo9IwCrUH4qobWdcTEVp
         JaaEwK/L7/fITuLDgkNCheCN3ZmJDQKHmZ94OOb8AnpW5mTmKLSUpH4TcbvJViwqUI92
         FnpknU83HVsdVHwOkAitdxrIdn0Kqs2ACRHdDTJ6CwKEkgiROYm5uO0RHYYj1dAXaley
         UVA8jyZQXaBc0wkLUpVp0K0iG+FEmVvlJ0MZqxpupgKzGEWDJtZeqrzwftgCefHMlfKS
         F1hw==
X-Gm-Message-State: AC+VfDwSxGymuUkJ2lk9o7ZPs4uoXtldS0vkjU9wGNq/c7ytMKWW/AR3
	Zk1GwbyyZsWv/Qp1ndnDDc4=
X-Google-Smtp-Source: ACHHUZ6OW8K0CTNvK5+CMzRzg6se3je+OeCfn5sg+JmCERCtPTBR5ROXGar/DNfnHt46cUaQNBUNNw==
X-Received: by 2002:a05:6359:61b:b0:127:a734:9d0 with SMTP id eh27-20020a056359061b00b00127a73409d0mr640197rwb.30.1686078931445;
        Tue, 06 Jun 2023 12:15:31 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f59e:5ad5:28cc:2003])
        by smtp.gmail.com with ESMTPSA id s1-20020a17090a13c100b00258f9597e9fsm6723827pjf.45.2023.06.06.12.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 12:15:30 -0700 (PDT)
Date: Tue, 6 Jun 2023 12:15:28 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>, soc@kernel.org,
	linux-omap@vger.kernel.org, linux-input@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] Input: ads7846 - Fix usage of match data
Message-ID: <ZH+F0LtkqPoLg4mm@google.com>
References: <20230606191304.3804174-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606191304.3804174-1-linus.walleij@linaro.org>

On Tue, Jun 06, 2023 at 09:13:04PM +0200, Linus Walleij wrote:
> device_get_match_data() returns the match data directly, fix
> this up and fix the probe crash.
> 
> Fixes: 767d83361aaa ("Input: ads7846 - Convert to use software nodes")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
> This patch needs to be applied to the SoC tree where the
> offending patch is residing.
> ---
>  drivers/input/touchscreen/ads7846.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
> index 40eb27f1b23f..fe6fe8acd8a6 100644
> --- a/drivers/input/touchscreen/ads7846.c
> +++ b/drivers/input/touchscreen/ads7846.c
> @@ -1117,20 +1117,13 @@ MODULE_DEVICE_TABLE(of, ads7846_dt_ids);
>  static const struct ads7846_platform_data *ads7846_get_props(struct device *dev)
>  {
>  	struct ads7846_platform_data *pdata;
> -	const struct platform_device_id *pdev_id;
>  	u32 value;
>  
> -	pdev_id = device_get_match_data(dev);
> -	if (!pdev_id) {
> -		dev_err(dev, "Unknown device model\n");
> -		return ERR_PTR(-EINVAL);
> -	}
> -
>  	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>  	if (!pdata)
>  		return ERR_PTR(-ENOMEM);
>  
> -	pdata->model = (unsigned long)pdev_id->driver_data;
> +	pdata->model = (u32)device_get_match_data(dev);
>  
>  	device_property_read_u16(dev, "ti,vref-delay-usecs",
>  				 &pdata->vref_delay_usecs);
> -- 
> 2.34.1
> 

-- 
Dmitry
