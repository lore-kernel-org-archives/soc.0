Return-Path: <SRS0=H+9z=QZ=linaro.org=ulf.hansson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF88C433EF
	for <soc@archiver.kernel.org>; Wed,  8 Dec 2021 10:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E27D0C341C3; Wed,  8 Dec 2021 10:48:22 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 39E0EC341C8
	for <soc@kernel.org>; Wed,  8 Dec 2021 10:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 39E0EC341C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 13so3166970ljj.11
        for <soc@kernel.org>; Wed, 08 Dec 2021 02:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b+SdIraKU1h/VTJU366bK+146L0b2CZSCkrC1RqcLiI=;
        b=fhXHxYwOAsjpDT7PFmr/Ay2Bpv6Q52w7gzhLvGp3vi03x0kgJwC1mR2nR1tEBwpntR
         5BIgAfnWN19+UstNXJU4S3pPdsYuWBgNebk4d3ZIyHcMtWi3YzAF0eZIz8zZvhekOaoN
         dpXhu+rLaGYfNU3wPEK81pcn5RGWC+TYP50YKir8VfeN5bYZl1TC19FCevLctaRQ7GbS
         gPCsf9ihaBJkTM0mvs/9FwV0KyzdDAXiEqb7QKxeQwaG8ND1MHBq/EpD6AasS8g7Ta3l
         bXpZYLOXalhq5nbUEDXeIJBRG84NeR6F77adUrF6zH9WKGEaVG6SVgZm6ihC4RzUHLYr
         VlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b+SdIraKU1h/VTJU366bK+146L0b2CZSCkrC1RqcLiI=;
        b=eazX+URHtGl6C2mEAnIQ3cuElCtsnVnAS8Wua5XrcZ1HXWh5usXZMUSeOljTnjG+4V
         VWd9hyw2KMX99XwMa+fy6Cvprwfie1xBzjmpNJKwqhCGEzCDQKI2e44DGQLMx4V8dNBb
         VBqNgjbNdt+uHjECIl+S3Bri+d28Dq0Crzq+BEKllJbpNdEmHKyx0Bkbg1TXUVGVhya7
         FeQ8hryQuSppNhM2nHIvsoRON/YamNL6Xad4h03QDj1Y19O5GV8r2kG9ndLUxI9eq3Hu
         r6IFgsHCOQeydI+p/+aJeGjYd6+5kyKbc48cTf20fu2Je9dWpmWNySQb9Awvc51dXhNR
         R0XQ==
X-Gm-Message-State: AOAM533QWn8UN2+wDVuBflwQ3p3EA3nCIK/UdSw8JVoMEfPO9SMGD/GT
	DE7JZc6nMo/S5yNwE2yenkicsg2gggv+jrRrmUZvFg==
X-Google-Smtp-Source: ABdhPJwVpthnKSrDF/C2HexBrqNAjJ6E3HCFUU7MoAlXVzpyAbLD4i9B/Oo9exkRlkxfOdIXnrTziCam6tJi8meqZow=
X-Received: by 2002:a2e:a22a:: with SMTP id i10mr48977767ljm.16.1638960500425;
 Wed, 08 Dec 2021 02:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20211204061042.1248028-1-Mr.Bossman075@gmail.com> <20211204061042.1248028-12-Mr.Bossman075@gmail.com>
In-Reply-To: <20211204061042.1248028-12-Mr.Bossman075@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 8 Dec 2021 11:47:44 +0100
Message-ID: <CAPDyKFohGQ9M08sJmM5eo2jNhrvFSHA2bnb31AEgiFCFfV78ng@mail.gmail.com>
Subject: Re: [PATCH v4 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	Kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, 
	stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org, 
	arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, 
	abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org, 
	giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 4 Dec 2021 at 07:11, Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> From: Jesse Taube <mr.bossman075@gmail.com>
>
> Add support for i.MXRT1050's sdhc.
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

No need to resend this, it's already been applied.

Kind regards
Uffe



> ---
> V1->V2:
> * Nothing done
> V2->V3:
> * Rename imxrt to imxrt1050
> * Remove BROKEN_AUTO_CMD23 and MAN_TUNING flags
> V3->V4:
> * Nothing done
> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 764ee1b761d9..55981b0f0b10 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -305,6 +305,9 @@ static struct esdhc_soc_data usdhc_imx7ulp_data = {
>                         | ESDHC_FLAG_PMQOS | ESDHC_FLAG_HS400
>                         | ESDHC_FLAG_STATE_LOST_IN_LPMODE,
>  };
> +static struct esdhc_soc_data usdhc_imxrt1050_data = {
> +       .flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_HS200 | ESDHC_FLAG_ERR004536,
> +};
>
>  static struct esdhc_soc_data usdhc_imx8qxp_data = {
>         .flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
> @@ -355,6 +358,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
>         { .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
>         { .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
>         { .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
> +       { .compatible = "fsl,imxrt1050-usdhc", .data = &usdhc_imxrt1050_data, },
>         { .compatible = "nxp,s32g2-usdhc", .data = &usdhc_s32g2_data, },
>         { /* sentinel */ }
>  };
> --
> 2.34.0
>
