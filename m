Return-Path: <SRS0=kmdQ=TX=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7CAC433EF
	for <soc@archiver.kernel.org>; Sat, 12 Mar 2022 03:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6FC21C340F3; Sat, 12 Mar 2022 03:45:29 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9A03CC340E9;
	Sat, 12 Mar 2022 03:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9A03CC340E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id j83so11524834oih.6;
        Fri, 11 Mar 2022 19:45:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BwjHEM1ve6vauVKyKa9ZUyCUyEFXM5iLr7KYRJbKfko=;
        b=L9rdsSEtM7gH4mqNS22EBtRFsSQEmw874A5ixgwAD12+e2dt/ODZIyrMOya92A8J/h
         IT4D+En0BBMwSqIw1/l8fg7+W9koYsMfjttrHpTY/wYE0puZ8XYP6hwpU9/2DzkUaj8F
         RP983Vf6tJci19Vmz8vd1TTCwh26DosLog9xpPbsFwdOZdogMUvU0hBZexTNiaK7M2nn
         3dzx53n1XYYjwNKC5lDXSb3/ywvBzznSHzcD+IQ7nVwPP9KzOR7heBHsAKxqm66eq+rR
         THkFCpWYK+NhdNEYkIWzCW0MmqEHyRCjlLfXV7E8F+55cckot2dFH5hMViAN4ohJMbgt
         adNg==
X-Gm-Message-State: AOAM531Kfse9mvVUoccV7TXqgwhCjQbxkiyG80Gxtl1qlQJJjH85Vg+i
	mMopTcoIv8FYRuZmFFEm9gNCF3ZMug==
X-Google-Smtp-Source: ABdhPJyN4Me6aXpEWsG65Sb5BfWNEBIhIM8S49iH8KYbautApP4UfXutmtJ97KxAWUQ7Amb9REJqQg==
X-Received: by 2002:aca:34c1:0:b0:2ec:8ee8:90c7 with SMTP id b184-20020aca34c1000000b002ec8ee890c7mr3951666oia.267.1647056727702;
        Fri, 11 Mar 2022 19:45:27 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 67-20020aca0546000000b002d46e151b9bsm4645324oif.18.2022.03.11.19.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 19:45:26 -0800 (PST)
Received: (nullmailer pid 730303 invoked by uid 1000);
	Sat, 12 Mar 2022 03:45:25 -0000
Date: Fri, 11 Mar 2022 21:45:25 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@kernel.org, Heiko Stuebner <heiko@sntech.de>, Viresh Kumar <vireshk@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Frank Wunderlich <frank-w@public-files.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Michael Riesch <michael.riesch@wolfvision.net>, linux-ide@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Peter Geis <pgwipeout@gmail.com>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/6] dt-bindings: ata: ahci-platform: Convert DT
 bindings to yaml
Message-ID: <YiwXVRPJITCOiCoj@robh.at.kernel.org>
References: <20220311210357.222830-1-linux@fw-web.de>
 <20220311210357.222830-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311210357.222830-2-linux@fw-web.de>

On Fri, 11 Mar 2022 22:03:52 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Create a yaml file for dtbs_check from the old txt binding.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> 
> v6:
>   - fix indentation of examples
>   - add compatible marvell,berlin2-ahci
>   - change maximum of ports-implemented
>   - add select to exclude qcom compatibles
>   - drop marvell,armada-380-ahci
>     it is not handled in the ahci-platform.c but ahci_mvebu.c
>     and incompatible due to missing phys/target-supply
> 
> v5:
>   - change subject
>   - drop brcm,iproc-ahci from standalone enum
>   - fix reg address in example 2
>   - move clocknames next to clocks, regnames to reg
>   - drop interrupts description
>   - drop newline from dma-coherent
>   - drop max-items from ports-implemented
>   - min2max in child phys
>   - fix identation for compatible and sata-common
>   - add additionalProperties=false for subnodes
>   - pipe for paragraphs and newline after title
>   - add maximum for ports-implemented (found only 0x1 as its value)
>   - add phy-names to sata-ports
> 
> v4:
>   - fix min vs. max
>   - fix indention of examples
>   - move up sata-common.yaml
>   - reorder compatible
>   - add descriptions/maxitems
>   - fix compatible-structure
>   - fix typo in example achi vs. ahci
>   - add clock-names and reg-names
>   - fix ns2 errors in separate patch
> v3:
>   - add conversion to sata-series
>   - fix some errors in dt_binding_check and dtbs_check
>   - move to unevaluated properties = false
> 
> arch/arm/boot/dts/qcom-apq8064.dtsi had caused errors for clock-count
> ---
> 
> have not added reviewed-by from v5 because i have changed patch too much
> 
> ---
>  .../devicetree/bindings/ata/ahci-platform.txt |  79 --------
>  .../bindings/ata/ahci-platform.yaml           | 182 ++++++++++++++++++
>  2 files changed, 182 insertions(+), 79 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/ata/ahci-platform.txt
>  create mode 100644 Documentation/devicetree/bindings/ata/ahci-platform.yaml
> 

Applied, thanks!
