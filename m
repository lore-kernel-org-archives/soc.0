Return-Path: <SRS0=/zSA=L2=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B597BC11F6A
	for <soc@archiver.kernel.org>; Fri,  2 Jul 2021 15:14:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9D20861420; Fri,  2 Jul 2021 15:14:43 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 732E461410;
	Fri,  2 Jul 2021 15:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 732E461410
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-il1-f171.google.com with SMTP id k6so2151295ilo.3;
        Fri, 02 Jul 2021 08:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ut9imKxL6QnSk4qfHyI4LHUlOzS0PtJ0GGDAQ0op66c=;
        b=mYqb56wd2zFQjy8ERIcc8uJYPsNfAdrM2rQ024cBLtE++OUl6iN7jQzdAQoZkSHgNt
         Vi2zi0b7Lg4UxX7oAg72BYqIaUT+tDLOX1kTZBsiZghuFXzzIRNcJix213p2R601DOo7
         rtV5r1KxErPo4HBLJB4fLToDni8ugyQjAIAVxqAftfTswawpGFC6hYmbbpyiUhROYPgP
         6fQ8nU9xyLcC1Kcrxewyl+cBYIyNc1lEsGje8wEoJAp6/Wy3iFXFJiUhnokbcltd5362
         QK1h3YuBG9YHJC7SlcT55LgDOIOPmL2Smy9SBn8ct5hXXUrmGMzARQzGy7+drC9ODNSo
         4KRA==
X-Gm-Message-State: AOAM532PDoOmTZ4ZK+gcaX9spO2e/bzeFJ52nkup7HUnYUbxuCQ4kcDS
	jqG0vLER6yu1CyWTvRbVQw==
X-Google-Smtp-Source: ABdhPJyJQ+7r5oKAFDBY9y+s7apI5nAskZUs0JrjDvLU1ycLlp4sB/Uhwdv5yqQLYQelhXIiDZpx6g==
X-Received: by 2002:a92:dd89:: with SMTP id g9mr333572iln.209.1625238882803;
        Fri, 02 Jul 2021 08:14:42 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id g6sm1846444ilj.65.2021.07.02.08.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 08:14:41 -0700 (PDT)
Received: (nullmailer pid 437820 invoked by uid 1000);
	Fri, 02 Jul 2021 15:14:37 -0000
Date: Fri, 2 Jul 2021 09:14:37 -0600
From: Rob Herring <robh@kernel.org>
To: Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, bcm-kernel-feedback-list@broadcom.com, Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, Scott Branden <sbranden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 4/4] dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
Message-ID: <20210702151437.GA437656@robh.at.kernel.org>
References: <20210625095000.3358973-1-mnhagan88@gmail.com>
 <20210625095000.3358973-5-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625095000.3358973-5-mnhagan88@gmail.com>

On Fri, 25 Jun 2021 10:49:51 +0100, Matthew Hagan wrote:
> Add bindings for the Meraki MX64/MX65 series.
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

