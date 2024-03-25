Return-Path: <SRS0=+0zi=K7=gmail.com=mazziesaccount@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D89CC54E64
	for <soc@archiver.kernel.org>; Mon, 25 Mar 2024 09:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4450C43394; Mon, 25 Mar 2024 09:40:25 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86702C433F1;
	Mon, 25 Mar 2024 09:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86702C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-513d599dbabso5355893e87.1;
        Mon, 25 Mar 2024 02:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711359622; x=1711964422; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mtstH1BLOLsw9jtNCibv6vHLTRe0hRVYkNedjxZxFWA=;
        b=myg3cQ2WbWugPjbjOkW3unRn2DVDU6DtfIVXXWi2XpatDsNvb/CKDMaUsYzAFR1wkE
         xcpeVN+FCUB7nTQ1oY66kjdtbkYaOoRyefkwAm70WkQTLCFapxABnxVL8+TcPBLCwOm9
         Di81RRXMwAj2ms17DiEW3O1NrGNPKbrNpy58uUS4aqEmbFH8Nw/H28mxxqsuHnWmaIcS
         MFFalJAMqM+6QhchdkaDeP1Cv4ntmY7l8bR697JkoLxEEmsD2FmvpCFOuknby3UrP8pM
         nA5G2RTd+hbMih1q0kzy4KsTHBBvK+uTzhPGelXpoqm+Zyjg5No5v8MX69tPl/i80bbs
         amcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711359622; x=1711964422;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mtstH1BLOLsw9jtNCibv6vHLTRe0hRVYkNedjxZxFWA=;
        b=jeo+bdzc6fOO7wRLAGlsOd+mu6FrNVk3h08MQ59ouePy8s+JqaGsquZdz/mL+9rYmP
         qqRTNyAtvI22k1A358v4k1KwxW8qBUU/6aHBUr5ABb/3GUnh980xbUxDgaNVmHtk9+q7
         VQ6HRG/+t/gvcGOVAvqOFy2eoUq0kEQCvdCygmSPtNfmDmdXbbuuNSduXArV2ap6uENd
         T2jsnY+3Xl12MdW1IV3+3fxLG13UHvAUGyM49A9wDDiOrSiwiQlasvXBgm3cHsAMmN73
         xsKLQvxfyCYlF34g6cXSaUSJ50A5w0pi0yxALYFdY76ZF+kBtrp4v9nQqgs2OxjN+Y6K
         WEuA==
X-Forwarded-Encrypted: i=1; AJvYcCVlYFcW/zbanFq7lIfzxJLbE2RD0mdoNyhL8ehw0b+rceYbRnFKLjHAsjp1ELEm4eRCpDdIBfiq2S2LdfipJxiaUOxfX74srMbyCcT2cCc=
X-Gm-Message-State: AOJu0YzxyuyW8hezpgC8HS//Sp1ODSRFen1DO/skR3vpGWlMQoA3NpvW
	D++Jlz9135mECh5gnodbni2fsFmUBkc+BcjhO+RKOKdPUYVwQILsvy3BwDGf
X-Google-Smtp-Source: AGHT+IEAPIfQV7RaQc/ZjRSgo29as88bZrpnYHt2zKpdpLka6t1u8dBCE0dT8oAk2COFiZ0eYavTeQ==
X-Received: by 2002:ac2:59c1:0:b0:515:9ae2:93b0 with SMTP id x1-20020ac259c1000000b005159ae293b0mr3835321lfn.19.1711359621730;
        Mon, 25 Mar 2024 02:40:21 -0700 (PDT)
Received: from ?IPV6:2001:14ba:7426:df00::6? (drtxq0yyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:7426:df00::6])
        by smtp.gmail.com with ESMTPSA id s17-20020a056512215100b00513e47ef4b1sm1016016lfr.195.2024.03.25.02.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 02:40:21 -0700 (PDT)
Message-ID: <dd4c655f-39c4-47c1-b5fb-4d6fc94cc430@gmail.com>
Date: Mon, 25 Mar 2024 11:40:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/11] devm-helpers: Add resource managed version of
 irq_create_mapping()
