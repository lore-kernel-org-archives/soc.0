Return-Path: <SRS0=dUhC=LA=linaro.org=dan.carpenter@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A553C54E58
	for <soc@archiver.kernel.org>; Tue, 26 Mar 2024 09:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1B706C43390; Tue, 26 Mar 2024 09:00:32 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1845FC433C7
	for <soc@kernel.org>; Tue, 26 Mar 2024 09:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1845FC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a46ba938de0so705444366b.3
        for <soc@kernel.org>; Tue, 26 Mar 2024 02:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711443629; x=1712048429; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m63gCWGRhL/wRJdhnP7MEeXdlJyGmEWUu13/Biz4Pfc=;
        b=SB2y6AcDovaeJT4J9WxGh+cbh4UsobVQj+e2b8E97c6j1UMGwA2K81ijVOdiHrycG6
         9LZr+cOne8lqzo/XdrbJLIUF+3adqub6YQbT3qp+btwmeFkOBGI0WhLXJphOc2B/FPZp
         GXQIaAJuUnHQM8POEzuzj7g8fTq13Lecdfu6y+cSHU7iJMrlHKjl3K0iUbtYwOq/ENZ9
         9rd19EeDP0f/HCS2E6D67lNZatsYajowTerzzvUAtEUbF2gUgZ/qlOsCzAnhUKzSTdNL
         GiXi1YxfY44OC3OnELPi6N0LlviblyJpqzsohHl2Fx6yWF/gaeXcxo3Ys5IyBviCoz9C
         VVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711443629; x=1712048429;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m63gCWGRhL/wRJdhnP7MEeXdlJyGmEWUu13/Biz4Pfc=;
        b=pbZXwuLJx61WHaJGJ3g4wVJh8+fxX6adAgdGwEq74ZRRGo95w6S9Lyzmj6hYLlEbTj
         zJdwsWY4UjIYDw6u1zyaCfSN9T2qokrsD9wVkIG0lxlYXLB9ogGxwucUNgwg1+q4owoM
         60a8SxXLKC1GgTml4cIvUJDCgC4SsgMsPcyxWpT+81dThWo9gmdwpgwbIL3Pf7XAOCXW
         D93D402F8ynYuOW6mfQ/HtjRJNecOelQehnHNOG9immK4J+fiuo7jgrB29ubymABA/bg
         xkx++SlJwBRfLRA5udfChsPSGnnf6m6sEB5WWqZjF/ZPkQC+6mWKFA32OEf1HS5ssO0k
         rfGw==
X-Forwarded-Encrypted: i=1; AJvYcCVEQzhoi6cZx4MO0n1eGjyYQhSz1owO1Reb7NdwXZ1SAHAB+ZU4AKgzuzfWVIh4wRJubEo9h+h0B90966dnSw==
X-Gm-Message-State: AOJu0YxfEXCu1SxS/zVJ1bGIDIXNl9PBoLct6G/xsR+UFc6R9+qkkhqy
	JB9e9+PXLhvhYVGh2jU3N8wTd3Rk3cl/Wp+wH3r1VsQb3SgDNUrPx2bGH48QjI4=
X-Google-Smtp-Source: AGHT+IFjgo1w4nZ2O4eNk881Ww1anaBEX/i76CaqNoRSwZEdcRCn3dyIq8WxNXo9+RFpWyaRh5TiwA==
X-Received: by 2002:a17:906:1194:b0:a46:ac10:1cde with SMTP id n20-20020a170906119400b00a46ac101cdemr1328114eja.45.1711443629180;
        Tue, 26 Mar 2024 02:00:29 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id jy10-20020a170907762a00b00a461e10094asm4021494ejc.95.2024.03.26.02.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 02:00:28 -0700 (PDT)
Date: Tue, 26 Mar 2024 12:00:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>, soc@kernel.org,
	arm@kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>, linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v5 06/11] devm-helpers: Add resource managed version of
 irq_create_mapping()
Message-ID: <72bf31c3-337d-4747-8353-639492507a7b@moroto.mountain>
References: <20240323164359.21642-1-kabel@kernel.org>
 <20240323164359.21642-7-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240323164359.21642-7-kabel@kernel.org>

On Sat, Mar 23, 2024 at 05:43:54PM +0100, Marek Behún wrote:
> +/**
> + * devm_irq_create_mapping - Resource managed version of irq_create_mapping()
> + * @dev:	Device which lifetime the mapping is bound to
> + * @domain:	domain owning this hardware interrupt or NULL for default domain
> + * @hwirq:	hardware irq number in that domain space
> + *
> + * Create an irq mapping to linux irq space which is automatically disposed when
> + * the driver is detached.
> + * devm_irq_create_mapping() can be used to omit the explicit
> + * irq_dispose_mapping() call when driver is detached.
> + *
> + * Returns a linux irq number on success, 0 if mapping could not be created, or
                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> + * a negative error number if devm action could not be added.
> + */
> +static inline int devm_irq_create_mapping(struct device *dev,
> +					  struct irq_domain *domain,
> +					  irq_hw_number_t hwirq)
> +{
> +	unsigned int virq = irq_create_mapping(domain, hwirq);
> +
> +	if (!virq)
> +		return 0;

What is the point of returning zero instead of an error code?  Neither
of the callers that are introduced later in the patchset use this.

I understand that it matches some of the other legacy irq function
behaviors, but I think we are trying to move away from that because it
just leads to bugs.

Since we don't need the zero now, let's wait until we have a user before
introducing this behavior.  Then we can add a new function that returns
zero, but we'll still encourage people to use the standard error code
function where possible.  And at the same time, when we do introduce the
zero is an error code, function you should contact
kernel-janitors@vger.kernel.org so someone an write a static checker
rule to detect the bugs that result from it.

regards,
dan carpenter

> +
> +	/*
> +	 * irq_dispose_mapping() is an empty function if CONFIG_IRQ_DOMAIN is
> +	 * disabled. No need to register an action in that case.
> +	 */
> +	if (IS_ENABLED(CONFIG_IRQ_DOMAIN)) {
> +		int err;
> +
> +		err = devm_add_action_or_reset(dev, devm_irq_mapping_drop,
> +					       (void *)(unsigned long)virq);
> +		if (err)
> +			return err;
> +	}
> +
> +	return virq;
> +}
> +
>  #endif
> -- 
> 2.43.2
> 
