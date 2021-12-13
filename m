Return-Path: <SRS0=b9UP=Q6=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5DBC433F5
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 19:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7097C34605; Mon, 13 Dec 2021 19:15:51 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 397AFC34600;
	Mon, 13 Dec 2021 19:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 397AFC34600
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id n17-20020a9d64d1000000b00579cf677301so18517632otl.8;
        Mon, 13 Dec 2021 11:15:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=16e1HfFxtcfwwmkLUyb20/1qiOCSvIHS7M0mF1ml9mI=;
        b=IvJd+uNaHrTCG2WEKDpaamvZzX3BuDtxsit6DZ3jJfCyAMd5R/gyFaiCgS3SR4IUOr
         FCmUBEl/o2BiCLeI8zkw9O2Vz4Saeluw0hcL0kUQ108oJWym0WWMQEh1QwgV+OXyDcn0
         gl8lXe502ujQ3XwXG/iHWkW8Pp/n7bgnq198RhP1ma6lhGuJlIdsM/W0zInoHyEhkvdv
         BTPREQ5OyJgvLwfDSrd39ln7ET1tv5z0/YAOc2FlSIiQzSpQPKYsZNMlN1Xj0EnP0FZI
         rfb+PjnpZx0/OgIYl6kVl9T1tukj/iu89NBEVty64E8nFsPcCj+kgclr3xvpFRQcpA1f
         M3rQ==
X-Gm-Message-State: AOAM531Acd0pDmbvZW7wowyvsNYvvqd0dCKogbGhFz8ONIyRVeQLDZnD
	Qz1inp2hD0jnFKNyUjnYHg==
X-Google-Smtp-Source: ABdhPJzVa0W2V/rohpLCRuJlg9x83XZI/BE79xLSeEW4JCwi36dY8pa5cSoWmZjNr1LsxdrIv7m1bA==
X-Received: by 2002:a9d:7289:: with SMTP id t9mr419304otj.1.1639422950366;
        Mon, 13 Dec 2021 11:15:50 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j5sm2336967oou.23.2021.12.13.11.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 11:15:49 -0800 (PST)
Received: (nullmailer pid 1406565 invoked by uid 1000);
	Mon, 13 Dec 2021 19:15:48 -0000
Date: Mon, 13 Dec 2021 13:15:48 -0600
From: Rob Herring <robh@kernel.org>
To: Andrej Picej <andrej.picej@norik.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@kernel.org, kernel@pengutronix.de, shawnguo@kernel.org, leoyang.li@nxp.com, krzysztof.kozlowski@canonical.com, linux@rempel-privat.de, festevam@gmail.com, arnd@arndb.de, linux-imx@nxp.com, y.bas@phytec.de
Subject: Re: [PATCH 1/4] dt-bindings: arm: fsl: add PHYTEC phyGATE Tauri
 i.MX6 ULL
Message-ID: <Ybeb5I/mP3JFrDsQ@robh.at.kernel.org>
References: <20211201125327.3704500-1-andrej.picej@norik.com>
 <20211201125327.3704500-2-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211201125327.3704500-2-andrej.picej@norik.com>

On Wed, Dec 01, 2021 at 01:53:24PM +0100, Andrej Picej wrote:
> Add devicetree bindings for phyGATE Tauri board with phyCORE-i.MX6 ULL.
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 0b595b26061f..9c37f22b6c61 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -602,6 +602,15 @@ properties:
>            - const: phytec,imx6ull-pcl063  # PHYTEC phyCORE-i.MX 6ULL
>            - const: fsl,imx6ull
>  
> +      - description: i.MX6ULL PHYTEC phyGATE-Tauri
> +        items:
> +          - enum:
> +              - phytec,imx6ull-phygate-tauri-emmc
> +              - phytec,imx6ull-phygate-tauri-nand
> +          - const: phytec,imx6ull-phygate-tauri # PHYTEC phyGATE-Tauri with i.MX6 ULL

Is there really a need for 2 compatibles here? Either 
phytec,imx6ull-phygate-tauri is specific enough (as nand/emmc can be 
described elsewhere) or you need 
phytec,imx6ull-phygate-tauri-emmc/phytec,imx6ull-phygate-tauri-nand.


> +          - const: phytec,imx6ull-pcl063        # PHYTEC phyCORE-i.MX 6ULL
> +          - const: fsl,imx6ull
> +
>        - description: i.MX6ULL Boards with Toradex Colibri iMX6ULL Modules
>          items:
>            - enum:
> -- 
> 2.25.1
> 
> 