Content-Language: en-US, en-GB
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, soc@kernel.org, arm@kernel.org,
 Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Horia_Geant=C4=83?=
 <horia.geanta@nxp.com>, Pankaj Gupta <pankaj.gupta@nxp.com>,
 Gaurav Jain <gaurav.jain@nxp.com>, linux-crypto@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>
References: <20240323164359.21642-1-kabel@kernel.org>
 <20240323164359.21642-7-kabel@kernel.org>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240323164359.21642-7-kabel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/23/24 18:43, Marek Behún wrote:
> Add resource managed version of irq_create_mapping(), to help drivers
> automatically dispose a linux irq mapping when driver is detached.
> 
> The new function devm_irq_create_mapping() is not yet used, but the
> action function can be used in the FSL CAAM driver.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>   drivers/crypto/caam/jr.c     |  8 ++----
>   include/linux/devm-helpers.h | 54 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 56 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/crypto/caam/jr.c b/drivers/crypto/caam/jr.c
> index 26eba7de3fb0..ad0295b055f8 100644
> --- a/drivers/crypto/caam/jr.c
> +++ b/drivers/crypto/caam/jr.c
> @@ -7,6 +7,7 @@
>    * Copyright 2019, 2023 NXP
>    */
>   
> +#include <linux/devm-helpers.h>
>   #include <linux/of_irq.h>
>   #include <linux/of_address.h>
>   #include <linux/platform_device.h>
> @@ -576,11 +577,6 @@ static int caam_jr_init(struct device *dev)
>   	return error;
>   }
>   
> -static void caam_jr_irq_dispose_mapping(void *data)
> -{
> -	irq_dispose_mapping((unsigned long)data);
> -}
> -
>   /*
>    * Probe routine for each detected JobR subsystem.
>    */
> @@ -656,7 +652,7 @@ static int caam_jr_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	}
>   
> -	error = devm_add_action_or_reset(jrdev, caam_jr_irq_dispose_mapping,
> +	error = devm_add_action_or_reset(jrdev, devm_irq_mapping_drop,
>   					 (void *)(unsigned long)jrpriv->irq);
>   	if (error)
>   		return error;
> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
> index 74891802200d..3805551fd433 100644
> --- a/include/linux/devm-helpers.h
> +++ b/include/linux/devm-helpers.h
> @@ -24,6 +24,8 @@
>    */
>   
>   #include <linux/device.h>
> +#include <linux/kconfig.h>
> +#include <linux/irqdomain.h>
>   #include <linux/workqueue.h>

My confidence level is not terribly high today, so I am likely to accept 
just about any counter arguments :) But ... More I think of this whole 
header, less convinced I am that this (the header) is a great idea. I 
wonder who has authored a concept like this... :rolleyes:

Pulling punch of unrelated APIs (or, unrelated except the devm-usage) in 
one header has potential to be including a lot of unneeded stuff to the 
users. I am under impression this can be bad for example for the build 
times.

I think that ideally the devm-APIs should live close to their non-devm 
counterparts, and this header should be just used as a last resort, when 
all the other options fail :) May I assume all other options have failed 
for the IRQ stuff?

Well, I will leave the big picture to the bigger minds. When just 
looking at the important things like the function names and coding style 
- this change looks Ok to me ;)

>   static inline void devm_delayed_work_drop(void *res)
> @@ -76,4 +78,56 @@ static inline int devm_work_autocancel(struct device *dev,
>   	return devm_add_action(dev, devm_work_drop, w);
>   }
>   
> +/**
> + * devm_irq_mapping_drop - devm action for disposing an irq mapping
> + * @res:	linux irq number cast to the void * type
> + *
> + * devm_irq_mapping_drop() can be used as an action parameter for the
> + * devm_add_action_or_reset() function in order to automatically dispose
> + * a linux irq mapping when a device driver is detached.
> + */
> +static inline void devm_irq_mapping_drop(void *res)
> +{
> +	irq_dispose_mapping((unsigned int)(unsigned long)res);
> +}
> +
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
>   #endif

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

