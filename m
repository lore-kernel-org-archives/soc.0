Return-Path: <SRS0=IZLd=ON=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E52C433EF
	for <soc@archiver.kernel.org>; Thu, 23 Sep 2021 16:56:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A358A61090; Thu, 23 Sep 2021 16:56:50 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77C1E6105A;
	Thu, 23 Sep 2021 16:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77C1E6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 5-20020a9d0685000000b0054706d7b8e5so9435155otx.3;
        Thu, 23 Sep 2021 09:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yCuhDbFySv0WBASIMuHbe9F9f8YaVqjJ37FH7IkOu2Q=;
        b=BkCD988AcUAvaWzYOlQ/G8oN8nRxcQjNzYRIgveLR8TnXEvPj1LjNI6lHscjdSXnoE
         Ny7QVqDTLA6Xb+5bv5yrNXKZOm6veTd2q+Ts0jqMct9xziF79YASQVn6x7LIH0nyii54
         Sgs/tZK/HlhvYNDA22Zofrch3JhQbAxT25vUje0v0C1bwZ9f/Jl+NgKQBxjHKnq3//oQ
         GIFNJK89l2Ew+99gT8U+fl5w63Dy5gBCW0/YyzOZ0sSQqoXMEhv1TSmPeguMwhWlLJsM
         S8zhnSEL9mds7qa1Ru0HG4J/75TQIYElVOPAbDE9+BURYsMcTyEZfmHhlPgc9QUOeW8f
         ebUg==
X-Gm-Message-State: AOAM533x2fatgDUSdRMPSfXpdmr6PVQTOFrIvAMxsO9JslAIU/YzmqUQ
	osH5kLO2X7BRUU1i+JlduQ==
X-Google-Smtp-Source: ABdhPJwZF13O3L94Az07rbZOHYKpGcxO0Y3TsLBWTY4BwTvdCjMK2u5P9d4TPJIIAl0Dmte2Oz4hQQ==
X-Received: by 2002:a9d:7dd0:: with SMTP id k16mr5369860otn.51.1632416209860;
        Thu, 23 Sep 2021 09:56:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s26sm1498922ooc.26.2021.09.23.09.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 09:56:49 -0700 (PDT)
Received: (nullmailer pid 3165231 invoked by uid 1000);
	Thu, 23 Sep 2021 16:56:48 -0000
Date: Thu, 23 Sep 2021 11:56:48 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-mtd@lists.infradead.org, olof@lixom.net, ka@semihalf.com, dinguyen@kernel.org, devicetree@vger.kernel.org, miquel.raynal@bootlin.com, richard@nod.at, jam@semihalf.com, soc@kernel.org, linux-arm-kernel@lists.infradead.org, tn@semihalf.com, p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, arnd@arndb.de, vigneshr@ti.com, robh+dt@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mtd: spi-nor: add n25q00 schema
Message-ID: <YUyx0K9M7wspVl+E@robh.at.kernel.org>
References: <20210920124141.1166544-1-pan@semihalf.com>
 <20210920124141.1166544-2-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210920124141.1166544-2-pan@semihalf.com>

On Mon, 20 Sep 2021 14:41:39 +0200, Paweł Anikiel wrote:
> Add schema for the n25q00 NOR flash memory.
> 
> Signed-off-by: Paweł Anikiel <pan@semihalf.com>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
