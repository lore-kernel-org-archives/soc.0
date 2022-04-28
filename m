Return-Path: <SRS0=cNPI=VG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8215AC433F5
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 07:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56EF5C385AC; Thu, 28 Apr 2022 07:13:30 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 547B6C385A0
	for <soc@kernel.org>; Thu, 28 Apr 2022 07:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 547B6C385A0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id r13so7705702ejd.5
        for <soc@kernel.org>; Thu, 28 Apr 2022 00:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iGqqNXodCdUDh7H9P3dABdV87d92uw3GOCws81glz0A=;
        b=bZSDYZK3nZ8gNy0m2zOk1wfcaP/wBfAJTWrD4X7zoB+oJBYlWudyPmULtS1NYm4mxp
         7HfiUBgkOKIwAzB4l4kApY3BoLGk/ZoyLxYc7OtY4Whi+KY/JkuV3ZOkSXu/28vUE/0D
         3v/J3lI7c5WbaegYPuiWYmUX/pR/+IiERbtnl07Ek3QmqFEeA6DrJnzri8MhZzRsePQ2
         NQII16PWfwWBGz9/z3Q5wfP/Ng2BvuX7NxP8ZzvtU+aQ4JFFPKB2A8eJR61JyS9BAr+B
         VWKOYXYjyzGazWswq8q7jjB6GWV27+/fCtbo+sGDf7xKX1cuHHekM1EQEMVSicse3rjh
         ywFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iGqqNXodCdUDh7H9P3dABdV87d92uw3GOCws81glz0A=;
        b=MlYUoOhlRWQZ2BPGa3N3QjwF45+4gH0fsOb+O3TD8yChq/ldHOydXjq1Gcn0E1quhx
         sF3gKCcyIhM5Q2OsNat/XUHUL8lZDAoFAyt1Trp7+YZhTzGO8yiyfIYVxaZroDIkqFKm
         eENNP51hjtlNiSgD2FM+ryZlW1hBAr2Kz4aGpOdskZDeT+G7MtYPfFIwfKH1lI/8sZuW
         z5MuORVW6jUC38v9uQ43NgS38LkNSXr1OR3T+jMNe2aaoORvKPN1JL7xACco9rsT0IBo
         vVcE5xJhfqjBgzhf0q0rBTh6cICWWWmv4rlfiNgGPYPOFi0oTww7V5BlYGl6YRHVPa3T
         9Lfg==
X-Gm-Message-State: AOAM532qfN1Nw/mFanmnWEKNvKPytKg5/RhAejeNj6sFlhmRI8WZfTEZ
	lg46/n/wsXfMUu9Ti9Pz8Y+Z/g==
X-Google-Smtp-Source: ABdhPJzklgMRo6K6Lgff0kJeIZiKiKNlkH0bcxPoFqazCmfw8oQiB7HgE78X2TJm3gxs/k62MWTUpg==
X-Received: by 2002:a17:907:e88:b0:6ef:bce9:ff6a with SMTP id ho8-20020a1709070e8800b006efbce9ff6amr32059892ejc.275.1651130007604;
        Thu, 28 Apr 2022 00:13:27 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k26-20020a17090666da00b006ef79b595e9sm7946644ejp.80.2022.04.28.00.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 00:13:26 -0700 (PDT)
Message-ID: <a1d5cec3-b883-319c-c413-b09cca1fa518@linaro.org>
Date: Thu, 28 Apr 2022 09:13:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC RFT PATCH v1 1/1] ARM: orion5x: convert D-Link DNS-323 to
 the Device Tree
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Mauri Sandberg <maukka@ext.kapsi.fi>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: arnd@arndb.de, olof@lixom.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, andrew@lunn.ch,
 sebastian.hesselbarth@gmail.com
References: <20220427162123.110458-1-maukka@ext.kapsi.fi>
 <20220427162123.110458-2-maukka@ext.kapsi.fi>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220427162123.110458-2-maukka@ext.kapsi.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/04/2022 18:21, Mauri Sandberg wrote:
> Convert D-Link DNS-323 to use the device tree and remove associated
> mach file.
> 

Thank you for your patch. There is something to discuss/improve.

> Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
> ---
>  arch/arm/boot/dts/Makefile                   |   3 +
>  arch/arm/boot/dts/orion5x-dlink-dns323.dtsi  | 217 ++++++
>  arch/arm/boot/dts/orion5x-dlink-dns323a1.dts |  59 ++
>  arch/arm/boot/dts/orion5x-dlink-dns323b1.dts |  38 +
>  arch/arm/boot/dts/orion5x-dlink-dns323c1.dts |  80 ++
>  arch/arm/mach-orion5x/Kconfig                |   6 +-
>  arch/arm/mach-orion5x/Makefile               |   2 +-
>  arch/arm/mach-orion5x/board-dns323.c         | 118 +++
>  arch/arm/mach-orion5x/board-dt.c             |   3 +
>  arch/arm/mach-orion5x/common.h               |   6 +
>  arch/arm/mach-orion5x/dns323-setup.c         | 724 -------------------
>  11 files changed, 528 insertions(+), 728 deletions(-)
>  create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323.dtsi
>  create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323a1.dts
>  create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323b1.dts
>  create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323c1.dts
>  create mode 100644 arch/arm/mach-orion5x/board-dns323.c
>  delete mode 100644 arch/arm/mach-orion5x/dns323-setup.c

DTS goes separately.

> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7c16f8a2b738..c7c5c0b6c843 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -949,6 +949,9 @@ dtb-$(CONFIG_SOC_DRA7XX) += \
>  	dra71-evm.dtb \
>  	dra76-evm.dtb
>  dtb-$(CONFIG_ARCH_ORION5X) += \
> +	orion5x-dlink-dns323a1.dtb \
> +	orion5x-dlink-dns323b1.dtb \
> +	orion5x-dlink-dns323c1.dtb \
>  	orion5x-kuroboxpro.dtb \
>  	orion5x-lacie-d2-network.dtb \
>  	orion5x-lacie-ethernet-disk-mini-v2.dtb \
> diff --git a/arch/arm/boot/dts/orion5x-dlink-dns323.dtsi b/arch/arm/boot/dts/orion5x-dlink-dns323.dtsi
> new file mode 100644
> index 000000000000..2b033d37cbf8
> --- /dev/null
> +++ b/arch/arm/boot/dts/orion5x-dlink-dns323.dtsi
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2022 Mauri Sandberg <maukka@ext.kapsi.fi>
> + *
> + */
> +
> +/ {
> +	model = "D-Link DNS-323";
> +	compatible = "dlink,dns323", "marvell,orion5x";
> 

You need to also document the compatibles in bindings file for boards.
It would be nice to convert
Documentation/devicetree/bindings/arm/marvell/marvell,orion5x.txt to DT
Schema (see armada-7k-8k.yaml for example), but it is not a requirement.


Best regards,
Krzysztof
