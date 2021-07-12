Return-Path: <SRS0=WedL=ME=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B1FC07E99
	for <soc@archiver.kernel.org>; Mon, 12 Jul 2021 20:11:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CCFA560FF0; Mon, 12 Jul 2021 20:11:40 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3ADD611F1;
	Mon, 12 Jul 2021 20:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3ADD611F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-io1-f42.google.com with SMTP id l5so24222408iok.7;
        Mon, 12 Jul 2021 13:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gQIGOfZ9xP5XhtIaQ8VkC7v7sAXj1rbJpx/JTLj7+aU=;
        b=UgbOGHqmob7LUSTea3pGJfNz/6grlnBfmzAN8k8aWObmt+RbgOqA3SO009uuoV5fuy
         nFXx8ztgS31e/Cf+UtMNFK+c9hj1qK9+udjkmYjeKeiipuztJybC6k5pKxsSVZtziljN
         Cz9pybWzFtNG61k8XZLzprY3uCi7gHtYg/D8Wc5i9hSKZbcjovAKcOrc2JqSyiyGoyoW
         7PHeKX9rRKZjy+KJu4Eaj6w4njyJkWQFII8ZJulZL/iHxjHi52yY0gwbE9OdHBcuJwGB
         8MHCEHuis9RoVWdQEshGLlVH68D6cA74EW63D3mCB9wfGE9+gFNjxURii/lXfemNTBsg
         YiIQ==
X-Gm-Message-State: AOAM530Bu5baGNa5ICXJnu5tDdEZdY2YjJMls2+4oBVD8lOKDeqU/NFD
	+NDYzMLjFpDME5OODQq4Aw==
X-Google-Smtp-Source: ABdhPJxcpniyee6ILry/QHvrQ2OrFoTqoJfCa4tRWk9rFnfjHgLdXRmDbFPnrRFUxSH4jTF723x4ew==
X-Received: by 2002:a05:6638:264e:: with SMTP id n14mr640343jat.71.1626120700117;
        Mon, 12 Jul 2021 13:11:40 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id w13sm8749396ilh.39.2021.07.12.13.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 13:11:39 -0700 (PDT)
Received: (nullmailer pid 2408076 invoked by uid 1000);
	Mon, 12 Jul 2021 20:11:36 -0000
Date: Mon, 12 Jul 2021 14:11:36 -0600
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, olof@lixom.net, devicetree@vger.kernel.org, ulli.kroll@googlemail.com, arnd@arndb.de, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: add vendor prefix for edimax
Message-ID: <20210712201136.GA2408046@robh.at.kernel.org>
References: <20210618205533.1527384-1-clabbe@baylibre.com>
 <20210618205533.1527384-3-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618205533.1527384-3-clabbe@baylibre.com>

On Fri, 18 Jun 2021 20:55:30 +0000, Corentin Labbe wrote:
> Add vendor prefix for EDIMAX Technology Co., Ltd (https://www.edimax.com/)
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
