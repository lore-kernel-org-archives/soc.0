Return-Path: <SRS0=Zczl=HN=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B052C4167B
	for <soc@archiver.kernel.org>; Sat,  2 Dec 2023 01:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AA4DBC433D9; Sat,  2 Dec 2023 01:59:05 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 29CDEC433C8
	for <soc@kernel.org>; Sat,  2 Dec 2023 01:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 29CDEC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-58dd3528497so1638965eaf.3
        for <soc@kernel.org>; Fri, 01 Dec 2023 17:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701482343; x=1702087143; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKW8AARa2rBh8AkUnRrMxneVAMkSWeexqM6ylc8U14k=;
        b=hc8UiScZ4Gt2G+iZtcvCQxKTy/h9dSuQtXB6OPkkxzBlkOQBo+Tm17Amad+U96Trf8
         bvSKt+EftA1s3Q/e3fEuLN/fMG3FvUBHLFGjWcSnX+WcUhd3dfqHKXLcnlb3YueGVrdz
         jnXEG6jyuG823PN9PLWA9cJkimnJfnz1IjpVh7Rm5dxSUYBKQ6jPCTkJBeMDm5Yut0Cm
         f56rSvocSLybMo2eKTANp4c0FFd5DK7n7HvdoojUwgg5B7/JEIm2tWivLkt4kveVayQC
         +yex2ZRT7iP1h1ZEkd8cHHMMZ2v7LBai76mSgAuPgm3vtuvNlHrFvtq96dlqj6HuX5qi
         GMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701482343; x=1702087143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKW8AARa2rBh8AkUnRrMxneVAMkSWeexqM6ylc8U14k=;
        b=eEDEop4BhjHOFP1+DpkMY0U08FoaL0Zr11YmwQQE50RC2OnVVoS1kJN1Zz97uns2Gz
         VCZWy6U4xGsdd/FxWBz5rv93bMhNJUbLIF/3zhfUF1CJS1l2O4rIggLlmEEQl6m+srHy
         Y/SN0dj3g0WC+Xt8sbnfzvqtgSqfwWDTwouw+g7Y7Hx7RY6S2wsQKzEXrqltVvVBzr0u
         QGoxSidFVKR9roSdF66idteow2UBTizULBbzBS7/IN5G9Hpf86gYFep6AwHte7ta4m54
         Q/e4Eldi8e+drsTEUtRUeBEMLk3pYVnAdJ8VUS24R9XIbKjtDb/Uq97sS61PnJYGVR0+
         3rNg==
X-Gm-Message-State: AOJu0Ywkb8NEkzoRrW4g3Zxp6DNoXQSZsaSkLiouljRObID2xljxlB/W
	rvHJiWErro6Aef3BJxcs84AQEHIVLMHRzi1Og6xc3A==
X-Google-Smtp-Source: AGHT+IEmaypBUAU4k3Y4/7axsxc8VYRkLEuyHYlfN4wqGcPrNgMS6965Dk435KeJRUEpfpCOlt7Y2NmlbUKeIXQ2kGM=
X-Received: by 2002:a05:6358:2911:b0:16d:bc0b:836 with SMTP id
 y17-20020a056358291100b0016dbc0b0836mr615554rwb.19.1701482343090; Fri, 01 Dec
 2023 17:59:03 -0800 (PST)
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-15-peter.griffin@linaro.org> <CGME20231202004026epcas5p4d3947d7bb99e54f70ca37272cfdc5e55@epcas5p4.samsung.com>
 <CAPLW+4kBOWFPx3Hr-=UoLWvRxCorzBY9RCOiBhfkKcU0LAa21Q@mail.gmail.com> <000001da24c0$0b83aab0$228b0010$@samsung.com>
