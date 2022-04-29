Return-Path: <SRS0=tp0+=VH=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977C4C433EF
	for <soc@archiver.kernel.org>; Fri, 29 Apr 2022 22:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 52E50C385AC; Fri, 29 Apr 2022 22:39:39 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 73A03C385A7;
	Fri, 29 Apr 2022 22:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 73A03C385A7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id y63so9983142oia.7;
        Fri, 29 Apr 2022 15:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cbmFT06gQ+FCLpyhadq3rgAfKDwGeHIVypMNjP8Pu5Y=;
        b=RpWDy8o7LSX5YAkJjpBeL/ESMql2O/6KM85oIVu+uN5Iy9kzqf7CR8iRD3XX7z74Xt
         PHd/cENFrcCqMfi7r52R1pQVAYrMreiT9KINamJiOy1XfKIrHqCKnSOr/nCWZFsxWW2V
         2E9Buv8cngSVZkfn9td6Xd71/WB1pJUDIaFIT9A9Kg/crf9WAqNMcj1j43nBQ346hH1g
         Od7m+WWE+fma4dKZuSIDTCGGqMcQViUGGOpY9/ynmd/OIz28oi4pW82U0EySVA6vc1AW
         XWLhpm0KwNooYM3fThNjMLnSTC0op/1me3P0VpfeRedjZo88WaUIOARJPct3k68hE5LB
         6twQ==
X-Gm-Message-State: AOAM533wzaH6IHeCR95vweWIWgXBj5tXBk0DihxsROluqEQTc7IZpHNe
	O1sFeyhHvZpDSWxHJcXQeQ==
X-Google-Smtp-Source: ABdhPJwXBBj9cHsPWQwl+eX9LW5bTZAU6HexJBOWwqIuNHgx7dYVrz/3RzDOqd02GTqBEwED39x6Cg==
X-Received: by 2002:a54:4d9b:0:b0:324:f014:80d5 with SMTP id y27-20020a544d9b000000b00324f01480d5mr2634714oix.110.1651271977531;
        Fri, 29 Apr 2022 15:39:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l2-20020a4ad9c2000000b0035eb4e5a6b7sm1269496oou.13.2022.04.29.15.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 15:39:37 -0700 (PDT)
Received: (nullmailer pid 3032996 invoked by uid 1000);
	Fri, 29 Apr 2022 22:39:35 -0000
Date: Fri, 29 Apr 2022 17:39:35 -0500
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, dev@lynxeye.de, marcel.ziswiler@toradex.com, tharvey@gateworks.com, leoyang.li@nxp.com, sebastian.reichel@collabora.com, cniedermaier@dh-electronics.com, clin@suse.com, giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 04/15] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT1170
 compatible
Message-ID: <YmxpJ//rsCRBO2Jz@robh.at.kernel.org>
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
 <20220428214838.1040278-5-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428214838.1040278-5-Mr.Bossman075@gmail.com>

On Thu, Apr 28, 2022 at 05:48:27PM -0400, Jesse Taube wrote:
> Add i.MXRT1170 compatible string to Documentation.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1 -> V2:
>  - New commit to fix dtbs_check
> ---
>  Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> index 19621a2f8beb..b4d98a9c0952 100644
> --- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> @@ -34,6 +34,7 @@ properties:
>            - fsl,imx6ull-usdhc
>            - fsl,imx7d-usdhc
>            - fsl,imx7ulp-usdhc
> +          - fsl,imx1050-usdhc

typo? Should be fsl,imxrt1050-usdhc?

>            - nxp,s32g2-usdhc
>        - items:
>            - enum:
> @@ -44,6 +45,11 @@ properties:
>                - fsl,imx8qm-usdhc
>                - fsl,imx8qxp-usdhc
>            - const: fsl,imx7d-usdhc
> +      - const: fsl,imxrt1050-usdhc

You don't need this line.

> +      - items:
> +          - enum:
> +              - fsl,imxrt1170-usdhc
> +          - const: fsl,imxrt1050-usdhc
>  
>    reg:
>      maxItems: 1
> -- 
> 2.35.1
> 
> 
