Return-Path: <SRS0=WbWG=NE=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECAEC4338F
	for <soc@archiver.kernel.org>; Fri, 13 Aug 2021 18:56:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AE16F6056B; Fri, 13 Aug 2021 18:56:16 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C0FA60E9B;
	Fri, 13 Aug 2021 18:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C0FA60E9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id r16-20020a0568304190b02904f26cead745so13141136otu.10;
        Fri, 13 Aug 2021 11:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hzJEw0L+kP4NgMaVTXLDpwO/ZHH+044EBwZ0FnUt4pc=;
        b=AC+IDWEKYom+j8MGKrlRYbyEZ8CVWvQvj3N2Jfxc8VjRfER44S6Ul6Vs/3hnAGB1oI
         xgiZvuTtGqiwsDFd2Td1PGKVM96abvsnph8CKBF/PAr5gdhvEyJFVkgbCmUXHckvYUOX
         BDWvxUWOvCRSxWmPZNMpsX4NTC8IfeUMxZocic8ggEi50GTAf24JEfgT2va93478qtHM
         r1BMv/XSrO8gv7SQ/0R1V+qYhNGl6qrN5rbRcDMUQEh9xaZb+Y+PKYVLiSrmDry2MVhz
         dGKcVMHIaB7st5sYD58PrRnSt8IjBrwjEdefABcocoO0HfATHuPFRQOD/R+kefZntTBb
         5FGw==
X-Gm-Message-State: AOAM532Wh17o3ZPzBmavJc817dSS19hRlqPE5twLyGxqZkdjO9Cu81En
	4BLIWLAz+E7K9hsTcXhfiQ==
X-Google-Smtp-Source: ABdhPJxF3tjwBS2dlLyMp36aylpfzvH9ZeHuko+34laK+0gtd9fhwvTyAGtSV/ixwbCc6l+jU0CfSg==
X-Received: by 2002:a9d:7d90:: with SMTP id j16mr3341650otn.186.1628880975818;
        Fri, 13 Aug 2021 11:56:15 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a19sm485076otl.48.2021.08.13.11.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 11:56:15 -0700 (PDT)
Received: (nullmailer pid 3860867 invoked by uid 1000);
	Fri, 13 Aug 2021 18:56:14 -0000
Date: Fri, 13 Aug 2021 13:56:14 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: nicolas.ferre@microchip.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, olof@lixom.net, alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org, soc@kernel.org, ludovic.desroches@microchip.com, arnd@arndb.de
Subject: Re: [PATCH 5/7] dt-bindings: add vendor prefix for calamp
Message-ID: <YRbAThIgS8qPi9UP@robh.at.kernel.org>
References: <20210805155357.594414-1-claudiu.beznea@microchip.com>
 <20210805155357.594414-6-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805155357.594414-6-claudiu.beznea@microchip.com>

On Thu, 05 Aug 2021 18:53:55 +0300, Claudiu Beznea wrote:
> Add vendor prefix for CalAmp Corp.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
