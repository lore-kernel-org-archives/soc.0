Return-Path: <SRS0=HVze=LM=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30519C48BDF
	for <soc@archiver.kernel.org>; Fri, 18 Jun 2021 21:06:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0B41961261; Fri, 18 Jun 2021 21:06:59 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D09E361279;
	Fri, 18 Jun 2021 21:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D09E361279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-oo1-f54.google.com with SMTP id q20-20020a4a6c140000b029024915d1bd7cso2767939ooc.12;
        Fri, 18 Jun 2021 14:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YtiOyReou+pF/1rfufORAr+idx/wS1LrrDO07j6J4ZY=;
        b=TxpYeAur26zXtqWuCC8pkg4Ugacf3o81iZsJqu6Khb5MaAQe8hCY1C/PMeQP/L6XwL
         QZXUfHmG3X+KLBX9igngIC7iUHn9n4pH4KF9Ux2SGY3nrspvEc7I1NkuT/MCulWSsl3y
         msok/CjFZoQ5/s8lozfeAPe30ndw2lXbM5VmOgwI25t75IpK/OAxzze69oz8j25N3YDf
         rsTj5qlFeoWLO5S3WLvrYl7lQDk3FzCHyeb9PHQu9dmbJLFs3XRDHt73oBnu98B4EhR1
         SqA3Qx8ui6qxuxiCY4E3DOTh5U/ZlXkkU+5a00E0BQfcpSAuKBhRsGdiBTq4G01tBc/X
         6Uwg==
X-Gm-Message-State: AOAM533yZAkDlGrxJkZsYr7rgZLYRyATvcPF+P2MbYkORCi5NHpWUzJ9
	XOT+iLc1Vi7qlAngiBPGPA==
X-Google-Smtp-Source: ABdhPJxMCbp/u0TP+JyeZh7NKeN4BrawJlBzXSydp60BTZbERp/w/KlhgnJ1kT4nGA+auxBWoWyDRw==
X-Received: by 2002:a4a:cb06:: with SMTP id r6mr10657436ooq.15.1624050418226;
        Fri, 18 Jun 2021 14:06:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t39sm2014170ooi.42.2021.06.18.14.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 14:06:57 -0700 (PDT)
Received: (nullmailer pid 2874848 invoked by uid 1000);
	Fri, 18 Jun 2021 21:06:54 -0000
Date: Fri, 18 Jun 2021 15:06:54 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Fabio Estevam <festevam@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, soc@kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v1 3/4] dt-bindings: arm: fsl: add SKOV imx6q and imx6dl
 based boards
Message-ID: <20210618210654.GA2874818@robh.at.kernel.org>
References: <20210609121050.18715-1-o.rempel@pengutronix.de>
 <20210609121050.18715-4-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609121050.18715-4-o.rempel@pengutronix.de>

On Wed, 09 Jun 2021 14:10:49 +0200, Oleksij Rempel wrote:
> Add SKOV imx6q/dl LT2, LT6 and mi1010ait-1cp1 boards.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
