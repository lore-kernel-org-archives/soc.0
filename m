Return-Path: <SRS0=IvzB=VL=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72DEC433F5
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 21:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B0BFCC385A4; Tue,  3 May 2022 21:43:39 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F089FC385B1;
	Tue,  3 May 2022 21:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F089FC385B1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f179.google.com with SMTP id y63so19568670oia.7;
        Tue, 03 May 2022 14:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AslExF7FIeWiE1XAfGO7Gr/CjNSAVkdBagVMGjZRKl8=;
        b=AMw7GyY5A/e49+0Fwc85z3IZAKb4lwJpIWZ+LFgeQEI0SaZuqW2jnobyHix46/GbH8
         RWfWB1rNNaSwpfBa6/M5YRp5L0IxdXldKIxtLprnctkuAMww6rCs0o7w38fmpPDTbLko
         9yt33lPozAuE1HdpiQuyRNdp1tmoCCwzIll/jnE9zZrFUW1UFDWUSB7YAMrIUjNMgn0K
         xjf/HoQ84GoLf21X5QQv0w53eQN+oQGBPDl6l0/4DTwvgFXW7dRGpfS2NFaaGbIbQrJl
         URQ9PrGLY+ttVqVHE/qMgXFq18TAZauvItK5nXdnKOeMctIrw9H4ZOxbXJuLC97OvslL
         EbAw==
X-Gm-Message-State: AOAM530sgVbrwA4idQ1rBPqLJkoNjWIVk1u0z+6T13eAJtYk+l4HJ2fX
	wnlx6oyIrudCYt56qKkCFA==
X-Google-Smtp-Source: ABdhPJyNoO0eggMNyiE7l98v1cDQkC/VjzdrCByZYzlJVVHHsc/h+ndTz6SRfZY6gegAaIjIw8NSKg==
X-Received: by 2002:a05:6808:144c:b0:325:64f3:d428 with SMTP id x12-20020a056808144c00b0032564f3d428mr2786884oiv.210.1651614217929;
        Tue, 03 May 2022 14:43:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w3-20020a056830280300b006060322123dsm4307533otu.13.2022.05.03.14.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 14:43:37 -0700 (PDT)
Received: (nullmailer pid 83673 invoked by uid 1000);
	Tue, 03 May 2022 21:43:36 -0000
Date: Tue, 3 May 2022 16:43:36 -0500
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, daniel.lezcano@linaro.org, clin@suse.com, festevam@gmail.com, linux-imx@nxp.com, mturquette@baylibre.com, linus.walleij@linaro.org, devicetree@vger.kernel.org, giulio.benetti@benettiengineering.com, kernel@pengutronix.de, leoyang.li@nxp.com, robh+dt@kernel.org, linux@armlinux.org.uk, olof@lixom.net, arnd@arndb.de, tglx@linutronix.de, dev@lynxeye.de, cniedermaier@dh-electronics.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org, stefan@agner.ch, sebastian.reichel@collabora.com, sboyd@kernel.org, soc@kernel.org, Mr.Bossman075@gmail.com, abel.vesa@nxp.com, linux-kernel@vger.kernel.org, s.hauer@pengutronix.de, tharvey@gateworks.com, marcel.ziswiler@toradex.com, aisheng.dong@nxp.com
Subject: Re: [PATCH v2 06/15] dt-bindings: pinctrl: add i.MXRT1170 pinctrl
 Documentation
Message-ID: <YnGiCNvnW86ZIejd@robh.at.kernel.org>
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
 <20220428214838.1040278-7-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428214838.1040278-7-Mr.Bossman075@gmail.com>

On Thu, 28 Apr 2022 17:48:29 -0400, Jesse Taube wrote:
> Add i.MXRT1170 pinctrl binding Documentation
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1 -> V2:
>  - Nothing done
> ---
>  .../bindings/pinctrl/fsl,imxrt1170.yaml       | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
