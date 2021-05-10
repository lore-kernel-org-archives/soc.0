Return-Path: <SRS0=qa4P=KF=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E279C433B4
	for <soc@archiver.kernel.org>; Mon, 10 May 2021 15:49:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 197EF61400; Mon, 10 May 2021 15:49:23 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB6FF6143C;
	Mon, 10 May 2021 15:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB6FF6143C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so4652141otg.2;
        Mon, 10 May 2021 08:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jbgJ2xIcj4Tn125ILT0iif80RhniBOFq8W6ICy6OMZc=;
        b=YJyW5RhkhSGY+xM29AyhUX/bcULI/ucn9A7M0CHYufVwBgzIUYIAO/zKluz87Lmt7g
         EXMCRb24vZy0Hkp6vNvME8PII6oAvkEhoGAZfC5hu0EOxcSOBwj32rfUUvbk3aM3LUia
         PZMDHkHXgSgspNLAYDIPB3tfiupAWc2jICvv1UGMbDgDDhLZ3JpP3LDSssWjH94FCnKf
         sXDsAnACLBR8F0G6W7RBruvQJlf2ynA+WF1cuTc+EhyjjiGz4dzvFhOshWGWmTZ39o1B
         rq9F/YcD2Cvv/MdUNo+UEbI19UF1eg99dUJsdJChAMWD0HnwrBirK4MchIRCm0aOpX0G
         ls0A==
X-Gm-Message-State: AOAM533mUjKa7CiXsGiMWaL1HV49Q6WvBckA7/2oWWSc0ccJR5lKcynr
	4nWvsqfk0a56WtGqGOlihw==
X-Google-Smtp-Source: ABdhPJxqwatdUXu5iD5ufgA065ek3wwc3mDJfGRnXDZj4TVrpVHHBi/u5IzRcZZV+NBBHDIQv89GQA==
X-Received: by 2002:a9d:6a88:: with SMTP id l8mr22407633otq.236.1620661762113;
        Mon, 10 May 2021 08:49:22 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 19sm1129696oiy.11.2021.05.10.08.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 08:49:20 -0700 (PDT)
Received: (nullmailer pid 185884 invoked by uid 1000);
	Mon, 10 May 2021 15:49:19 -0000
Date: Mon, 10 May 2021 10:49:19 -0500
From: Rob Herring <robh@kernel.org>
To: Eugen Hristev <eugen.hristev@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: ludovic.desroches@microchip.com, claudiu.beznea@microchip.com, alexandre.belloni@bootlin.com, soc@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, codrin.ciubotariu@microchip.com, nicolas.ferre@microchip.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: ARM: at91: document sama7g5ek board
Message-ID: <20210510154919.GA185855@robh.at.kernel.org>
References: <20210507152655.182558-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210507152655.182558-1-eugen.hristev@microchip.com>

On Fri, 07 May 2021 18:26:52 +0300, Eugen Hristev wrote:
> Document the SAMA7G5 Evaluation Kit based on sama7g5 SoC.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
