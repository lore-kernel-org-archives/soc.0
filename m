Return-Path: <SRS0=rYwF=NH=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99BDC25B76
	for <soc@archiver.kernel.org>; Wed,  5 Jun 2024 19:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD067C32781; Wed,  5 Jun 2024 19:01:00 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ECA0FC2BD11;
	Wed,  5 Jun 2024 19:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ECA0FC2BD11
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52b98fb5c32so280481e87.1;
        Wed, 05 Jun 2024 12:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717614058; x=1718218858; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYhIOyPTOMDfxI0+KR+naWl8/lGKtywkm84N4Cz6eKM=;
        b=HOgq0hcVnFhcE4RJOrG9H7YmTorGTeCekifnVwjHscwP/T+6jldU74oEb5cbJJmMrS
         h/GhOqEFMua5+KtZmkDjxlynWWYlpJ4iPqBscBE/fbO2TbO4V6RhkjPfXHHVE+Fuf1/V
         NQgbYJT9gIe12KsOPq7lOK9U5ZFV0qhvcbZrMrGExghbNJFeekyAdmZqepsHCkEhU8NX
         s/gqjQFOWV9icePmAlsXf3kyTq+ZtDv3WTLjKxm+lxRgRTJedOirJWXvdNsAfNctyGhZ
         Rbi6Bs2PPwC7V5oXtwhtU1fM52QtWbYOqxpwyAxxiQJWhBAISXHZpqXcpkdRSM3guZnK
         ig7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717614058; x=1718218858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYhIOyPTOMDfxI0+KR+naWl8/lGKtywkm84N4Cz6eKM=;
        b=ZE05Kq4V+4BP96U0DTOMjlSEAUrKZF0BytVMr2Kf/nG8UAFpctrk1KLy5qkRu6cxss
         UW2hhM016dbRlutrLseNrgVl1jRhEblI9iLs0jK9E5wMpI9DvvWL3R1ZhDjzL2nr3XNd
         NbE+BdLDdK4MbqY4mMRv8stXlz+Q3a2+olUQdd4eD34zNpclbU0KlXoattoaWgiaJAuf
         VLD+oCROcUs01oQIqnBehOexE2CCnuumrZrQUE34zraHpDU2p5ip6l4zXnB1q0+umDMH
         n0QJLX9Xxs281sEcZWrVVf/CPZpxRsGkTdHPrNfq9oCuVJweei0wAKEW51BjPub1PWye
         sLmA==
X-Forwarded-Encrypted: i=1; AJvYcCVPqqby0fGGEmFH5ww926dyX+ZzFEG+UFdz0Ym6Ul2T7I97Kfxu4Iz2BAmxN7dKKeX9uA7x+yAr0B9pex6u3b5u5PsLLuh5O2qZ4Xpt7DVfRLwW36WA1qWE0YQ9gAcbjw==
X-Gm-Message-State: AOJu0Yyp/DR8uZIDQTyC14iCWs8mVfTDxlpMwTPo+cVYuQO2QpZeFR0q
	v4TncQ1a0uvBWMvxmVN8ubIjYrmIDKSwo0LJCD7mxm/2Pynn1dBk1KFKgkDzUozheArf/7pvDmo
	AaVFyzTfg0D/z31BZiwGwO3F0Hg71bWTl
X-Google-Smtp-Source: AGHT+IGcDozObRVYZ76zXZPRUAXMF/4meZiWPArCnmpa0e4ramK0EiWLTzgfvAF+nimAD5HnaXqqnbcxwOLaFVcBMUA=
X-Received: by 2002:a05:6512:1285:b0:52b:7a44:e17b with SMTP id
 2adb3069b0e04-52bab4ca4d2mr3449911e87.13.1717614057475; Wed, 05 Jun 2024
 12:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240605161851.13911-1-kabel@kernel.org> <20240605161851.13911-7-kabel@kernel.org>
In-Reply-To: <20240605161851.13911-7-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Jun 2024 22:00:20 +0300
Message-ID: <CAHp75VfWZhmw00QP-ra4Zajn7LMvDW+NUT2fMx5kqeQ9eHLv5A@mail.gmail.com>
Subject: Re: [PATCH v11 6/8] platform: cznic: turris-omnia-mcu: Add support
 for MCU provided TRNG
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 7:19=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org> =
wrote:
>
> Add support for true random number generator provided by the MCU.
> New Omnia boards come without the Atmel SHA204-A chip. Instead the
> crypto functionality is provided by new microcontroller, which has
> a TRNG peripheral.

+Cc: Bart for gpiochip_get_desc() usage.

...

> +#include <linux/bitfield.h>
> +#include <linux/completion.h>

+ errno.h

> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/hw_random.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/string.h>

> +#include <linux/turris-omnia-mcu-interface.h>

As per other patches.

> +#include <linux/types.h>
> +
> +#include "turris-omnia-mcu.h"

...

> +       irq_idx =3D omnia_int_to_gpio_idx[__bf_shf(OMNIA_INT_TRNG)];
> +       irq =3D gpiod_to_irq(gpiochip_get_desc(&mcu->gc, irq_idx));
> +       if (irq < 0)
> +               return dev_err_probe(dev, irq, "Cannot get TRNG IRQ\n");

Okay, it's a bit more complicated than that. The gpiochip_get_desc()
shouldn't be used. Bart, what can you suggest to do here? Opencoding
it doesn't sound to me a (fully) correct approach in a long term.

--
With Best Regards,
Andy Shevchenko
