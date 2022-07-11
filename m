Return-Path: <SRS0=O2Vz=XQ=gmail.com=fancer.lancer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7918C433EF
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 15:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A948EC341CA; Mon, 11 Jul 2022 15:53:40 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0163FC34115
	for <soc@kernel.org>; Mon, 11 Jul 2022 15:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0163FC34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id c15so6761248ljr.0
        for <soc@kernel.org>; Mon, 11 Jul 2022 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=85DEu1xuo9m6TpYYmG3UGJAS94hTnePhq7yS+YuyNtE=;
        b=V65HvM1rKqLT8eCjdFPbWBLPRJKLb9JlT3XSZEPP/urQZEO4bcFQd7goxwj5fxFNAX
         QxusI58KfS/8HjeD8BuCpGnZdVcwgxW8FfTv/oVqk1+WQj/5q5J8VJ6nl7BVXfX6k/lu
         wNRUM9ck+V9UT/Z2Hf9Y3MRbxgKg+XKC3+xHOHLj5DW+xpTq84FLdR2v9tCRkpLS+fBt
         3d0X1+QSzUoOJNwDlayMqCfhN+AQrP8MlmleQgz7EeBg3+0pCGSrjlH3eibUEOXO5KaF
         3P2D+vvqwPjTlSPSEb799RqqPzSq5R7sE3tNcXmRq23ekIUSV1amUYbWuke3SAP3eDsI
         XEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=85DEu1xuo9m6TpYYmG3UGJAS94hTnePhq7yS+YuyNtE=;
        b=Ht/4CPMzG+oXqz/aBOi9SY0VMIYdVCSLj19Y6oIw9tmUDP+eipTm7xkgEjPPcIJG6h
         X9RHhGFkpGgf0IqZd+Ivygb+6ECCsNHvn1EqZBHfE7j9+f/vtixyk4oOm778Fp8BXFUy
         TFWiQbCYS01IHFiIEmfzH/qmtzz8LBZLHjxEMoOrw0VfroBbKwvuJRjqLZCJzQLaAwrg
         uRQ+06XmU1afnlz9Kv8UpALHZV9onDhZP8cXxocde8CBjn3jAFQ3oi0hT8sisZ3T5D1+
         rshIcdv142QJV1uPeGFnC3sudow94cPS4uLezvNlM0ve5AcUfgNWc81IF7EMg2iJlEVG
         1fAw==
X-Gm-Message-State: AJIora87JrXwvkE4Bw2XUV4JVaVzdtq4FNzlTdL5iFyxiiH1tWMpk7F2
	eEwUFWAbFH7rd6RavQghSXY=
X-Google-Smtp-Source: AGRyM1uGsEFytWwLuoILQFiiprIrbwpKTlL6wKeQDwG/joC8wYBKrG+Puw8l4ehXLtTdXYNJ9EawYg==
X-Received: by 2002:a2e:bd89:0:b0:25a:86c8:93ca with SMTP id o9-20020a2ebd89000000b0025a86c893camr9942346ljq.419.1657554817892;
        Mon, 11 Jul 2022 08:53:37 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id a28-20020a2eb17c000000b0025d3c2e6b8dsm1779848ljm.105.2022.07.11.08.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 08:53:37 -0700 (PDT)
Date: Mon, 11 Jul 2022 18:53:35 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
	Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
	soc@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v4 1/2] bus: bt1-apb: Don't print error on
 -EPROBE_DEFER
Message-ID: <20220711155335.ltctlk66vylwcpcj@mobilestation>
References: <20220708194448.10700-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708194448.10700-1-Sergey.Semin@baikalelectronics.ru>

Hi Arnd, Philipp

Since no comments have been posted for the patches lately and the @Philipp
notes have been fixed way on v2, could you please consider merge the
patchset in through any of your repos?

-Sergey

On Fri, Jul 08, 2022 at 10:44:47PM +0300, Serge Semin wrote:
> The Baikal-T1 APB bus driver correctly handles the deferred probe
> situation, but still pollutes the system log with a misleading error
> message. Let's fix that by using the dev_err_probe() method to print the
> log message in case of the clocks/resets request errors.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Link: https://lore.kernel.org/lkml/20220610080103.10689-1-Sergey.Semin@baikalelectronics.ru/
> Changelog v2:
> - Use the dev_err_probe() return value as the return status of the
>   corresponding method. (@Philipp)
> 
> Link: https://lore.kernel.org/lkml/20220610104030.28399-1-Sergey.Semin@baikalelectronics.ru
> Changelog v3:
> - Just resend.
> - Rebase onto the kernel v5.19-rcX.
> 
> Link: https://lore.kernel.org/lkml/20220624211233.7529-1-Sergey.Semin@baikalelectronics.ru/
> Changelog v4:
> - Just resend.
> ---
>  drivers/bus/bt1-apb.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/bt1-apb.c b/drivers/bus/bt1-apb.c
> index b25ff941e7c7..63b1b4a76671 100644
> --- a/drivers/bus/bt1-apb.c
> +++ b/drivers/bus/bt1-apb.c
> @@ -175,10 +175,9 @@ static int bt1_apb_request_rst(struct bt1_apb *apb)
>  	int ret;
>  
>  	apb->prst = devm_reset_control_get_optional_exclusive(apb->dev, "prst");
> -	if (IS_ERR(apb->prst)) {
> -		dev_warn(apb->dev, "Couldn't get reset control line\n");
> -		return PTR_ERR(apb->prst);
> -	}
> +	if (IS_ERR(apb->prst))
> +		return dev_err_probe(apb->dev, PTR_ERR(apb->prst),
> +				     "Couldn't get reset control line\n");
>  
>  	ret = reset_control_deassert(apb->prst);
>  	if (ret)
> @@ -199,10 +198,9 @@ static int bt1_apb_request_clk(struct bt1_apb *apb)
>  	int ret;
>  
>  	apb->pclk = devm_clk_get(apb->dev, "pclk");
> -	if (IS_ERR(apb->pclk)) {
> -		dev_err(apb->dev, "Couldn't get APB clock descriptor\n");
> -		return PTR_ERR(apb->pclk);
> -	}
> +	if (IS_ERR(apb->pclk))
> +		return dev_err_probe(apb->dev, PTR_ERR(apb->pclk),
> +				     "Couldn't get APB clock descriptor\n");
>  
>  	ret = clk_prepare_enable(apb->pclk);
>  	if (ret) {
> -- 
> 2.35.1
> 
