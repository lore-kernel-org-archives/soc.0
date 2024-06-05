Return-Path: <SRS0=rYwF=NH=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3598C25B76
	for <soc@archiver.kernel.org>; Wed,  5 Jun 2024 19:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B627C4AF08; Wed,  5 Jun 2024 19:04:15 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 90EA0C2BD11;
	Wed,  5 Jun 2024 19:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 90EA0C2BD11
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a63359aaaa6so22267366b.2;
        Wed, 05 Jun 2024 12:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717614253; x=1718219053; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xh71ZSxxFua5UsJmiWrAn4VvcZX7vPDfF1OxNk1pmOQ=;
        b=ZYTnDDVON2BUS0PfqTLDg2UNP01QYDPbo0hmyYVMAhPYRBqEU7GHInoaxp3vGw/+i4
         PIfGELQFpvekqMI6RM0RjaayptMabgivbSnWv9YzDDs3gunIsXu8z8OVfQ88adQM/wYV
         1owuUa80BoqC2DTuWnWDSIDdjzLEETv+3aycLhur7cutic0Wo7+vkzi+x12D83J6AcqZ
         h0vdAH63ULEmy3io2igxxUb0bXhZwZ7s3zNJCfmqG3gY/QoqUOgU23+I/kXH2GRt0BP8
         /Np+Uw/f8e4aovOgjwBkAPwYOhtoskRoEVEp6EJvHQgf8etPbCQQldFYaENYRCzvxHpy
         owiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717614253; x=1718219053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xh71ZSxxFua5UsJmiWrAn4VvcZX7vPDfF1OxNk1pmOQ=;
        b=NFoalv9QfTgweyS0HjCFWE8y/8kD67IKucFyIcorV8dHksO3Cmj6k393J9tYskuO+U
         Myco4E6Xe7BZioL18y5+7vT0y6iLdLDxCSITRxx1l82KnfXfBULI5aT46Fv7SctGiB0Y
         1oTRoJCv8nO0zJgL6tlSxnRIRwz6qHHSZ7kleEIR7kK5kCygycoeDK9hzMI8NSELPkWX
         k0iOCO2FODWD2VHh7D1pUIkodZf7yOj3S/M1nArmJBLR0OZAtapuPhRZ6vN4ZaURlHWI
         iYdxII+DbN+LyCltGAq9i9anRJEwNEY1kFcjicTGq2pFrPWxg0x6F4hZ0frmwUeOC72J
         75YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRc1ZKlqIjk+ncGpRSxDbzeB3o6E7lJrDmuRUsK1y7GQkijuMh7xdvgQkymoYHUuamhuLU9KDiNkwE3W9XNDM8owSbK4Z0N/IcOeroRGRQpiJ3ECEFvePXKPHHCNL8+A==
X-Gm-Message-State: AOJu0Yz0I5bhcZ06IyF6Qpm/M3X6Rw/MJuX8k5uLAELi9w9pDMgSWc6J
	/asQubyC6ErJTL+x8SCJ7gi3nIHM2l4Sfe5mR+VeXaDgF/0r8WexfMitA3Ra3Paw5Yi92yZldqg
	H18s67BCLQ9obj4t07szHHptA3TguEcJE
X-Google-Smtp-Source: AGHT+IFV7sCTmuoMWxPwMTfZ7pw9ClPnGKlQdVQc1LeidomVOKHdzQe2DOE0iWJKDVSFs9zC8IM4SqejPBDSD9wMOfI=
X-Received: by 2002:a17:906:3516:b0:a68:cc6f:cb5a with SMTP id
 a640c23a62f3a-a699fdfe2abmr224118766b.68.1717614252579; Wed, 05 Jun 2024
 12:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240605161851.13911-1-kabel@kernel.org> <20240605161851.13911-4-kabel@kernel.org>
 <CAHp75VfsUZ=1u4dk-YniFpOSwWVSo6Qg124RBJAikBwu2Hj1vw@mail.gmail.com>
In-Reply-To: <CAHp75VfsUZ=1u4dk-YniFpOSwWVSo6Qg124RBJAikBwu2Hj1vw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Jun 2024 22:03:36 +0300
Message-ID: <CAHp75VfrRMXi2HkVESe7HaLfwNd+6dhDiis_ZvOebUiVzumF9w@mail.gmail.com>
Subject: Re: [PATCH v11 3/8] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 9:29=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jun 5, 2024 at 7:19=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org=
> wrote:

...

> > +/**
> > + * omnia_mask_interleave - Interleaves the bytes from @rising and @fal=
ling
> > + *     @dst: the destination u8 array of interleaved bytes
> > + *     @rising: rising mask
> > + *     @falling: falling mask
>
> Why so many spaces before @? One is enough.
>
> > + *
> > + * Interleaves the little-endian bytes from @rising and @falling words=
.
> > + *
> > + * If @rising =3D (r0, r1, r2, r3) and @falling =3D (f0, f1, f2, f3), =
the result is
> > + * @dst =3D (r0, f0, r1, f1, r2, f2, r3, f3).
> > + *
> > + * The MCU receives an interrupt mask and reports a pending interrupt =
bitmap in
> > + * this interleaved format. The rationale behind this is that the low-=
indexed
> > + * bits are more important - in many cases, the user will be intereste=
d only in
> > + * interrupts with indexes 0 to 7, and so the system can stop reading =
after
> > + * first 2 bytes (r0, f0), to save time on the slow I2C bus.
> > + *
> > + * Feel free to remove this function and its inverse, omnia_mask_deint=
erleave,
> > + * and use an appropriate bitmap_*() function once such a function exi=
sts.
> > + */
> > +static void
> > +omnia_mask_interleave(u8 *dst, unsigned long rising, unsigned long fal=
ling)

> But rising and failing should be either u64 or unsigned long *.

Ah, sorry, I misread the use, discard this single comment.

> > +{
> > +       for (int i =3D 0; i < sizeof(u32); ++i) {
>
> In other cases you use:
> 1) unsigned
> 2) post-increment
>
> What makes this one special?
>
> > +               dst[2 * i] =3D rising >> (8 * i);
> > +               dst[2 * i + 1] =3D falling >> (8 * i);
> > +       }
> > +}
>
> ...
>
> > +/**
> > + * omnia_mask_deinterleave - Deinterleaves the bytes into @rising and =
@falling
> > + *     @src: the source u8 array containing the interleaved bytes
> > + *     @rising: pointer where to store the rising mask gathered from @=
src
> > + *     @falling: pointer where to store the falling mask gathered from=
 @src
> > + *
> > + * This is the inverse function to omnia_mask_interleave.
> > + */
> > +static void omnia_mask_deinterleave(const u8 *src, unsigned long *risi=
ng,
> > +                                   unsigned long *falling)
> > +{
> > +       *rising =3D *falling =3D 0;
> > +
> > +       for (int i =3D 0; i < sizeof(u32); ++i) {
> > +               *rising |=3D src[2 * i] << (8 * i);
> > +               *falling |=3D src[2 * i + 1] << (8 * i);
> > +       }
> > +}
>
> Same comments as per above function.

--=20
With Best Regards,
Andy Shevchenko
