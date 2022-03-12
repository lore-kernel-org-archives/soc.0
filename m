Return-Path: <SRS0=kmdQ=TX=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740A6C433EF
	for <soc@archiver.kernel.org>; Sat, 12 Mar 2022 03:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45AE2C340F3; Sat, 12 Mar 2022 03:45:38 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 831F7C340E9;
	Sat, 12 Mar 2022 03:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 831F7C340E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id ay7so11524921oib.8;
        Fri, 11 Mar 2022 19:45:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F+svWGiQPbj6b5eqrrYsXkkVUBwPXGhMy9dOFM1Y7js=;
        b=EQys00r4E4d7Y59AzP2qU6TZ+J2GcZiES5gIEReGPmZ1ORHpLEn4Jwln7v1VDdQJZT
         4Pxk/VI05t7giPpwAuNykHiyxhp2DUuRptGP21ahwptaBr6wXw5N4vc9Id25TQDkW+ZI
         YFpwWTuyGaR5uGuFQx7VmIqwb0gxQQLB1huDiS/NjMWu69YcckJZCbR9zp3ghC71cs5F
         /u5Q2DCmzhidq2EY26REt63MYoV4Yba9ZzS4mRRgN+atnfA2ZpQNACfZAZDtbfTp7NF7
         DLxbYRiPPgEUv/Wq3qGzuHaVRWgPBwWnDq8QxV5AuFu3ZJCblgBOMr9+dpy/ApdieMOj
         gOow==
X-Gm-Message-State: AOAM530N3NGGs64NKZh+iEsx5sK4pGvnvvO/7mZAnA+IlxosxfcflTjK
	tcz/eqvYUwkjUBIohrAhUQ==
X-Google-Smtp-Source: ABdhPJzk4+0YFHC3Pb78/3qG1BRW4mUW3u2Py+qjT/Are8jNXsASCtST45p8XPbSbImBaTWkD8R3KQ==
X-Received: by 2002:a05:6808:130f:b0:2da:3ed2:68ca with SMTP id y15-20020a056808130f00b002da3ed268camr9481487oiv.216.1647056736564;
        Fri, 11 Mar 2022 19:45:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y8-20020a544d88000000b002d525da014bsm4392686oix.42.2022.03.11.19.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 19:45:35 -0800 (PST)
Received: (nullmailer pid 730669 invoked by uid 1000);
	Sat, 12 Mar 2022 03:45:34 -0000
Date: Fri, 11 Mar 2022 21:45:34 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Gregory Clement <gregory.clement@bootlin.com>, linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>, Frank Wunderlich <frank-w@public-files.de>, Andrew Lunn <andrew@lunn.ch>, linux-ide@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, linux-rockchip@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, soc@kernel.org, Hans de Goede <hdegoede@redhat.com>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v6 4/6] dt-bindings: ata: ahci-platform: Add
 power-domains property
Message-ID: <YiwXXl61xODMuGlW@robh.at.kernel.org>
References: <20220311210357.222830-1-linux@fw-web.de>
 <20220311210357.222830-5-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311210357.222830-5-linux@fw-web.de>

On Fri, 11 Mar 2022 22:03:55 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Some SoC using power-domains property so add it here
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
> changes in v5: added reviewed by
> changes in v4: none
> changes in v3:
>   - new patch
> ---
>  Documentation/devicetree/bindings/ata/ahci-platform.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!
