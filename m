Return-Path: <SRS0=Ae9U=MN=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A527C25B10
	for <soc@archiver.kernel.org>; Fri, 10 May 2024 13:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32547C4AF07; Fri, 10 May 2024 13:35:11 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 514F2C113CC;
	Fri, 10 May 2024 13:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 514F2C113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a59cc765c29so456648066b.3;
        Fri, 10 May 2024 06:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715348108; x=1715952908; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9z/WF9EK9tZcqaL8I/iPFkkiWdIRn1J1eTch4hQphBo=;
        b=L3hbR31FJbo2oHG1i37FJO5E3MjmBeiwYsUU/65pVYs/sTUCtbO/p4s2xVtMtkar+w
         ErrtmTSCMGFpRFcXZE/jboTnip5ek4gBXssfFH58nyhUb+fBU8YKNwW7pbqLaM49KU95
         b2FopsA10sVNbfafBfz3v9wlb/7TtobTfO3IzP7YccLMuW5G1oxrDEHrHdDICz4l7rkh
         hkxxPY7aEro4Uj/T4iXXGfuYJkci19AnD8eFLQXV0TgzGI7K/1FfC4ioUTaj16GOI2Um
         CzJXTrn6M7gqhAl0QgRUEvueLOZHw2VNsqhWMhUuOa9VGzeov1FoIOuz2Zihnqd386NW
         wX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715348108; x=1715952908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9z/WF9EK9tZcqaL8I/iPFkkiWdIRn1J1eTch4hQphBo=;
        b=l6v8FsJ7m7aVI7wpxBNZ6j15qkGCC6rZpp43gu3iEroaYPQFwBpTQW1cr4OrU+FN5g
         5GOTmSeT7mJDZ8eCzUUqTa9FWhvCCKnCrWv3tS5nAt6HJDNkTZKVR7TyO0r90M10CQpk
         6DQTivJpNlUGXvrgGs141dm+R4cXi7BqPHdhjrRW8jZqvn1HQp2RyhMKACReoNbIMFxf
         ibi6HdttdgEtJznWT2/MxlsHcC9EVT2AVy9wHe7piNgcMR2oaGeG4uc0/aP8BM8TN8ZN
         RJCr3ShFuUKEm1m2IqrEftS498Y1sYrpNhIDDvKQCXjtiz4zle3B2ZyHKB/4yGxe/bBn
         3PYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcdmGw01n1eI0AtHjUWKjSFtpQpc4d9R+qpi4pXYaZs0m+lVhVecsVuubte7oNvs9KkDAUUdmxxdtyRZ9AjrCE+hYXBRl1P7Y5R/DMtfs=
X-Gm-Message-State: AOJu0YzTPxgLS/Ndax4WGjyVr8je7OAhewG+FNY/nsnaHsDkoKMNMJgH
	56DJDyVPkq0vgq0ceTDRaF/fyLKf3ZRUYcgyF/K8HxqNE60eryDgsQZ2FsXZRNawT7hjkpwBKIo
	4N9zcj2dlBZCBB6o6RM/GTCzwLZgtSzQM
X-Google-Smtp-Source: AGHT+IFru+UqFq9gfmS5rsgmHO4zzjFJhXOFUjvCHZibm2WFbDnhHkjJYccZLh/xglciE/NLKzlOFCXyYxSoDusK6YU=
X-Received: by 2002:a17:906:3b50:b0:a5a:7a1:5d9c with SMTP id
 a640c23a62f3a-a5a2d66879bmr183692566b.62.1715348108221; Fri, 10 May 2024
 06:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240508103118.23345-1-kabel@kernel.org> <20240508103118.23345-4-kabel@kernel.org>
 <ZjtfCjAlDMMndRfv@smile.fi.intel.com> <20240510100946.270c00e3@dellmb>
In-Reply-To: <20240510100946.270c00e3@dellmb>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 May 2024 16:34:31 +0300
Message-ID: <CAHp75VdEDhShmZDriikP0799BrV0sCZiwENhpLBoo2zGNMkLsA@mail.gmail.com>
Subject: Re: [PATCH v9 3/9] platform: cznic: turris-omnia-mcu: Add support for
 MCU connected GPIOs
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 11:09=E2=80=AFAM Marek Beh=C3=BAn <kabel@kernel.org=
> wrote:
> On Wed, 8 May 2024 14:16:26 +0300
> Andy Shevchenko <andy@kernel.org> wrote:
> > On Wed, May 08, 2024 at 12:31:12PM +0200, Marek Beh=C3=BAn wrote:

...

> > > +   if (type & IRQ_TYPE_EDGE_RISING)
> > > +           mcu->rising |=3D bit;
> > > +   else
> > > +           mcu->rising &=3D ~bit;
> > > +
> > > +   if (type & IRQ_TYPE_EDGE_FALLING)
> > > +           mcu->falling |=3D bit;
> > > +   else
> > > +           mcu->falling &=3D ~bit;
> >
> > If those variables was defined as unsigned long, these can be just
> >
> >       __assign_bit()
> >       __assign_bit()
> >
> > And other non-atomic bitops elsewhere, like __clear_bit().
>
> Changing this propagated to many other variables and even required
> some refactoring of the omnia_gpio structure, since the bit, ctl_bit
> and int_bit members are stored as a masks, but __assign_bit() /
> __set_bit() / __clear_bit() requires bit numbers.
>
> For example
>   if (gpio->int_bit && (mcu->is_cached & gpio->int_bit))
>     return !!(mcu->cached & gpio->int_bit);
> needed to change to
>   if (gpio->has_int && (mcu->is_cached & BIT(gpio->int_bit)))
>     return !!(mcu->cached & BIT(gpio->int_bit));

You rather meant

  return test_bit(...);

> and so on.

...and so on :-)

> Moreover, I agree that the if-else statement which you commented on,
> when changed to __assign_bit(), looks much nicer, but some changes that
> sprouted from this are in my opinion less readable.

Maybe. It can be done later on.

> I have prepared the fixup patch, but I am not confident enough that
> everything is done correctly. I would prefer leaving this one for
> later, if it is okay with you.

--
With Best Regards,
Andy Shevchenko
