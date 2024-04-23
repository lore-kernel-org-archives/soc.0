Return-Path: <SRS0=eoZA=L4=gmail.com=mazziesaccount@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F5DC04FFE
	for <soc@archiver.kernel.org>; Tue, 23 Apr 2024 12:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56999C32782; Tue, 23 Apr 2024 12:32:28 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48B88C116B1;
	Tue, 23 Apr 2024 12:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48B88C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2dd6c160eaaso28053181fa.1;
        Tue, 23 Apr 2024 05:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713875545; x=1714480345; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OrHXvRaUv3C2iqQS4WjEmHKtqea6OF0pLobXVwLpQUk=;
        b=VlUrUdZx0vnAjmjQApnLPxOogAHWDspNDsB+ZoN5VJ2tVeuo+QLEEWkge2Cu7KXR/S
         6aZ2I5kUrtz1hOfEgZTfkr2k9NxRp3zjCS91zz54uG6Ee8DZ5fQPZ3d1FZPWThMmb3s/
         DYDnCa+H/ZGQC16qZhE0fcYVKaSgD8h9yy/RHXPgeqX6Ti00x9Q9ddWELeto2FRjHvyn
         qI3fcqkdETQmpKRmxO9QNnVGWt83bAWpECjqVllyFK1HJIp3oGUwcSgtyWVuiK6ZJ2f3
         8qF+TGbl8ZAg9WoY8U3OzLb4UBSLWeU1ppOCcU0tkgRcgk5jp4zGSNumznUB5t/Tbodx
         Hvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713875545; x=1714480345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OrHXvRaUv3C2iqQS4WjEmHKtqea6OF0pLobXVwLpQUk=;
        b=JDbzOy3dPwbhGC8lvgZ5nfz1T0F9ETUjkXmfZI7rOJ7K2Hd2WMr1TxsA5XetedZ7xL
         xmDl+U2fVoUk7iU4tJZqUM2GF5RgisGOs68ctu6MmwSAGpiEyd+yvMRrXMqDrGS6y+4/
         eFX7dIW8du1bZ8c3FxUKZT3S6JmS+W98NqTP5L60cK9LpYoQGa76VjdRwOMioPebnNF/
         MhJBjpR1d98PEmmVeDewsH338UBmxYk+7u7T1azXF1q65BjKxxPrV/0CDErEnrpr5pMC
         PrHc89gdx9ZdUi8Pmt1WL+BgSQ9jHnfmX49ah/kgJri5O0ebnJJq+YjEXrJw60HUbKW0
         6qHw==
X-Forwarded-Encrypted: i=1; AJvYcCXuCbDDS6hsgvvSfvL0QWDbMPZxZ20xvc0qL8wilIwftf54r0hq0yVXAngmpX640D273SltpvK7a8pzFJ/jqQ==
X-Gm-Message-State: AOJu0YwEqV0Kp4FGY0rHle1ITHhpN1fL2oC8p1swTsecgeBMtyoBJwNa
	0O/DA3bIUBkQuXy1ixoaBk0gPGP+lwChQRQWxq+scs47BGPdTDbSt/2TKw==
X-Google-Smtp-Source: AGHT+IFnWA0qBoSVXjgXdK4f6pQg6ueSoGhlCVma+uEAyB9pgtdKjcOxV+v4IPaoLbkrbbG6KZ3n5A==
X-Received: by 2002:a2e:b911:0:b0:2d8:7320:e36a with SMTP id b17-20020a2eb911000000b002d87320e36amr9181610ljb.17.1713875544945;
        Tue, 23 Apr 2024 05:32:24 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd? ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id bj24-20020a2eaa98000000b002da080a84cfsm1660763ljb.23.2024.04.23.05.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 05:32:24 -0700 (PDT)
Message-ID: <aa564814-bf73-4a37-88c3-50738272a85f@gmail.com>
Date: Tue, 23 Apr 2024 15:32:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/11] devm-helpers: Add resource managed version of
 irq_create_mapping()
Content-Language: en-US, en-GB
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: arm@kernel.org
References: <20240418121116.22184-1-kabel@kernel.org>
 <20240418121116.22184-7-kabel@kernel.org>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240418121116.22184-7-kabel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/18/24 15:11, Marek Behún wrote:
> Add resource managed version of irq_create_mapping(), to help drivers
> automatically dispose a linux irq mapping when driver is detached.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>   include/linux/devm-helpers.h | 54 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 54 insertions(+)
> 
> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
> index 74891802200d..fe62b28baf03 100644
> --- a/include/linux/devm-helpers.h
> +++ b/include/linux/devm-helpers.h
> @@ -24,6 +24,8 @@
>    */
>   
>   #include <linux/device.h>
> +#include <linux/kconfig.h>
> +#include <linux/irqdomain.h>

I still think stuffing all unrelated APIs in one header will lead to 
problems because of the sheer amount of unrelated stuff which gets 
included when only some APIs from this file are used.

But as I said during V5 review, I don't want to block this if no one 
else thinks it is a real problem.

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

>   #include <linux/workqueue.h>
>   
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
> + * Returns a linux irq number on success, -ENXIO if the mapping could not be
> + * created, or a negative error number if devm action could not be added.
> + */
> +static inline int devm_irq_create_mapping(struct device *dev,
> +					  struct irq_domain *domain,
> +					  irq_hw_number_t hwirq)
> +{
> +	unsigned int virq = irq_create_mapping(domain, hwirq);
> +
> +	if (!virq)
> +		return -ENXIO;
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

