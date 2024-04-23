Return-Path: <SRS0=8AdT=L4=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC07C4345F
	for <soc@archiver.kernel.org>; Tue, 23 Apr 2024 16:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3716C2BD11; Tue, 23 Apr 2024 16:44:20 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B2859C2BD10;
	Tue, 23 Apr 2024 16:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B2859C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a55b2f49206so4718766b.1;
        Tue, 23 Apr 2024 09:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713890658; x=1714495458; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzHvPMI8jy4JoQIjALX1Zmza34aN1gCSFeb2zP8PLnY=;
        b=fMlMlrGxWOCy3e2sgOJiNtzqDqnIsHBtrctyAZdSq+sAKKTSy4TWt2shHGyRTkS/vQ
         29jPvPeK93ZaKauxhLkNXCOnSy/gXZuIjwAjhHS9WyTYLP7422fuiJMCP7VJL4nop7Kz
         MhYPX2DZTPS+rTGalkyi9q+qBhItuH4Bfpgd3rygZWV7I72i7Y+u/oYf5FgLjEYkXDQ/
         UiSeDsSAMwOjY373/gdVwTDfgtGYlvbLzHQioLrVbip2gDhVCGKDfpKBa5VP1crU1cOs
         KCGa4DC2LtU1QB6uUm8GVUbzJC5lY+zxdLRBL/WzVL04uj3Y2JOdUo0kkyOfxUFhl0Dg
         M02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713890658; x=1714495458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzHvPMI8jy4JoQIjALX1Zmza34aN1gCSFeb2zP8PLnY=;
        b=m67HmP1rC6hPAbunQiiZgbkY+zynIlxSHpogwVf3/7nI2/59H1mYk8yOxxFfsrBkBd
         4da7Ns9yZBW+zDidHQdyYpV6UQ2oBCn6ND25OQMnq6+WmVbfY7bn8EuJ3J6Yj1zVUQIH
         TDvdZ600n7XkXB7cigoSnn7amlKz6H/zYLbyT7YQRAJHbyUscH3+g8wRFoZWhEfU589G
         fP8XICHYoCEtqjBYSjl4sTlKXCC5yFCBg/mKZlCqv+4NJu1aqAXznkoh+WfbC0rPeE2T
         9YhNCNYLmfebttErU1+DjLSIXEtC8ktXM9BaGUauk2UMKTngFxL8lH9MNFpJeq1ZOHom
         T7fA==
X-Forwarded-Encrypted: i=1; AJvYcCVs+N7TYVZiAw5uG+73znxX0o1NHfUEyYk3WgmkKP2glfNGT1P0/pGboG0CtT8aab1ARgscup5yGCdLDwiyDd0eka6ML4W5jKdVOadikVQ=
X-Gm-Message-State: AOJu0YxEYDLPoIVQHx+qH1AyzEvcFpPh4Vkmw6xswTV60tiJZXMQ/+6o
	Fhtb6quhHkMmHcChqOt+BQ0sRr0gTj9tA3D9bIoDidi1uWV22inxNTkZpDpeD8fxF4whsogMS+I
	aWnHpZmmOUZ6MkfecN0NW/YT+Esq9jco9
X-Google-Smtp-Source: AGHT+IHSbCrYySuPw2JwMFZJ1BbFCsUQksBQF5BIagB21JFr3mV8NPTJAmKTRu8kFIXN4c3hM3Wotbg80bYc0sdO3hU=
X-Received: by 2002:a17:906:a2cf:b0:a55:75f7:42fb with SMTP id
 by15-20020a170906a2cf00b00a5575f742fbmr3582184ejb.24.1713890657677; Tue, 23
 Apr 2024 09:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240418121116.22184-1-kabel@kernel.org> <20240418121116.22184-8-kabel@kernel.org>
 <Zifamxfa18yjD_VS@smile.fi.intel.com> <20240423183225.6e4f90a7@thinkpad>
In-Reply-To: <20240423183225.6e4f90a7@thinkpad>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 23 Apr 2024 19:43:41 +0300
Message-ID: <CAHp75VcfmTeG+G1DkteR6GN96y3+h_Mz1YQ8U5asHJ7oTq+KbQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/11] platform: cznic: turris-omnia-mcu: Add support
 for MCU provided TRNG
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-crypto@vger.kernel.org, arm@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 7:32=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
> On Tue, 23 Apr 2024 18:58:19 +0300
> Andy Shevchenko <andy@kernel.org> wrote:
> > On Thu, Apr 18, 2024 at 02:11:12PM +0200, Marek Beh=C3=BAn wrote:

...

> > > +   irq_idx =3D omnia_int_to_gpio_idx[__bf_shf(INT_TRNG)];
> > > +   irq =3D devm_irq_create_mapping(dev, mcu->gc.irq.domain, irq_idx)=
;
> > > +   if (irq < 0)
> > > +           return dev_err_probe(dev, irq, "Cannot map TRNG IRQ\n");
> >
> > This looks like some workaround against existing gpiod_to_irq(). Why do=
 you
> > need this?
>
> Hmmm, I thought that would not work because that line is only valid
> as an IRQ, not as a GPIO (this is enforced via the valid_mask member of
> gpio_chip and gpio_irq_chip).
>
> But looking at the code of gpiolib, if I do
>   irq =3D gpiod_to_irq(gpiochip_get_desc(gc, irq_idx));
> the valid_mask is not enforced anywhere.

Which one? GPIO has two: one per GPIO realm and one for IRQ domain.

> Is this semantically right to do even in spite of the fact that the
> line is not a valid GPIO line?

Yes. It's orthogonal to that.

--=20
With Best Regards,
Andy Shevchenko
