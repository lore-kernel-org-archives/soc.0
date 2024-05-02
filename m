Return-Path: <SRS0=belY=MF=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63CBC4345F
	for <soc@archiver.kernel.org>; Thu,  2 May 2024 18:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78974C4AF14; Thu,  2 May 2024 18:48:04 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5BA7BC113CC;
	Thu,  2 May 2024 18:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5BA7BC113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a58fbbcd77aso690155466b.2;
        Thu, 02 May 2024 11:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714675681; x=1715280481; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ptcMrkNICz73eAQABExX63Kj/ICN/L9qU5c/PqnqoE=;
        b=hT3UJHWvqoRyS0ffnKOL+c00sktCHoc19NcYDyPlRRo9iKxDOjNP4TsKdMSr5ywr6Q
         Yh6lnP1vdbR4qMj1cHq7MgGKuf6U2YakxqshZltST7sbLXZq2P7FBFRdis3FNICxc4/T
         20GUVS6b/quG9Amhk9TLjxP8q0H3PdxSLvaWnlo6d+N/xFjTvYuuveFGrN2eJfJEll4P
         izadGZmC2GTP6faGOe878GeKdiwQ7OB0sga1SrW9XdUFkmyUNXIXr99uZCDrImL2z5rg
         K1hHded59H7bgn4smwor59dMQD2Scec0+KAlr0FMQxyKsYQoplboD1sRLaw1ZJDTIrCh
         zqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714675681; x=1715280481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ptcMrkNICz73eAQABExX63Kj/ICN/L9qU5c/PqnqoE=;
        b=CyUN4iWUsycWP46MPCZZn3wosKEx2Ei/x7RXWDeXx5JOM1stPQXbg7CbWBAY6v2Yzw
         AFigBW1Ogj2JNeiDhzeHk1kapD2XZ/ZYx46gUOQd6hvTVlfZbw4uvluCnzBTyzGybPVS
         IcFelwWowupDJ17vgE27nlahj+MFte9KOQ0pHPy9qWOeSJaEqly23ASYGVj/VbGERdIv
         qz+fLgKvCqTAFfvIj6gDSO8s25Psen6c5NhvFjwr56aRpPRRPT1tetkxVvqRhvfUVc7b
         cYD9yy3GMyp0KNPTc7/MKmJBXw/aYvNU0sOaadVYszjvauX7mFUmcv1pmOYTwsAW5/61
         E67w==
X-Forwarded-Encrypted: i=1; AJvYcCVGTNUoI5LpivqpegGOS7oBiDSa0uYgC/dx5yJNHgnMYb365Fmb/fSwq7enP/5agwKYqD1kKC7YmNvyvdDRO4CiykqTBtdaFvHA6tlrDfc=
X-Gm-Message-State: AOJu0Yxol97kpfA0Zh6S4JWVqAs3V/V2u0/sFYpPwT5COIyJoUToUKMl
	C2k4HSPGUrSnr2gv8rADj71Fpk851G/kdcmzbj/BPcurO58WefwlNwl072tm8C2seQ8WK94DqpE
	mry6suuTvDwydjCmzyDxT+CK4P2/d9hIG
X-Google-Smtp-Source: AGHT+IFbES+v3k94VbHdMqiFlPW3sCkNwAMB0n3v4VQ2cEEzJBmZIXQvb/xZ0tM78GX8eDF/qAQPpRvtVtWRT5EFBsA=
X-Received: by 2002:a17:906:71d2:b0:a51:fec0:23ec with SMTP id
 i18-20020a17090671d200b00a51fec023ecmr222077ejk.25.1714675681214; Thu, 02 May
 2024 11:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240430115111.3453-1-kabel@kernel.org> <20240430115111.3453-3-kabel@kernel.org>
 <CAHp75VcgfvyZ9rcNev9CpQEN3CkUVozEkv+ycaQggPbE4tx+1Q@mail.gmail.com>
 <20240430160507.45f1f098@dellmb> <ZjELmaD3aQEuEa5K@smile.fi.intel.com> <20240502184005.fsdbwrbzmv5gshxh@kandell>
In-Reply-To: <20240502184005.fsdbwrbzmv5gshxh@kandell>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 May 2024 21:47:25 +0300
Message-ID: <CAHp75VfktKyGUNBz18TUQknF-5YZDOTgh2WLJhTs-_Ay-wgQoA@mail.gmail.com>
Subject: Re: [PATCH v8 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2024 at 9:40=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org> =
wrote:
> On Tue, Apr 30, 2024 at 06:17:45PM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 30, 2024 at 04:05:07PM +0200, Marek Beh=C3=BAn wrote:
> > > On Tue, 30 Apr 2024 15:53:51 +0300
> > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Tue, Apr 30, 2024 at 2:51=E2=80=AFPM Marek Beh=C3=BAn <kabel@ker=
nel.org> wrote:

...

> > > > > +static int omnia_get_version_hash(struct omnia_mcu *mcu, bool bo=
otloader,
> > > > > +                                 u8 version[static OMNIA_FW_VERS=
ION_HEX_LEN])
> > > >
> > > > Interesting format of the last parameter. Does it make any differen=
ce
> > > > to the compiler if you use u8 *version?
> > >
> > > The compiler will warn if an array with not enough space is passed as
> > > argument.
> >
> > Really?
>
> Indeed:
>
>   extern void a(char *x);
>
>   static void b(char x[static 10]) {
>       a(x);
>   }
>
>   void c(void) {
>       char x[5] =3D "abcd";

>       b(x);

It's not the example I was talking about. Here should be a(x).

>   }
>
> says:
>   test.c: In function =E2=80=98c=E2=80=99:
>   test.c:9:9: warning: =E2=80=98b=E2=80=99 accessing 10 bytes in a region=
 of size 5 [-Wstringop-overflow=3D]
>       9 |         b(x);
>         |         ^~~~
>   test.c:9:9: note: referencing argument 1 of type =E2=80=98char[10]=E2=
=80=99
>   test.c:3:13: note: in a call to function =E2=80=98b=E2=80=99
>       3 | static void b(char x[static 10]) {
>         |

...

> > > > > +               omnia_info_missing_feature(dev, "feature reading"=
);
> > > >
> > > > Tautology. Read the final message. I believe you wanted to pass jus=
t
> > > > "reading" here.
> > >
> > > No, I actually wanted it to print
> > >   Your board's MCU firmware does not support the feature reading
> > >   feature.
> > > as in the feature "feature reading" is not supported.
> > > I guess I could change it to
> > >   Your board's MCU firmware does not support the feature reading.
> > > but that would complicate the code: either I would need to add
> > > " feature" suffix to all the features[].name, or duplicate the
> > > info string from the omnia_info_missing_feature() function.
> >
> > From point of a mere user (as I am towards this driver) I consider
> > the tautology confusing.
> >
> >       ...the 'reading' feature
> >
> > may be a good compromise.
>
> I have rewritten it to use another dev_info:
>   dev_info(dev,
>            "Your board's MCU firmware does not support feature reading.\n=
");

OK! As long as there are no two messages in a row for the same error.

--=20
With Best Regards,
Andy Shevchenko
