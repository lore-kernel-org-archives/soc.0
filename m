Return-Path: <SRS0=pHZj=W7=gmail.com=fancer.lancer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC1FC433EF
	for <soc@archiver.kernel.org>; Fri, 24 Jun 2022 21:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5215CC3411C; Fri, 24 Jun 2022 21:12:37 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A1242C341C0
	for <soc@kernel.org>; Fri, 24 Jun 2022 21:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A1242C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id s14so4138209ljs.3
        for <soc@kernel.org>; Fri, 24 Jun 2022 14:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lTrnV2rYrJ8o1ODTyvarmJaUuIaEeYOS8mDXp4Te+J8=;
        b=gqdFAOJKjz24yjspPoQKSsNC0qU2rR1PtdJr0cZoHm+rxal4DzzoHFC6cvpxNm/Sp2
         eUtx2k4m2GCfJfnBLdSuC9NOpcU9veEdmoe7yVdh0B+NAxR07VzEaz7ZM9j8F3OPgEHc
         Bscm4zF88tcIMFPucw+edYQorIrsGltV2jpXXjuJNEqkZpy/B2Tjey6+B8PromDgr7jC
         SUte450LzO87e6yP9aJSrkQdLavayq8S5e2Z6seL5cZsbr5h+HJQiAsdGtKPAGzDHhUX
         parFNLrRFCNcSTVvxcBwOXfojdOpe3urd7pORk/iqtpIUdpgy3pnE4DZDl7iRldWS8CJ
         zIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lTrnV2rYrJ8o1ODTyvarmJaUuIaEeYOS8mDXp4Te+J8=;
        b=kE/Aluvh8pssw4b6peGOERPF/MDeTG2cnBfSnMMET+iwNjkajMMPaDITshCe/lUQiq
         1LdGgzhOodFdt/Ch/UaTHc4aXrSTA7cgW4aSyLU6Zf4zOWthbMojT3DS6SH0eT+LfY7C
         oxZHxv+wr/wBzqfFojgAFsGrc/DKaKeiKatMbKpE4p0SEgu6Gifby+VfV1w/ma2wnr9j
         M/adRdFmzqAHBkfu+0wPQlcu1KFwHrkOnUfnBSYBZiKf32wDEFvOKEy7yg1+/xf+eYvS
         wA5x2l311NOdnDke6PaKPGViUzLQsuYmRU7rg25SfeavM0V87TQ44dMFkdqtOzBxTKP2
         OJiA==
X-Gm-Message-State: AJIora/Ix0dT/1nzz2nEgFPMvz7GfzCKxBQuHUbNKpSi3lMWSWFC1ajD
	iau38mvl9Ng1XNrpFNup+aQ=
X-Google-Smtp-Source: AGRyM1uqvHm9gGmDsqawX0ijWysHczgVnJIJmqxEsPP+wDSnmUpOkwsdpsLYi44eFEUtxbqnjkbc+A==
X-Received: by 2002:a2e:87c7:0:b0:25a:9605:a2b8 with SMTP id v7-20020a2e87c7000000b0025a9605a2b8mr439209ljj.148.1656105154752;
        Fri, 24 Jun 2022 14:12:34 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
        by smtp.gmail.com with ESMTPSA id p28-20020a056512139c00b00478ebc6be69sm517368lfa.261.2022.06.24.14.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 14:12:30 -0700 (PDT)
Date: Sat, 25 Jun 2022 00:12:27 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Philipp Zabel <p.zabel@pengutronix.de>,
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
	Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
	soc@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2 1/2] bus: bt1-apb: Don't print error on
 -EPROBE_DEFER
Message-ID: <20220624211227.667ejjix3gboj6mt@mobilestation>
References: <20220624211015.7351-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624211015.7351-1-Sergey.Semin@baikalelectronics.ru>

Oops, wrong version ID. I'll resend it.

-Sergey

On Sat, Jun 25, 2022 at 12:10:13AM +0300, Serge Semin wrote:
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
