Return-Path: <SRS0=XK7G=F2=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6A1C41513
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 06:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C8ABC433C7; Thu, 12 Oct 2023 06:00:09 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D5F41C433C8
	for <soc@kernel.org>; Thu, 12 Oct 2023 06:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D5F41C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2799b7280d1so456038a91.1
        for <soc@kernel.org>; Wed, 11 Oct 2023 23:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697090405; x=1697695205; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdRKaWOIGE9rdXyy8hmwpjeYVOv6dJPGfVRoVNmPFx8=;
        b=DMIso9+WIO2E5zBKqWAc2yDWMLUCTbD4fHH1H43S2uSxs+Hl6k26NyApJtHTju82vQ
         FMUg1Mx1tkK6qM59DNGNn0xDHUxVqG5JylBHlVE6UA1AAErSHSW0xiig7ubv6mAz5Wzy
         7TmoLH5Ah+d5gx3EKIBgyGPuefCsBwZxqyTlKPMEpIHpooZ8DcbXbiqEh+VV8v5oYz8+
         7XwmlJEy5Jxk70WonF6GyMohS/sR280ziec5hgZtPY5N1TcNprxWvrBGp+tfy3Dz6aA6
         6QS0qSy29KcDhRhsDNZFThfXlMCOjs11GsYcy32bJt21mV+lDg430c59IcF9TsBBegHa
         qoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697090405; x=1697695205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdRKaWOIGE9rdXyy8hmwpjeYVOv6dJPGfVRoVNmPFx8=;
        b=ZrC4x2wKYQroKqkh02c9ewyBYCgUrqSPhqC4fCoKo0SUmkKjNzoZeIIonrwCq7CCH3
         Ft1ii5YO71G4jUxockxuhWwlvjsU+bu0ZVlCeNMsZHMjWOsJ8hJcawOIBXXz3+czKZ4m
         ynjg1F6396lSq8DyqOmQZqGG+emhPTmboi4v0fbvni3II3WLufMYTgcg22sMJdn91taP
         A6DWjTLimQqt58fa2sRBFZ2S21RgE4ST3PuodsuotgJrNROOsK0vlL0Es4z/5JPyLcwV
         RzPLtbxhQJ37n46d8vbp/2ZeCPqmN59SDudf90pFKpRVS1026VMVQEglp+kJeCW63o+y
         Cvnw==
X-Gm-Message-State: AOJu0YxK/TDe4DnM9+QKDCSRKe5qfUXeCMN1xepS6Z2g+q6ccs3LFZsz
	TVJ7fngiUZR2pWDXYGFDaXpUkNrmOW1nHe9hWFuFuA==
X-Google-Smtp-Source: AGHT+IEds9zFic3dvlWUSNrZjAbExnKRJ4kvrmEJ/j2zeqzZeqvS2iAQjcycEIzZ/pCID3ZnpX6tT3RPJpg8eIoPdng=
X-Received: by 2002:a17:90a:f68a:b0:27d:e18:810d with SMTP id
 cl10-20020a17090af68a00b0027d0e18810dmr2828954pjb.11.1697090404986; Wed, 11
 Oct 2023 23:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-15-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-15-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 12 Oct 2023 00:59:53 -0500
