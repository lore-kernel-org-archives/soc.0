Return-Path: <SRS0=HQhw=K6=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE00C47DD9
	for <soc@archiver.kernel.org>; Sun, 24 Mar 2024 15:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8F6E5C433C7; Sun, 24 Mar 2024 15:31:19 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7680AC433F1;
	Sun, 24 Mar 2024 15:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7680AC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513d3746950so4439666e87.1;
        Sun, 24 Mar 2024 08:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711294276; x=1711899076; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0h9CkCjrhT3P+set+37h9vZa3QRZIGn/XuauQXUeDHQ=;
        b=e/kpasCrPqBCpdWvQUWIrdV9wZF3DvxP6f3mB1wMx1Tyy9T5t4vB9MTxUShDf7/L++
         sKwveuJrbZOgEBa6cqU5Q5kY0snI5ExArRxnPFbM4Qb5SIsQ8xtQc6jOMj+xMyQDAgLJ
         ueyM/yGlPzwwj8G9mr4zP8zkk20ukdcF8qPAboeVXQP6KopktJk5E0Fl1QsvoSxPdlzq
         W1QonMWaEuV39ttth56XBouW0fDU+eFtc/7xMkGkHYwrDTiJ9VyuU+sqBG92gVnyPQqY
         uWwmj5fqARYGOYheIOt/i6O8300pkjf2acQdR8k+C4g2Zo88CjFICwJEOq1aQ4DxLPop
         5Bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711294276; x=1711899076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0h9CkCjrhT3P+set+37h9vZa3QRZIGn/XuauQXUeDHQ=;
        b=VcDZTJujA2Bi+UhJJ9sav+m03Q3STvfwlju2NSvN2Q/Viw+pPngRXdGC49g79cO+Hs
         357Ob5axqEkKkxY72n00pdliqcxUhLYZvjXDHW1Kda5ada+tNJC2fyZpjG0AmdBIOBDl
         Vi+MH1VLmdfTA1V2FItj5UrDQAVqa81jyh02m6D8Dxit3a4pZCC+EEyTySdUIOG6xCd+
         8XkhvC4RuNiObFhJ6auO+VZ+yBJ6vEbTEGlkHPzZIoEXhSX2ROPT4Ip0DTZfVWVUj/gl
         90QOGvJTDUUmC8lM1hbfdGXidSFR16w1IGM6SvoMtKMNOD9KZbumq29vKpOlVPbgK2YL
         +yHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd3pG3xxBKI+9B+2KruXvqybZHvtwObNPpobhsj5irMCtEyUFlAK6Hp5FsWPGMv48FnMCqW4kb5CJWdMBlFnFmtRMHx/EvpaC3iS4fbG512r5IGMxl9SjXiMkBEexrng==
X-Gm-Message-State: AOJu0YyKoFEsuMRoQR5Anw6HQQ4p21wBixKH+TcGrtO6pLVb9+SDKATE
	bh6Czf6nKC0E0q/HLM8BtGAYXn5McXNoAo2o15xwBdZQN7sBKfW3sZ4s8tacUz4jrFvs2Uh1UrU
	F4o/nfn+K+wWeHma7kOrKCAr0peGFovCyYCE=
X-Google-Smtp-Source: AGHT+IF1hgt89EHgXPEmK77BTi70jUOCk3tAdabwBOn4F1ZNKwy73xPE4h3/tpPQKJQSRKtU/HT7oaL8f7mcIJopj70=
X-Received: by 2002:ac2:4d95:0:b0:513:5bdb:10f7 with SMTP id
 g21-20020ac24d95000000b005135bdb10f7mr2979461lfe.14.1711294276178; Sun, 24
 Mar 2024 08:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240323164359.21642-1-kabel@kernel.org> <20240323164359.21642-3-kabel@kernel.org>
 <ZgAII1B03bLUisWr@surfacebook.localdomain> <20240324160408.77c8574e@thinkpad>
