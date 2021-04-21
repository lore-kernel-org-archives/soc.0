Return-Path: <SRS0=Pp40=JS=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DCBC433B4
	for <soc@archiver.kernel.org>; Wed, 21 Apr 2021 22:08:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 04DD061437; Wed, 21 Apr 2021 22:08:21 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C91B161439;
	Wed, 21 Apr 2021 22:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C91B161439
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-ot1-f48.google.com with SMTP id i16-20020a9d68d00000b0290286edfdfe9eso29704453oto.3;
        Wed, 21 Apr 2021 15:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ogAI8lijeVMhpP0KzWT5cWLb3gfzY1kK9mczRtEJ5GQ=;
        b=f/ufNj0CAV1TTB2Mo2XNLL9+95whmzBGezNOLuqe3TvmAdshLi25oZ/1fv2zvUOcOm
         MLyeA4TVk12knaPOMwwmqO3Rh/GmH7vJLoVfJP+l28mJ6Ji97qoEpiAwij/UsLGnYLrC
         DvOnN4WNgnOH8L0aaJJik5wyAkYZpqGQpRL2Enkre+qW4bdGtVAJb/frmb9hhUbqmRUc
         +LOkYSrxo+zX9KeTZUw6pgQEQPMIw9yNCo+It/EK7djJchKgBXFm2/WmxQANWheR+5aY
         f/Rm4/6cKvUJD6pYhrfzp/zXToc4XR0JxV4TRPt5lKC0rWTUY2VK12svdOR2YOZ6GcfD
         WqIg==
X-Gm-Message-State: AOAM530ukLjLOgHc2KzpMjCCtqBbKuEatRfol8DRX8Dapw3P2PXaWcYG
	JcV8kWCLaGDMj3OIU8zK4A==
X-Google-Smtp-Source: ABdhPJw0W0dG7gtawcvuBCeeexKFOXPCEzTcs1o3Os9xSTfMg69F/6plTv+OtgNEaEjEI3FUsTqMoA==
X-Received: by 2002:a9d:7b59:: with SMTP id f25mr249406oto.53.1619042900067;
        Wed, 21 Apr 2021 15:08:20 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x2sm210190ote.47.2021.04.21.15.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 15:08:19 -0700 (PDT)
Received: (nullmailer pid 1702678 invoked by uid 1000);
	Wed, 21 Apr 2021 22:08:18 -0000
Date: Wed, 21 Apr 2021 17:08:18 -0500
From: Rob Herring <robh@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-amlogic@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: mali-bifrost: add dma-coherent
Message-ID: <20210421220818.GA1702628@robh.at.kernel.org>
References: <20210421204833.18523-1-khilman@baylibre.com>
 <20210421204833.18523-2-khilman@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421204833.18523-2-khilman@baylibre.com>

On Wed, 21 Apr 2021 13:48:33 -0700, Kevin Hilman wrote:
> Add optional dma-coherent property to binding doc.
> 
> Found by 'make dtbs_check' on arm64/amlogic DT files.
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
