Return-Path: <SRS0=ljdS=MI=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC14C4345F
	for <soc@archiver.kernel.org>; Sun,  5 May 2024 13:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11783C4AF68; Sun,  5 May 2024 13:35:08 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06152C113CC;
	Sun,  5 May 2024 13:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06152C113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a59ab4f60a6so193173666b.0;
        Sun, 05 May 2024 06:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714916105; x=1715520905; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPcqfr+g+bSXYm7pimJ3InvzS+CyypGlpNPh0xMs/rc=;
        b=MM4LEOEKjgxsnvlg8fpYYvuhP+VXKriUtAdvbitGEq9qe3QAnL2z2YXNOJCveepQqw
         AGRUBKF+8xstZyvpW3olXb1VKxt5zFXHdlX+vGHI0xMpkUhr1CqUWuGeDhx1nlbUqld+
         7+m075ViFSFHpa+3AoS34xa2ymqhFyE3jjRTJ9Hox5L8Xr2OEDSg6JaSaGAqy9OnBX04
         cGL1W4gHRk9mVEQ2BZ2niWR/nBQIop7DMv84Z6C9T6hTTAODtYLYJzoTjXbjp5XATIxC
         4nQdYOJe0N2ukwxbyirAP80hlcqEZHz+S6P/pLXIKqjdNhT40dyZR8QwDEN+wbk3c0jV
         GP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714916105; x=1715520905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPcqfr+g+bSXYm7pimJ3InvzS+CyypGlpNPh0xMs/rc=;
        b=JGP6N+d2w+/PddqdDx8eeNvAvvtyWyXfJrFa5GaTyoPr8aAEgZzrd3+k39e+vIORjH
         eVC279L5T54UNSBcWr5tCmeIR/5Y6+M5MqFZyy581RjDzu4ou/KVDDd0yBxsYAn8l5Vd
         ++EwUIooaDhJobfR7OKhRPwgzr1bOKTtLAwuZUNfJgePfgJm2px2vKUtA/lKt5nM7WSl
         exEzIgK7WjKyys2h8alVyTnwaIPT4onfs/kYvY/ipXOk53ipSw72HgHQthReug3xwKtJ
         /8tvCnCJeQCFbwKUP6r7ZAMHEM4IXBQGtuFeLy4+CUFDZvt2MsLaTGOWRGFmlhbzRYkQ
         nQJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoiq4sevGyKk2JGT9sFpW0rqv4omUtkTkZG7jN7AK+SMG/dIjubiieAKnNTLHRfsl07c2NO0NIkoIPZySJyEnIHuiLtqrzbiIhRTuBTNM=
X-Gm-Message-State: AOJu0YzZKzUlregJ72XluzbdSYJKya73i1SLAdfX8kQGQmZ+jjFYCEFA
	tPt8hmOgaUKEZaDXEcYTp5T0kvjCSJzpYVs3dh8bOBGpfl+CL4et/fnnZNFmKO4Wyxn7YV1038g
	zfjc2N9vg9H2tvKy6QpUfCPkBfgTVKR58
X-Google-Smtp-Source: AGHT+IGVMzODczjSb3xYifmUIjM97SrQLtGh7kNjX1SuDadTH6xGpEbH9YZyMj+ajPCbWymnZ+I+P2vRO2HVR89KP4o=
X-Received: by 2002:a17:906:608d:b0:a58:7ea5:c49b with SMTP id
 t13-20020a170906608d00b00a587ea5c49bmr6427702ejj.42.1714916104913; Sun, 05
 May 2024 06:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240430115111.3453-1-kabel@kernel.org> <20240430115111.3453-4-kabel@kernel.org>
 <CAHp75VdV_JmbS1pM11Pf8S5vWU8X1FrKpw3aAtTHK0tsLua5fg@mail.gmail.com>
 <20240503082714.ow5qtqu2myi3z2ug@kandell> <ZjUyJSuGthKH0q4q@smile.fi.intel.com>
 <20240505081832.vf2267v37shu6fhe@kandell>
In-Reply-To: <20240505081832.vf2267v37shu6fhe@kandell>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 5 May 2024 16:34:28 +0300
Message-ID: <CAHp75VcDi5hbG3wzygBJ=iGteVrzJp08sKD0cJyS1vvkx8fo6Q@mail.gmail.com>
Subject: Re: [PATCH v8 3/9] platform: cznic: turris-omnia-mcu: Add support for
 MCU connected GPIOs
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 5, 2024 at 11:18=E2=80=AFAM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
> On Fri, May 03, 2024 at 09:51:17PM +0300, Andy Shevchenko wrote:
> > On Fri, May 03, 2024 at 10:28:17AM +0200, Marek Beh=C3=BAn wrote:
> > > On Fri, May 03, 2024 at 07:05:34AM +0300, Andy Shevchenko wrote:
> > > > On Tue, Apr 30, 2024 at 2:51=E2=80=AFPM Marek Beh=C3=BAn <kabel@ker=
nel.org> wrote:

