Return-Path: <SRS0=nEAh=HQ=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93DEC4167B
	for <soc@archiver.kernel.org>; Tue,  5 Dec 2023 11:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B50D2C433C9; Tue,  5 Dec 2023 11:34:34 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40527C433C7
	for <soc@kernel.org>; Tue,  5 Dec 2023 11:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40527C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-67ad032559fso8464616d6.2
        for <soc@kernel.org>; Tue, 05 Dec 2023 03:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701776070; x=1702380870; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwtFK4uZk8YXwxxWxxu0bCEynVzQGRZAOw69ApxLFiQ=;
        b=S4XyoLNGMBbA+CbMOiV5JI4lXPn9Fmj1SVPSPTLNcIR57cqZqXp1kMdGLggKL01ZKS
         rloturv/HfZ58r+erqlKuizVCpr+Jm7w4J7NROdUPe1qn52AVPZvLX+vH9Fj7hr2Jk74
         zczY/h52xRnOJ+yEBSDZA0npqPYE07eM6fsHRmbj3gsXfYEIgmnj4P9yqInqG3DatbWt
         ZF8MZ379a1IMcuM+9j/VyAZ8DHPc7wpgAy+QHCGHQ6hkDKnMus2rzeZFc+qgug8h3Xte
         BV6/IqUMG7moyQwTtYI40a7pJ/XJ0nL2Uva0+M1FLu0micD83PoKV1Ce9+4FwK7/tJWp
         7D2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701776070; x=1702380870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwtFK4uZk8YXwxxWxxu0bCEynVzQGRZAOw69ApxLFiQ=;
        b=K7ehpJgGJ4xLI36Eu/omAt9f4m9WvaAt2JHOYLoXJRks/sH6wFWIOTlj38LNOf38kR
         4nF9oAdmgemb+L6F4bFh2jaWPiF54i0PlDpHBnKcKFZzkRA9bpfRClRSlNaTHsC64Y6l
         rlhNY3GShbSDy5OebKZXJdLB0cRoqPUwzyIDeSEtFl+irP0auceA8y4xN6y3GO2Aw7tZ
         j9NFeiz6n9tzy0pcBuB9zCCzadDTbnlM42HiI7nZWsR6fGQQJlNeDRxu3ZC+irI00zHe
         pQdME0HDkVvjhFdMXnZ7v4MWt4AXNO8YFp0VqI2xEdvMbXPpMAujKisRgcLd7lcLEj1r
         dtRg==
X-Gm-Message-State: AOJu0YxVIG2OOCYaSD0M6yyAjSXr4310PpSFnPwGFwX7Yo6VXooLuR8v
	6GuKB6JCe8VU4IsfdCzGPFPGk4QscFXEWpqvti7PRg==
X-Google-Smtp-Source: AGHT+IGx7N4HJp+W5DRsPvhVHmiYYxTg2xQR3uNUhGbspvlU5nXwTu6Ab40JkEXEQ/QdRnqcCARDEIeu+koLqGwogag=
X-Received: by 2002:ad4:44a3:0:b0:67a:509c:78af with SMTP id
 n3-20020ad444a3000000b0067a509c78afmr1430322qvt.60.1701776069546; Tue, 05 Dec
 2023 03:34:29 -0800 (PST)
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-14-peter.griffin@linaro.org> <CAPLW+4nJCabQhyGrTKZhKG40Z9ysRq7Zms413JrhZKzeYzad5w@mail.gmail.com>
In-Reply-To: <CAPLW+4nJCabQhyGrTKZhKG40Z9ysRq7Zms413JrhZKzeYzad5w@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 5 Dec 2023 11:34:18 +0000
Message-ID: <CADrjBPrq_CTzZsP+5cqpNkkyVYHu9Yey0AF+m4VxcSEz+Z+wrQ@mail.gmail.com>
Subject: Re: [PATCH v5 13/20] pinctrl: samsung: Add filter selection support
 for alive banks
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

Thanks for your review.

