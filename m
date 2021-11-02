Return-Path: <SRS0=Qo2+=PV=gmail.com=festevam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A88C433EF
	for <soc@archiver.kernel.org>; Tue,  2 Nov 2021 23:42:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 925636109D; Tue,  2 Nov 2021 23:42:43 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6032261050;
	Tue,  2 Nov 2021 23:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6032261050
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id p37so66667uae.8;
        Tue, 02 Nov 2021 16:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O8/enUMhz+riyzQ2Zd8RV/GG8++DAENfi7ZT3OLtTzs=;
        b=n6VZ9pT7W0nCDLDr1BLiRtznprYVOhzyzxWqZRe3Dzld4TwJqFhWdnGQW72uIy7/c7
         p6Nrb/7UBpO+s3/fv4uTWtVhC5cYgoEwnFU0SM/AAySBDub0b7xVhk1qn3OmW5B9/mL0
         kSsOnYbgWoZDhcmz5tEqx+gN35vEQAcbAehYBDycY/faaZN06EJJYFJ6ncuw15SrmLML
         tjXvJ3p90QRX6fPR+tknrlMNS5RLBEH6o4xnzEQiePE4LLoIF68xw2+d08xWrSi5zsQr
         Wujoh0Yww4IpvOExhcUbhf+Tv51Leih2LL2HrCQKs5MRLal3pntCsG4k69eG/va0jX8v
         0dbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O8/enUMhz+riyzQ2Zd8RV/GG8++DAENfi7ZT3OLtTzs=;
        b=lHKaADlSdIADL19mLQj3ltY5c29GZev7oym5tdt/iEOlU+XRzKLJ7UkMivpcrVZf88
         tC63OvOaCqWlF94MRP5jU3OIxYPnD9DSHsYhuaHhMiFe9K8uV/yDUE2N8yfpkDwkb/QC
         mHRvd9DH9PSkxmRuX3Ybeamu13mcpjSq2zyxgxZwOaFOTaQJI005jIKV7sRpnMRL2QB4
         3edX8W++RpcbUTd2dzawBGqAgUwIgH+6seLsO3lHv0lSD0cAjGP7s8x2Emkg/gnpX5WH
         JPPcQrrL52n8nrJvkksGEi1rry18PC542r4eKAOwBhkfnQYncF3B7d7aC5HgkXdsXPE/
         fphg==
X-Gm-Message-State: AOAM532BSDxtTGom150WjRA/1azvVRFZbnCrO/7swQ6rRKmkLod9PnN9
	i0xcmF0BxAa0g/NNaNU1DQpOFPCpnC1/ILnpr34=
X-Google-Smtp-Source: ABdhPJwurPunbhgaMhr2aohB9ULiuMaCOL1VxU+6z5Q9/nzQIcTtnZQ7HFyfuV8GL22sGJRc0itAFSRr6ZB6VOkTllQ=
X-Received: by 2002:a67:af13:: with SMTP id v19mr4403884vsl.5.1635896562431;
 Tue, 02 Nov 2021 16:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com> <20211102225701.98944-13-Mr.Bossman075@gmail.com>
In-Reply-To: <20211102225701.98944-13-Mr.Bossman075@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 2 Nov 2021 20:42:31 -0300
Message-ID: <CAOMZO5DV-6dKnaGMgARhtv7mq-nOr9jO-XUWAJDmJWwNxc+B1g@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] ARM: dts: imx: add i.MXRT1050-EVK support
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

> +/ {
> +       model = "NXP IMXRT1050-evk board";
> +       compatible = "fsl,imxrt1050-evk", "fsl,imxrt1050";
> +
> +       chosen {
> +               bootargs = "root=/dev/ram";

No need to pass bootargs here.

> +               stdout-path = &lpuart1;
> +       };
> +
> +       aliases {
> +               gpio0 = &gpio1;
> +               gpio1 = &gpio2;
> +               gpio2 = &gpio3;
> +               gpio3 = &gpio4;
> +               gpio4 = &gpio5;
> +               mmc0 = &usdhc1;
> +               serial0 = &lpuart1;
> +       };
> +
> +       memory@0 {

memory@80000000

Building with W=1 should give a dtc warning due to the unit address
and reg mismatch.

> +               device_type = "memory";
> +               reg = <0x80000000 0x2000000>;
> +       };
> +

Unneeded blank line.
> +
> +&iomuxc {
> +       pinctrl-names = "default";
> +
> +       imxrt1050-evk {

No need for this imxrt1050-evk container.

> +               pinctrl_lpuart1: lpuart1grp {
> +                       fsl,pins = <
> +                               MXRT1050_IOMUXC_GPIO_AD_B0_12_LPUART1_TXD
> +                                       0xf1

Put it on a single line. It helps readability. Same applies globally.
> +&usdhc1 {
> +       pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +       pinctrl-0 = <&pinctrl_usdhc0>;
> +       pinctrl-1 = <&pinctrl_usdhc0>;
> +       pinctrl-2 = <&pinctrl_usdhc0>;
> +       pinctrl-3 = <&pinctrl_usdhc0>;
> +       status = "okay";
> +
> +       cd-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;

Make 'status' to be the last property. Remove the blank line.

> +               edma1: dma-controller@400e8000 {
> +                       #dma-cells = <2>;
> +                       compatible = "fsl,imx7ulp-edma";
> +                       reg = <0x400e8000 0x4000>,
> +                               <0x400ec000 0x4000>;
> +                       dma-channels = <32>;
> +                       interrupts = <0>,
> +                               <1>,
> +                               <2>,
> +                               <3>,
> +                               <4>,
> +                               <5>,
> +                               <6>,
> +                               <7>,
> +                               <8>,
> +                               <9>,
> +                               <10>,
> +                               <11>,
> +                               <12>,
> +                               <13>,
> +                               <14>,
> +                               <15>,
> +                               <16>;

Please group more elements into the same line.

Putting one entry per line makes it extremely long.

> +               gpio5: gpio@400c0000 {
> +                       compatible = "fsl,imxrt-gpio", "fsl,imx35-gpio";
> +                       reg = <0x400c0000 0x4000>;
> +                       interrupts = <88>,
> +                               <89>;

Put the interrupts into a single line.
