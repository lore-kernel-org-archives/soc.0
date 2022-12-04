Return-Path: <SRS0=vPge=4C=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6396C4332F
	for <soc@archiver.kernel.org>; Sun,  4 Dec 2022 23:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8D43EC433D6; Sun,  4 Dec 2022 23:55:25 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D0AFC433C1
	for <soc@kernel.org>; Sun,  4 Dec 2022 23:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D0AFC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id c7so6413497pfc.12
        for <soc@kernel.org>; Sun, 04 Dec 2022 15:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gHlZGpeZlTuBVPZFLOSWn4tUqUYQHoDhbXM9z/ibwxk=;
        b=NVPCNqIYQwJ9riFBXF9JBy0G6xWfj+kYEuyG/U/R9TRpQlNH0ftWSX5J+oxMxU5RZI
         cp6krhYjoSadBWzHh4U0D0CbqBmnQ80pjtWYKW5USrbj4LMmMqDTZoH0WymauCZk5PLa
         f5THaB5h+f134C/UwnY3U0fVLlycd3mzSe65ilIIIMu1/6HkyLvymnZNIzarKelrwOb/
         MwpTEc0FPShO2Ho3FGnJUOa66Pdv1YSwUU7GxXAoOewSP7Nh+DQNm4ykxMw6zVcY7BVZ
         RpeFezVWxW1/d3O1CJXnht0Aeh46fE4r1bb/67Z0455qAKKa3tYVWHLhNHCi6AVIiNC2
         O6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHlZGpeZlTuBVPZFLOSWn4tUqUYQHoDhbXM9z/ibwxk=;
        b=3mAvupCD/YwF8szSu2dM62VfUbOvJKpmyds2WM8x+pwmvEwhUDy3bJLiRCg1PkRAuc
         wTDjuux8etTesF5Hq1JIQ/CKEti+WV1OgC5N5djSfDvHv3bYTZb1L8Ycp/4qCnhUgOhk
         v+LJqMQClx1Km29ehtbJemYGZfYqKj9mtgV4Jsa9nSb33UcWG4J29MzLWLgnAMCagVTE
         nId8yKcXhd4TvJ+/zQTJDTKoANlxcBheRhwi1VSedutM21tk5Gw6KqpwIT+rbjWvTPXD
         O3P/Rz43WdpVlhdVErYo+lUmHFhzhXGf3V2SUhWGC5zl14EBqfsTdUtsiD207l544ugG
         4Lyg==
X-Gm-Message-State: ANoB5pmz1aUd+FENgT1vXTN9wdts7zggPGG+LPLmyVp6VilfONUgQ5Vw
	YQSlHdDHJtv+8ksvDopTCzBknyub2Po=
X-Google-Smtp-Source: AA0mqf4pMxxhbRVxKZP9kRnJWpyGf5dQqY829R1P8RGw1dgjRNh6xo628tCXNeoJ+fmMbjg0u+d7KQ==
X-Received: by 2002:a63:cd44:0:b0:478:1391:fc43 with SMTP id a4-20020a63cd44000000b004781391fc43mr31855466pgj.431.1670198123613;
        Sun, 04 Dec 2022 15:55:23 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:ea63:b7ba:2a89:fec])
        by smtp.gmail.com with ESMTPSA id b65-20020a62cf44000000b0056f0753390csm8802078pfg.96.2022.12.04.15.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 15:55:22 -0800 (PST)
Date: Sun, 4 Dec 2022 15:55:19 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Li Yang <leoyang.li@nxp.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [RESEND PATCH] soc: fsl: qe: request pins non-exclusively
Message-ID: <Y40zZ8fkE9d1zbbV@google.com>
References: <Y4wnGgMLOr04RwvU@google.com>
 <81a7715b-559f-4c5c-bdb6-1aa00d409155@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81a7715b-559f-4c5c-bdb6-1aa00d409155@app.fastmail.com>

On Sun, Dec 04, 2022 at 01:10:19PM +0100, Arnd Bergmann wrote:
> On Sun, Dec 4, 2022, at 05:50, Dmitry Torokhov wrote:
> >
> > SoC team, the problematic patch has been in next for a while and it
> > would be great to get the fix in to make sure the driver is not broken
> > in 6.2. Thanks!
> 
> I have no problem taking thsi patch, but I get a merge conflict that
> I'm not sure how to resolve:
> 
> 
> @@@ -186,23 -182,27 +180,43 @@@ struct qe_pin *qe_pin_request(struct de
>         if (WARN_ON(!gc)) {
>                 err = -ENODEV;
>                 goto err0;
> ++<<<<<<< HEAD
>  +      }
>  +      qe_pin->gpiod = gpiod;
>  +      qe_pin->controller = gpiochip_get_data(gc);
>  +      /*
>  +       * FIXME: this gets the local offset on the gpio_chip so that the driver
>  +       * can manipulate pin control settings through its custom API. The real
>  +       * solution is to create a real pin control driver for this.
>  +       */
>  +      qe_pin->num = gpio_chip_hwgpio(gpiod);
>  +
>  +      if (!of_device_is_compatible(gc->of_node, "fsl,mpc8323-qe-pario-bank")) {
>  +              pr_debug("%s: tried to get a non-qe pin\n", __func__);
>  +              gpiod_put(gpiod);
> ++=======
> +       } else if (!fwnode_device_is_compatible(gc->fwnode,
> +                                               "fsl,mpc8323-qe-pario-bank")) {
> +               dev_dbg(dev, "%s: tried to get a non-qe pin\n", __func__);
> ++>>>>>>> soc: fsl: qe: request pins non-exclusively
>                 err = -EINVAL;
> -               goto err0;
> +       } else {
> +               qe_pin->controller = gpiochip_get_data(gc);
> +               /*
> +                * FIXME: this gets the local offset on the gpio_chip so that
> +                * the driver can manipulate pin control settings through its
> +                * custom API. The real solution is to create a real pin control
> +                * driver for this.
> +                */
> +               qe_pin->num = desc_to_gpio(gpiod) - gc->base;
>         }
> 
> Could you rebase the patch on top of the soc/driver branch in the
> soc tree and send the updated version?

I see, it conflicts with:

	c9eb6e546a23 soc: fsl: qe: Switch to use fwnode instead of of_node

that is in next but not in soc/driver tree/branch. OK, I'll rebase and I
just noticed that I was leaking gpiod in case we could not locate gc
(unlikely but still...).

Thanks.

-- 
Dmitry
