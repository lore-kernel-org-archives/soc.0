Return-Path: <SRS0=kmdQ=TX=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FA5C433FE
	for <soc@archiver.kernel.org>; Sat, 12 Mar 2022 03:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 34169C36AE2; Sat, 12 Mar 2022 03:45:43 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8AC52C340E9;
	Sat, 12 Mar 2022 03:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8AC52C340E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id h10so11549284oia.4;
        Fri, 11 Mar 2022 19:45:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vd8wRMirH20qZ3MunPMpjYuLCrOwOqi3XC/b/3pYVHA=;
        b=Wok2MX7jb0l99r5+7RknmDacOSlW/mupef5s9XJwryObgBThkB3v8onv6eLsbR6r0D
         nqGQz7AwYMXyJstEXkfhBHK2aspWUlp6g28TOqOI9EDheTDTSvSqTJlMAj7VYVMFWDeM
         qzItfO1gN8oE1hSqxB6WDq08zyQzwHdL2h+iVPSNYi4rvabKbjMjR/DIjbM0RIyEuvEr
         lG1f2Vm2ewZQfViaCjbtHgsEiooLHwEpUOe2jwL+8TAUkNjKdshV/BOLMz8urSzK/5WG
         sh4r7TU0sHy42hdXkZgK0lAZXOtgFPgKY7H7xSBHEplYEWfUP0A9QJumjrUuxSE4SpyT
         u8Aw==
X-Gm-Message-State: AOAM530OZ8sR4+hr6DxQZ28WK8MniDQckca6BQIQayxoFsKFhbi3z672
	0UfPM6HwfA9sX188WRqGkQ==
X-Google-Smtp-Source: ABdhPJx4byST3cn01Iwsrcdl0TxymdYn3svPvMQkqG/bJhnL9oRUPuCxQhxOTuMBuuFJbDX7dtHbZg==
X-Received: by 2002:a05:6808:d4:b0:2da:503b:40a with SMTP id t20-20020a05680800d400b002da503b040amr8863995oic.121.1647056741712;
        Fri, 11 Mar 2022 19:45:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bb39-20020a05680816a700b002d9a8eb89fasm4515278oib.46.2022.03.11.19.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 19:45:41 -0800 (PST)
Received: (nullmailer pid 730936 invoked by uid 1000);
	Sat, 12 Mar 2022 03:45:39 -0000
Date: Fri, 11 Mar 2022 21:45:39 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
List-Id: <soc.lore.kernel.org>
Cc: Michael Riesch <michael.riesch@wolfvision.net>, Frank Wunderlich <frank-w@public-files.de>, Andrew Lunn <andrew@lunn.ch>, Hans de Goede <hdegoede@redhat.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-ide@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, soc@kernel.org, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v6 5/6] dt-bindings: ata: ahci-platform: Add
 rk3568-dwc-ahci compatible
Message-ID: <YiwXY6/JVwMUfa71@robh.at.kernel.org>
References: <20220311210357.222830-1-linux@fw-web.de>
 <20220311210357.222830-6-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311210357.222830-6-linux@fw-web.de>

On Fri, 11 Mar 2022 22:03:56 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add SoC specific compatible for rk3568 ahci controller
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
> v6:
>   change subject to dwc instead of dwc3
> ---
>  Documentation/devicetree/bindings/ata/ahci-platform.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Applied, thanks!
