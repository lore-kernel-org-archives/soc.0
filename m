Return-Path: <SRS0=2HeH=RH=gmail.com=festevam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA1FC433F5
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 02:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D748AC36AEC; Wed, 22 Dec 2021 02:02:34 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 507FCC36AE9;
	Wed, 22 Dec 2021 02:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 507FCC36AE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id w16so2286637edc.11;
        Tue, 21 Dec 2021 18:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0pvJ0VJBvj9qiKz1E6D8UeM5hFtVE1+1j1opSDSflxo=;
        b=hso3Yd7IWueqzl2mIgrOpP66XETFw/Qq6TD71x/nVKTezClSMd/aVDBCarWi1F3D3i
         nEwOP1sxgBDEslD6aKDTAFIN/JhQpIdVH2xWXv8G0WxGtpGnQGIGwrEhQDUExRVE6pOm
         7vQPP7Mry2+W5V2toB26R8UJyxWHJS5EKR/F8jiNQv3D0VzsjLQ/DYikkdfEwhC8oeiV
         hBHZdkKcZJXCo7o4bQZ/5I3rhrbCZ/J/hDqbFn0jiD/ukhw9tTS8VrVtRqwqH0NixuYr
         NZbvBwT3kPOxYXnF6YYJlfe7shMMAhQI87TWQC41zrPRxXMyCblQgvhC2Cz5yuUH3MDO
         uBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0pvJ0VJBvj9qiKz1E6D8UeM5hFtVE1+1j1opSDSflxo=;
        b=wok+EwapX5V4ZkHR8Ixo2BXZTHw21ABkrECXs3z8UAQXGW7NZQR1VDhkFNXciPEi9H
         dZUd9Ja33YiXeOYAjDlX/4BAA9sIp1K3Trm5eQ/S5n9A0U2LR6uayXwRU19qVV9QUz8B
         67njhjbpnTJPWooAp4+x7x/NI42PZK0RcLEVUFKRVwy+LxnJEj4fhGpTXbYvyc8uKyyR
         FDCvA9ffi0NCHdqRA3745DSqCqMwnsu4io+uDuQZxYGLiEaF/xT477WNHCNIGJUQohVm
         +iZwz8adCe+JqkGBNkohPPAgCBkVlVFmfOIfArOppqdB2eecXjQIbhIKtTKYs+mx5Tgo
         nYaA==
X-Gm-Message-State: AOAM532qzz8CWcmCrPSN3kcHF3rmXeuEs8QEzSNuogbSWP7SgbmwnDDF
	CY/FIvifV167ZJsaxaRMRVnVa/figWmbFSCHNk8=
X-Google-Smtp-Source: ABdhPJzLpnG/UsK725GwrFFKPbmxb8uA6enGbrXJVIDRT1VOpS7WXzeYwddNf5loslL9Xzc0bUG2deH5QOcNKv1rmo8=
X-Received: by 2002:a17:907:7205:: with SMTP id dr5mr791523ejc.696.1640138552651;
 Tue, 21 Dec 2021 18:02:32 -0800 (PST)
MIME-Version: 1.0
References: <20211222015244.2464671-1-Mr.Bossman075@gmail.com> <20211222015244.2464671-6-Mr.Bossman075@gmail.com>
In-Reply-To: <20211222015244.2464671-6-Mr.Bossman075@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 21 Dec 2021 23:02:21 -0300
Message-ID: <CAOMZO5DV7WKU_dO3KRERpcoManFZs1MbdL54BtSmtMnVY5ujrg@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] clk: imx: Add initial support for i.MXRT1050 clock driver
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

On Tue, Dec 21, 2021 at 10:52 PM Jesse Taube <mr.bossman075@gmail.com> wrote:


> +static struct platform_driver imxrt1050_clk_driver = {
> +       .probe = imxrt1050_clocks_probe,
> +       .driver = {
> +               .name = "imxrt1050-ccm",
> +               .of_match_table = of_match_ptr(imxrt1050_clk_of_match),

No need for of_match_ptr() here.
