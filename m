Return-Path: <SRS0=nEAh=HQ=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABF3C4167B
	for <soc@archiver.kernel.org>; Tue,  5 Dec 2023 22:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 214B4C433C8; Tue,  5 Dec 2023 22:04:07 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5DCE4C433C7
	for <soc@kernel.org>; Tue,  5 Dec 2023 22:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5DCE4C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-67ac8e5566cso16201586d6.3
        for <soc@kernel.org>; Tue, 05 Dec 2023 14:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701813843; x=1702418643; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLkdwIzSkRdyJvWkuBYBl8NXAPFxbIdD1dlzt6dCueE=;
        b=N0V+SpKd4KQ5enk2V9mjy5woJsV0QhL/OVhKuA6Iw7P7q6NxR2GV0wzr8fDl9tALFy
         NHqXVBxDqCTB5jb/hF/qstqdcjMt99/3p3B9AychcNvrpg+pAomwrj9HiPT/CkHWNcl1
         2A9HNyghsaBc7OaEzhBtifEDPgC2Hy5YMVlbwG8fC8RdF7eJZqs+r36NyLlfNAU1TrIi
         GPqNOagA3II2qcFcuk6iufMFC2dTi4n9NV4Zy8blWxiNKPXp9ncP/4pvczGx6psF01mo
         CTqEXXs/ac7AUB8LSqQipeXPMFrvxAdXQLh6PhZYpHPaIx4jwEj0QzdDq2f5QbZfqHsx
         wwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701813843; x=1702418643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLkdwIzSkRdyJvWkuBYBl8NXAPFxbIdD1dlzt6dCueE=;
        b=ixHVNNuEiRwDT57jxmA2FlY+0AP2t6tnKnom+GOQfOMrCtPgLvTtVWa0evua+0K29E
         t0n7kzWRTbAmSHF5cUx7ZHJvZXHsNbhuuNsG5vNUt9mXIQ99PMqmWNRJ8CPnBet0R0VI
         rbgQQIqA8NDAWkvcXuCKppj9lJGYgQTGONhBP482Zb2v41hI60BkmfPKlKCRy1PWy5xp
         +W+nxEz2yy4bLuftMU5opFlPLDGGmmq9FKsSfhHTQlKe8290asAQw+gA/CMKb+o1CSdw
         OdWtu8OB3xLxA1aTaOMaScxXU8drd/SmnOzvIP0vM3K+D/znvU4+FIoxzZyuuCZ1ggtS
         FvHw==
X-Gm-Message-State: AOJu0YzbhI+lDXkd9uOcJLtlNfJ9PacyYJfIkE2vMo63II79UsDZI7LG
	QLwotKpguruqSzFU5Tt79wzIXRCYf7DmcULc2ugRzw==
X-Google-Smtp-Source: AGHT+IErwhru2UO/1eHXtSZq4qe6vdEPU3tHwbbh+WsPhY++retoRNq1NqNHFm94bagQ4+LqS0vzUYQ8jyi5KmPRCa4=
X-Received: by 2002:a0c:eb46:0:b0:67a:bae1:a48f with SMTP id
 c6-20020a0ceb46000000b0067abae1a48fmr1886783qvq.103.1701813843342; Tue, 05
 Dec 2023 14:04:03 -0800 (PST)
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-16-peter.griffin@linaro.org> <CAPLW+4=2aK-XJ69cTBzwhQF8s3E9in-NFkK3h43L7C+oieqyDg@mail.gmail.com>
In-Reply-To: <CAPLW+4=2aK-XJ69cTBzwhQF8s3E9in-NFkK3h43L7C+oieqyDg@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 5 Dec 2023 22:03:51 +0000
Message-ID: <CADrjBPreo1uXOksJ15AaiowGS8wf63DV6Q_phDvZzxoinVYjqQ@mail.gmail.com>
Subject: Re: [PATCH v5 15/20] watchdog: s3c2410_wdt: Add support for WTCON
 register DBGACK_MASK bit
