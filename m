Return-Path: <SRS0=WedL=ME=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15E2C07E9C
	for <soc@archiver.kernel.org>; Mon, 12 Jul 2021 20:14:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 909B760FF0; Mon, 12 Jul 2021 20:14:30 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65D51611CB;
	Mon, 12 Jul 2021 20:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65D51611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-io1-f46.google.com with SMTP id d9so24228108ioo.2;
        Mon, 12 Jul 2021 13:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ujFMA+hMrUmT7cVUeg1tfuvODZSAIYxTqES6NtonES4=;
        b=YhkC5mRzwe9Qggk0ryOyL5Ck/yXYT4JyoHrpvKiFlGjP841SDnm/5EYNry1K2/IzYP
         V/KaO/PI2Cd36neIj20/gqcL6+MHBuPV9K4bDxald29svKXWRV3cm+XB+Mr5ZTDTe4kF
         GzxS6NZtX2TDXEFlnBoNjPFE8581GuELl9fmbiVe1AzD2m6TkuPt5ChOM7BNyKnG2HfH
         yMRWziq/QElfD/+976Wc66HbVQWIN8u83sTfGvnfsHIomqmXlFUu9M9n9tbkIFk74l/5
         fqfX8EJb/quVGZyjxk/pT+/H3q7yr9NIz3Zo0mjp4g1tLn3Cq1xMVXuKfeO55Amt6J1B
         Er1g==
X-Gm-Message-State: AOAM530ofA4rmD8vgGp2qKEUpsVWhh9xYpghbHLuAW88xTgbGzxsy4JD
	DY+RryLRuWxTuXQOJwwSlw==
X-Google-Smtp-Source: ABdhPJzOLn4APGVG1nKmc2qZ2z5S2MfzNNZt/cT3GpZl4Pv4O9svr42eRc1ndov0GLJQAPDrJRbBfw==
X-Received: by 2002:a6b:fe09:: with SMTP id x9mr533070ioh.20.1626120869835;
        Mon, 12 Jul 2021 13:14:29 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h13sm3137813ila.44.2021.07.12.13.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 13:14:28 -0700 (PDT)
Received: (nullmailer pid 2412840 invoked by uid 1000);
	Mon, 12 Jul 2021 20:14:27 -0000
Date: Mon, 12 Jul 2021 14:14:27 -0600
From: Rob Herring <robh@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, Li Yang <leoyang.li@nxp.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add SolidSense boards
Message-ID: <20210712201427.GA2412806@robh.at.kernel.org>
References: <E1ludJe-0001rQ-8c@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1ludJe-0001rQ-8c@rmk-PC.armlinux.org.uk>

On Sat, 19 Jun 2021 16:55:26 +0100, Russell King (Oracle) wrote:
> Add SolidRun SolidSense boards.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
