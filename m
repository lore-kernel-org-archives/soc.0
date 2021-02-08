Return-Path: <SRS0=6A6O=HK=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F9EC433DB
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 17:32:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 88DB864DFF; Mon,  8 Feb 2021 17:32:18 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BFED64DB2;
	Mon,  8 Feb 2021 17:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BFED64DB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-ot1-f46.google.com with SMTP id d7so12651052otq.6;
        Mon, 08 Feb 2021 09:32:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CJGZSCJAur/5Hm+o5HKIZJ3m/1BQyOjxp7i5ki4kvKg=;
        b=LG6c8jjs/JTjoscc5UsyfCpwx/M9Vl0CNqwYtt8NJ2dGu2uRRfWP0sH/dDodONe5Us
         Rox6TX26DJDyzskouu5HpdIUm8uEgexDU2rBbf0lLUA77//palpiNtTK4exRvs/7pNc9
         rt/vU6pXUZHxlcV5X9hFRBjadkGf45Kx9rchIdTMhaOcUddb8Nc4zcjx0m7+34ig5ndw
         LXuoOL1Kl7k+hbMKwZJm6YVA1AVjVia1qUDBuCiRCD4q+0ojukfg9+Jp8q4a3b+ihyd6
         EG9X2aoSwPGb1EjUG9J16NlrVo1PHvB2nCT+8x+nJ0OAITEx/j1xSRaGvhwl+ICNGLbH
         q8Gg==
X-Gm-Message-State: AOAM533iziTAp6/UFfLPbpJSrHqBvMN1NwQXb9MXSKFiwxFSo4PFa3UC
	xSymHBiBQYE2xLsm+o+QzDMbQ1hW+A==
X-Google-Smtp-Source: ABdhPJw4/R4KH0mvoPgQxyLxAdM16oo9jlsjZpjjo7ro5BZRGiRShXk92zZZg3RgRWmLqj4kALEs9w==
X-Received: by 2002:a9d:640b:: with SMTP id h11mr13124079otl.224.1612805537064;
        Mon, 08 Feb 2021 09:32:17 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y65sm1324246oie.50.2021.02.08.09.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 09:32:16 -0800 (PST)
Received: (nullmailer pid 1578321 invoked by uid 1000);
	Mon, 08 Feb 2021 17:32:15 -0000
Date: Mon, 8 Feb 2021 11:32:15 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, soc@kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/18] dt-bindings: vendor-prefixes: add AAPL prefix
Message-ID: <20210208173215.GA1567700@robh.at.kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-2-marcan@marcan.st>
 <20210208102730.p4nhsl35oowsklv2@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210208102730.p4nhsl35oowsklv2@kozik-lap>

On Mon, Feb 08, 2021 at 11:27:30AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Feb 05, 2021 at 05:39:34AM +0900, Hector Martin wrote:
> > Amusingly, this wasn't yet documented, even though this vendor prefix
> > has been used since time immemorial on PPC.
> > 
> > Signed-off-by: Hector Martin <marcan@marcan.st>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index 041ae90b0d8f..d7950c723472 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -25,6 +25,8 @@ patternProperties:
> >    # Keep list in alphabetical order.
> >    "^70mai,.*":
> >      description: 70mai Co., Ltd.
> > +  "^AAPL,.*":
> 
> All prefixes are lower case... see ABB below (not mentioning that the
> company name is not APPLE), so just "apple".

Grep the kernel tree for 'AAPL,'. It comes from the the ticker symbol 
which early on was the preferred form, but we've tended to move away 
from that. The DT Apple ships (which is *very* different) uses both 
forms.

So keep what exists already or have old AAPL and new apple?

Rob