In-Reply-To: <000001da24c0$0b83aab0$228b0010$@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Dec 2023 19:58:52 -0600
Message-ID: <CAPLW+4mJ8yEwC8iJdhbiDC8sikAb1BMtGs_OLAAHczkE6U+J=w@mail.gmail.com>
Subject: Re: [PATCH v5 14/20] pinctrl: samsung: Add gs101 SoC pinctrl configuration
To: Alim Akhtar <alim.akhtar@samsung.com>
List-Id: <soc.lore.kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, 
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com, 
	s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org, 
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	olof@lixom.net, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	cw00.choi@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 7:37=E2=80=AFPM Alim Akhtar <alim.akhtar@samsung.com=
> wrote:
>
>
>
> > -----Original Message-----
> > From: Sam Protsenko <semen.protsenko@linaro.org>
> > Sent: Saturday, December 2, 2023 6:10 AM
> > To: Peter Griffin <peter.griffin@linaro.org>
> > Cc: robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > mturquette@baylibre.com; conor+dt@kernel.org; sboyd@kernel.org;
> > tomasz.figa@gmail.com; s.nawrocki@samsung.com; linus.walleij@linaro.org=
;
> > wim@linux-watchdog.org; linux@roeck-us.net; catalin.marinas@arm.com;
> > will@kernel.org; arnd@arndb.de; olof@lixom.net;
> > gregkh@linuxfoundation.org; jirislaby@kernel.org;
> > cw00.choi@samsung.com; alim.akhtar@samsung.com;
> > tudor.ambarus@linaro.org; andre.draszik@linaro.org;
> > saravanak@google.com; willmcvicker@google.com; soc@kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux=
-
> > samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-
> > gpio@vger.kernel.org; linux-watchdog@vger.kernel.org; kernel-
> > team@android.com; linux-serial@vger.kernel.org
> > Subject: Re: [PATCH v5 14/20] pinctrl: samsung: Add gs101 SoC pinctrl
> > configuration
> >
> > On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@li=
naro.org>
> > wrote:
> > >
> > > Add support for the pin-controller found on the gs101 SoC used in
> > > Pixel 6 phones.
> > >
> > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > ---
> > >  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 159 ++++++++++++++++=
++
> > >  drivers/pinctrl/samsung/pinctrl-exynos.c      |   2 +
> > >  drivers/pinctrl/samsung/pinctrl-exynos.h      |  34 ++++
> > >  drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
> > >  drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
> > >  5 files changed, 198 insertions(+)
> > >
> > > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > > b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > > index cb965cf93705..e1a0668ecb16 100644
> > > --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > > +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > > @@ -796,3 +796,162 @@ const struct samsung_pinctrl_of_match_data
> > fsd_of_data __initconst =3D {
> > >         .ctrl           =3D fsd_pin_ctrl,
> > >         .num_ctrl       =3D ARRAY_SIZE(fsd_pin_ctrl),
> > >  };
> > > +
> > > +/*
> > > + * bank type for non-alive type
> > > + * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit
> > > +field: 4)
> > > + * (CONPDN bit field: 2, PUDPDN bit field: 4)  */ static struct
> > > +samsung_pin_bank_type gs101_bank_type_off  =3D {
> > > +       .fld_width =3D { 4, 1, 4, 4, 2, 4, },
> > > +       .reg_offset =3D { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, }, };
> >
> > This is just the same as exynos850_bank_type_off (100% duplication).
> > Here is what I suggest. Now that it's obvious there is some common plat=
form
> > for moder Exynos SoCs, and it's probably Exynos9, I'd suggest next cour=
se of
> > action (if maintainers agree):
> >   1. Remove this one
> >   2. Rename exynos850_bank_type_off to exynos9_bank_type_off
> >   3. Use it for both gs101 and exynos850
> >
> > Does it make sense?
> >
> My opinion is to reuse exynos850 for gs101 (wherever applicable), same ph=
ilosophy was historically followed in this file.
> That way (using exynos850 for gs101) things will be simple.
> Adding exynos9_* is not adding any benefit, rather it create confusion.
>

Yes. But why not also rename exynos850_* to exynos9_*? I've a feeling
that a lot of modern Exynos SoCs have the same pin bank configuration.
Wouldn't it be better to use exynos9_ prefix for all such SoCs than
exynos850_*? Because Exynos9 is a family, but Exynos850 is a
particular SoC from that family.

> > > +
> > > +/*
> > > + * bank type for alive type
> > > + * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit
> > > +field: 4)  */ static const struct samsung_pin_bank_type
> > > +gs101_bank_type_alive =3D {
> > > +       .fld_width =3D { 4, 1, 4, 4, },
> > > +       .reg_offset =3D { 0x00, 0x04, 0x08, 0x0c, }, };
> [...]
>
>
