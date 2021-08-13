Return-Path: <SRS0=WbWG=NE=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E852C4338F
	for <soc@archiver.kernel.org>; Fri, 13 Aug 2021 18:55:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 11EEE6024A; Fri, 13 Aug 2021 18:55:56 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE44060231;
	Fri, 13 Aug 2021 18:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE44060231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id d10-20020a9d4f0a0000b02904f51c5004e3so13164449otl.9;
        Fri, 13 Aug 2021 11:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L0pfLxRNKo02qzCvo3QeOM9KCSwF5hE7nSVfXNEo/n4=;
        b=Px1ek/ZRM0r3s5DF1ERpi0ZqIDvSKafuAjW1eTMIRcfP/ARNsEsU0vjfpnGb4Bm0Z6
         447Pp/vN0qArgjD/rKFz0wfs+x6zycnrL7Bbgr3wYNt5i//KNBtT4OgsNEgNMFpc5tqp
         +zi6ItcsxHpBTYMFuI6Mzi1oDApqgasVx+go3h8jdw/mOrWfhEKYbJhFlFxzzQsdsonN
         UJ8dRwbaoAc6SrJBuBFiISN7sJzjfDJ2yHJ32uWCksqRo7g7GUJezISsSn2nGuoxxsjK
         zA1BUOhqWmYY2c1Ic936oad3Z8/8Cy80rKoWNMiQLTLFmxeYf2LADAzx7SFEaANTpPBJ
         Sdsg==
X-Gm-Message-State: AOAM531tNfNyXuzoBDq3PL18YtS2d3AvNj7uIbiRAE6Ou0L69WDaLQG5
	0JQVrEyyZhmoAWBXk0OWtg==
X-Google-Smtp-Source: ABdhPJxF8W59I5HF/nGleAn8s5FNFCVTubE+Y9Cx1YpkOP7Ji8jY4ePHPHUQr9pRU2lN8utICytuLQ==
X-Received: by 2002:a9d:266a:: with SMTP id a97mr1850524otb.114.1628880955277;
        Fri, 13 Aug 2021 11:55:55 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t21sm463096otl.67.2021.08.13.11.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 11:55:54 -0700 (PDT)
Received: (nullmailer pid 3860141 invoked by uid 1000);
	Fri, 13 Aug 2021 18:55:53 -0000
Date: Fri, 13 Aug 2021 13:55:53 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, nicolas.ferre@microchip.com, olof@lixom.net, arnd@arndb.de, soc@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: ARM: at91: document exegin q5xr5 board
Message-ID: <YRbAOYoRoMCtxuGL@robh.at.kernel.org>
References: <20210805155357.594414-1-claudiu.beznea@microchip.com>
 <20210805155357.594414-4-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805155357.594414-4-claudiu.beznea@microchip.com>

On Thu, 05 Aug 2021 18:53:53 +0300, Claudiu Beznea wrote:
> Document Exegin Q5xR5 board.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
