Return-Path: <SRS0=Xset=PU=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C848EC433EF
	for <soc@archiver.kernel.org>; Mon,  1 Nov 2021 20:14:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AF7F461058; Mon,  1 Nov 2021 20:14:03 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F57D60D07;
	Mon,  1 Nov 2021 20:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F57D60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id o83so26631325oif.4;
        Mon, 01 Nov 2021 13:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Sj56GUTpPgRS7oqOggzrlIvilkSN16Fc0q8+soup5ug=;
        b=3b6TxXjPMQjO6GVOftQfuK/ZWL3mqoK3uK75sxkqf5fW1cDoFqH0d5om1Fmoi3eR65
         lI3N9GYOK89SArUhMsNCeDM7HbimuuYgmd1W0H2IEwL1ZH/xoCD4ZYpui3FPyAVSlnm8
         4xpvCBcxLOOjQmGfxgJfJ8VOAFhNuAi5FC8zLaOl3KC2qW5jnGvbPrIqV4pv795v9+xg
         Y6bIstN7/AfDM+HKGqTbOhX+/OpKVLD5YjwLehpf0BP5YL2ojsCeQVDAidZv6BwI4Y5b
         aVgPPbn1dNUcjQZpP/TkC9msZP0TzK8BJsPgNyUQzoWzed5/s6Y/yqMjlQcZ4PoBfX4E
         A0yw==
X-Gm-Message-State: AOAM533rNZyloVqm+YxO1fvuRyPJfctwQc//UhOhCjFQI0iSJAexmaeD
	XZVAC6unOMbn7vaaltniUg==
X-Google-Smtp-Source: ABdhPJw4z4KW2KWTYje7OKN2C81USrvHcH4TcTdLEGXf0B/pSdBvEpDjI866C/Ip1rWhs9d+cREpGw==
X-Received: by 2002:a05:6808:f8e:: with SMTP id o14mr1063812oiw.89.1635797642815;
        Mon, 01 Nov 2021 13:14:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 46sm4354343otd.2.2021.11.01.13.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 13:14:02 -0700 (PDT)
Received: (nullmailer pid 963901 invoked by uid 1000);
	Mon, 01 Nov 2021 20:13:59 -0000
Date: Mon, 1 Nov 2021 15:13:59 -0500
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org, giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp, leonard.crestez@nxp.com, b20788@freescale.com, fugang.duan@nxp.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT
 compatible
Message-ID: <YYBKh1KYrWTzm+5G@robh.at.kernel.org>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-9-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211024154027.1479261-9-Mr.Bossman075@gmail.com>

On Sun, Oct 24, 2021 at 11:40:22AM -0400, Jesse Taube wrote:
> Add i.MXRT documentation for compatible string.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> index a90c971b4f1f..4b4340def2aa 100644
> --- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> +++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> @@ -21,6 +21,7 @@ properties:
>            - fsl,ls1028a-lpuart
>            - fsl,imx7ulp-lpuart
>            - fsl,imx8qm-lpuart
> +          - fsl,imxrt-lpuart

Actually, 'rt' is not a single part is it? If the variations are same 
die, but fused off then no need to distinguish. Otherwise, these should 
be SoC specific.

Same applies to other compatible strings.

>        - items:
>            - const: fsl,imx8qxp-lpuart
>            - const: fsl,imx7ulp-lpuart
> -- 
> 2.33.0
> 
> 
