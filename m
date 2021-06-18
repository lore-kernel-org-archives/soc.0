Return-Path: <SRS0=HVze=LM=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9DAC48BE8
	for <soc@archiver.kernel.org>; Fri, 18 Jun 2021 21:06:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 187DE61261; Fri, 18 Jun 2021 21:06:21 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA85461264;
	Fri, 18 Jun 2021 21:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA85461264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-oi1-f179.google.com with SMTP id s23so11961736oiw.9;
        Fri, 18 Jun 2021 14:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=F22AKDNL3d07Kxi7bAvLGrzvtDt3Ggs0m0nDR4Vfnrk=;
        b=SqQiHROvf6F+KfWckLdV4Wug7Rf5Ywwi0OHo4m2DmMXa6SQ8C6YmBDO7GM0IqxOCrx
         fh3VNKnXBy0W4fUBn/mMlQhltF5KoGfdu6b6nTVkjcyLiuA4feLNPrPLWjgRutbEOf72
         zdfro0dxl3vCB098mfVHj9QnQQ7xYJt0pEasoeFuyCIEX3KpfVABEiOH5e4oKXlXN4xU
         Y5nlExQh/gO1fLyXWCbMzeIfiWZwgbZ22eAUtLo3Jk/zQ+JYxtg/BNfA/MXeUxRaXS2J
         VJjiqSLsdJmmEY2CEb1TnBUz5a/pdcfeTom7QrJyIlBsoxpSifWf+B/tHjfplv+hBAi/
         R+2A==
X-Gm-Message-State: AOAM533TOIJixFY6SX225p8RIorwccNqbIbY4lAoC+bsUc7EgttLjJzP
	PkEf34UQYsIPux9DioIhUQ==
X-Google-Smtp-Source: ABdhPJxJZLUHgtZu7sTq3PAbrobAWO/1QnPSMepIbgPrF28rW+Vr/C9MDt7TspFK7/RwnzNGmtYu0A==
X-Received: by 2002:a54:400c:: with SMTP id x12mr15730026oie.89.1624050380272;
        Fri, 18 Jun 2021 14:06:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t3sm1647263oic.48.2021.06.18.14.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 14:06:19 -0700 (PDT)
Received: (nullmailer pid 2873797 invoked by uid 1000);
	Fri, 18 Jun 2021 21:06:13 -0000
Date: Fri, 18 Jun 2021 15:06:13 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Olof Johansson <olof@lixom.net>, soc@kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 1/4] dt-bindings: display: simple: add some Logic
 Technologies and Multi-Inno panels
Message-ID: <20210618210613.GA2873750@robh.at.kernel.org>
References: <20210609121050.18715-1-o.rempel@pengutronix.de>
 <20210609121050.18715-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210609121050.18715-2-o.rempel@pengutronix.de>

On Wed, 09 Jun 2021 14:10:47 +0200, Oleksij Rempel wrote:
> Add Logictechno and Multi-Inno panels:
> - Logic Technologies LTTD800x480 L2RT 7" 800x480 TFT Resistive Touch Module
> - Logic Technologies LTTD800480070-L6WH-RT 7” 800x480 TFT Resistive Touch Module
> - Multi-Inno Technology Co.,Ltd MI1010AIT-1CP 10.1" 1280x800 LVDS IPS Cap Touch Mod.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