...

> > > > > +static const char * const omnia_mcu_gpio_templates[64] =3D {
> > > > > +       /* GPIOs with value read from the 16-bit wide status */
> > > > > +       [4]  =3D "gpio%u.MiniPCIe0 Card Detect",
> > > > > +       [5]  =3D "gpio%u.MiniPCIe0 mSATA Indicator",
> > > > > +       [6]  =3D "gpio%u.Front USB3 port over-current",
> > > > > +       [7]  =3D "gpio%u.Rear USB3 port over-current",
> > > > > +       [8]  =3D "gpio%u.Front USB3 port power",
> > > > > +       [9]  =3D "gpio%u.Rear USB3 port power",
> > > > > +       [12] =3D "gpio%u.Front Button",
> > > > > +
> > > > > +       /* GPIOs with value read from the 32-bit wide extended st=
atus */
> > > > > +       [16] =3D "gpio%u.SFP nDET",
> > > > > +       [28] =3D "gpio%u.MiniPCIe0 LED",
> > > > > +       [29] =3D "gpio%u.MiniPCIe1 LED",
> > > > > +       [30] =3D "gpio%u.MiniPCIe2 LED",
> > > > > +       [31] =3D "gpio%u.MiniPCIe0 PAN LED",
> > > > > +       [32] =3D "gpio%u.MiniPCIe1 PAN LED",
> > > > > +       [33] =3D "gpio%u.MiniPCIe2 PAN LED",
> > > > > +       [34] =3D "gpio%u.WAN PHY LED0",
> > > > > +       [35] =3D "gpio%u.WAN PHY LED1",
> > > > > +       [36] =3D "gpio%u.LAN switch p0 LED0",
> > > > > +       [37] =3D "gpio%u.LAN switch p0 LED1",
> > > > > +       [38] =3D "gpio%u.LAN switch p1 LED0",
> > > > > +       [39] =3D "gpio%u.LAN switch p1 LED1",
> > > > > +       [40] =3D "gpio%u.LAN switch p2 LED0",
> > > > > +       [41] =3D "gpio%u.LAN switch p2 LED1",
> > > > > +       [42] =3D "gpio%u.LAN switch p3 LED0",
> > > > > +       [43] =3D "gpio%u.LAN switch p3 LED1",
> > > > > +       [44] =3D "gpio%u.LAN switch p4 LED0",
> > > > > +       [45] =3D "gpio%u.LAN switch p4 LED1",
> > > > > +       [46] =3D "gpio%u.LAN switch p5 LED0",
> > > > > +       [47] =3D "gpio%u.LAN switch p5 LED1",
> > > > > +
> > > > > +       /* GPIOs with value read from the 16-bit wide extended co=
ntrol status */
> > > > > +       [48] =3D "gpio%u.eMMC nRESET",
> > > > > +       [49] =3D "gpio%u.LAN switch nRESET",
> > > > > +       [50] =3D "gpio%u.WAN PHY nRESET",
> > > > > +       [51] =3D "gpio%u.MiniPCIe0 nPERST",
> > > > > +       [52] =3D "gpio%u.MiniPCIe1 nPERST",
> > > > > +       [53] =3D "gpio%u.MiniPCIe2 nPERST",
> > > > > +       [54] =3D "gpio%u.WAN PHY SFP mux",
> > > > > +};
> > > >
> > > > You may reduce the memory footprint of these just by doing "gpio%u.=
"
> > > > part(s) outside. Here compiler won't compress this (as in the case =
of
> > > > repetitive string literals),
> > >
> > > Are you saying that I should dynamically create another array just to
> > > pass it to the gpiochip's names pointer?
> >
> > I have looked into this again and now I'm puzzled how you tested this.
> > To me it seems that those gpio%u will go as a fixed string to the user =
space,
> > there is no %u --> number substitution happens. Moreover, this data any=
way
> > is redundant. Userspace and debugfs all have line numbers being printed=
.
> >
>
> It gets substituted in drivers/gpio/gpiolib-sysfs.c, function
> gpiod_export():
>
>   dev =3D device_create_with_groups(&gpio_class, &gdev->dev,
>                                   MKDEV(0, 0), data, gpio_groups,
>                                   ioname ? ioname : "gpio%u",
>                                   desc_to_gpio(desc));
>
> The ioname variable contains the string.
>
> This is then visible in sysfs:
>
>   $ cd /sys/class/gpio
>   $ echo 560 >export
>   $ ls
>   ...
>   gpio560.eMMC nRESET
>   ...

Interesting. But before giving my conclusion on this, what is the
output of /sys/kernel/debug/gpio and `gpioinfo` (the latter from
libgpiod)?

--=20
With Best Regards,
Andy Shevchenko