In-Reply-To: <20240324160408.77c8574e@thinkpad>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 24 Mar 2024 17:30:39 +0200
Message-ID: <CAHp75VesxrOdm4H3TYUtfEJx=i3Zpd6a=yzbkUFismnzW=nE-g@mail.gmail.com>
Subject: Re: [PATCH v5 02/11] platform: cznic: Add preliminary support for
 Turris Omnia MCU
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Gregory CLEMENT <gregory.clement@bootlin.com>, soc@kernel.org, 
	arm@kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 24, 2024 at 5:04=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> Hi Andy,
>
> thank you very much for the review. I have some notes and some
> questions, see below.

Btw, I'll look into other patches next week.

> On Sun, 24 Mar 2024 13:01:55 +0200
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > Sat, Mar 23, 2024 at 05:43:50PM +0100, Marek Beh=C3=BAn kirjoitti:

...

> > > +   err =3D omnia_cmd_read(mcu->client, bootloader ? CMD_GET_FW_VERSI=
ON_BOOT :
> > > +                                                  CMD_GET_FW_VERSION=
_APP,
> > > +                        reply, sizeof(reply));
> >
> > Wouldn't be better to have a logical split?
> >
> >       err =3D omnia_cmd_read(mcu->client,
> >                            bootloader ? CMD_GET_FW_VERSION_BOOT : CMD_G=
ET_FW_VERSION_APP,
> >                            reply, sizeof(reply));
>
> Changed for v6 to
>
> >       err =3D omnia_cmd_read(mcu->client,
> >                            bootloader ? CMD_GET_FW_VERSION_BOOT
> >                                       : CMD_GET_FW_VERSION_APP,
> >                            reply, sizeof(reply));
>
> There are still some people wanting only 80 columns, and the whole
> driver is written that way.

Hmm... Is it still a hard limit for drivers/platform/cznic for the _new_ co=
de?

> > ?

...

> > > +static ssize_t fw_features_show(struct device *dev, struct device_at=
tribute *a,
> > > +                           char *buf)
> >
> > One line?
>
> 80 columns...

Ditto.

...

> > > +static const struct attribute_group *omnia_mcu_groups[] =3D {
> > > +   &omnia_mcu_base_group,
> > > +   NULL
> > > +};
> >
> > __ATTRIBUTE_GROUPS()
>
> The next patches add more groups into this array, after the whole
> series it looks like this:
>
> static const struct attribute_group *omnia_mcu_groups[] =3D {
>         &omnia_mcu_base_group,
>         &omnia_mcu_gpio_group,
>         &omnia_mcu_poweroff_group,
>         NULL
> };
>
> There is no macro for that.

Good point.

> Should I still use __ATTRIBUTE_GROUPS() in
> the first patch and than change it in the next one?

...

> > > +static inline int omnia_cmd_read(const struct i2c_client *client, u8=
 cmd,
> > > +                            void *reply, unsigned int len)
> > > +{
> >
> > Why is this in the header?
>
> I considered it a helper function that should be defined in the header
> file, like the rest of the cmd helpers in this file. If you disagree, I
> will put it into the -base.c file.

I don't see the technical justification to hold it in the *.h rather
than *.c. To me this one is big enough in C and likely in assembly to
be copied to each user. Besides that aspect, it slows down the build a
lot (mostly due to i2c.h inclusion which otherwise is not needed).

> > > +   struct i2c_msg msgs[2];
> > > +   int ret;
> > > +
> > > +   msgs[0].addr =3D client->addr;
> > > +   msgs[0].flags =3D 0;
> > > +   msgs[0].len =3D 1;
> > > +   msgs[0].buf =3D &cmd;
> > > +   msgs[1].addr =3D client->addr;
> > > +   msgs[1].flags =3D I2C_M_RD;
> > > +   msgs[1].len =3D len;
> > > +   msgs[1].buf =3D reply;
> > > +
> > > +   ret =3D i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> > > +   if (ret < 0)
> > > +           return ret;
> > > +   if (ret !=3D ARRAY_SIZE(msgs))
> > > +           return -EIO;
> > > +
> > > +   return 0;
> > > +}

--=20
With Best Regards,
Andy Shevchenko