On Sat, 2 Dec 2023 at 00:22, Sam Protsenko <semen.protsenko@linaro.org> wro=
te:
>
> On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > Newer Exynos SoCs have a filter selection register on alive bank pins.
> > This allows the selection of a digital or delay filter for each pin. If
> > the filter selection register is not available then the default filter
> > (digital) is applied.
> >
> > On suspend we apply the analog filter to all pins in the bank (as the
> > digital filter relies on a clock). On resume the digital filter is
> > reapplied to all pins in the bank. The digital filter is working via
> > clock and has an adjustable filter delay register bitfield, whereas
> > the analog filter uses a fixed delay.
> >
> > The filter determines to what extent signal fluctuations received throu=
gh
> > the pad are considered glitches.
> >
> > The code path can be exercised using
> > echo mem > /sys/power/state
> > And then wake the device using a eint gpio
>
> Period.

Will fix

>
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/pinctrl/samsung/pinctrl-exynos.c  | 89 ++++++++++++++++++++++-
> >  drivers/pinctrl/samsung/pinctrl-exynos.h  |  7 ++
> >  drivers/pinctrl/samsung/pinctrl-samsung.c |  2 +
> >  drivers/pinctrl/samsung/pinctrl-samsung.h | 22 ++++++
> >  4 files changed, 119 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl=
/samsung/pinctrl-exynos.c
> > index 6b58ec84e34b..56fc11a1fe2f 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> > @@ -269,6 +269,71 @@ struct exynos_eint_gpio_save {
> >         u32 eint_mask;
> >  };
> >
> > +/*
> > + * Set the desired filter (digital or analog delay) to every pin in
> > + * the bank. Note the filter selection bitfield is only found on alive
> > + * banks. The filter determines to what extent signal fluctuations
> > + * received through the pad are considered glitches.
> > + */
> > +static void exynos_eint_flt_config(struct samsung_pinctrl_drv_data *d,
> > +                                  struct samsung_pin_bank *bank, int f=
ilter)
> > +{
> > +       unsigned int flt_reg, flt_con =3D 0;
> > +       unsigned int val, shift;
> > +       int i;
> > +       int loop_cnt;
> > +
> > +       /*
> > +        * The FLTCON register has the following layout
> > +        *
> > +        * BitfieldName[PinNum][Bit:Bit]
> > +        * FLT_EN[3][31] FLT_SEL[3][30] FLT_WIDTH[3][29:24]
> > +        * FLT_EN[2][23] FLT_SEL[2][22] FLT_WIDTH[2][21:16]
> > +        * FLT_EN[1][15] FLT_SEL[1][14] FLT_WIDTH[1][13:8]
> > +        * FLT_EN[0][7]  FLT_SEL[0][6]  FLT_WIDTH[0][5:0]
> > +        *
> > +        * FLT_EN       0x0 =3D Disable, 0x1=3DEnable
> > +        * FLT_SEL      0x0 =3D Delay filter, 0x1 Digital filter
> > +        * FLT_WIDTH    Filtering width. Valid when FLT_SEL is 0x1
> > +        */
> > +
> > +       flt_con |=3D EXYNOS9_FLTCON_EN;
> > +
> > +       if (filter)
> > +               flt_con |=3D EXYNOS9_FLTCON_DIGITAL;
> > +
> > +       flt_reg =3D EXYNOS_GPIO_EFLTCON_OFFSET + bank->fltcon_offset;
> > +
> > +       /*
> > +        * If nr_pins > 4, we should set FLTCON0 register fully.
> > +        * (pin0 ~ 3). So loop 4 times in case of FLTCON0.
> > +        */
> > +       if (bank->nr_pins > EXYNOS9_FLTCON_NR_PIN)
> > +               loop_cnt =3D EXYNOS9_FLTCON_NR_PIN;
> > +       else
> > +               loop_cnt =3D bank->nr_pins;
> > +
> > +       val =3D readl(d->virt_base + flt_reg);
> > +       for (i =3D 0; i < loop_cnt; i++) {
> > +               shift =3D i * EXYNOS9_FLTCON_LEN;
> > +               val &=3D ~(EXYNOS9_FLTCON_MASK << shift);
> > +               val |=3D (flt_con << shift);
> > +       }
> > +       writel(val, d->virt_base + flt_reg);
> > +
> > +       /* Loop for FLTCON1 pin 4 ~ 7 */
> > +       if (bank->nr_pins > EXYNOS9_FLTCON_NR_PIN) {
> > +               loop_cnt =3D (bank->nr_pins - EXYNOS9_FLTCON_NR_PIN);
> > +               val =3D readl(d->virt_base + flt_reg + 0x4);
> > +               for (i =3D 0; i < loop_cnt; i++) {
> > +                       shift =3D i * EXYNOS9_FLTCON_LEN;
> > +                       val &=3D ~(EXYNOS9_FLTCON_MASK << shift);
> > +                       val |=3D (flt_con << shift);
> > +               }
> > +               writel(val, d->virt_base + flt_reg + 0x4);
> > +       }
> > +}
> > +
>
> This whole function needs a refactoring. Do you think below code looks be=
tter?

