Return-Path: <SRS0=Zczl=HN=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AF7C4167B
	for <soc@archiver.kernel.org>; Sat,  2 Dec 2023 00:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78571C433CA; Sat,  2 Dec 2023 00:54:01 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26C17C433C8
	for <soc@kernel.org>; Sat,  2 Dec 2023 00:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 26C17C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2866af9d73bso296846a91.3
        for <soc@kernel.org>; Fri, 01 Dec 2023 16:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701478438; x=1702083238; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWpew+j0iOnh0aSpDX7YrdE/c2uqLvGCTRlanK0mkVM=;
        b=I92FjYkfV9OXuTnfHhqXlISClyg4kmEPtUh27j5v+WzMP2aLtpiJGaRnE8+HBC42lC
         nsYbX+5l+uZcpPzjNT2bXW8qUO9N9ehwTW4AkXl9Di0Qb97i05AfjyBDOnVbr7tFRtIK
         RbWRcYwBjo5z4gZZvvpeFg7RpZjFmLbWXRwaO7rl4uXS7g8x1sA3VDueWMIRxM/MxiLb
         rgy1JRCNV3VwZ3ixUcvrmszNN3QDN5HwCdcNLeCd5HRJt7aSKyAgWyI7eKje8HdMcKTk
         Pq8zi0IE8bLViBfROOmegyx4eWbVxoxQ6059STLrJHuGbxOq1NoYl9x8Xc8hqD2xC/3g
         tneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701478438; x=1702083238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWpew+j0iOnh0aSpDX7YrdE/c2uqLvGCTRlanK0mkVM=;
        b=aOSCMGwfvN5rXL1y4GBQPK0yL1XojFXcwnyOCwmzi/EkdHiS+kIzbMytmSa5Cr/cNC
         K1iXr7tkxjkDCkS0nbRt32x9LA0FI//uW4FV9NFhq8AtmOr2RBQHbY9xjCGoUNspXO/b
         n4n8pviMSWEAdbeTWcqEgZEJkF+jHdwIkOLvv3HVvhbkacFJBu/q/D7w1YbgH8bVFrUR
         o4JLkFE8/nOBng488MdSFLpNw8WUAZQw7Bps77t4E84marwsukU/AJbhzNIxh/goN/9l
         DyHedU7HCVL4gwuBTnCoJRJp2VMERy+9L00MVYLf9nZReD3AIDgHoigX59Pl6BWHIJO4
         ySNg==
X-Gm-Message-State: AOJu0YyjzDegm8Dga6LdGCm90HCLpUyfUpys+d8LK56plnO/7I+stfXW
	5GqP07c0u2pVkfeIF7WdqhwIIrlPAgNAAHqozlAS1g==
X-Google-Smtp-Source: AGHT+IFihTDxIDcxGjYUzhV8+6lrC1XGUY94TBxc7PdRpNeXgfGgALbLtvyxmBUVArqYNaxwc3t7/shSGo0x2UfFRA4=
X-Received: by 2002:a17:90a:1f05:b0:286:6cc1:8678 with SMTP id
 u5-20020a17090a1f0500b002866cc18678mr223772pja.93.1701478438430; Fri, 01 Dec
 2023 16:53:58 -0800 (PST)
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org> <20231201160925.3136868-16-peter.griffin@linaro.org>
In-Reply-To: <20231201160925.3136868-16-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Dec 2023 18:53:46 -0600
Message-ID: <CAPLW+4=2aK-XJ69cTBzwhQF8s3E9in-NFkK3h43L7C+oieqyDg@mail.gmail.com>
Subject: Re: [PATCH v5 15/20] watchdog: s3c2410_wdt: Add support for WTCON
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

On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> The WDT uses the CPU core signal DBGACK to determine whether the SoC
> is running in debug mode or not. If the DBGACK signal is asserted and
> DBGACK_MASK bit is enabled, then WDT output and interrupt is masked
> (disabled).
>
> Presence of the DBGACK_MASK bit is determined by adding a new
> QUIRK_HAS_DBGACK_BIT quirk.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 0b4bd883ff28..39f3489e41d6 100644
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

Suggest using BIT() macro. Btw, checkpatch with --strict option
suggests it too :)

>
>  #define S3C2410_WTCON_DIV16    (0 << 3)
>  #define S3C2410_WTCON_DIV32    (1 << 3)
> @@ -100,12 +101,17 @@
>   * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_NON=
CPU_OUT)
>   * with "watchdog counter enable" bit. That bit should be set to make wa=
tchdog
>   * counter running.
> + *
> + * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Setting th=
e
> + * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debu=
g mode.
> + * Debug mode is determined by the DBGACK CPU signal.
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
> @@ -375,6 +381,19 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *wdt=
, bool en)
>         return 0;
>  }
>
> +static void s3c2410wdt_mask_dbgack(struct s3c2410_wdt *wdt)
> +{
> +       unsigned long wtcon;
> +
> +       if (!(wdt->drv_data->quirks & QUIRK_HAS_DBGACK_BIT))
> +               return;
> +
> +       /*  disable watchdog outputs if CPU is in debug mode */

Double whitespace in the comment. Also, I'd move this comment up to
the function declaration.

Other than that:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> +       wtcon =3D readl(wdt->reg_base + S3C2410_WTCON);
> +       wtcon |=3D S3C2410_WTCON_DBGACK_MASK;
> +       writel(wtcon, wdt->reg_base + S3C2410_WTCON);
> +}
> +
>  static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
>  {
>         struct s3c2410_wdt *wdt =3D watchdog_get_drvdata(wdd);
> @@ -700,6 +719,8 @@ static int s3c2410wdt_probe(struct platform_device *p=
dev)
>         wdt->wdt_device.bootstatus =3D s3c2410wdt_get_bootstatus(wdt);
>         wdt->wdt_device.parent =3D dev;
>
> +       s3c2410wdt_mask_dbgack(wdt);
> +
>         /*
>          * If "tmr_atboot" param is non-zero, start the watchdog right no=
w. Also
>          * set WDOG_HW_RUNNING bit, so that watchdog core can kick the wa=
tchdog.
> --
> 2.43.0.rc2.451.g8631bc7472-goog
>
