Return-Path: <SRS0=WbWG=NE=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7B7C4338F
	for <soc@archiver.kernel.org>; Fri, 13 Aug 2021 18:55:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A69EC61038; Fri, 13 Aug 2021 18:55:20 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D44060FC4;
	Fri, 13 Aug 2021 18:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D44060FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id u25so17285256oiv.5;
        Fri, 13 Aug 2021 11:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cng24zHOfefhsIyuo8+sls9JUJaOQc7bK59B/LvqdMk=;
        b=UOpel8sCmD7z5BUlmG12h7fxu1uAoQcqpY8XKFZQZiqHHZKLl05XIU1R1PSXm1FDHI
         oYW6IssanSDidV4bPdFq//CN+JSrxxwJAihOyP84qvgbTJooSXi6/1PRdvwxjKac3c+P
         ZJnUiUL0WthqYDZPpKVA9WUt7YlCc8soHZzkiG/fh27aVr+LXtm37bLNMwiLbXhtRI5J
         6OcFyLG/esCEZb72yQkf1ZRSspItL90YsDRDADsu1qdOQ/T/bM24GQyjn1Z78fNwgaF9
         Z3RnxOGM5Wyxme48XmRcQNP/YBdN3EmucHjbEdi5zvpMEdepS5BJFASFuOAjyhPxQna+
         s14w==
X-Gm-Message-State: AOAM532mL8gMPEBXQ+b2u5FLLaVDclPoDlihKVBPPiuc4x4jAGuvay54
	tQ/coFkx3wz+41gs05RHVQ==
X-Google-Smtp-Source: ABdhPJzwh8U81EC0A8V3HPWGGTJ4J2sIg/6C2OiLum4E+86UHhc9fu+Yxp/WTdfVouHPjIRsBKPoDg==
X-Received: by 2002:a05:6808:bcd:: with SMTP id o13mr3401856oik.61.1628880919869;
        Fri, 13 Aug 2021 11:55:19 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t3sm520494oic.13.2021.08.13.11.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 11:55:19 -0700 (PDT)
Received: (nullmailer pid 3859064 invoked by uid 1000);
	Fri, 13 Aug 2021 18:55:18 -0000
Date: Fri, 13 Aug 2021 13:55:18 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: olof@lixom.net, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, devicetree@vger.kernel.org, nicolas.ferre@microchip.com, soc@kernel.org, ludovic.desroches@microchip.com, robh+dt@kernel.org, alexandre.belloni@bootlin.com
Subject: Re: [PATCH 2/7] dt-bindings: add vendor prefix for exegin
Message-ID: <YRbAFrGzKv9s0mKe@robh.at.kernel.org>
References: <20210805155357.594414-1-claudiu.beznea@microchip.com>
 <20210805155357.594414-3-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805155357.594414-3-claudiu.beznea@microchip.com>

On Thu, 05 Aug 2021 18:53:52 +0300, Claudiu Beznea wrote:
> Add vendor prefix for Exegin Technologies Limited.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
