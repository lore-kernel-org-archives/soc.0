Return-Path: <SRS0=hQyD=NI=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C60FC4338F
	for <soc@archiver.kernel.org>; Tue, 17 Aug 2021 22:18:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 742C060E90; Tue, 17 Aug 2021 22:18:39 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A1A660EE0;
	Tue, 17 Aug 2021 22:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A1A660EE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so309238oth.7;
        Tue, 17 Aug 2021 15:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hH6x0kKNvTVTngzAJglfbn28xI8QAAWrgkjyn1ogaAA=;
        b=kNN0Eki+iIeJG6jWWx9cyCCZaXtYUzHsJ6LRazm7gth6BoqmN59Ur3C4RINPdSnqBV
         fIE5CYaExKaSp3uHstZKvkDk7plO5xKsCXR0YbrQsqQYpjcvKUjFDQWT6ONdRpTZQzhF
         K6nBXisrbfGUT33DToPDSWnd3xiXNTX6REdLIXamJbnN5dYiscdBtJCgz6YTHxwo61/+
         LBfpH5wDNYZy83gx9hRC2oCIqX8qy6uSI49rUJ4MCZpJjZnqxG6p7h6zQ0Cx3q0yeVjx
         LNTR35AYwmmVesqSZXavab6rDff37lFG/a50pMO2/G3tGIPyY5hJTU30W+M9Mgd4g6Sm
         eOZQ==
X-Gm-Message-State: AOAM530zRYVdtOSGB8pv7ViY2bIXjU1dBKeHp+ytP85FkYWAhi5NgPDN
	1XfwHfR2Tx9Lo0x+qbOb3w==
X-Google-Smtp-Source: ABdhPJyZkwXaIBIiV+RYqjeipQRsYMSwJcPUjKRxBFM10YNTOL1cqAvlf+PDs3/94oHBkGxuqgjARA==
X-Received: by 2002:a9d:77da:: with SMTP id w26mr4522551otl.293.1629238718681;
        Tue, 17 Aug 2021 15:18:38 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s12sm654598otk.21.2021.08.17.15.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 15:18:37 -0700 (PDT)
Received: (nullmailer pid 939324 invoked by uid 1000);
	Tue, 17 Aug 2021 22:18:36 -0000
Date: Tue, 17 Aug 2021 17:18:36 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: alexandre.belloni@bootlin.com, soc@kernel.org, arnd@arndb.de, nicolas.ferre@microchip.com, linux-arm-kernel@lists.infradead.org, olof@lixom.net, linux-kernel@vger.kernel.org, ludovic.desroches@microchip.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: ARM: at91: document CalAmp LMU5000
 board
Message-ID: <YRw1vN9KHSY1hCmR@robh.at.kernel.org>
References: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
 <20210816064416.1630674-4-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816064416.1630674-4-claudiu.beznea@microchip.com>

On Mon, 16 Aug 2021 09:44:12 +0300, Claudiu Beznea wrote:
> Document CalAmp LMU5000.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
