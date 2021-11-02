Return-Path: <SRS0=YOEr=PV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45219C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:18:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07C3D60EB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07C3D60EB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1HOtbpwEn/5zF8+zY0YfLYEsbeyuTMZyxo98zAppvU=; b=gjOHkwf4dUfQ1Z
	ImoU9SCtH8ytwJGNoXgOGD0osPSf3RK8H5wQDqS7PAc9E9yY36oZ1ukO+J/RAvnzSbX5wFsjRyXr+
	6Xlawp1zHnrVh6vSq7rUqga3PJpqTeYBTh9gREO/pZFLlgq06TWvkxMx04pSx3SyRV+aLNuiXSZRz
	pUH9PSNKAiTVNjWH23uldrUPPzwnOv4DwLJpnr1cDyMSWam5wdXUQvq3Y+obUOW7s7LKYmKA/BYAc
	iuP4loyBaM5sbiaiubvtYZ0b8sAfR3dpAqqtISEqdmKme6NyMs8JJy9WW5iSvaSh1quN9Fw3YeM+/
	zhSUp3PHa+ABhzqsMECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi328-003M1Q-0I; Tue, 02 Nov 2021 23:17:36 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi323-003Lzc-E4
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Nov 2021 23:17:32 +0000
Received: by mail-ua1-x936.google.com with SMTP id i6so1086925uae.6
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 16:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZsNw+rozMJw0uF1kikrp6ToQQ8yZiRgQpxArMCQC7PY=;
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
 b=wgd7Bz1usRFVEAqxgoR+lq2T9kF8LbE3bKLgRBOZSJlVsdAoo82dfkKnvhxvqobl2R
 02n7lXoiv+hlE5GF3QtF/FQG4HadrOto67MRmGOubEJE1tZ8Z2ldE5ljuFjm0mIIG1U6
 vHSWN0zZNNtfwMIzgFbzk431sOOMf+jOgtDws7yi34nFoKLOziYnn33sZo1a1voDQMNk
 IMPGUNrXklng72TbnMSopU2/fXw6OaoNROYxRV/EAYfNPD/vgpgQzHDUmlEXhMCvM+vt
 Ed2tZDlIgL4plGK6KccUFPdztIwIjNbgHYdDUuWmonCW1eha/veAGWf3x2gmObAXcghY
 NNZQ==
X-Gm-Message-State: AOAM531+Ysv/lAMcS2PEhG3rxnvQlyQQY6SxsUi6DIiHMnwYEHAfVF37
 j5/RfPrm3nNrgfQyeUwr3T2mezbFDUTC+ySof5o=
X-Google-Smtp-Source: ABdhPJyKSz6TCwnh7C+kJRYFN36Ph1nCIbuAY9M8q8RU9WcxjgDuFfVym1xz6Ue87gxiQx13egUc+1+Z88EDJpe8oCo=
X-Received: by 2002:ab0:6ca7:: with SMTP id j7mr31958596uaa.133.1635895049876; 
 Tue, 02 Nov 2021 16:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-12-Mr.Bossman075@gmail.com>
In-Reply-To: <20211102225701.98944-12-Mr.Bossman075@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 2 Nov 2021 20:17:19 -0300
Message-ID: <CAOMZO5AxMXxDkNDqGJDhtepqSUxGRCWO+L=c67O==4fx66M7XQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, 
 Russell King - ARM Linux <linux@armlinux.org.uk>, Abel Vesa <abel.vesa@nxp.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-clk <linux-clk@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_161731_520208_E85B4F4D 
X-CRM114-Status: GOOD (  14.57  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211102231719.XYnsIYeBhRKBd4MV_JCE_CHAfK23gNAtK5-wI4L3pZI@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
