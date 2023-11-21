Return-Path: <SRS0=O7bH=HC=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA9DC61D85
	for <soc@archiver.kernel.org>; Tue, 21 Nov 2023 17:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C2EB1C433D9; Tue, 21 Nov 2023 17:52:49 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B28CCC433C7
	for <soc@kernel.org>; Tue, 21 Nov 2023 17:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B28CCC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5c184b3bbc4so4493347a12.1
        for <soc@kernel.org>; Tue, 21 Nov 2023 09:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700589167; x=1701193967; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wpqGVbIK3WplCROjVemwcSWLjI6+dgvA3XaSrJo6hc=;
        b=HVqaD4t8kegJhNGme73TxJ/VgkVT5tOxRVDQ1YDRvPWZ2/cBKa4kmuBwARClvRFlud
         RuIdz0rQdUh+s0ciYgzOny59LUHuU+rn/41WK/iS8Zpgl079PmD8UmC6hYZxSoXcRR2+
         SjC5cQN80g9es9krMgz4YYjy5tl8jk5LKIoPpTKQzcSUuB+N9SAF27w1Ew9bHOrMw23M
         CYrI9fBzKI0Y5gsDuNLh6LI2zw8rqK0qyRQn04Ndy09yvykSvw+8Ggyz9k41GzEW4zII
         YT/oajiAx8HxmWNDvh7fLBV+8TQbKJKkG4C5t/9RbR3R8BvfGHpSepvSGQy2eV6ADXAH
         eqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700589167; x=1701193967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wpqGVbIK3WplCROjVemwcSWLjI6+dgvA3XaSrJo6hc=;
        b=r5RcGYXR04R0w+iEV7tKTRlk0Evq0J8Ea8Xo9M1afGKXQutiUr7FQw6BCY/LghunVk
         LvpFZDCTSUcmLADn9tuYUH/nKiVdPRkJuimUGVqht6GLCDxNBly6ocGZM+KKCnXjAJlp
         Je++w9BR2wIgFKW+mBth2HVfIy9S+iNqviPgpHeedRm/R85Elr9BDoJoQqkF/rmdCFj6
         k/ICoCIXgh9pb+5QpOY20Y3eI3Chr3cX8eCYDENvElAJ4Aba671FgjfJt6mE2nL1Dv3w
         xGTM9bOVTq12o4VlDT/ihOeGn2zt7qGA0HxNQp8r4VVwkGaOhpDuptQjUZjXUYgE7ASw
         45UQ==
X-Gm-Message-State: AOJu0YzURodLIwje0WjzoMQEdU5Qnw10KCyrx2vfqxPRuzBSeRZHZ3Hg
	bqefIh86J6HHlUkT0MnsQAtsLTqVwm8CopFc83w+Hg==
X-Google-Smtp-Source: AGHT+IEdZp5NTxf9oR3LSlmESZBZSQbkEXjEj7cCwEl5eMeZY9Ha2tcsIk9FWPcD9OV0TPHekxd5b3NDVOKW++TOaBw=
X-Received: by 2002:a17:90b:1c83:b0:27d:b3d:5c33 with SMTP id
 oo3-20020a17090b1c8300b0027d0b3d5c33mr13567253pjb.28.1700589167121; Tue, 21
 Nov 2023 09:52:47 -0800 (PST)
MIME-Version: 1.0
References: <20231120212037.911774-1-peter.griffin@linaro.org> <20231120212037.911774-16-peter.griffin@linaro.org>
In-Reply-To: <20231120212037.911774-16-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 21 Nov 2023 11:52:36 -0600
Message-ID: <CAPLW+4m+vG62V++izkycRYEhcTpoT+G=g+3Y4j8vqEpeX2uEPw@mail.gmail.com>
Subject: Re: [PATCH v4 15/19] watchdog: s3c2410_wdt: Add support for WTCON
 register DBGACK_MASK bit
To: Peter Griffin <peter.griffin@linaro.org>
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

