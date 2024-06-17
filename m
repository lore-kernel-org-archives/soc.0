Return-Path: <SRS0=0S8+=NT=bgdev.pl=brgl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24966C27C6E
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 09:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9607C4AF1A; Mon, 17 Jun 2024 09:07:43 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57E71C3277B
	for <soc@kernel.org>; Mon, 17 Jun 2024 09:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 57E71C3277B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ebe785b234so40603651fa.1
        for <soc@kernel.org>; Mon, 17 Jun 2024 02:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718615260; x=1719220060; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lx+2LB1DyYdaX0uEWLJbcZAfd2gRgzXYA8uTQQWgnm8=;
        b=jKen17X4DpL98/8rX+vr2y8ASwA+eL/+addGZbDHxO6XOuKIEVNUO0t9O9tQBxvFhD
         94FhN5WsUxSKhudSNHpwfele5JYABoUCsXEvJEYFVwM21KnfXpqVLvc/R6YVL647kn2o
         8WgF0PSn3GTr6AxsSyjjKJcTn0+qv9a9OON5kH+nXKGDSSCsiqO7hNbn59UgxLY2C3lS
         HCnBkVv0LFt8yXSj/BtuH5ah5SHXXJcGGrKrF+pdkAMPhAqrrHE5Vfc2FKHiQRDVf7yt
         VoJmRLxRCHS4eq9Xmu5bfMx3Gbr7IN6HrjyJf2wnuzvNsr6jIp4SM0e/fCqLKYvN77Pk
         BdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718615260; x=1719220060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lx+2LB1DyYdaX0uEWLJbcZAfd2gRgzXYA8uTQQWgnm8=;
        b=VvLENJjm7QJBLriKgJwfdWK4slVTESoDh3ng3gcpd2SBnLgY+W1VbKwUd2A8EcsVGb
         YwiL8TtMqhZ6KVIL9YPQTjeX9N3RHKkLKz29UlvyOmQhN8TnIkJ8D88IN73QhhQdnjVn
         qhkW9jbJid/ZzWgOo6uU8qYlMsN1fhr1YFt0idFkBfYypyvoKIfy7q2SwnYSHBvNOWcY
         klpB8oS9Eyg1nXTwjnpPLqsOnHv13djrhwEwvwlkju7DXO1I6a0c7F3r29hRsyzfXgzE
         d/XvqktJN8eAY49hbDrjjZ7vOxf2PIVV+r8aclhT3gO2BazfHAR5lCO9lJf1+xfQQ1bd
         TeaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRnCDoWk9snPRCTVxcCMRtPF1OnJ2LlI+nEkKH4L/DKc2lkk4A4jedIKNT6dStqjMyiVLjXaJFz5/fe+mXow==
X-Gm-Message-State: AOJu0YwCIrJZR94l1mVVjarwDXHwqIKwrjydkS4LIJbCOJOFDE1JogGx
	OdS5J2Ol7Eoekg1+ocXfZFVPJZCf1ucvwvOvnuniUkhyT0JoRcV3BHoFJ2HFNTgF3kAKNOibuXu
	qAlUu3uCJA93jh4le8HORYKf2/a9q8dTg5AYCNw==
X-Google-Smtp-Source: AGHT+IFj6tIFtHkHrgkmpfqmirXSdUPag0786JMFxBaMI+9HbXB6HmvVH08NUGItXvvzIa1tjVugd9Ed4pCCeDgRCqk=
X-Received: by 2002:a2e:84c7:0:b0:2eb:d8d2:f909 with SMTP id
 38308e7fff4ca-2ec0e46deffmr65434411fa.16.1718615260493; Mon, 17 Jun 2024
 02:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240605161851.13911-1-kabel@kernel.org> <20240605161851.13911-7-kabel@kernel.org>
 <CAHp75VfWZhmw00QP-ra4Zajn7LMvDW+NUT2fMx5kqeQ9eHLv5A@mail.gmail.com>
 <CAMRc=McmiZFwPneeCtYtqgLiapf9jP9=L8WBmCwQTsZdZVeaqg@mail.gmail.com> <20240617105614.009be8cc@dellmb>
In-Reply-To: <20240617105614.009be8cc@dellmb>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 17 Jun 2024 11:07:29 +0200
Message-ID: <CAMRc=MfB26+CArmu6tHVkpA16OD6_b45FHr2WgzPh45KcdFc2A@mail.gmail.com>
Subject: Re: [PATCH v11 6/8] platform: cznic: turris-omnia-mcu: Add support
 for MCU provided TRNG
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 10:56=E2=80=AFAM Marek Beh=C3=BAn <kabel@kernel.org=
> wrote:
>
> On Mon, 17 Jun 2024 10:38:31 +0200
> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > On Wed, Jun 5, 2024 at 9:00=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Wed, Jun 5, 2024 at 7:19=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel=
.org> wrote:
> > > >
> > > > Add support for true random number generator provided by the MCU.
> > > > New Omnia boards come without the Atmel SHA204-A chip. Instead the
> > > > crypto functionality is provided by new microcontroller, which has
> > > > a TRNG peripheral.
> > >
> > > +Cc: Bart for gpiochip_get_desc() usage.
> > >
> > > ...
> > >
> > > > +#include <linux/bitfield.h>
> > > > +#include <linux/completion.h>
> > >
> > > + errno.h
> > >
> > > > +#include <linux/gpio/consumer.h>
> > > > +#include <linux/gpio/driver.h>
> > > > +#include <linux/hw_random.h>
> > > > +#include <linux/i2c.h>
> > > > +#include <linux/interrupt.h>
> > > > +#include <linux/minmax.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/string.h>
> > >
> > > > +#include <linux/turris-omnia-mcu-interface.h>
> > >
> > > As per other patches.
> > >
> > > > +#include <linux/types.h>
> > > > +
> > > > +#include "turris-omnia-mcu.h"
> > >
> > > ...
> > >
> > > > +       irq_idx =3D omnia_int_to_gpio_idx[__bf_shf(OMNIA_INT_TRNG)]=
;
> > > > +       irq =3D gpiod_to_irq(gpiochip_get_desc(&mcu->gc, irq_idx));
> > > > +       if (irq < 0)
> > > > +               return dev_err_probe(dev, irq, "Cannot get TRNG IRQ=
\n");
> > >
> > > Okay, it's a bit more complicated than that. The gpiochip_get_desc()
> > > shouldn't be used. Bart, what can you suggest to do here? Opencoding
> > > it doesn't sound to me a (fully) correct approach in a long term.
> > >
> >
> > Andy's worried about reference counting of the GPIO device. Maybe you
> > should just ref the GPIO device in irq_request_resources() and unref
> > it in irq_release_resources()? Then you could use gpiochip_get_desc()
> > just fine.
>
> But this is already being done.
>
> The irqchip uses GPIOCHIP_IRQ_RESOURCE_HELPERS macro in its definition:
>
>   static const struct irq_chip omnia_mcu_irq_chip =3D {
>     ...
>     GPIOCHIP_IRQ_RESOURCE_HELPERS,
>   };
>
> This means that gpiochip_irq_reqres() and gpiochip_irq_relres() are
> used as irq_request_resources() and irq_release_resources().
>
> The gpiochip_reqres_irq() code increases the module refcount and even
> locks the line as IRQ:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpio/gpiolib.c?h=3Dv6.10-rc4#n3732
>
> Marek

Andy: what is the issue here then exactly?

Bart