Message-ID: <CAPLW+4=k1qZgOKUUXgJYgXOzzRujyjW+Ua0Sej-gDcZsvCWirw@mail.gmail.com>
Subject: Re: [PATCH v3 14/20] pinctrl: samsung: Add gs101 SoC pinctrl configuration
To: Peter Griffin <peter.griffin@linaro.org>
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

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add support for the pin-controller found on the gs101 SoC used in
> Pixel 6 phones.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 163 ++++++++++++++++++
>  drivers/pinctrl/samsung/pinctrl-exynos.c      |   2 +
>  drivers/pinctrl/samsung/pinctrl-exynos.h      |  34 ++++
>  drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
>  5 files changed, 202 insertions(+)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pin=
ctrl/samsung/pinctrl-exynos-arm64.c
> index cb965cf93705..db47001d1b35 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -796,3 +796,166 @@ const struct samsung_pinctrl_of_match_data fsd_of_d=
ata __initconst =3D {
>         .ctrl           =3D fsd_pin_ctrl,
>         .num_ctrl       =3D ARRAY_SIZE(fsd_pin_ctrl),
>  };
> +
> +/*
> + * bank type for non-alive type
> + * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit field:=
 4)
> + * (CONPDN bit field: 2, PUDPDN bit field: 4)
> + */
> +static struct samsung_pin_bank_type gs101_bank_type_off  =3D {
> +       .fld_width =3D { 4, 1, 4, 4, 2, 4, },
> +       .reg_offset =3D { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
> +};
> +
> +/*
> + * bank type for alive type
> + * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit field:=
 4)
> + */
> +static const struct samsung_pin_bank_type gs101_bank_type_alive =3D {
> +       .fld_width =3D { 4, 1, 4, 4, },
> +       .reg_offset =3D { 0x00, 0x04, 0x08, 0x0c, },
> +};
> +
> +/* pin banks of gs101 pin-controller (ALIVE) */
> +static const struct samsung_pin_bank_data gs101_pin_alive[] =3D {
> +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 8, 0x0, "gpa0", 0x0=
0, 0x00, FLT_SELECTABLE),

Here and further: please keep 80 characters per line when possible.

> +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 7, 0x20, "gpa1", 0x=
04, 0x08, FLT_SELECTABLE),
> +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 5, 0x40, "gpa2", 0x=
08, 0x10, FLT_SELECTABLE),
> +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 4, 0x60, "gpa3", 0x=
0c, 0x18, FLT_SELECTABLE),
> +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 4, 0x80, "gpa4", 0x=
10, 0x1c, FLT_SELECTABLE),
> +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 7, 0xa0, "gpa5", 0x=
14, 0x20, FLT_SELECTABLE),
> +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 8, 0xc0, "gpa9", 0x=
18, 0x28, FLT_SELECTABLE),
> +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 2, 0xe0, "gpa10", 0=
x1c, 0x30, FLT_SELECTABLE),
> +};
> +
> +/* pin banks of gs101 pin-controller (FAR_ALIVE) */
> +static const struct samsung_pin_bank_data gs101_pin_far_alive[] =3D {
> +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 8, 0x0, "gpa6", 0x0=
0, 0x00, FLT_SELECTABLE),
> +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 4, 0x20, "gpa7", 0x=
04, 0x08, FLT_SELECTABLE),
> +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 8, 0x40, "gpa8", 0x=
08, 0x0c, FLT_SELECTABLE),
> +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 2, 0x60, "gpa11", 0=
x0c, 0x14, FLT_SELECTABLE),
> +};
> +
> +/* pin banks of gs101 pin-controller (GSACORE) */
> +static const struct samsung_pin_bank_data gs101_pin_gsacore[] =3D {
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x0, "gps0", 0x00,=
 0x00, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 8, 0x20, "gps1", 0x04=
, 0x04, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 3, 0x40, "gps2", 0x08=
, 0x0c, FLT_DEFAULT),
> +};
> +
> +/* pin banks of gs101 pin-controller (GSACTRL) */
> +static const struct samsung_pin_bank_data gs101_pin_gsactrl[] =3D {
> +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 6, 0x0, "gps3", 0x0=
0, 0x00, FLT_DEFAULT),
> +};
> +
> +/* pin banks of gs101 pin-controller (PERIC0) */
> +static const struct samsung_pin_bank_data gs101_pin_peric0[] =3D {
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 5, 0x0, "gpp0", 0x00,=
 0x00, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x20, "gpp1", 0x04=
, 0x08, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x40, "gpp2", 0x08=
, 0x0c, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x60, "gpp3", 0x0c=
, 0x10, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x80, "gpp4", 0x10=
, 0x14, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0xa0, "gpp5", 0x14=
, 0x18, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0xc0, "gpp6", 0x18=
, 0x1c, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0xe0, "gpp7", 0x1c=
, 0x20, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x100, "gpp8", 0x2=
0, 0x24, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x120, "gpp9", 0x2=
4, 0x28, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x140, "gpp10", 0x=
28, 0x2c, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x160, "gpp11", 0x=
2c, 0x30, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x180, "gpp12", 0x=
30, 0x34, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x1a0, "gpp13", 0x=
34, 0x38, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x1c0, "gpp14", 0x=
38, 0x3c, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x1e0, "gpp15", 0x=
3c, 0x40, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x200, "gpp16", 0x=
40, 0x44, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x220, "gpp17", 0x=
44, 0x48, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x240, "gpp18", 0x=
48, 0x4c, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x260, "gpp19", 0x=
4c, 0x50, FLT_DEFAULT),
> +};
> +
> +/* pin banks of gs101 pin-controller (PERIC1) */
> +static const struct samsung_pin_bank_data gs101_pin_peric1[] =3D {
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 8, 0x0, "gpp20", 0x00=
, 0x00, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x20, "gpp21", 0x0=
4, 0x08, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x40, "gpp22", 0x0=
8, 0x0c, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 8, 0x60, "gpp23", 0x0=
c, 0x10, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x80, "gpp24", 0x1=
0, 0x18, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0xa0, "gpp25", 0x1=
4, 0x1c, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 5, 0xc0, "gpp26", 0x1=
8, 0x20, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0xe0, "gpp27", 0x1=
c, 0x28, FLT_DEFAULT),
> +};
> +
> +/* pin banks of gs101 pin-controller (HSI1) */
> +static const struct samsung_pin_bank_data gs101_pin_hsi1[] =3D {
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 6, 0x0, "gph0", 0x00,=
 0x00, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 7, 0x20, "gph1", 0x04=
, 0x08, FLT_DEFAULT),
> +};
> +
> +/* pin banks of gs101 pin-controller (HSI2) */
> +static const struct samsung_pin_bank_data gs101_pin_hsi2[] =3D {
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 6, 0x0, "gph2", 0x00,=
 0x00, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x20, "gph3", 0x04=
, 0x08, FLT_DEFAULT),
> +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 6, 0x40, "gph4", 0x08=
, 0x0c, FLT_DEFAULT),
> +};
> +
> +static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst =3D {
> +       {
> +               /* pin banks of gs101 pin-controller (ALIVE) */
> +               .pin_banks      =3D gs101_pin_alive,
> +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_alive),
> +               .eint_gpio_init =3D exynos_eint_gpio_init,
> +               .eint_wkup_init =3D exynos_eint_wkup_init,

Is it ok to have both .eint_gpio_init and .eint_wkup_init set here and
further? I remember doing something like that for Exynos850 before,
only to realize further if was a mistake. Please check commit
96f79935015c ("pinctrl: samsung: Remove EINT handler for Exynos850
ALIVE and CMGP gpios"). Maybe it's ok in your case.

> +               .suspend        =3D exynos_pinctrl_suspend,
> +               .resume         =3D exynos_pinctrl_resume,

Did you manage to actually test those suspend/resume callbacks
somehow? If so, can you please share the procedure? I guess I had some
Power Domains and clock related problems on Exynos850 when I tried
that before, so just curious.

> +       }, {
> +               /* pin banks of gs101 pin-controller (FAR_ALIVE) */
> +               .pin_banks      =3D gs101_pin_far_alive,
> +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_far_alive),
> +               .eint_gpio_init =3D exynos_eint_gpio_init,
> +               .eint_wkup_init =3D exynos_eint_wkup_init,
> +               .suspend        =3D exynos_pinctrl_suspend,
> +               .resume         =3D exynos_pinctrl_resume,
> +       }, {
> +               /* pin banks of gs101 pin-controller (GSACORE) */
> +               .pin_banks      =3D gs101_pin_gsacore,
> +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_gsacore),
> +               .eint_gpio_init =3D exynos_eint_gpio_init,
> +       }, {
> +               /* pin banks of gs101 pin-controller (GSACTRL) */
> +               .pin_banks      =3D gs101_pin_gsactrl,
> +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_gsactrl),
> +               .eint_gpio_init =3D exynos_eint_gpio_init,
> +       }, {
> +               /* pin banks of gs101 pin-controller (PERIC0) */
> +               .pin_banks      =3D gs101_pin_peric0,
> +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_peric0),
> +               .eint_gpio_init =3D exynos_eint_gpio_init,
> +               .suspend        =3D exynos_pinctrl_suspend,
> +               .resume         =3D exynos_pinctrl_resume,
> +       }, {
> +               /* pin banks of gs101 pin-controller (PERIC1) */
> +               .pin_banks      =3D gs101_pin_peric1,
> +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_peric1),
> +               .eint_gpio_init =3D exynos_eint_gpio_init,
> +               .suspend        =3D exynos_pinctrl_suspend,
> +               .resume =3D exynos_pinctrl_resume,
> +       }, {
> +               /* pin banks of gs101 pin-controller (HSI1) */
> +               .pin_banks      =3D gs101_pin_hsi1,
> +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_hsi1),
> +               .eint_gpio_init =3D exynos_eint_gpio_init,
> +               .suspend        =3D exynos_pinctrl_suspend,
> +               .resume         =3D exynos_pinctrl_resume,
> +       }, {
> +               /* pin banks of gs101 pin-controller (HSI2) */
> +               .pin_banks      =3D gs101_pin_hsi2,
> +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_hsi2),
> +               .eint_gpio_init =3D exynos_eint_gpio_init,
> +               .suspend        =3D exynos_pinctrl_suspend,
> +               .resume         =3D exynos_pinctrl_resume,
> +       },
> +};
> +
> +const struct samsung_pinctrl_of_match_data gs101_of_data __initconst =3D=
 {
> +       .ctrl           =3D gs101_pin_ctrl,
> +       .num_ctrl       =3D ARRAY_SIZE(gs101_pin_ctrl),
> +};
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/s=
amsung/pinctrl-exynos.c
> index 800831aa8357..014f0c37f97f 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -533,6 +533,8 @@ static const struct of_device_id exynos_wkup_irq_ids[=
] =3D {
>                         .data =3D &exynos7_wkup_irq_chip },
>         { .compatible =3D "samsung,exynosautov9-wakeup-eint",
>                         .data =3D &exynos7_wkup_irq_chip },
> +       { .compatible =3D "google,gs101-wakeup-eint",
> +                       .data =3D &exynos7_wkup_irq_chip },
>         { }
>  };
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/s=
amsung/pinctrl-exynos.h
> index 63b2426ad5d6..0dd013654bd2 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -147,6 +147,40 @@
>                 .name           =3D id                            \
>         }
>
> +#define EXYNOS9_PIN_BANK_EINTN(types, pins, reg, id)   \
> +       {                                               \
> +               .type           =3D &types,               \
> +               .pctl_offset    =3D reg,                  \
> +               .nr_pins        =3D pins,                 \
> +               .eint_type      =3D EINT_TYPE_NONE,       \
> +               .fltcon_type    =3D FLT_DEFAULT           \
> +               .name           =3D id                    \
> +       }
> +
> +#define EXYNOS9_PIN_BANK_EINTG(types, pins, reg, id, offs, fltcon_offs, =
fltcontype) \
> +       {                                               \
> +               .type           =3D &types,               \
> +               .pctl_offset    =3D reg,                  \
> +               .nr_pins        =3D pins,                 \
> +               .eint_type      =3D EINT_TYPE_GPIO,       \
> +               .eint_offset    =3D offs,                 \
> +               .fltcon_type    =3D fltcontype,           \
> +               .fltcon_offset  =3D fltcon_offs,          \
> +               .name           =3D id                    \
> +       }
> +
> +#define EXYNOS9_PIN_BANK_EINTW(types, pins, reg, id, offs, fltcon_offs, =
fltcontype) \
> +       {                                               \
> +               .type           =3D &types,               \
> +               .pctl_offset    =3D reg,                  \
> +               .nr_pins        =3D pins,                 \
> +               .eint_type      =3D EINT_TYPE_WKUP,       \
> +               .eint_offset    =3D offs,                 \
> +               .fltcon_type    =3D fltcontype,           \
> +               .fltcon_offset  =3D fltcon_offs,          \
> +               .name           =3D id                    \
> +       }
> +

