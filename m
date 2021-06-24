Return-Path: <SRS0=RW9I=LS=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB2CC49EA6
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 20:22:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 468E5613BA; Thu, 24 Jun 2021 20:22:44 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14812613B9;
	Thu, 24 Jun 2021 20:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14812613B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-io1-f49.google.com with SMTP id i189so9864516ioa.8;
        Thu, 24 Jun 2021 13:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=knEwkp+Z8llmgr1VJTsCXisfmU+yU/tJNLrDFp/f5Bg=;
        b=ePT0zs+Uu2FjFL23yVG9RFbL5nReQcTDZsqgZzrJNBoEu03ilfBE4FkBQfcX1Sr6j3
         q9Po7QYlZjihCDrDcNgpI6Bnf35HOWdOLPuhmaXTjDBNUcOiPWaHrfsSwyxV6lPs/+Mv
         4KD1WqjYS2Oe05ydcwaTg/aU6KpKO+khnu1DG9eQL4nA88jouCUDtylrKlGLTMduJCij
         fSR7nRkRHw58iOCw5J34hzRDrKmbvCUPeY8evVgQmfY4uMOf34BP/Ipydkl3TWEJNfDr
         vUgZz0kb/tM5HTwOmVOysaBChra94r7uwsh+by/YvDEkSPhxk5Pode+RmxN4YAPPo9X+
         QuGw==
X-Gm-Message-State: AOAM533yEPdOXUcYcVS0yfz8mUZltEff19GN1dXtv90IuUjOIR5+dpmk
	a2PcEupV4SZku9nKFW9W2g==
X-Google-Smtp-Source: ABdhPJwobF8PdC0NO8payPPWkGXZGT2rK/e9rI/graPZ4wi+ob3vqdYIhC/ZQ9+WAp50FD9qqZtjMw==
X-Received: by 2002:a5d:8b8b:: with SMTP id p11mr5674403iol.77.1624566163505;
        Thu, 24 Jun 2021 13:22:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id g8sm1954736iop.31.2021.06.24.13.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 13:22:42 -0700 (PDT)
Received: (nullmailer pid 1927038 invoked by uid 1000);
	Thu, 24 Jun 2021 20:22:37 -0000
Date: Thu, 24 Jun 2021 14:22:37 -0600
From: Rob Herring <robh@kernel.org>
To: Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Geert Uytterhoeven <geert+renesas@glider.be>, soc@kernel.org, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Ray Jui <rjui@broadcom.com>, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v3 4/4] dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
Message-ID: <20210624202237.GA1926990@robh.at.kernel.org>
References: <20210613101658.3242777-1-mnhagan88@gmail.com>
 <20210613101658.3242777-5-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210613101658.3242777-5-mnhagan88@gmail.com>

On Sun, 13 Jun 2021 11:16:48 +0100, Matthew Hagan wrote:
> Add bindings for the Meraki MX64/MX65 series. Note this patch should be
> applied on top of "dt-bindings: arm: bcm: add NSP devices to SoCs".
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
