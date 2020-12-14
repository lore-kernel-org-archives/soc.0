Return-Path: <SRS0=tYx/=FS=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61442C4361B
	for <soc@archiver.kernel.org>; Mon, 14 Dec 2020 14:34:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2CE5C22473; Mon, 14 Dec 2020 14:34:56 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C92852226A;
	Mon, 14 Dec 2020 14:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C92852226A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-oi1-f195.google.com with SMTP id d27so19369477oic.0;
        Mon, 14 Dec 2020 06:34:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pmYimdHqPZCmGoKy+QfoCbZ6cMjYvJ9Ol9TiMKbqo5U=;
        b=H1fUeFy65rn9OzpsTQJvpRanq7CmoJuwwe9cjXINLby2yg54pOoJQsFJiT/nw2YlmI
         Gs+UGzqbPSMFTI2RdPnaPwlPd/cjciBV+j8+HhIof1vsEv4Qw1+GwH+TuN85GLPI9UhW
         rKnnVdEONbiVt9eTi6WKjTW0frO4d43dxn0XeSQdWNDV1n5DQ8R9fIzp7VE/c3tl2yzB
         iyX8+Iv77lnzaQHw1Xrad56stlpRrwwwHnGmaSgbsWIzyMg+znDPiUpPjkmE/zyhTjM0
         I32WI8Wc0cG0daVDqAVuTCaXyEy6zsV+5HQAEKJjMn0EIA+ymLXmbQVj35G70jjE1yVf
         8D9w==
X-Gm-Message-State: AOAM530JZhae6FrWIgh9HlZXL3wtYa4/b9dlUUPIm7LDee479Syur/b4
	j/5+a+oQrq5a5ks2tyN46D5RdfLeQQ==
X-Google-Smtp-Source: ABdhPJxIZjyrGjwvcSupSDPeypUPaJjXZrJg/DEAYpaJ6OrhlsJtNXtsfhunBmocYWyjVbBoZqy2LQ==
X-Received: by 2002:aca:bc41:: with SMTP id m62mr18229830oif.16.1607956494486;
        Mon, 14 Dec 2020 06:34:54 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d13sm4354186oti.74.2020.12.14.06.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:34:53 -0800 (PST)
Received: (nullmailer pid 1883746 invoked by uid 1000);
	Mon, 14 Dec 2020 14:34:52 -0000
Date: Mon, 14 Dec 2020 08:34:52 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Jamie Iles <jamie@jamieiles.com>, Herbert Xu <herbert@gondor.apana.org.au>, soc@kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: Remove PicoXcell bindings
Message-ID: <20201214143452.GA1883626@robh.at.kernel.org>
References: <20201210200315.2965567-1-robh@kernel.org>
 <20201210200315.2965567-5-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210200315.2965567-5-robh@kernel.org>

On Thu, 10 Dec 2020 14:03:15 -0600, Rob Herring wrote:
> PicoXcell has had nothing but treewide cleanups for at least the last 8
> years and no signs of activity. The most recent activity is a yocto vendor
> kernel based on v3.0 in 2015.
> 
> Cc: Jamie Iles <jamie@jamieiles.com>
> Cc: linux-crypto@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> I'll take this via the DT tree.
> 
>  .../devicetree/bindings/arm/picoxcell.txt     | 24 -------------------
>  .../bindings/crypto/picochip-spacc.txt        | 21 ----------------
>  .../devicetree/bindings/net/macb.txt          |  2 --
>  .../bindings/timer/snps,dw-apb-timer.yaml     |  7 ------
>  4 files changed, 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/picoxcell.txt
>  delete mode 100644 Documentation/devicetree/bindings/crypto/picochip-spacc.txt
> 

Applied, thanks!
