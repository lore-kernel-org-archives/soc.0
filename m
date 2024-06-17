Return-Path: <SRS0=zac1=NT=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C75C2BB9A
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 10:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7DD68C4AF1D; Mon, 17 Jun 2024 10:43:21 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C6E0C2BD10;
	Mon, 17 Jun 2024 10:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6C6E0C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57c7681ccf3so4864811a12.2;
        Mon, 17 Jun 2024 03:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718620999; x=1719225799; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yG/uu801c17jNBp3Q6D+uIgxb2+x0+IM8usXqGLPPp0=;
        b=nbwEnThfEmvxohjTPNqUJBwPw4JtsLVcJwaMMjX6+OK/wxIQEQ5qyYKjwSgfmagLHe
         ryytjzwLYTd4AHy96lXASBCxBwT9lT2cyAvqM16Zgsje9k4B10j/ZKI+J6SLvRrTfMCd
         bRUWDqaX0y5PxQuXicWo1b44G2P7o8nlMwVkI7X6MTvSL3dPYFmiF1rGVDh3/+8RPzli
         JeO0+m5DLuYqKs7ed/Ghr2ex8eEvaj5Z75q7O/qKM116zW/cGRIoAFl7X3RdB6u6hhoe
         mvpV7SE8t7AQ3jECXMmtz0EXGYxHJarURIuR9WDUMRb3DTbscNRN35oe0XSJzxqWZfds
         oZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718620999; x=1719225799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yG/uu801c17jNBp3Q6D+uIgxb2+x0+IM8usXqGLPPp0=;
        b=o5gFGUJl+3ioQV08f99w1gW4PdV7kzGe9ByCGesCyX4HtyyuGZavS1xLkPVFQQLtk4
         svL/PJjR6S6dHv9HCY1uo5eIeuz2NRJjGE1AAPCMns43KkS8SAKDAdpVIb/pobCPCT1i
         CKu5ClS2hzy8PpOrcdAeylTNIOlV8t1WWzofTQ+qUYwGTid27p5tZSGtRZqHWTIPvUze
         C8VZcROCVVrurja2f2dcI/5FIBbSH+nbEzZ+zaSYRspGkLpcZZnV5lHV3Gdn1EMmX/kr
         NR4WZvvnmiPeU66Pe9zk88f7iKBbmEaP1f3S293K/qJmOICiDT0ghnB4CF3ohSW2+b+5
         AIPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk8iZWzQ85aEJS9TOhRqXz/hdMsXFwmIST/M5/RvZtUamnNJFbwTB2cBb/JOa7Hk2YFHMgd5fNnxkiEBq8lUZBnuisGIxh9ySC5Wi6XLfSRq496bIVMPlvdRlOaMMzdg==
X-Gm-Message-State: AOJu0YzeHEiU9QO+kqGnlXQJuSLmPul8jRKMnYN7iODMK0OmC62FuwXs
	g9QSoRK/KsGdbo+Vh+7YYuAY4u7T9eIO4gij6htxOaj0v2oC9sMQDtOfT6vRU2z4sOGnkuN/l6J
	AW5CC90A3qr65OqifJuNzcMF7XcNXyvqhLZ8=
X-Google-Smtp-Source: AGHT+IH3dyn+P+21hwIcjrDsuqyVWL/3oMGnmFJ2srgeI0E6Fu7TNJjmqBkWwOUFKFtWA6pamBGK/q5YkrVv2WwVhIs=
X-Received: by 2002:a17:906:b350:b0:a6e:f6b0:c49d with SMTP id
 a640c23a62f3a-a6f60d4294cmr577390066b.34.1718620998405; Mon, 17 Jun 2024
 03:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240605161851.13911-1-kabel@kernel.org> <20240605161851.13911-7-kabel@kernel.org>
 <CAHp75VfWZhmw00QP-ra4Zajn7LMvDW+NUT2fMx5kqeQ9eHLv5A@mail.gmail.com>
 <CAMRc=McmiZFwPneeCtYtqgLiapf9jP9=L8WBmCwQTsZdZVeaqg@mail.gmail.com>
 <20240617105614.009be8cc@dellmb> <CAMRc=MfB26+CArmu6tHVkpA16OD6_b45FHr2WgzPh45KcdFc2A@mail.gmail.com>
In-Reply-To: <CAMRc=MfB26+CArmu6tHVkpA16OD6_b45FHr2WgzPh45KcdFc2A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Jun 2024 12:42:41 +0200
Message-ID: <CAHp75VcMzZnKi6WUoiSgky5fsvt77FuPr6XZ+X=AD+i_2JzP3Q@mail.gmail.com>
Subject: Re: [PATCH v11 6/8] platform: cznic: turris-omnia-mcu: Add support
 for MCU provided TRNG
To: Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: <soc.lore.kernel.org>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 11:07=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> On Mon, Jun 17, 2024 at 10:56=E2=80=AFAM Marek Beh=C3=BAn <kabel@kernel.o=
rg> wrote:
> > On Mon, 17 Jun 2024 10:38:31 +0200
> > Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > On Wed, Jun 5, 2024 at 9:00=E2=80=AFPM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Wed, Jun 5, 2024 at 7:19=E2=80=AFPM Marek Beh=C3=BAn <kabel@kern=
el.org> wrote:
> > > > >
> > > > > Add support for true random number generator provided by the MCU.
> > > > > New Omnia boards come without the Atmel SHA204-A chip. Instead th=
e
> > > > > crypto functionality is provided by new microcontroller, which ha=
s
> > > > > a TRNG peripheral.
> > > >
> > > > +Cc: Bart for gpiochip_get_desc() usage.

...

> > > > > +       irq_idx =3D omnia_int_to_gpio_idx[__bf_shf(OMNIA_INT_TRNG=
)];
> > > > > +       irq =3D gpiod_to_irq(gpiochip_get_desc(&mcu->gc, irq_idx)=
);
> > > > > +       if (irq < 0)
> > > > > +               return dev_err_probe(dev, irq, "Cannot get TRNG I=
RQ\n");
> > > >
> > > > Okay, it's a bit more complicated than that. The gpiochip_get_desc(=
)
> > > > shouldn't be used. Bart, what can you suggest to do here? Opencodin=
g
> > > > it doesn't sound to me a (fully) correct approach in a long term.
> > >
> > > Andy's worried about reference counting of the GPIO device. Maybe you
> > > should just ref the GPIO device in irq_request_resources() and unref
> > > it in irq_release_resources()? Then you could use gpiochip_get_desc()
> > > just fine.
> >
> > But this is already being done.
> >
> > The irqchip uses GPIOCHIP_IRQ_RESOURCE_HELPERS macro in its definition:
> >
> >   static const struct irq_chip omnia_mcu_irq_chip =3D {
> >     ...
> >     GPIOCHIP_IRQ_RESOURCE_HELPERS,
> >   };
> >
> > This means that gpiochip_irq_reqres() and gpiochip_irq_relres() are
> > used as irq_request_resources() and irq_release_resources().
> >
> > The gpiochip_reqres_irq() code increases the module refcount and even
> > locks the line as IRQ:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/gpio/gpiolib.c?h=3Dv6.10-rc4#n3732
>
> Andy: what is the issue here then exactly?

The function in use is marked as DEPRECATED. If you are fine with its
usage in this case, I have no issues with it.
If you want it to be replaced with the respective
gpio_device_get_desc(), it's fine, but then the question is how
properly get a pointer to GPIO device object.

--=20
With Best Regards,
Andy Shevchenko
