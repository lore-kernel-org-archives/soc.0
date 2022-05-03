Return-Path: <SRS0=IvzB=VL=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA59C433EF
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 21:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7235FC385B3; Tue,  3 May 2022 21:43:02 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6F4FC385B2;
	Tue,  3 May 2022 21:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B6F4FC385B2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id z15-20020a9d65cf000000b00605f064482cso9689007oth.6;
        Tue, 03 May 2022 14:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7Hu0gsr8Y6PWp2FP45L7+RGtOMCVNeN3hbCuvJ2usXo=;
        b=h/i1ohZN46NXY7Ht7NSRn1+/GFxSl5BgyZlSnkVZxnCdmJHleb6EKMTH6df38rY5vJ
         4tuH4MiHooTWSGZarLgwGoRsrTUxXZdh5HzXNRFx90d/YhDhVPgR/q0r7g15cfjGJWhX
         ggd9ZJmxUgu7jrQDiT58t7evpP1ENY1k/3X7oz6NH8eixRswuVSHq9D5lNkgEBd+RtZu
         JhpQ0p5ZfKl9JdA+sNnDkTKDFO0Pw3IC0c/qpMNAmAUcFwIfXUrvCjVmb0jDTyJ0IfY3
         vFDVYKYewPhYHWppGa6oeUpSKGH3q731k0TNSqjT9p9qGR4VUsPUbRsV5RV29jQI1KGd
         yNuA==
X-Gm-Message-State: AOAM530N663FeoQMqKLfgjeApOowb+grkngHVodhLB005j8IFKehWB1V
	W639tAn60qEt+tdmXE8qrQ==
X-Google-Smtp-Source: ABdhPJz4N4R764kPo+v++/Y+BmcZqqzXF0v6pZHNpMo6V//OxOtU550cg4XA4nzAnBjeZQ2Nv/molw==
X-Received: by 2002:a9d:1714:0:b0:606:eaf:fa95 with SMTP id i20-20020a9d1714000000b006060eaffa95mr5217807ota.180.1651614180748;
        Tue, 03 May 2022 14:43:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bg1-20020a056808178100b00326414c1bb7sm686470oib.35.2022.05.03.14.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 14:43:00 -0700 (PDT)
Received: (nullmailer pid 82356 invoked by uid 1000);
	Tue, 03 May 2022 21:42:58 -0000
Date: Tue, 3 May 2022 16:42:58 -0500
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: sboyd@kernel.org, linux-clk@vger.kernel.org, daniel.lezcano@linaro.org, leoyang.li@nxp.com, giulio.benetti@benettiengineering.com, festevam@gmail.com, clin@suse.com, s.hauer@pengutronix.de, linux-imx@nxp.com, stefan@agner.ch, tharvey@gateworks.com, linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com, robh+dt@kernel.org, tglx@linutronix.de, abel.vesa@nxp.com, sebastian.reichel@collabora.com, dev@lynxeye.de, Mr.Bossman075@gmail.com, linux-kernel@vger.kernel.org, kernel@pengutronix.de, olof@lixom.net, mturquette@baylibre.com, linux@armlinux.org.uk, linus.walleij@linaro.org, cniedermaier@dh-electronics.com, soc@kernel.org, linux-gpio@vger.kernel.org, shawnguo@kernel.org, marcel.ziswiler@toradex.com, arnd@arndb.de, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 03/15] dt-bindings: gpio: fsl-imx-gpio: Add i.MXRT
 compatibles
Message-ID: <YnGh4oZOm9eHO9z2@robh.at.kernel.org>
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
 <20220428214838.1040278-4-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428214838.1040278-4-Mr.Bossman075@gmail.com>

On Thu, 28 Apr 2022 17:48:26 -0400, Jesse Taube wrote:
> Both the i.MXRT1170 and 1050 have the same gpio controller as
> "fsl,imx35-gpio". Add i.MXRT to the compatible list.
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1 -> V2:
>  - New commit to fix dtbs_check
> ---
>  Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
