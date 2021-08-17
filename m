Return-Path: <SRS0=hQyD=NI=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB58C4338F
	for <soc@archiver.kernel.org>; Tue, 17 Aug 2021 18:46:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B820D60FC3; Tue, 17 Aug 2021 18:46:43 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D68660EFF;
	Tue, 17 Aug 2021 18:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D68660EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id bj40so529017oib.6;
        Tue, 17 Aug 2021 11:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b4LH5u0KhUfAlgd1fdyz9ZjG+CpygTQr8w8JJtZ1B74=;
        b=s/GfxNUAVPcYpGU0bxB9ytOGN1pQgRIU35H4L41EtSGAx9uxcNdhy53lahpUzBqxL/
         Z6QX51i2Dd3Of//54J2EFTJ+k/SId2+CIcpzDTzLpacDfqg3aPgciAQbc4dQzzxrac6P
         LZdgUPVZYzvFI4HM8eXiwmqEeFT/d4xK6fB832k+zrChnZpbNlK/6vO9lS4+Co1dneFQ
         dtFkChMM+v7ArJTXEs+9QQCJZpZ+J6SFf7Ko548EeCK6mVYH8c+zLrOookZdAsh/gyDQ
         d23NmOu6X9WqFSOy1c8wyiqk3RvMv9tGaFB1qoo9qdDXkC7J/Vg9zUcorYtFS5uR6afA
         6dkg==
X-Gm-Message-State: AOAM5313N8XffXkI2wEEFGhS54B2TqG+OBOo1OGqJitCZtq9TUKHbAZH
	BBH9yeDquNaMDwrEoD7DBw==
X-Google-Smtp-Source: ABdhPJyb+e3INPAtFRLFklMWl+fZQxDDn2l23zD16hQgbtUM3bjFJ83mJs0R8MOWe+/4wpRFVgwPeQ==
X-Received: by 2002:a05:6808:7c2:: with SMTP id f2mr2342723oij.20.1629226002922;
        Tue, 17 Aug 2021 11:46:42 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y24sm551038oto.40.2021.08.17.11.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 11:46:42 -0700 (PDT)
Received: (nullmailer pid 640500 invoked by uid 1000);
	Tue, 17 Aug 2021 18:46:41 -0000
Date: Tue, 17 Aug 2021 13:46:41 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@kernel.org, alexandre.belloni@bootlin.com, olof@lixom.net, arnd@arndb.de, devicetree@vger.kernel.org, robh+dt@kernel.org, ludovic.desroches@microchip.com, nicolas.ferre@microchip.com
Subject: Re: [PATCH v2 6/7] dt-bindings: ARM: at91: document exegin q5xr5
 board
Message-ID: <YRwEEQ0SgQRDnd7t@robh.at.kernel.org>
References: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
 <20210816064416.1630674-7-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816064416.1630674-7-claudiu.beznea@microchip.com>

On Mon, 16 Aug 2021 09:44:15 +0300, Claudiu Beznea wrote:
> Document Exegin Q5xR5 board.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

