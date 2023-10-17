Return-Path: <SRS0=tRV6=F7=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26103CDB482
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 21:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D11B6C433C7; Tue, 17 Oct 2023 21:39:45 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6AB27C433D9
	for <soc@kernel.org>; Tue, 17 Oct 2023 21:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6AB27C433D9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5a81ab75f21so59665817b3.2
        for <soc@kernel.org>; Tue, 17 Oct 2023 14:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697578781; x=1698183581; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmISP2S8U1A5twlDYRxsFXqdw+RtYQyX+R3AByezHEM=;
        b=dP7S73Xl8xTYb11XVa8onbuJlKTbkScdACu9frC3vKmfLD61NRC8xAJpCIhq00BP7s
         n8YYOxBMSTYcvSe6aSidWuJgXtQO+WDgcJcArkN4mZtN4M1hDMxzuDEnFDFOMn39neGg
         X0zqbjEpQk78KoRperyVcO+9Eqmd/XT1gu9cjBL2r4ZRBBmJN8nCtPlMH/lKyL6+9J2Z
         NtAGzVwM1PAg+HFyjFud9awB17rRI48FX9oSvmpJ5Mflb6cwUVZCAgZ+oKAqDlqcgMnH
         LA8hNx7sSdaxaKY5RAOMKcARSSTZqBQo4wpKcA//8Cg7B41ueR9aG9AkRCd8BNbEDrpR
         4ecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697578781; x=1698183581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmISP2S8U1A5twlDYRxsFXqdw+RtYQyX+R3AByezHEM=;
        b=JlDVL6OVjfUnj5jFQkS/7u78ap/FeNi0Kja77dJjg8LSmkMGwRcBOTmxnrbzfISWXx
         kzeBER418olhjLaIJfWuh7LvrrT0hPBMPHO+IMSjnY5m/BJhGWKfjOXpE1ouummMakZf
         doyHGzpVG2V6NI7ACkqtC5gt+trd8XZdnbjI8obpEUz/GIajAyjAPYCpFBdjp1otQLDV
         GZSRVOUhlTtuX1zsXk8OZGBv6hpuW+xKlTx83uGTtpmofbsTmc2OtQn9CJo7kqnvWEjK
         K+yMUgA6tKejaKJk2nww7swqcCUcNdGGgwgk7HpcGxhJoD2teLgWKSTkfvetmE+Yh77B
         xg2g==
X-Gm-Message-State: AOJu0YynMUdewlCB26d16vKddFegyn6CchiBa07vZVxgaDTKotW9DXGP
	++32PIOIUPVM7EE+p5+bbC9CRjOVfc6LzwYK1K/CJg==
X-Google-Smtp-Source: AGHT+IHua/KltsnqqGjl3PvYG28PrHHlXxn+OmvGp5scpAbn4tVbTxqp1NobPsPoOTBmA4Wh42mpIvAp9W/VQNZupVI=
X-Received: by 2002:a81:4996:0:b0:592:ffc:c787 with SMTP id
 w144-20020a814996000000b005920ffcc787mr3741095ywa.30.1697578781124; Tue, 17
 Oct 2023 14:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-16-peter.griffin@linaro.org> <CAPLW+4njAN595m_BEXXG4ykyY=BYWKOX8dxqKSGPRi9_FSMJgQ@mail.gmail.com>
In-Reply-To: <CAPLW+4njAN595m_BEXXG4ykyY=BYWKOX8dxqKSGPRi9_FSMJgQ@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 17 Oct 2023 22:39:30 +0100
Message-ID: <CADrjBPoCaOCf9TrxXgNKAPgbG0x+Qt4UfN0UJqXtnbv79w4JsA@mail.gmail.com>
Subject: Re: [PATCH v3 15/20] watchdog: s3c2410_wdt: Add support for Google
 tensor SoCs
To: Sam Protsenko <semen.protsenko@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	cw00.choi@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,

Thanks for your review.

