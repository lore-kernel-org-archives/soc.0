Return-Path: <SRS0=Pp40=JS=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFCCCC43461
	for <soc@archiver.kernel.org>; Wed, 21 Apr 2021 12:51:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BEA6C6144C; Wed, 21 Apr 2021 12:51:59 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B0AB61409;
	Wed, 21 Apr 2021 12:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B0AB61409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-oi1-f179.google.com with SMTP id k18so37360783oik.1;
        Wed, 21 Apr 2021 05:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=K1VN0E2afsXuIRa/0LuPNToiHvD7gJG5kP9WS3acX7M=;
        b=bbjq0aPYbelXiEK7BfozPPaQswIKf/m/0HOyL3GsIGRJO0n8HPDa2jMo9pUdydMggA
         Kxn9XYv3lHCP7WB6wvCEh2VyXdXuobfCL93asNNaxiDv+2k+3PNEaPXMbvtmMmaG4uoa
         m5A6rMAWgdBVmP5Flx9VZt4MUb1YzNVxciexxqjp0A8iHu5Jgue9J5Udhp/+IVP8avDQ
         N+0sOE0iYmTuL/vzFWfZGF0q4044q9uTsLXysJo49SqVrZKOPOcO2kiSymxlZLidc48L
         H9ZF2p2uc00fqM/yrXpC2tWXHKon2lxTkcMGyLZLRauYeSMehcTknOG2n3csCyAkSx+z
         vJdw==
X-Gm-Message-State: AOAM533zAC5NVM5tAbTrbYGzEWrcDcmVPZyogXqKMI5R4GFe9JDEB/TD
	JzSjfIQ0z+dOKZo2dRD5uw==
X-Google-Smtp-Source: ABdhPJzBQLaeAdphPS+lRTeJpyFlvyfn8teAf6BdWXlXZzgiwjh0PpzFEFV066OXCxVYfGg6dPnRug==
X-Received: by 2002:aca:cf09:: with SMTP id f9mr6712741oig.95.1619009518555;
        Wed, 21 Apr 2021 05:51:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u4sm433608ool.25.2021.04.21.05.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 05:51:56 -0700 (PDT)
Received: (nullmailer pid 967208 invoked by uid 1000);
	Wed, 21 Apr 2021 12:51:48 -0000
From: Rob Herring <robh@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20210420230402.8807-1-khilman@baylibre.com>
References: <20210420230402.8807-1-khilman@baylibre.com>
Subject: Re: [PATCH] arm64: dts: amlogic: misc DT schema fixups
Date: Wed, 21 Apr 2021 07:51:48 -0500
Message-Id: <1619009508.502472.967207.nullmailer@robh.at.kernel.org>

On Tue, 20 Apr 2021 16:04:02 -0700, Kevin Hilman wrote:
> Take a pass at cleaning up a bunch of warnings
> from 'make dtbs_check' that have crept in.
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |  5 +++++
>  .../bindings/media/amlogic,axg-ge2d.yaml           |  1 +
>  Documentation/devicetree/bindings/media/rc.yaml    |  4 ++++
>  .../devicetree/bindings/sound/amlogic,t9015.yaml   |  1 +
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  4 ++--
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
>  18 files changed, 38 insertions(+), 27 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.example.dt.yaml: ge2d@ff940000: 'reset-names' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/amlogic,t9015.example.dt.yaml: audio-controller@32000: 'reset-names' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml

See https://patchwork.ozlabs.org/patch/1468511

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