Yes it does!
>
> 8<----------------------------------------------------------------->8
> static void exynos_eint_update_flt_reg(void __iomem *reg, int cnt, int co=
n)
> {
>     unsigned int val, shift;
>     int i;
>
>     val =3D readl(reg);
>     for (i =3D 0; i < cnt; i++) {
>         shift =3D i * EXYNOS9_FLTCON_LEN;
>         val &=3D ~(EXYNOS9_FLTCON_MASK << shift);
>         val |=3D con << shift;
>     }
>     writel(val, reg);
> }
>
> /*
>  * Set the desired filter (digital or analog delay) to every pin in the b=
ank.
>  * Note the filter selection bitfield is only found on alive banks. The f=
ilter
>  * determines to what extent signal fluctuations received through the pad=
 are
>  * considered glitches.
>  *
>  * The FLTCON register has the following layout:
>  *
>  *     BitfieldName[PinNum][Bit:Bit]
>  *     FLT_EN[3][31] FLT_SEL[3][30] FLT_WIDTH[3][29:24]
>  *     FLT_EN[2][23] FLT_SEL[2][22] FLT_WIDTH[2][21:16]
>  *     FLT_EN[1][15] FLT_SEL[1][14] FLT_WIDTH[1][13:8]
>  *     FLT_EN[0][7]  FLT_SEL[0][6]  FLT_WIDTH[0][5:0]
>  *
>  * FLT_EN    0x0 =3D Disable, 0x1 =3D Enable
>  * FLT_SEL    0x0 =3D Delay filter, 0x1 =3D Digital filter
>  * FLT_WIDTH    Filtering width. Valid when FLT_SEL is 0x1
>  */
> static void exynos_eint_flt_config(struct samsung_pinctrl_drv_data *d,
>                    struct samsung_pin_bank *bank, int filter)
> {
>     unsigned int off =3D EXYNOS_GPIO_EFLTCON_OFFSET + bank->fltcon_offset=
;
>     unsigned int con =3D EXYNOS9_FLTCON_EN | filter;
>     void __iomem *reg =3D d->virt_base + off;
>     u8 n =3D bank->nr_pins;
>
>     if (bank->fltcon_type =3D=3D FLT_DEFAULT)
>         return;
>
>     /*
>      * If nr_pins > 4, we should set FLTCON0 register fully (pin0~3).
>      * So loop 4 times in case of FLTCON0. Loop for FLTCON1 pin4~7.
>      */
>     if (n <=3D 4) {
>         exynos_eint_update_flt_reg(reg, n, con);
>     } else {
>         exynos_eint_update_flt_reg(reg, 4, con);
>         exynos_eint_update_flt_reg(reg + 0x4, n - 4, con);
>     }
> }
> 8<----------------------------------------------------------------->8
>
> (the code is only to illustrate the idea, I never tested it).

I can refactor it along those lines.

>
> >  /*
> >   * exynos_eint_gpio_init() - setup handling of external gpio interrupt=
s.
> >   * @d: driver data of samsung pinctrl driver.
> > @@ -321,6 +386,10 @@ __init int exynos_eint_gpio_init(struct samsung_pi=
nctrl_drv_data *d)
> >                         goto err_domains;
> >                 }
> >
> > +               /* Set Delay Analog Filter */
>
> The code below looks quite self-explanatory to. Maybe remove all
> comments like this? If you don't think exynos_eint_flt_config() is
> clear, maybe rename it to exynos_eint_set_filter().

Ok, I will update the function name to exynos_eint_set_filter() and
remove the comments.

>
> > +               if (bank->fltcon_type !=3D FLT_DEFAULT)
> > +                       exynos_eint_flt_config(d, bank,
> > +                                              EXYNOS9_FLTCON_DELAY);
>
> It fits the previous line just fine, no need to break the line.
>
> Also, if you use the refactored version of exynos_eint_flt_config() I
> mentioned above, you can drop all 'if' conditions like this.

