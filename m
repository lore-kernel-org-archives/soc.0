Return-Path: <SRS0=ahOE=KO=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DF7C433B4
	for <soc@archiver.kernel.org>; Wed, 19 May 2021 19:50:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B5C5A611B0; Wed, 19 May 2021 19:50:27 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A0FE610CB;
	Wed, 19 May 2021 19:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A0FE610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-ot1-f41.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so12802986otp.11;
        Wed, 19 May 2021 12:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I1uvTDG2OZUbucg6l58mULhf0aAS9KnjR9rg8Nbg/Jo=;
        b=klo6I9KNDiCsO0lCRSzYfuQeOaVC44Zpuq586ehi/Wbvxoxt0XinvtkJg/14T02dfr
         lGkZjPCkqctj7a/tHq8DWfcglJd3wp61hrBRehHq1EOVNoQlbN8rCaV8RRHsPzgzvuIr
         a/MSid0jQ92XV+f6XgCZXcR/Ku3yhy179uDi9M5DKqeYL4Imgl/25/IrdQ07392Hmvi2
         B30w6HPDaXQ/Uzgv2bPU2kuqpDMtqdgrCKaYGV9Xf1hGtAGOEUS1Kx7g55FvlMxGgbw3
         1Y5SQvH3HFndPJzY4OyQBEqvTMAwu5J36rRcmC7NXta4VtilqTfcgRw6AnuDnm4ApI7r
         UsxA==
X-Gm-Message-State: AOAM533WGYJ2VMZEqJJouQvg/ddI97lIUhj4mrYxp3ED/dmX1C0efB3I
	9aAo2ne84tnXjwdFEynH3A==
X-Google-Smtp-Source: ABdhPJwrHVc2P5vLxQ+BR4go+vILSaFqfZHLcQ3INgskiyPhp8eJ8bI+GvqEIxWP2XOunEwh6KIdSA==
X-Received: by 2002:a9d:644f:: with SMTP id m15mr954049otl.99.1621453826858;
        Wed, 19 May 2021 12:50:26 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n193sm124169oig.49.2021.05.19.12.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 12:50:25 -0700 (PDT)
Received: (nullmailer pid 3534510 invoked by uid 1000);
	Wed, 19 May 2021 19:50:24 -0000
Date: Wed, 19 May 2021 14:50:24 -0500
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, robh+dt@kernel.org, soc@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, ulli.kroll@googlemail.com, linux-arm-kernel@lists.infradead.org, olof@lixom.net
Subject: Re: [PATCH 2/5] dt-bindings: add vendor prefix for edimax
Message-ID: <20210519195024.GA3534096@robh.at.kernel.org>
References: <20210517193205.691147-1-clabbe@baylibre.com>
 <20210517193205.691147-3-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517193205.691147-3-clabbe@baylibre.com>

On Mon, 17 May 2021 19:32:02 +0000, Corentin Labbe wrote:
> Add vendor prefix for EDIMAX Technology Co., Ltd (https://www.edimax.com/)
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
