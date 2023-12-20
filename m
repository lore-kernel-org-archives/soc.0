Return-Path: <SRS0=FcB2=H7=gmail.com=gsomlo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4E8C3DA6E
	for <soc@archiver.kernel.org>; Wed, 20 Dec 2023 20:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D66A6C433C8; Wed, 20 Dec 2023 20:35:32 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE407C433C7;
	Wed, 20 Dec 2023 20:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE407C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3ba14203a34so18842b6e.1;
        Wed, 20 Dec 2023 12:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703104531; x=1703709331; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oVoim3ZI7VZX/tKDQGzFMPPOl07OuoqY3KhlixMQhCE=;
        b=gPpA4HT4lvQeiaSdIyzSg50JhMAEbYBq2KD/QXJw0sPjn9Z9//SvxEVW2r57PXUSwN
         I2IYuPdZOwuqLjgrMY7YDJ+ShCMH5thg7uqYC/pMmtuP9PiH3eplC1JCYRXEx2XqeU0Z
         EBsaKaN2WuOCiPg8RbM1RdKWMaqjJubEZ8msYTEbFn0menrfC0vnOiG0tBpeP4hM+luh
         jQTqfOsox9tMvUcowl1ey/u+BWf2nyAFsODe47q7fSQyVWdKIpbmpT5FuKp9JREuvvMC
         S+lBCOL6elLoY7xzhAXnCbfQeRRBA4p0z1aM29f8pApafE7YX1KMg9LNW/GeX6kok92i
         9clg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703104531; x=1703709331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVoim3ZI7VZX/tKDQGzFMPPOl07OuoqY3KhlixMQhCE=;
        b=BlL+XsbYKLKjyN3v3Cgc6NWPD2MYAWsx+a4aPYjqE+Y3UvM3gu+VI4xJO2wL9ANNTc
         3ySZgsYvn+5a/M/cwX/lpBUEJzO5PFScGWE6eucKbujbf3VkiMc8zM0Zae4LjGmav4y8
         +cDsvB5ep9oe+VvSYlZd2+ukfapgnIfP5WGC9SHGqYhdGkw6Hp64umFvMI50gBXUS9Mn
         PfQY7IGb0mImLLV41Q10ykAgmzUN0PB66J5ONuhujlwaFKO9QSbMRDzxpZ74Y2XXvwhg
         AA65lw3/JnQQpBKqYX/MiriXbg/5l5KxcjOeYDhLNkLLzOAOQZsJv3avIhYU0zfvbts7
         2kOA==
X-Gm-Message-State: AOJu0YwK1ZgwphAvU7j/X8qniJDSreMD8NpDWOGMCww6P5E93eSKmwiC
	CVm8U7fbsH5MUEm0XiDq8L0=
X-Google-Smtp-Source: AGHT+IH6PMDyng/5PnOlcknBm5cZ5WiPB0L/Y1T9IJYbEWvlvF71Ms3ilAkxMRNhfQTcavEdbDFhhA==
X-Received: by 2002:a05:6808:2129:b0:3bb:7681:aac with SMTP id r41-20020a056808212900b003bb76810aacmr642856oiw.79.1703104529811;
        Wed, 20 Dec 2023 12:35:29 -0800 (PST)
Received: from errol.ini.cmu.edu ([72.95.245.133])
        by smtp.gmail.com with ESMTPSA id er14-20020a056214190e00b0067f4886019dsm142513qvb.122.2023.12.20.12.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 12:35:29 -0800 (PST)
Date: Wed, 20 Dec 2023 15:35:21 -0500
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: arnd@arndb.de
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Andrew Davis <afd@ti.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Joel Stanley <joel@jms.id.au>, Mark Brown <broonie@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH RFC 2/5] drivers/soc/litex: Use
 devm_register_restart_handler()
Message-ID: <ZYNQCTIRDj1VAwPJ@errol.ini.cmu.edu>
References: <20231117161006.87734-1-afd@ti.com>
 <20231117161006.87734-3-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117161006.87734-3-afd@ti.com>
X-Clacks-Overhead: GNU Terry Pratchett

On Fri, Nov 17, 2023 at 10:10:03AM -0600, Andrew Davis wrote:
> Use device life-cycle managed register function to simplify probe error
> path and eliminate need for explicit remove function.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Gabriel Somlo <gsomlo@gmail.com>

Arnd: the original patch is available here for the purpose of pulling via
the soc tree:
https://lore.kernel.org/lkml/20231117161006.87734-3-afd@ti.com/

Thanks,
--Gabriel

> ---
>  drivers/soc/litex/litex_soc_ctrl.c | 23 +++++------------------
>  1 file changed, 5 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/soc/litex/litex_soc_ctrl.c b/drivers/soc/litex/litex_soc_ctrl.c
> index 10813299aa106..7a0096d93c73d 100644
> --- a/drivers/soc/litex/litex_soc_ctrl.c
> +++ b/drivers/soc/litex/litex_soc_ctrl.c
> @@ -69,14 +69,11 @@ static int litex_check_csr_access(void __iomem *reg_addr)
>  
>  struct litex_soc_ctrl_device {
>  	void __iomem *base;
> -	struct notifier_block reset_nb;
>  };
>  
> -static int litex_reset_handler(struct notifier_block *this, unsigned long mode,
> -			       void *cmd)
> +static int litex_reset_handler(struct sys_off_data *data)
>  {
> -	struct litex_soc_ctrl_device *soc_ctrl_dev =
> -		container_of(this, struct litex_soc_ctrl_device, reset_nb);
> +	struct litex_soc_ctrl_device *soc_ctrl_dev = data->cb_data;
>  
>  	litex_write32(soc_ctrl_dev->base + RESET_REG_OFF, RESET_REG_VALUE);
>  	return NOTIFY_DONE;
> @@ -107,11 +104,9 @@ static int litex_soc_ctrl_probe(struct platform_device *pdev)
>  	if (error)
>  		return error;
>  
> -	platform_set_drvdata(pdev, soc_ctrl_dev);
> -
> -	soc_ctrl_dev->reset_nb.notifier_call = litex_reset_handler;
> -	soc_ctrl_dev->reset_nb.priority = 128;
> -	error = register_restart_handler(&soc_ctrl_dev->reset_nb);
> +	error = devm_register_restart_handler(&pdev->dev,
> +					      litex_reset_handler,
> +					      soc_ctrl_dev);
>  	if (error) {
>  		dev_warn(&pdev->dev, "cannot register restart handler: %d\n",
>  			 error);
> @@ -120,20 +115,12 @@ static int litex_soc_ctrl_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static void litex_soc_ctrl_remove(struct platform_device *pdev)
> -{
> -	struct litex_soc_ctrl_device *soc_ctrl_dev = platform_get_drvdata(pdev);
> -
> -	unregister_restart_handler(&soc_ctrl_dev->reset_nb);
> -}
> -
>  static struct platform_driver litex_soc_ctrl_driver = {
>  	.driver = {
>  		.name = "litex-soc-controller",
>  		.of_match_table = of_match_ptr(litex_soc_ctrl_of_match)
>  	},
>  	.probe = litex_soc_ctrl_probe,
> -	.remove_new = litex_soc_ctrl_remove,
>  };
>  
>  module_platform_driver(litex_soc_ctrl_driver);
> -- 
> 2.39.2
> 