On Mon, Nov 20, 2023 at 3:21=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> The WDT uses the CPU core signal DBGACK to determine whether the SoC
> is running in debug mode or not. If the DBGACK signal is asserted and
> DBGACK_MASK is enabled, then WDT output and interrupt is masked.
>
> Presence of the DBGACK_MASK bit is determined by adding a new
> QUIRK_HAS_DBGACK_BIT quirk. Currently only gs101 SoC is known to have
> the DBGACK_MASK bit so add the quirk to drv_data_gs101_cl1 and
> drv_data_gs101_cl1 quirks.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 32 +++++++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 08b8c57dd812..ed561deeeed9 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -34,9 +34,10 @@
>
>  #define S3C2410_WTCNT_MAXCNT   0xffff
>
> -#define S3C2410_WTCON_RSTEN    (1 << 0)
> -#define S3C2410_WTCON_INTEN    (1 << 2)
> -#define S3C2410_WTCON_ENABLE   (1 << 5)
> +#define S3C2410_WTCON_RSTEN            (1 << 0)
> +#define S3C2410_WTCON_INTEN            (1 << 2)
> +#define S3C2410_WTCON_ENABLE           (1 << 5)
> +#define S3C2410_WTCON_DBGACK_MASK      (1 << 16)
>
>  #define S3C2410_WTCON_DIV16    (0 << 3)
>  #define S3C2410_WTCON_DIV32    (1 << 3)
> @@ -107,12 +108,16 @@
>   * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_NON=
CPU_OUT)
>   * with "watchdog counter enable" bit. That bit should be set to make wa=
tchdog
>   * counter running.
> + *
> + * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Enables ma=
sking
> + * WDT interrupt and reset request according to CPU core DBGACK signal.
>   */
>  #define QUIRK_HAS_WTCLRINT_REG                 (1 << 0)
>  #define QUIRK_HAS_PMU_MASK_RESET               (1 << 1)
>  #define QUIRK_HAS_PMU_RST_STAT                 (1 << 2)
>  #define QUIRK_HAS_PMU_AUTO_DISABLE             (1 << 3)
>  #define QUIRK_HAS_PMU_CNT_EN                   (1 << 4)
> +#define QUIRK_HAS_DBGACK_BIT                   (1 << 5)
>
>  /* These quirks require that we have a PMU register map */
>  #define QUIRKS_HAVE_PMUREG \
> @@ -279,7 +284,7 @@ static const struct s3c2410_wdt_variant drv_data_gs10=
1_cl0 =3D {
>         .cnt_en_reg =3D GS_CLUSTER0_NONCPU_OUT,
>         .cnt_en_bit =3D 8,
>         .quirks =3D QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | Q=
UIRK_HAS_PMU_CNT_EN |
> -                 QUIRK_HAS_WTCLRINT_REG,
> +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
>  };
>
>  static const struct s3c2410_wdt_variant drv_data_gs101_cl1 =3D {
> @@ -291,7 +296,7 @@ static const struct s3c2410_wdt_variant drv_data_gs10=
1_cl1 =3D {
>         .cnt_en_reg =3D GS_CLUSTER1_NONCPU_OUT,
>         .cnt_en_bit =3D 7,
>         .quirks =3D QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | Q=
UIRK_HAS_PMU_CNT_EN |
> -                 QUIRK_HAS_WTCLRINT_REG,
> +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
>  };
>

This patch states it's adding the feature, but in fact it's also
enabling this feature for gs101. Suggest moving this patch before the
one enabling gs101 wdt. This way, one patch will only add the feature,
and another patch will enable gs101 entirely (with this feature used).
At least it seems like more atomic approach to me.

>  static const struct of_device_id s3c2410_wdt_match[] =3D {
> @@ -408,6 +413,21 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *wdt=
, bool en)
>         return 0;
>  }
>
> +static void s3c2410wdt_mask_dbgack(struct s3c2410_wdt *wdt, bool mask)
> +{
> +       unsigned long wtcon;
> +
> +       if (!(wdt->drv_data->quirks & QUIRK_HAS_DBGACK_BIT))
> +               return;
> +
> +       wtcon =3D readl(wdt->reg_base + S3C2410_WTCON);
> +       if (mask)
> +               wtcon |=3D S3C2410_WTCON_DBGACK_MASK;
> +       else
> +               wtcon &=3D ~S3C2410_WTCON_DBGACK_MASK;
> +       writel(wtcon, wdt->reg_base + S3C2410_WTCON);
> +}
> +
>  static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
>  {
>         struct s3c2410_wdt *wdt =3D watchdog_get_drvdata(wdd);
> @@ -737,6 +757,8 @@ static int s3c2410wdt_probe(struct platform_device *p=
dev)
>         wdt->wdt_device.bootstatus =3D s3c2410wdt_get_bootstatus(wdt);
>         wdt->wdt_device.parent =3D dev;
>
> +       s3c2410wdt_mask_dbgack(wdt, true);
> +
>         /*
>          * If "tmr_atboot" param is non-zero, start the watchdog right no=
w. Also
>          * set WDOG_HW_RUNNING bit, so that watchdog core can kick the wa=
tchdog.
> --
> 2.43.0.rc1.413.gea7ed67945-goog
>
