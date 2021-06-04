Return-Path: <SRS0=fTfs=K6=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DCDC4743C
	for <soc@archiver.kernel.org>; Fri,  4 Jun 2021 21:31:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E2483613F8; Fri,  4 Jun 2021 21:31:06 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1E7761287;
	Fri,  4 Jun 2021 21:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1E7761287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-oi1-f179.google.com with SMTP id r17so881273oic.7;
        Fri, 04 Jun 2021 14:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G8/6uPjm9zIO07Og3jk4Blee6TytpfNx97cozFtQkXk=;
        b=YMVCBOTeXysmcF2wAbu/KSfkNckI2ygyqy7B8KdxurGP2Gtuk0ic9jc7OgXn6sLev9
         c3e/aplwH33WXUaonOZvUk9zaOzMdqowDQV2CEIJLXtk+8dr/ru7Y3qHzcfZ9l0fHxUc
         /syfsoIjJkScBIQRVdrPS+7JoqH6WG3XCz9mxEtqNCqgJ/yi9/xHS1nyIq0hf2oKZhzA
         bUpYVliWgCpuX6cfe6p/HvFV81yeYYdniCyzrBtwQ2p76SwWsHgW87p1nYmgIt1bkKQS
         n6Hni0krkz5V11BhznROPfy9XXiPFAsMUWtBVcmcCymVOmt+jPKS0Sr4ZbvGMde4mX4C
         57GQ==
X-Gm-Message-State: AOAM533mMYDUcDsYIJDUxGoQA+oamZz0dBjKoMCsUiY+vrzuyTFuoyCW
	O9SRnD5gQDRAPBnWs3pZOdh/JbDctA==
X-Google-Smtp-Source: ABdhPJwt9RTOBE4geRHCniJZTQYsmuFJN2nxYT9C6QTFn0LP/lZgvq3IYcVDxInRaeGmlUib3nIgRQ==
X-Received: by 2002:aca:32d5:: with SMTP id y204mr4299396oiy.97.1622842265997;
        Fri, 04 Jun 2021 14:31:05 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p25sm667895ood.4.2021.06.04.14.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 14:31:05 -0700 (PDT)
Received: (nullmailer pid 3955311 invoked by uid 1000);
	Fri, 04 Jun 2021 21:31:04 -0000
Date: Fri, 4 Jun 2021 16:31:04 -0500
From: Rob Herring <robh@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, soc@kernel.org, Scott Branden <sbranden@broadcom.com>, Olof Johansson <olof@lixom.net>, Nicolas Saenz Julienne <nsaenz@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ray Jui <rjui@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] dt-bindings: arm: bcm2835: Add Raspberry Pi 400 to
 DT schema
Message-ID: <20210604213104.GA3955259@robh.at.kernel.org>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
 <1622366775-5309-5-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622366775-5309-5-git-send-email-stefan.wahren@i2se.com>

On Sun, 30 May 2021 11:26:13 +0200, Stefan Wahren wrote:
> Add new Raspberry Pi 400 to DT schema.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
