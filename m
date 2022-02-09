Return-Path: <SRS0=4MXi=SY=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651C5C433F5
	for <soc@archiver.kernel.org>; Wed,  9 Feb 2022 03:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27AF9C340EE; Wed,  9 Feb 2022 03:13:34 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8DB0C004E1;
	Wed,  9 Feb 2022 03:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8DB0C004E1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id x52-20020a05683040b400b0059ea92202daso633568ott.7;
        Tue, 08 Feb 2022 19:13:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bhPYavz29pyl+ykJUTk2kuFVvwHnpLudfeWM07RV3CY=;
        b=CSnDwrvW7LI4nSsN8eeHd5g2iKsEdXrdkhkv6xhPl4J/gaAfp2eMBjkEuXfbfS65i8
         bNhOei8ywmosSIBGhPjhWmYRTNTC+mnS6scedEA8N28ezYNmIjG3E5bMg9ocsSZxzehC
         PE9EOlH59Ons3A9Ryyvb4QzWUAvg7qq7BbWAW0vnifzsECbpV/zUsFsXXXXPQ3iFwXaH
         0YXBv+a9ba7ff+Srb6YO3u6ybgnAhAYA/LzTZqupcsKCGQ8Ts7CyJILFlAk2XFaLGLhT
         ftYAK7VDoWhBbBGWsxOR7QZ5XZp82lCy28yc4DNQk4QXy5aEYJxqs1R5FZiTNqN4m/sI
         P47A==
X-Gm-Message-State: AOAM533fRaxewBhSBnFgf+fmd3lX3XCdv163PBpxtk8+K0s63bYQCS9v
	ZVGGNQlwNNA/nIQgzfmzuA==
X-Google-Smtp-Source: ABdhPJzRQj0n07HNIyiYaj9jZlxThIk4+DLTmzsAvKXF03QmDAL4Omrrf0mgpRfVvroOQUoPAt4qag==
X-Received: by 2002:a9d:6b15:: with SMTP id g21mr148782otp.337.1644376412801;
        Tue, 08 Feb 2022 19:13:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n13sm6738710ooj.34.2022.02.08.19.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 19:13:32 -0800 (PST)
Received: (nullmailer pid 3557642 invoked by uid 1000);
	Wed, 09 Feb 2022 03:13:31 -0000
Date: Tue, 8 Feb 2022 21:13:31 -0600
From: Rob Herring <robh@kernel.org>
To: Ben Wolsieffer <benwolsieffer@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, soc@kernel.org, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom: document HP TouchPad
Message-ID: <YgMxW46u6m5dhn0+@robh.at.kernel.org>
References: <cover.1643075547.git.benwolsieffer@gmail.com>
 <aa59002aeae45a95097300213fc34490aa8db250.1643075547.git.benwolsieffer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa59002aeae45a95097300213fc34490aa8db250.1643075547.git.benwolsieffer@gmail.com>

On Mon, 24 Jan 2022 21:07:04 -0500, Ben Wolsieffer wrote:
> Add binding documentation for the HP TouchPad.
> 
> Signed-off-by: Ben Wolsieffer <benwolsieffer@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