On Thu, 12 Oct 2023 at 03:32, Sam Protsenko <semen.protsenko@linaro.org> wr=
ote:
>
> On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > This patch adds the compatibles and drvdata for the Google
> > gs101 & gs201 SoCs found in Pixel 6 and Pixel 7 phones. Similar
> > to Exynos850 it has two watchdog instances, one for each cluster
> > and has some control bits in PMU registers.
> >
> > The watchdog IP found in gs101 SoCs also supports a few
> > additional bits/features in the WTCON register which we add
> > support for and an additional register detailed below.
> >
> > dbgack-mask - Enables masking WDT interrupt and reset request
> > according to asserted DBGACK input
> >
> > windowed-mode - Enabled Windowed watchdog mode
> >
> > Windowed watchdog mode also has an additional register WTMINCNT.
> > If windowed watchdog is enabled and you reload WTCNT when the
> > value is greater than WTMINCNT, it prompts interrupt or reset
> > request as if the watchdog time has expired.
> >
>
> A couple of thoughts in addition to what Guenter said.
>
> From the description it looks like this patch should be split into 3 patc=
hes:
>   1. Add "dbgack" feature
>   2. Add "windowed mode" feature
>   3. Enable gsX01 support

Sure I can split it up like that in v4 if that is preferable. The most impo=
rtant
part atm is SoC support, as the watchdog is left enabled by the bootloader
so without this, the system resets after ~ 1 minute.

> Also, it's not clear if those features are mandatory for gsX01 wdt to
> function properly, or optional?

The features aren't mandatory, the watchdog works fine with windowed
mode disabled and the "dback" feature just affects the watchdog reset
behaviour when an external debug agent is used.

> From the code it looks like both
> dbgack and windowed mode will only affect gsX01 variants (because of
> quirk flags), but maybe the commit message should be more clear about
> that.

Sure I will be more verbose in the commit messages when I split it out into
separate patches

>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/watchdog/s3c2410_wdt.c | 127 ++++++++++++++++++++++++++++++---
> >  1 file changed, 116 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_=
wdt.c
> > index 0b4bd883ff28..36c170047180 100644
> > --- a/drivers/watchdog/s3c2410_wdt.c
> > +++ b/drivers/watchdog/s3c2410_wdt.c
> > @@ -31,12 +31,14 @@
> >  #define S3C2410_WTDAT          0x04
> >  #define S3C2410_WTCNT          0x08
> >  #define S3C2410_WTCLRINT       0x0c
> > -
> > +#define S3C2410_WTMINCNT       0x10
> >  #define S3C2410_WTCNT_MAXCNT   0xffff
> >
> > -#define S3C2410_WTCON_RSTEN    (1 << 0)
> > -#define S3C2410_WTCON_INTEN    (1 << 2)
> > -#define S3C2410_WTCON_ENABLE   (1 << 5)
> > +#define S3C2410_WTCON_RSTEN            (1 << 0)
> > +#define S3C2410_WTCON_INTEN            (1 << 2)
> > +#define S3C2410_WTCON_ENABLE           (1 << 5)
> > +#define S3C2410_WTCON_DBGACK_MASK      (1 << 16)
> > +#define S3C2410_WTCON_WINDOWED_WD      (1 << 20)
>
> Maybe use BIT() macro here?

I didn't use the BIT macro for my changes, as the rest of the driver
isn't currently using the BIT macro.

>
> >
> >  #define S3C2410_WTCON_DIV16    (0 << 3)
> >  #define S3C2410_WTCON_DIV32    (1 << 3)
> > @@ -51,6 +53,7 @@
> >
> >  #define S3C2410_WATCHDOG_ATBOOT                (0)
> >  #define S3C2410_WATCHDOG_DEFAULT_TIME  (15)
> > +#define S3C2410_WINDOW_MULTIPLIER      2
> >
> >  #define EXYNOS5_RST_STAT_REG_OFFSET            0x0404
> >  #define EXYNOS5_WDT_DISABLE_REG_OFFSET         0x0408
> > @@ -67,6 +70,13 @@
> >  #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT     25
> >  #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT     24
> >
> > +#define GS_CLUSTER0_NONCPU_OUT                 0x1220
> > +#define GS_CLUSTER1_NONCPU_OUT                 0x1420
> > +#define GS_CLUSTER0_NONCPU_INT_EN              0x1244
> > +#define GS_CLUSTER1_NONCPU_INT_EN              0x1444
> > +#define GS_CLUSTER2_NONCPU_INT_EN              0x1644
> > +#define GS_RST_STAT_REG_OFFSET                 0x3B44
>
> Please move those to the section above, where similar registers are
> described for other SoCs.

