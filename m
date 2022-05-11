Return-Path: <SRS0=lsSe=VT=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72F1C433EF
	for <soc@archiver.kernel.org>; Wed, 11 May 2022 15:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94E53C34113; Wed, 11 May 2022 15:23:20 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2E86C340EE;
	Wed, 11 May 2022 15:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D2E86C340EE
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-ed8a3962f8so3212662fac.4;
        Wed, 11 May 2022 08:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5zNISZaXlYvmRc3tMtVlWkswi785e/B+9/uY5oE6YAQ=;
        b=XulRTicIf7LxwU1lKULiPZlA+ophSUjUstVr4Z3bpC1rgBShSUnlktGOhFD4SSHHcC
         WOXb+btQRxzx7BFKRj3jCZWrRB1dqigWFUkxbSsEcgu+ja+DK8UV6P9LTAJjWK5R5Jz6
         SN5/43wf3bKLshqRgTYLgr5Xq+yzFbmD449kdFce2TdEsMCLEml8fuuUwlOYh0XdKjY1
         J3Qwx28ziMNribkbNO8tjTauZJ1ih1HANIHWRE+mURiHsDxsi6PU0Ufk3p4u4Ddj4VRA
         wJcd7Ha8eq39xr9eKRm9t6WSvVD2aKH5qRpDhLhM/N1vi9l04QR8eL+t0dExf73VuZy8
         +13A==
X-Gm-Message-State: AOAM533L6PFiHQm5vaCoyCSj4U5ZUHx+NMVrVHXGPNa746i0HQV+JiyZ
	YBmpHYlpTEjjLp7huBRVUQ==
X-Google-Smtp-Source: ABdhPJz8rVBN06gIFVAn3YY+UTbDRGhzGs7/A3hZxVp8AZpNRgriF0sbM0SVBw8RFbySvGxuvEdMuQ==
X-Received: by 2002:a05:6870:61cd:b0:e9:8de7:9c51 with SMTP id b13-20020a05687061cd00b000e98de79c51mr2953718oah.50.1652282598896;
        Wed, 11 May 2022 08:23:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bk14-20020a056820190e00b0035ec65ac944sm1036801oob.16.2022.05.11.08.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 08:23:18 -0700 (PDT)
Received: (nullmailer pid 337784 invoked by uid 1000);
	Wed, 11 May 2022 15:23:17 -0000
Date: Wed, 11 May 2022 10:23:17 -0500
From: Rob Herring <robh@kernel.org>
To: Jacky Huang <ychuang3@nuvoton.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, ychuang570808@gmail.com, cfli0@nuvoton.com, devicetree@vger.kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, catalin.marinas@arm.com, sboyd@kernel.org, robh+dt@kernel.org, arnd@arndb.de, krzk+dt@kernel.org, will@kernel.org, olof@lixom.net
Subject: Re: [PATCH V4 5/5] dt-bindings: arm: Add initial bindings for
 Nuvoton Platform
Message-ID: <20220511152317.GA337729-robh@kernel.org>
References: <20220510032558.10304-1-ychuang3@nuvoton.com>
 <20220510032558.10304-6-ychuang3@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510032558.10304-6-ychuang3@nuvoton.com>

On Tue, 10 May 2022 11:25:58 +0800, Jacky Huang wrote:
> Add binding for ARMv8 based Nuvotn SoCs and platform boards.
> Add initial bindings for MA35D1 series development boards.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---
>  .../devicetree/bindings/arm/nuvoton.yaml      | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/nuvoton.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
