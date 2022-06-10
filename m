Return-Path: <SRS0=qI/0=WR=gmail.com=fancer.lancer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC72C433EF
	for <soc@archiver.kernel.org>; Fri, 10 Jun 2022 09:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A571CC3411E; Fri, 10 Jun 2022 09:39:31 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C5672C3411C
	for <soc@kernel.org>; Fri, 10 Jun 2022 09:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C5672C3411C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id s6so41917757lfo.13
        for <soc@kernel.org>; Fri, 10 Jun 2022 02:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nV43jtmwHVhNIUIwHqbPqyXT6AOAMyWo/9t3uutR0Qo=;
        b=PAtECZypcteP9uwJWi2omhMCe2W0JP5ojEDBSMhWtPUuUP/W5gFWYqDgst1QrGIzrZ
         Oes9uDu6/m5HC6eqRgievAxVNYETDEdTAtXk6RP1ts2F5VWj9RVslkuah88dkD1mrsy9
         tjbWGNBxmjO9v0voDhV0bUBdcO8Tj8kvJ2slrW8onbIRu0VrhWBc8yRr0ghCEeriZ/NN
         veXTvGvDdaULdMdqMh4pzHkGz6ZnoIUneq5Vvf1VcNJPKRPXPlwte59hT3n3KS/XBa5c
         GGAzX4GUcTtOAbkwKIGpAXUMq9rT8Z+VThb6/X4UKr97n4BJovWcczY1JX60zRQTE47J
         9iYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nV43jtmwHVhNIUIwHqbPqyXT6AOAMyWo/9t3uutR0Qo=;
        b=KLMql+hTrAKdbifeF5xXf8qoGLrpblX80Lz9UOVatUXOIfKpuSCSeO6hhuRoKDMLKx
         4X8nvbB+V2e8uk8AmrCJ+EfDXXzaoxvOrnWacy59Yw1Y1sqq+082vg210OvZG5J1FbW6
         uNz1EKXWZjjUKMBXssIk3rStbnD/BOOgIJhNf9SUfoK9tjIU+baXcM7o8sgdw30YclCJ
         czf/lLtSdKfuTgDlfA2qZCQaNwvxLOMo8mfhitZLfBiE2KZcm2CNyW+O0q+YhDtGbP8c
         f+RUmorEUmvtzKBaluyuZMwANcEOIM52M4S7n+WGFN63GnG8xcLZJCR4xGRWRQ/khcKm
         UD4w==
X-Gm-Message-State: AOAM5333JmH4mPb4Mjemsd+zgMylMdopgkcKhtK75VbBke/nMD4flx0M
	NrKd4CZLsdt/rxMec7r6LQ0=
X-Google-Smtp-Source: ABdhPJzhfuW5XdHCCRPubLqs1LoFsN2HHa+bDTgi7nPzDkZ8jaCdbntBg6Vboo4kR3OSwudczJn+0Q==
X-Received: by 2002:ac2:4c48:0:b0:479:4fdc:2c70 with SMTP id o8-20020ac24c48000000b004794fdc2c70mr13827925lfk.295.1654853968748;
        Fri, 10 Jun 2022 02:39:28 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
        by smtp.gmail.com with ESMTPSA id n8-20020a056512310800b0047906bad093sm2387841lfb.173.2022.06.10.02.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 02:39:28 -0700 (PDT)
Date: Fri, 10 Jun 2022 12:39:26 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
	Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
	soc@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] bus: bt1-apb: Don't print error on -EPROBE_DEFER
Message-ID: <20220610093926.xgy5pd5wep3hrakl@mobilestation>
References: <20220610080103.10689-1-Sergey.Semin@baikalelectronics.ru>
 <103fdfb5287a29fc229a734a40c3bcd3b373037f.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <103fdfb5287a29fc229a734a40c3bcd3b373037f.camel@pengutronix.de>

On Fri, Jun 10, 2022 at 11:35:36AM +0200, Philipp Zabel wrote:
> Hi Serge,
> 
> On Fr, 2022-06-10 at 11:01 +0300, Serge Semin wrote:
> > The Baikal-T1 APB bus driver correctly handles the deferred probe
> > situation, but still pollutes the system log with a misleading error
> > message. Let's fix that by using the dev_err_probe() method to print the
> > log message in case of the clocks/resets request errors.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > ---
> >  drivers/bus/bt1-apb.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/bus/bt1-apb.c b/drivers/bus/bt1-apb.c
> > index b25ff941e7c7..ac13b5b97107 100644
> > --- a/drivers/bus/bt1-apb.c
> > +++ b/drivers/bus/bt1-apb.c
> > @@ -176,7 +176,8 @@ static int bt1_apb_request_rst(struct bt1_apb *apb)
> >  
> > 
> > 
> > 
> >  	apb->prst = devm_reset_control_get_optional_exclusive(apb->dev, "prst");
> >  	if (IS_ERR(apb->prst)) {
> > -		dev_warn(apb->dev, "Couldn't get reset control line\n");
> > +		dev_err_probe(apb->dev, PTR_ERR(apb->prst),
> > +			      "Couldn't get reset control line\n");
> >  		return PTR_ERR(apb->prst);
> 

> This could be shortened to
> 
> -		dev_warn(apb->dev, "Couldn't get reset control line\n");
> +		return dev_err_probe(apb->dev, PTR_ERR(apb->prst),
> +				     "Couldn't get reset control line\n");
> -		return PTR_ERR(apb->prst);

You are absolutely right. Thanks. I'll fix it in the v2 in both
patches.

-Sergey

> 
> regards
> Philipp
> 