Will fix

>
> >         }
> >
> >         return 0;
> > @@ -555,6 +624,11 @@ __init int exynos_eint_wkup_init(struct samsung_pi=
nctrl_drv_data *d)
> >                 if (bank->eint_type !=3D EINT_TYPE_WKUP)
> >                         continue;
> >
> > +               /* Set Digital Filter */
> > +               if (bank->fltcon_type !=3D FLT_DEFAULT)
> > +                       exynos_eint_flt_config(d, bank,
> > +                                              EXYNOS9_FLTCON_DIGITAL);
>
> Ditto: no need to break the line, remove the comment. If you use the
> refactored function, you can drop 'if'.

will fix

>
> > +
> >                 bank->irq_chip =3D devm_kmemdup(dev, irq_chip, sizeof(*=
irq_chip),
> >                                               GFP_KERNEL);
> >                 if (!bank->irq_chip) {
> > @@ -658,6 +732,7 @@ static void exynos_pinctrl_suspend_bank(
> >  void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
> >  {
> >         struct samsung_pin_bank *bank =3D drvdata->pin_banks;
> > +       struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> >         struct exynos_irq_chip *irq_chip =3D NULL;
> >         int i;
> >
> > @@ -665,6 +740,10 @@ void exynos_pinctrl_suspend(struct samsung_pinctrl=
_drv_data *drvdata)
> >                 if (bank->eint_type =3D=3D EINT_TYPE_GPIO)
> >                         exynos_pinctrl_suspend_bank(drvdata, bank);
> >                 else if (bank->eint_type =3D=3D EINT_TYPE_WKUP) {
> > +                       /* Setting Delay (Analog) Filter */
> > +                       if (bank->fltcon_type !=3D FLT_DEFAULT)
> > +                               exynos_eint_flt_config(d, bank,
> > +                                                      EXYNOS9_FLTCON_D=
ELAY);
>
> Ditto: no need to break the line, remove the comment. If you use the
> refactored function, you can drop 'if'.

Will fix
>
> >                         if (!irq_chip) {
> >                                 irq_chip =3D bank->irq_chip;
> >                                 irq_chip->set_eint_wakeup_mask(drvdata,
> > @@ -707,11 +786,19 @@ static void exynos_pinctrl_resume_bank(
> >  void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
> >  {
> >         struct samsung_pin_bank *bank =3D drvdata->pin_banks;
> > +       struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
> >         int i;
> >
> >         for (i =3D 0; i < drvdata->nr_banks; ++i, ++bank)
> > -               if (bank->eint_type =3D=3D EINT_TYPE_GPIO)
> > +               if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> >                         exynos_pinctrl_resume_bank(drvdata, bank);
> > +               } else if (bank->eint_type =3D=3D EINT_TYPE_WKUP ||
> > +                          bank->eint_type =3D=3D EINT_TYPE_WKUP_MUX) {
> > +                       /* Set Digital Filter */
> > +                       if (bank->fltcon_type !=3D FLT_DEFAULT)
> > +                               exynos_eint_flt_config(d, bank,
> > +                                                      EXYNOS9_FLTCON_D=
IGITAL);
>
> Ditto: remove the comment, and if you use the refactored function, you
> can drop 'if'; also there will be no need to break the line.

Will fix
>
> > +               }
> >  }
> >
> >  static void exynos_retention_enable(struct samsung_pinctrl_drv_data *d=
rvdata)
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl=
/samsung/pinctrl-exynos.h
> > index 3ac52c2cf998..e2799ff1b5e9 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> > @@ -50,6 +50,13 @@
> >
> >  #define EXYNOS_EINT_MAX_PER_BANK       8
> >  #define EXYNOS_EINT_NR_WKUP_EINT
>
> Maybe add an empty line here?

Will fix
>
> > +/* EINT filter configuration */
> > +#define EXYNOS9_FLTCON_EN              BIT(7)
> > +#define EXYNOS9_FLTCON_DIGITAL         BIT(6)
> > +#define EXYNOS9_FLTCON_DELAY           (0 << 6)
> > +#define EXYNOS9_FLTCON_MASK            0xff
> > +#define EXYNOS9_FLTCON_LEN             8
> > +#define EXYNOS9_FLTCON_NR_PIN          4
>
> I'd say drop this one and just hard-code it where needed?

Ok, will drop.

>
> >
> >  #define EXYNOS_PIN_BANK_EINTN(pins, reg, id)           \
> >         {                                               \
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctr=
l/samsung/pinctrl-samsung.c
> > index 79babbb39ced..50c360b4753a 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > @@ -1105,6 +1105,8 @@ samsung_pinctrl_get_soc_data(struct samsung_pinct=
rl_drv_data *d,
> >                 bank->eint_func =3D bdata->eint_func;
> >                 bank->eint_type =3D bdata->eint_type;
> >                 bank->eint_mask =3D bdata->eint_mask;
> > +               bank->fltcon_type =3D bdata->fltcon_type;
> > +               bank->fltcon_offset =3D bdata->fltcon_offset;
> >                 bank->eint_offset =3D bdata->eint_offset;
> >                 bank->name =3D bdata->name;
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctr=
l/samsung/pinctrl-samsung.h
> > index 9b3db50adef3..5fab3885a7d7 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> > @@ -82,6 +82,20 @@ enum eint_type {
> >         EINT_TYPE_WKUP_MUX,
> >  };
> >
> > +/**
> > + * enum fltcon_type - filter selection
> > + * @FLT_DEFAULT: filter not selectable, default digital filter
> > + * @FLT_SELECT: filter selectable (digital or delay)
> > + *
> > + * Some banks on newer Exynos based SoCs have a selectable filter on a=
live
> > + * banks of 'analog/delay' or 'digital'. If the filter selection regis=
ter is
> > + * not available then the default filter is used (digital).
> > + */
> > +enum fltcon_type {
> > +       FLT_DEFAULT,
> > +       FLT_SELECTABLE,
> > +};
>
> Is there any benefit of having this enum over replacing it with just a
> bool field (e.g. 'bool flt_selectable')?

I thought it made it clearer at the callee sites which filter was
being set, but I can update to a bool if that's what you prefer.

regards,

Peter.

>
> > +
> >  /* maximum length of a pin in pin descriptor (example: "gpa0-0") */
> >  #define PIN_NAME_LENGTH        10
> >
> > @@ -122,6 +136,8 @@ struct samsung_pin_bank_type {
> >   * @eint_type: type of the external interrupt supported by the bank.
> >   * @eint_mask: bit mask of pins which support EINT function.
> >   * @eint_offset: SoC-specific EINT register or interrupt offset of ban=
k.
> > + * @fltcon_type: whether the filter (delay/digital) is selectable
> > + * @fltcon_offset: SoC-specific EINT filter control register offset of=
 bank.
> >   * @name: name to be prefixed for each pin in this pin bank.
> >   */
> >  struct samsung_pin_bank_data {
> > @@ -133,6 +149,8 @@ struct samsung_pin_bank_data {
> >         enum eint_type  eint_type;
> >         u32             eint_mask;
> >         u32             eint_offset;
> > +       enum fltcon_type fltcon_type;
> > +       u32             fltcon_offset;
> >         const char      *name;
> >  };
> >
> > @@ -147,6 +165,8 @@ struct samsung_pin_bank_data {
> >   * @eint_type: type of the external interrupt supported by the bank.
> >   * @eint_mask: bit mask of pins which support EINT function.
> >   * @eint_offset: SoC-specific EINT register or interrupt offset of ban=
k.
> > + * @fltcon_type: whether the filter (delay/digital) is selectable
> > + * @fltcon_offset: SoC-specific EINT filter control register offset of=
 bank.
> >   * @name: name to be prefixed for each pin in this pin bank.
> >   * @id: id of the bank, propagated to the pin range.
> >   * @pin_base: starting pin number of the bank.
> > @@ -170,6 +190,8 @@ struct samsung_pin_bank {
> >         enum eint_type  eint_type;
> >         u32             eint_mask;
> >         u32             eint_offset;
> > +       enum fltcon_type fltcon_type;
> > +       u32             fltcon_offset;
> >         const char      *name;
> >         u32             id;
> >
> > --
> > 2.43.0.rc2.451.g8631bc7472-goog
> >
