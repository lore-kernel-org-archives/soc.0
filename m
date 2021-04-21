Return-Path: <SRS0=Pp40=JS=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD24C433ED
	for <soc@archiver.kernel.org>; Wed, 21 Apr 2021 22:08:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A522961437; Wed, 21 Apr 2021 22:08:00 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DC5961439;
	Wed, 21 Apr 2021 22:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DC5961439
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-oi1-f174.google.com with SMTP id l17so12564185oil.11;
        Wed, 21 Apr 2021 15:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B7HN9kmJqg3nDcnNpEUGeHtWjMZ+HAbcP7LqiewTvjU=;
        b=s2D0F/gH72Mf9uvBz44JHcgriTzeaLWDzEhCHPTsDNYaeRKxgz6fDcUGrrTLtV9WoT
         Xqc9pebarLUz4nSaDMJCx80+/X4jtWpZwoltxZmbx8r45f1PS3WuvNCaQTiQ/vbmlDx6
         aP0CrQlxMuSZOj7pbEpoLGBtICJN3RjXNMfmcJn7XcJhO4CH4Y0i1gcHimRBimcCWVMn
         l427siLZFrQdMHKvmGIg9DNRDwCdrnQm9sNyRUMZDnkTDr/NrLDmyLFBteZuT6b1+uUQ
         59wLgFIirg/J3BJuo8hbQCX/iWASQ+HNAEYtA2Vv7FEyX3hQRyeqj4sq43YYJtePYTSd
         vhHg==
X-Gm-Message-State: AOAM531P3g0tX3g2nE+9UQevIE45IIzXy4XZzfcpPADz56IpY/1nTOnf
	vKjqAfYJFpBwnqA/AKOrPg==
X-Google-Smtp-Source: ABdhPJx/l9P3CfVp/lDyVvVMMVcT02A6NeUzXDvkdb/rJGquK0l6K2PlpbcX527U5HSH3YPvrhcA9g==
X-Received: by 2002:aca:4b83:: with SMTP id y125mr8162994oia.31.1619042879582;
        Wed, 21 Apr 2021 15:07:59 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 3sm195256ood.46.2021.04.21.15.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 15:07:59 -0700 (PDT)
Received: (nullmailer pid 1702061 invoked by uid 1000);
	Wed, 21 Apr 2021 22:07:58 -0000
Date: Wed, 21 Apr 2021 17:07:58 -0500
From: Rob Herring <robh@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, soc@kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: misc DT schema fixups
Message-ID: <20210421220758.GA1702029@robh.at.kernel.org>
References: <20210421204833.18523-1-khilman@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421204833.18523-1-khilman@baylibre.com>

On Wed, 21 Apr 2021 13:48:32 -0700, Kevin Hilman wrote:
> Take a pass at cleaning up a bunch of warnings
> from 'make dtbs_check' that have crept in.
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  Documentation/devicetree/bindings/media/rc.yaml    |  4 ++++
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  4 ++--
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  1 -
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  | 14 +++++++-------
>  .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |  2 +-
>  .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |  4 ++--
>  arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |  2 +-
>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |  4 ++--
>  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  2 +-
>  .../dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts |  2 +-
>  .../boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts |  8 ++++----
>  .../boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts |  2 +-
>  .../boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts   |  2 +-
>  .../boot/dts/amlogic/meson-gxm-wetek-core2.dts     |  2 +-
>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  4 ++--
>  .../arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts |  2 +-
>  16 files changed, 31 insertions(+), 28 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
