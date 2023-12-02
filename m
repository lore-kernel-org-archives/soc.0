Return-Path: <SRS0=Zczl=HN=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A137BC4167B
	for <soc@archiver.kernel.org>; Sat,  2 Dec 2023 01:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8F2A9C433D9; Sat,  2 Dec 2023 01:02:48 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3AC0EC433C8
	for <soc@kernel.org>; Sat,  2 Dec 2023 01:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3AC0EC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-285b926e5deso2572207a91.0
        for <soc@kernel.org>; Fri, 01 Dec 2023 17:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701478966; x=1702083766; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ON7TKe5HRlUXmxrdzzQVwohGw5eKAdzkW1tIPF6YTsU=;
        b=hkVTBO2OSkuXbk5T2CC0JdCeKmjAqxIVfRwvfXXEgLtbBFLOx0S4grMCRTWwbLc9os
         OQObTQEJqVZIO22hn66cJx/ByyR3+TLv4eo1ISgiZKQoWWoHq/WQx/jGupA38YTDwdnk
         nZ10hJGhcNZ9s09XRSAIEE1TOrdxA+JkIg5pNb7bqtkP8T6s0IMoDiENhrzlvoAG3ZGF
         vFa7DdC4DRni1TVVQg+4e76D2b0gKe/plwWLZXK3Mf1OysHH1UcitJTF64dvwysD3O0g
         PUdW7XagFpZqxtQhWAOzFastQp+kb6QkyQB6khWTfNtq9K81SwqtprqyJhDvpf90pFqa
         MJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701478966; x=1702083766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ON7TKe5HRlUXmxrdzzQVwohGw5eKAdzkW1tIPF6YTsU=;
        b=rULb2k/mvD9n2mrMVjir2VsYxGCWfxauXYjyam+QTUQaG2snbXtVrBPcCmWA7qCzEA
         OkWQ+okp9+/xQlFo49SHTzCBy4n1bVEKtFDIJCWdNvt0Y45Nj+IH3RblUvGefw4VxLZ9
         cuxba2ZlVl3HHtZfJZDdn84AsnMaI7vJXj2pLYgLhpcVNGguqrzishuKqa5szAcQqC3+
         q89ERyLMWZ2OxrPBCWAoNLTDej16rNjyqpdQfxLqUgN/vvJy97sRwkpg47sY9RLAvkd3
         MXHw4mMBp8Z4rHp1mYGGcfvqYDt7aPkcuNEOQywFlFaZbMn/Syei4T2lARinXdlm8/Ch
         0qYA==
X-Gm-Message-State: AOJu0YxXyYQIIAyN3aInf6vQZkT6wyLzMJSLyzwa+zTwZ1Qt8ToJQqsw
	JBKf3TSNoZdlX7guOq3utn+Gb/hPZj/o4C6QctdJPw==