Will fix.

>
> > +
> >  /**
> >   * DOC: Quirk flags for different Samsung watchdog IP-cores
> >   *
> > @@ -106,6 +116,8 @@
> >  #define QUIRK_HAS_PMU_RST_STAT                 (1 << 2)
> >  #define QUIRK_HAS_PMU_AUTO_DISABLE             (1 << 3)
> >  #define QUIRK_HAS_PMU_CNT_EN                   (1 << 4)
> > +#define QUIRK_HAS_DBGACK_BIT                   (1 << 5)
> > +#define QUIRK_HAS_WTMINCNT_REG                 (1 << 6)
>
> Please also document those two quirks in the kernel-doc comment above.
> Btw, the comment correctness can be checked like this:
>
>     $ scripts/kernel-doc -v -none drivers/watchdog/s3c2410_wdt.c
>
> or without "-none" option to see how the comment is parsed by kernel-doc.

Will do, and thanks for the kernel-doc hint!

>
> >
> >  /* These quirks require that we have a PMU register map */
> >  #define QUIRKS_HAVE_PMUREG \
> > @@ -263,6 +275,54 @@ static const struct s3c2410_wdt_variant drv_data_e=
xynosautov9_cl1 =3D {
> >                   QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> >  };
> >
> > +static const struct s3c2410_wdt_variant drv_data_gs101_cl0 =3D {
> > +       .mask_reset_reg =3D GS_CLUSTER0_NONCPU_INT_EN,
> > +       .mask_bit =3D 2,
> > +       .mask_reset_inv =3D true,
> > +       .rst_stat_reg =3D GS_RST_STAT_REG_OFFSET,
> > +       .rst_stat_bit =3D 0,
> > +       .cnt_en_reg =3D GS_CLUSTER0_NONCPU_OUT,
> > +       .cnt_en_bit =3D 8,
> > +       .quirks =3D QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET |=
 QUIRK_HAS_PMU_CNT_EN |
>
> Here and further: please stick to 80 characters per line when possible.

Will fix

>
> > +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK=
_HAS_WTMINCNT_REG,
> > +};
> > +
> > +static const struct s3c2410_wdt_variant drv_data_gs101_cl1 =3D {
> > +       .mask_reset_reg =3D GS_CLUSTER1_NONCPU_INT_EN,
> > +       .mask_bit =3D 2,
> > +       .mask_reset_inv =3D true,
> > +       .rst_stat_reg =3D GS_RST_STAT_REG_OFFSET,
> > +       .rst_stat_bit =3D 1,
> > +       .cnt_en_reg =3D GS_CLUSTER1_NONCPU_OUT,
> > +       .cnt_en_bit =3D 7,
> > +       .quirks =3D QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET |=
 QUIRK_HAS_PMU_CNT_EN |
> > +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK=
_HAS_WTMINCNT_REG,
> > +};
> > +
> > +static const struct s3c2410_wdt_variant drv_data_gs201_cl0 =3D {
> > +       .mask_reset_reg =3D GS_CLUSTER0_NONCPU_INT_EN,
> > +       .mask_bit =3D 2,
> > +       .mask_reset_inv =3D true,
> > +       .rst_stat_reg =3D GS_RST_STAT_REG_OFFSET,
> > +       .rst_stat_bit =3D 0,
> > +       .cnt_en_reg =3D GS_CLUSTER0_NONCPU_OUT,
> > +       .cnt_en_bit =3D 8,
> > +       .quirks =3D QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET |=
 QUIRK_HAS_PMU_CNT_EN |
> > +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK=
_HAS_WTMINCNT_REG,
> > +};
> > +
> > +static const struct s3c2410_wdt_variant drv_data_gs201_cl1 =3D {
> > +       .mask_reset_reg =3D GS_CLUSTER1_NONCPU_INT_EN,
> > +       .mask_bit =3D 2,
> > +       .mask_reset_inv =3D true,
> > +       .rst_stat_reg =3D GS_RST_STAT_REG_OFFSET,
> > +       .rst_stat_bit =3D 1,
> > +       .cnt_en_reg =3D GS_CLUSTER1_NONCPU_OUT,
> > +       .cnt_en_bit =3D 7,
> > +       .quirks =3D QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET |=
 QUIRK_HAS_PMU_CNT_EN |
> > +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK=
_HAS_WTMINCNT_REG,
> > +};
> > +
> >  static const struct of_device_id s3c2410_wdt_match[] =3D {
> >         { .compatible =3D "samsung,s3c2410-wdt",
> >           .data =3D &drv_data_s3c2410 },
> > @@ -278,6 +338,10 @@ static const struct of_device_id s3c2410_wdt_match=
[] =3D {
> >           .data =3D &drv_data_exynos850_cl0 },
> >         { .compatible =3D "samsung,exynosautov9-wdt",
> >           .data =3D &drv_data_exynosautov9_cl0 },
> > +       { .compatible =3D "google,gs101-wdt",
> > +         .data =3D &drv_data_gs101_cl0 },
> > +       { .compatible =3D "google,gs201-wdt",
> > +         .data =3D &drv_data_gs201_cl0 },
> >         {},
> >  };
> >  MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
> > @@ -375,6 +439,21 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *w=
dt, bool en)
> >         return 0;
> >  }
> >
> > +static void s3c2410wdt_mask_dbgack(struct s3c2410_wdt *wdt, bool mask)
> > +{
> > +       unsigned long wtcon;
> > +
> > +       if (!(wdt->drv_data->quirks & QUIRK_HAS_DBGACK_BIT))
> > +               return;
> > +
> > +       wtcon =3D readl(wdt->reg_base + S3C2410_WTCON);
> > +       if (mask)
> > +               wtcon |=3D S3C2410_WTCON_DBGACK_MASK;
> > +       else
> > +               wtcon &=3D ~S3C2410_WTCON_DBGACK_MASK;
> > +       writel(wtcon, wdt->reg_base + S3C2410_WTCON);
> > +}
> > +
> >  static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
> >  {
> >         struct s3c2410_wdt *wdt =3D watchdog_get_drvdata(wdd);
> > @@ -410,7 +489,7 @@ static int s3c2410wdt_stop(struct watchdog_device *=
wdd)
> >
> >  static int s3c2410wdt_start(struct watchdog_device *wdd)
> >  {
> > -       unsigned long wtcon;
> > +       unsigned long wtcon, wtmincnt;
> >         struct s3c2410_wdt *wdt =3D watchdog_get_drvdata(wdd);
> >         unsigned long flags;
> >
> > @@ -432,6 +511,12 @@ static int s3c2410wdt_start(struct watchdog_device=
 *wdd)
> >         dev_dbg(wdt->dev, "Starting watchdog: count=3D0x%08x, wtcon=3D%=
08lx\n",
> >                 wdt->count, wtcon);
> >
> > +       if (wdt->drv_data->quirks & QUIRK_HAS_WTMINCNT_REG) {
> > +               wtcon |=3D S3C2410_WTCON_WINDOWED_WD;
> > +               wtmincnt =3D wdt->count * S3C2410_WINDOW_MULTIPLIER;
> > +               writel(wtmincnt, wdt->reg_base + S3C2410_WTMINCNT);
> > +       }
> > +
> >         writel(wdt->count, wdt->reg_base + S3C2410_WTDAT);
> >         writel(wdt->count, wdt->reg_base + S3C2410_WTCNT);
> >         writel(wtcon, wdt->reg_base + S3C2410_WTCON);
> > @@ -447,7 +532,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog=
_device *wdd,
> >         unsigned long freq =3D s3c2410wdt_get_freq(wdt);
> >         unsigned int count;
> >         unsigned int divisor =3D 1;
> > -       unsigned long wtcon;
> > +       unsigned long wtcon, wtmincnt;
> >
> >         if (timeout < 1)
> >                 return -EINVAL;
> > @@ -478,6 +563,11 @@ static int s3c2410wdt_set_heartbeat(struct watchdo=
g_device *wdd,
> >         count =3D DIV_ROUND_UP(count, divisor);
> >         wdt->count =3D count;
> >
> > +       if (wdt->drv_data->quirks & QUIRK_HAS_WTMINCNT_REG) {
> > +               wtmincnt =3D count * S3C2410_WINDOW_MULTIPLIER;
> > +               writel(wtmincnt, wdt->reg_base + S3C2410_WTMINCNT);
> > +       }
> > +
> >         /* update the pre-scaler */
> >         wtcon =3D readl(wdt->reg_base + S3C2410_WTCON);
> >         wtcon &=3D ~S3C2410_WTCON_PRESCALE_MASK;
> > @@ -496,14 +586,20 @@ static int s3c2410wdt_restart(struct watchdog_dev=
ice *wdd, unsigned long action,
> >  {
> >         struct s3c2410_wdt *wdt =3D watchdog_get_drvdata(wdd);
> >         void __iomem *wdt_base =3D wdt->reg_base;
> > +       unsigned long wtcon;
> >
> >         /* disable watchdog, to be safe  */
> >         writel(0, wdt_base + S3C2410_WTCON);
> >
> >         /* put initial values into count and data */
> > +       if (wdt->drv_data->quirks & QUIRK_HAS_WTMINCNT_REG)
> > +               writel(0x100, wdt_base + S3C2410_WTMINCNT);
> >         writel(0x80, wdt_base + S3C2410_WTCNT);
> >         writel(0x80, wdt_base + S3C2410_WTDAT);
> >
> > +       if (wdt->drv_data->quirks & QUIRK_HAS_WTMINCNT_REG)
> > +               wtcon |=3D S3C2410_WTCON_WINDOWED_WD;
> > +
> >         /* set the watchdog to go and reset... */
> >         writel(S3C2410_WTCON_ENABLE | S3C2410_WTCON_DIV16 |
> >                 S3C2410_WTCON_RSTEN | S3C2410_WTCON_PRESCALE(0x20),
> > @@ -585,9 +681,11 @@ s3c2410_get_wdt_drv_data(struct platform_device *p=
dev, struct s3c2410_wdt *wdt)
> >         }
> >
> >  #ifdef CONFIG_OF
> > -       /* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster ind=
ex */
> > +       /* Choose Exynos850/ExynosAutov9/gsx01 driver data w.r.t. clust=
er index */
>
> Please keep 80 characters per line.

Will fix

regards,

Peter
>
> >         if (variant =3D=3D &drv_data_exynos850_cl0 ||
> > -           variant =3D=3D &drv_data_exynosautov9_cl0) {
> > +           variant =3D=3D &drv_data_exynosautov9_cl0 ||
> > +           variant =3D=3D &drv_data_gs101_cl0 ||
> > +           variant =3D=3D &drv_data_gs201_cl0) {
> >                 u32 index;
> >                 int err;
> >
> > @@ -600,9 +698,14 @@ s3c2410_get_wdt_drv_data(struct platform_device *p=
dev, struct s3c2410_wdt *wdt)
> >                 case 0:
> >                         break;
> >                 case 1:
> > -                       variant =3D (variant =3D=3D &drv_data_exynos850=
_cl0) ?
> > -                               &drv_data_exynos850_cl1 :
> > -                               &drv_data_exynosautov9_cl1;
> > +                       if (variant =3D=3D &drv_data_exynos850_cl0)
> > +                               variant =3D &drv_data_exynos850_cl1;
> > +                       else if (variant =3D=3D &drv_data_exynosautov9_=
cl0)
> > +                               variant =3D &drv_data_exynosautov9_cl1;
> > +                       else if (variant =3D=3D &drv_data_gs101_cl0)
> > +                               variant =3D &drv_data_gs101_cl1;
> > +                       else if (variant =3D=3D &drv_data_gs201_cl0)
> > +                               variant =3D &drv_data_gs201_cl1;
> >                         break;
> >                 default:
> >                         return dev_err_probe(dev, -EINVAL, "wrong clust=
er index: %u\n", index);
> > @@ -700,6 +803,8 @@ static int s3c2410wdt_probe(struct platform_device =
*pdev)
> >         wdt->wdt_device.bootstatus =3D s3c2410wdt_get_bootstatus(wdt);
> >         wdt->wdt_device.parent =3D dev;
> >
> > +       s3c2410wdt_mask_dbgack(wdt, true);
> > +
> >         /*
> >          * If "tmr_atboot" param is non-zero, start the watchdog right =
now. Also
> >          * set WDOG_HW_RUNNING bit, so that watchdog core can kick the =
watchdog.
> > --
> > 2.42.0.655.g421f12c284-goog
> >