To: Sam Protsenko <semen.protsenko@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Sat, 2 Dec 2023 at 00:53, Sam Protsenko <semen.protsenko@linaro.org> wro=
te:
>
> On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > The WDT uses the CPU core signal DBGACK to determine whether the SoC
> > is running in debug mode or not. If the DBGACK signal is asserted and
> > DBGACK_MASK bit is enabled, then WDT output and interrupt is masked
> > (disabled).
> >
> > Presence of the DBGACK_MASK bit is determined by adding a new
> > QUIRK_HAS_DBGACK_BIT quirk.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/watchdog/s3c2410_wdt.c | 27 ++++++++++++++++++++++++---
> >  1 file changed, 24 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_=
wdt.c
> > index 0b4bd883ff28..39f3489e41d6 100644
> > --- a/drivers/watchdog/s3c2410_wdt.c
> > +++ b/drivers/watchdog/s3c2410_wdt.c
> > @@ -34,9 +34,10 @@
> >
> >  #define S3C2410_WTCNT_MAXCNT   0xffff
> >
> > -#define S3C2410_WTCON_RSTEN    (1 << 0)
> > -#define S3C2410_WTCON_INTEN    (1 << 2)
> > -#define S3C2410_WTCON_ENABLE   (1 << 5)
> > +#define S3C2410_WTCON_RSTEN            (1 << 0)
> > +#define S3C2410_WTCON_INTEN            (1 << 2)
> > +#define S3C2410_WTCON_ENABLE           (1 << 5)
> > +#define S3C2410_WTCON_DBGACK_MASK      (1 << 16)
>
> Suggest using BIT() macro. Btw, checkpatch with --strict option
> suggests it too :)

Yes indeed. I was somewhat reluctant to include changes that had
nothing to do with the DBGACK feature but I will update to use the BIT
macro in v6.
>
> >
> >  #define S3C2410_WTCON_DIV16    (0 << 3)
> >  #define S3C2410_WTCON_DIV32    (1 << 3)
> > @@ -100,12 +101,17 @@
> >   * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_N=
ONCPU_OUT)
> >   * with "watchdog counter enable" bit. That bit should be set to make =
watchdog
> >   * counter running.
> > + *
> > + * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Setting =
the
> > + * DBGACK_MASK bit disables the watchdog outputs when the SoC is in de=
bug mode.
> > + * Debug mode is determined by the DBGACK CPU signal.
> >   */
> >  #define QUIRK_HAS_WTCLRINT_REG                 (1 << 0)
> >  #define QUIRK_HAS_PMU_MASK_RESET               (1 << 1)
> >  #define QUIRK_HAS_PMU_RST_STAT                 (1 << 2)
> >  #define QUIRK_HAS_PMU_AUTO_DISABLE             (1 << 3)
> >  #define QUIRK_HAS_PMU_CNT_EN                   (1 << 4)
> > +#define QUIRK_HAS_DBGACK_BIT                   (1 << 5)
> >
> >  /* These quirks require that we have a PMU register map */
> >  #define QUIRKS_HAVE_PMUREG \
> > @@ -375,6 +381,19 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *w=
dt, bool en)
> >         return 0;
> >  }
> >
> > +static void s3c2410wdt_mask_dbgack(struct s3c2410_wdt *wdt)
> > +{
> > +       unsigned long wtcon;
> > +
> > +       if (!(wdt->drv_data->quirks & QUIRK_HAS_DBGACK_BIT))
> > +               return;
> > +
> > +       /*  disable watchdog outputs if CPU is in debug mode */
>
> Double whitespace in the comment. Also, I'd move this comment up to
> the function declaration.

Will fix

>
> Other than that:
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

Thanks,

Peter
>
> > +       wtcon =3D readl(wdt->reg_base + S3C2410_WTCON);
> > +       wtcon |=3D S3C2410_WTCON_DBGACK_MASK;
> > +       writel(wtcon, wdt->reg_base + S3C2410_WTCON);
> > +}
> > +
> >  static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
> >  {
> >         struct s3c2410_wdt *wdt =3D watchdog_get_drvdata(wdd);
> > @@ -700,6 +719,8 @@ static int s3c2410wdt_probe(struct platform_device =
*pdev)
> >         wdt->wdt_device.bootstatus =3D s3c2410wdt_get_bootstatus(wdt);
> >         wdt->wdt_device.parent =3D dev;
> >
> > +       s3c2410wdt_mask_dbgack(wdt);
> > +
> >         /*
> >          * If "tmr_atboot" param is non-zero, start the watchdog right =
now. Also
> >          * set WDOG_HW_RUNNING bit, so that watchdog core can kick the =
watchdog.
> > --
> > 2.43.0.rc2.451.g8631bc7472-goog
> >