Looks to me that instead of adding new macros the already existing
EXYNOS850_PIN_BANK_* should be extended and re-used. Because those
pinctrl IP-cores on all modern Exynos chips look very similar, even if
you compare the downstream code. If EXYNOS850 prefix looks confusing,
maybe it can be renamed to EXYNOS9 or something like that. Those
filter parameters are also present in Exynos850 downstream kernel
code. So I just feel like the proper way to add that feature would be
to add that also for all modern ARM64 Exynos variants while at it.

>  /**
>   * struct exynos_weint_data: irq specific data for all the wakeup interr=
upts
>   * generated by the external wakeup interrupt controller.
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/=
samsung/pinctrl-samsung.c
> index 449f8109d8b5..12176f98440d 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1321,6 +1321,8 @@ static const struct of_device_id samsung_pinctrl_dt=
_match[] =3D {
>                 .data =3D &exynosautov9_of_data },
>         { .compatible =3D "tesla,fsd-pinctrl",
>                 .data =3D &fsd_of_data },
> +       { .compatible =3D "google,gs101-pinctrl",
> +               .data =3D &gs101_of_data },
>  #endif
>  #ifdef CONFIG_PINCTRL_S3C64XX
>         { .compatible =3D "samsung,s3c64xx-pinctrl",
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/=
samsung/pinctrl-samsung.h
> index de2ca8e8b378..e62e909fb10d 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> @@ -374,6 +374,7 @@ extern const struct samsung_pinctrl_of_match_data exy=
nos7885_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;
>  extern const struct samsung_pinctrl_of_match_data fsd_of_data;
> +extern const struct samsung_pinctrl_of_match_data gs101_of_data;
>  extern const struct samsung_pinctrl_of_match_data s3c64xx_of_data;
>  extern const struct samsung_pinctrl_of_match_data s3c2412_of_data;
>  extern const struct samsung_pinctrl_of_match_data s3c2416_of_data;
> --
> 2.42.0.655.g421f12c284-goog
>
