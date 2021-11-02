Return-Path: <SRS0=Qo2+=PV=gmail.com=festevam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381B9C433EF
	for <soc@archiver.kernel.org>; Tue,  2 Nov 2021 23:17:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1B0C961101; Tue,  2 Nov 2021 23:17:31 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC79F60EB9;
	Tue,  2 Nov 2021 23:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC79F60EB9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id l43so1102659uad.4;
        Tue, 02 Nov 2021 16:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZsNw+rozMJw0uF1kikrp6ToQQ8yZiRgQpxArMCQC7PY=;
        b=fl9496zHGb1NMIhicizBPN50+jkvVCzoSslA/3cjMnpa+V5Kk/tzqoNIW+vTJbkT46
         UnfGFq/LPeYOmOIklcJ/kTkv1M02gBxrdakFh/fHfrLqPQub6NnpOHSvOUgZndUCTvsA
         UxncsTS2FxzQzqnp5E4pKxsnzvtfexsn4kdBAyHztGytBIP0UtSUHrHE+m5aDlWCaXno
         CImAuLb8lQL3fI2V7b1LB8jiwAaxTpJrA7LxeF82W9qFv9pBpn96+XVytZ3+BXGfFUhM
         JoPLD1oxIHfd9RDAANGZiCow8xM3fDv06KG7SVCD4qmhxZ+HGYLbXctdsVepreqoYo0Q
         7S8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZsNw+rozMJw0uF1kikrp6ToQQ8yZiRgQpxArMCQC7PY=;
        b=stD7MKdnFrIt+WVkjftw3d68fhh+hrWc628Um4EQMJrHYA6aSnuvyNclqs3DcLhHsQ
         OWACXJPBEVOjd8JUl97/mgRwveZV6pK1/8q1B0YwLjUkbdHR4p3EEkx024DbX/x5/Lyt
         g7lxwLTd5ykUlRCkmRhbk6xEjQERLbO41ukIuj2w3KTI4gZHbjEghkHScEQsAOKGaztG
         WRsabg1fSO4UX16tkDIHgSHTt6bZGhF1pBwZJPrXQsRCaztvIrIYSF3MmuXEiPF0dLtK
         w8ucMcW/4dzp6UyvCVhGMQHelmjZ2EfVZ/1S9gGX9nF318O7PG1/b4ba5AK81TIKdKHd
         zz9w==
X-Gm-Message-State: AOAM530A0M2McJYvf/30wXY5ohgZRwhazwsmeZejK5xJQVJ66O2pdQnc
	LLaiB6gEUhN9+YOHXyZ1a3000rpgTpsMpdmUcaw=
X-Google-Smtp-Source: ABdhPJyKSz6TCwnh7C+kJRYFN36Ph1nCIbuAY9M8q8RU9WcxjgDuFfVym1xz6Ue87gxiQx13egUc+1+Z88EDJpe8oCo=
X-Received: by 2002:ab0:6ca7:: with SMTP id j7mr31958596uaa.133.1635895049876;
 Tue, 02 Nov 2021 16:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com> <20211102225701.98944-12-Mr.Bossman075@gmail.com>
In-Reply-To: <20211102225701.98944-12-Mr.Bossman075@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 2 Nov 2021 20:17:19 -0300
Message-ID: <CAOMZO5AxMXxDkNDqGJDhtepqSUxGRCWO+L=c67O==4fx66M7XQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Abel Vesa <abel.vesa@nxp.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk <linux-clk@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 2, 2021 at 7:57 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

>  static struct esdhc_soc_data usdhc_imx8qxp_data = {
>         .flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
> @@ -357,6 +363,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
>         { .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
>         { .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
>         { .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
> +       { .compatible = "fsl,imxrt-usdhc", .data = &usdhc_imxrt_data, },

I thought Rob suggested to use the SoC name, so this would be:

{ .compatible = "fsl,imxrt1050-usdhc", .data = &usdhc_imxrt1050_data, },

The same applies to the other bindings in the series.

This way it would be possible to differentiate between future
supported i.MX RT devices.
