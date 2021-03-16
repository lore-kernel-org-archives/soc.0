Return-Path: <SRS0=8Yc9=IO=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00CCC433E0
	for <soc@archiver.kernel.org>; Tue, 16 Mar 2021 22:00:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A4F8064F91; Tue, 16 Mar 2021 22:00:14 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EDBD64DFB;
	Tue, 16 Mar 2021 22:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EDBD64DFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-io1-f47.google.com with SMTP id k2so38937099ioh.5;
        Tue, 16 Mar 2021 15:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hWQnLy+wlCYyKsfibvRnMmDe6TnPBpLcmFf0o5i5sXo=;
        b=rq4YOdr3ndUShNlhXmCEHM9wtMZxqmwETSKTnXQrRGr/hTVlgRSQT6D99TwQmSu0zO
         OsBRjE7ta+FTi6TmLt8tPAt7qA/rWU2chIl1l+S3ZpjktBJ7qGEWoVO7UkWsjxKvr0WE
         2U5jDGmubu6i6bvHyr7TB94XRrmwutNwUUnfMEMp7dGBEwOH/ImAWFleRNT3Am4KzFzw
         W7daPGZxZ5mTjUGzNkNowgUGe2DW88K5IXOVRYlLxLVkE7bLMWFhNbqk26eCL0xcOrjM
         KC+ZMzMrKqNx27HQ7G6Dm+j+kqwtZ95PAlu340RpCzlhqL1yrUNRhHfigN1FCUuRYV9/
         245Q==
X-Gm-Message-State: AOAM533FWov6GvUgwLAoAtQvrboAc8WiRFPj1MUPNW0dhOsbDEVAYFOQ
	tcbKX9NCHUtQ+Yi32/2diA==
X-Google-Smtp-Source: ABdhPJwCXPLXH5ryR9zjM8plYiRvPqgWPNS67eAHKVo6mFw4S0V6YZBXB8qtNjD3qRbtCquQg9ctNg==
X-Received: by 2002:a05:6602:179c:: with SMTP id y28mr4758814iox.151.1615932013916;
        Tue, 16 Mar 2021 15:00:13 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id n16sm8806315ilq.71.2021.03.16.15.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 15:00:12 -0700 (PDT)
Received: (nullmailer pid 3753212 invoked by uid 1000);
	Tue, 16 Mar 2021 22:00:09 -0000
Date: Tue, 16 Mar 2021 16:00:09 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Olof Johansson <olof@lixom.net>, "Paul J. Murphy" <paul.j.murphy@intel.com>, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Daniele Alessandrelli <daniele.alessandrelli@intel.com>, soc@kernel.org
Subject: Re: [RESEND 2nd PATCH 01/10] dt-bindings: arm: intel,keembay: limit
 the dtschema to root node
Message-ID: <20210316220009.GA3753176@robh.at.kernel.org>
References: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
 <20210308170945.161468-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308170945.161468-2-krzysztof.kozlowski@canonical.com>

On Mon, 08 Mar 2021 18:09:36 +0100, Krzysztof Kozlowski wrote:
> From: Krzysztof Kozlowski <krzk@kernel.org>
> 
> The check for the board compatible should be limited only to the root
> node.  Any other nodes with such compatible are not part of this schema
> and should not match.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> ---
>  Documentation/devicetree/bindings/arm/intel,keembay.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
