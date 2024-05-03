Return-Path: <SRS0=9VqE=MG=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F154C4345F
	for <soc@archiver.kernel.org>; Fri,  3 May 2024 04:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32777C116B1; Fri,  3 May 2024 04:00:01 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CDA9C32789;
	Fri,  3 May 2024 03:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2CDA9C32789
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a5991a443b1so27364266b.1;
        Thu, 02 May 2024 20:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714708798; x=1715313598; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lV5QJtATJH3udYqZkh4GKglvbY5CEqoLqxh1pEW+0os=;
        b=fhGBKZqJSIM0SoJ4ePI/F+DmTLnlFkgf3yavjZT+sWoNAEi76BAnJDW+d3XccYbp6E
         FiYBf7n8pybSZ3Ez0JsrVBxjY8/kBxYAZ2rcLqr8BcFqOr5Ym0LnxiLIxPwHPilR4D2W
         ePR1I19myYH8g+z76m5EWv2wj7ElRNNS08IUSr8CGxB21pD6mK9vGG45xo63t5P+gwL+
         6AL3zRqBQOkHF++aS1wuMsp1I55WVlqfwlVUW6EGdo1cWvlpzGScwINUAHJkEVKj2Unk
         su5JPWPtdmEd0Y+F2jYFKTI6JLtYax5BIibHUGgL+Drl2dyB222WfCkCvpVtj8IxXp3Z
         MTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714708798; x=1715313598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lV5QJtATJH3udYqZkh4GKglvbY5CEqoLqxh1pEW+0os=;
        b=KOHH/6W5XKEqYSGIYVWEyjNMYCrxt8zk9y7O/KOkdvwt5WsSSmEvqxt9+AcavWsacS
         /ayo4zBcGvO/5DEJ5sjgPfMu1HEe68Zvb754YeyTlp8GkmdclkzYznR70I67UFuMopzp
         5WNToXMzqjRgZ3C6ZwL2ieKVViETylTDseNwd3ndO5aCl3iolWDzPl5+y/TJOAFMwawJ
         8jP+rvt2bGbRC/KhblgRIif8uepIthA+Z+wehpEehy5rxqIWvITp03okhxouj+pnV8id
         mrQqo3I+tnw2aiKN+IP/CGyvP7UwE+K2uw2ffm8K+z/Uq6u1fabvh19kNg4hVqBCZeZ/
         ENDg==
X-Forwarded-Encrypted: i=1; AJvYcCVYuGBiK08Uxkv0VjDAWV/yiFJrqbIBScQ3ccsj0vOqhT0d79YgpmplzaHLWnP+stx6jqGvhJCNCSY0K4+hQxS7fBleHYoz0S4rvsFVIgU=
X-Gm-Message-State: AOJu0YyX9rt+iCU8WfPMd3WWfeCQRsswN4fLaW83Nlsd54O94t8npU/8
	Q5VbbjwBjNesuErloCK9Be5Xkk8wNeWJ3K1f7g4KZuVrAjrrB6WJDpfyDYEoYPL6Yw6fCwbsNFd
	hdi2NOxFeUAoGT/8iskiXlBCoDZ5EV8se
X-Google-Smtp-Source: AGHT+IFBiPQ7H0X8hwY8QcSaSdp+fVMaQ0cgmNra5IDf6cHwrabjJCBmZEcj9mQ+TgxfPzYxRNuPc0IYidPKogUi6KE=
X-Received: by 2002:a17:906:c7d7:b0:a58:ee4e:1329 with SMTP id
 dc23-20020a170906c7d700b00a58ee4e1329mr784943ejb.35.1714708797860; Thu, 02
 May 2024 20:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240430115111.3453-1-kabel@kernel.org> <20240430115111.3453-3-kabel@kernel.org>
 <CAHp75VcgfvyZ9rcNev9CpQEN3CkUVozEkv+ycaQggPbE4tx+1Q@mail.gmail.com>
 <20240430160507.45f1f098@dellmb> <ZjELmaD3aQEuEa5K@smile.fi.intel.com>
 <20240502184005.fsdbwrbzmv5gshxh@kandell> <CAHp75VfktKyGUNBz18TUQknF-5YZDOTgh2WLJhTs-_Ay-wgQoA@mail.gmail.com>
 <20240502191756.ynwmp74yybat57my@kandell>
In-Reply-To: <20240502191756.ynwmp74yybat57my@kandell>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 3 May 2024 06:59:20 +0300
Message-ID: <CAHp75VcNDv=it_H8xt2p2J63UEqBpX_9qO3LxvQ3V_ZP0eStug@mail.gmail.com>
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

On Thu, May 2, 2024 at 10:18=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
> On Thu, May 02, 2024 at 09:47:25PM +0300, Andy Shevchenko wrote:
> > On Thu, May 2, 2024 at 9:40=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.o=
rg> wrote:
> > > On Tue, Apr 30, 2024 at 06:17:45PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Apr 30, 2024 at 04:05:07PM +0200, Marek Beh=C3=BAn wrote:
> > > > > On Tue, 30 Apr 2024 15:53:51 +0300
> > > > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > > On Tue, Apr 30, 2024 at 2:51=E2=80=AFPM Marek Beh=C3=BAn <kabel=
@kernel.org> wrote:

...

> > > > > > > +static int omnia_get_version_hash(struct omnia_mcu *mcu, boo=
l bootloader,
> > > > > > > +                                 u8 version[static OMNIA_FW_=
VERSION_HEX_LEN])
> > > > > >
> > > > > > Interesting format of the last parameter. Does it make any diff=
erence
> > > > > > to the compiler if you use u8 *version?
> > > > >
> > > > > The compiler will warn if an array with not enough space is passe=
d as
> > > > > argument.
> > > >
> > > > Really?
> > >
> > > Indeed:
> > >
> > >   extern void a(char *x);
> > >
> > >   static void b(char x[static 10]) {
> > >       a(x);
> > >   }
> > >
> > >   void c(void) {
> > >       char x[5] =3D "abcd";
> >
> > >       b(x);
> >
> > It's not the example I was talking about. Here should be a(x).
>
> Somehow I got lost. Let's return to my function, where I have
>   int omnia_get_version_hash(..., u8 version[static 40]);
>
> and then I use this function:
>
>   u8 version[40];
>   omnia_get_version_hash(..., version);
>
> If somehow I made a mistake and declared the version array shorter:
>   u8 version[20];
>   omnia_get_version_hash(..., version);
> I would get a warning.

Yes. Would you get the same warning if you replace the parameter to a point=
er?

> So the purpose is to get warned if the compiler can prove that there is
> not enough space in the destination buffer.


--=20
With Best Regards,
Andy Shevchenko