X-Google-Smtp-Source: AGHT+IEIJQTcxf2fR+Siy6DreRVrtY2OvPfv8TUAGPOb86XUUOoNnIM/iRPTYAZgTV8wPy36xz+rJ2xLVYlHHq85ZnU=
X-Received: by 2002:a17:90a:4385:b0:286:6cc1:781d with SMTP id
 r5-20020a17090a438500b002866cc1781dmr352836pjg.96.1701478966597; Fri, 01 Dec
 2023 17:02:46 -0800 (PST)
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org> <20231201160925.3136868-17-peter.griffin@linaro.org>
In-Reply-To: <20231201160925.3136868-17-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Dec 2023 19:02:35 -0600
Message-ID: <CAPLW+4mxzu4d_9i=ouDGtnSRMbhibfBnT5aXhkC4cGEC1bm6Bw@mail.gmail.com>
Subject: Re: [PATCH v5 16/20] watchdog: s3c2410_wdt: Add support for Google
 gs101 SoC
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
> This patch adds the compatibles and drvdata for the Google
> gs101 SoC found in Pixel 6, Pixel 6a & Pixel 6 pro phones.
>
> Similar to Exynos850 it has two watchdog instances, one for
> each cluster and has some control bits in PMU registers.
>
> gs101 also has the dbgack_mask bit in wtcon register, so
> we also enable QUIRK_HAS_DBGACK_BIT.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 47 ++++++++++++++++++++++++++++++----
>  1 file changed, 42 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 39f3489e41d6..c1ae71574457 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -68,6 +68,13 @@
>  #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT     25
>  #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT     24
>
> +#define GS_CLUSTER0_NONCPU_OUT                 0x1220
> +#define GS_CLUSTER1_NONCPU_OUT                 0x1420
> +#define GS_CLUSTER0_NONCPU_INT_EN              0x1244
> +#define GS_CLUSTER1_NONCPU_INT_EN              0x1444
> +#define GS_CLUSTER2_NONCPU_INT_EN              0x1644
> +#define GS_RST_STAT_REG_OFFSET                 0x3B44
> +
>  /**
>   * DOC: Quirk flags for different Samsung watchdog IP-cores
>   *
> @@ -269,6 +276,30 @@ static const struct s3c2410_wdt_variant drv_data_exy=
nosautov9_cl1 =3D {
>                   QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
>  };
>
> +static const struct s3c2410_wdt_variant drv_data_gs101_cl0 =3D {
> +       .mask_reset_reg =3D GS_CLUSTER0_NONCPU_INT_EN,
> +       .mask_bit =3D 2,
> +       .mask_reset_inv =3D true,
> +       .rst_stat_reg =3D GS_RST_STAT_REG_OFFSET,
> +       .rst_stat_bit =3D 0,
> +       .cnt_en_reg =3D GS_CLUSTER0_NONCPU_OUT,
> +       .cnt_en_bit =3D 8,
> +       .quirks =3D QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | Q=
UIRK_HAS_PMU_CNT_EN |

Please keep it at 80 characters limit.

> +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
> +};
> +
> +static const struct s3c2410_wdt_variant drv_data_gs101_cl1 =3D {
> +       .mask_reset_reg =3D GS_CLUSTER1_NONCPU_INT_EN,
> +       .mask_bit =3D 2,
> +       .mask_reset_inv =3D true,
> +       .rst_stat_reg =3D GS_RST_STAT_REG_OFFSET,
> +       .rst_stat_bit =3D 1,
> +       .cnt_en_reg =3D GS_CLUSTER1_NONCPU_OUT,
> +       .cnt_en_bit =3D 7,
> +       .quirks =3D QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | Q=
UIRK_HAS_PMU_CNT_EN |

Please keep it at 80 characters limit.

> +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
> +};
> +
>  static const struct of_device_id s3c2410_wdt_match[] =3D {
>         { .compatible =3D "samsung,s3c2410-wdt",
>           .data =3D &drv_data_s3c2410 },
> @@ -284,6 +315,8 @@ static const struct of_device_id s3c2410_wdt_match[] =
=3D {
>           .data =3D &drv_data_exynos850_cl0 },
>         { .compatible =3D "samsung,exynosautov9-wdt",
>           .data =3D &drv_data_exynosautov9_cl0 },
> +       { .compatible =3D "google,gs101-wdt",
> +         .data =3D &drv_data_gs101_cl0 },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
> @@ -604,9 +637,10 @@ s3c2410_get_wdt_drv_data(struct platform_device *pde=
v, struct s3c2410_wdt *wdt)
>         }
>
>  #ifdef CONFIG_OF
> -       /* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index=
 */
> +       /* Choose Exynos850/ExynosAutov9/gs101 driver data w.r.t. cluster=
 index */

Please keep it at 80 characters limit. Also, maybe just make it more
generic and mention "Exynos9 platforms" instead of listing all SoCs?

Other than that:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>


>         if (variant =3D=3D &drv_data_exynos850_cl0 ||
> -           variant =3D=3D &drv_data_exynosautov9_cl0) {
> +           variant =3D=3D &drv_data_exynosautov9_cl0 ||
> +           variant =3D=3D &drv_data_gs101_cl0) {
>                 u32 index;
>                 int err;
>
> @@ -619,9 +653,12 @@ s3c2410_get_wdt_drv_data(struct platform_device *pde=
v, struct s3c2410_wdt *wdt)
>                 case 0:
>                         break;
>                 case 1:
> -                       variant =3D (variant =3D=3D &drv_data_exynos850_c=
l0) ?
> -                               &drv_data_exynos850_cl1 :
> -                               &drv_data_exynosautov9_cl1;
> +                       if (variant =3D=3D &drv_data_exynos850_cl0)
> +                               variant =3D &drv_data_exynos850_cl1;
> +                       else if (variant =3D=3D &drv_data_exynosautov9_cl=
0)
> +                               variant =3D &drv_data_exynosautov9_cl1;
> +                       else if (variant =3D=3D &drv_data_gs101_cl0)
> +                               variant =3D &drv_data_gs101_cl1;
>                         break;
>                 default:
>                         return dev_err_probe(dev, -EINVAL, "wrong cluster=
 index: %u\n", index);
> --
> 2.43.0.rc2.451.g8631bc7472-goog
>
