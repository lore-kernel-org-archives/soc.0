Return-Path: <SRS0=5IX8=6T=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50A6C636D6
	for <soc@archiver.kernel.org>; Thu, 23 Feb 2023 14:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9331C433D2; Thu, 23 Feb 2023 14:17:34 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0297BC4339B
	for <soc@kernel.org>; Thu, 23 Feb 2023 14:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0297BC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id q16so454065wrw.2
        for <soc@kernel.org>; Thu, 23 Feb 2023 06:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GQqRTlkrm5QG+EGnWCpzyVrvyg+LM64SAZc4j8wYcvM=;
        b=P3lVxjVavHMPGH2zmNr1cOORB3U4MZWvchkceg/1v++UQe2FJJMcDWzTdVdIsJl2Jw
         fnavu7s2n8ag/2sAwVh+v8rfb5uD1qSoWiw5vCxkcgGglE6o01O1+afmgmst0UME7C6E
         j1JYOGcbxjsGo4D/OpsmJ9kBCO24AVScg08S9s0EdysrdNJOZJBr7UiIjoWOG0Ca5+Le
         pwrtcwW09nO5rRJ9zrR+4opS78G0WKvvFgIn2RP1C062tMfghg07BvLQCXcuoWwD76TU
         pdKgtDo6U1kZI5M2wBib3NBSXiZfHJLHBJVBuwzVRpuST4eWi6nhvRfmBhJC9JFo4CJW
         GEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GQqRTlkrm5QG+EGnWCpzyVrvyg+LM64SAZc4j8wYcvM=;
        b=YSBZ99QLAYY/OunwjE7bztvkkbzBEzDnauvi0aZC7nsp6Ni66QvQ1RFeFdUYil4NZP
         NkGHULnH71wvBZUy6Z4BPr5D+t2W8phqxBzfiz5x1NyE620KqITxRZfF4bPobPc20tqR
         e1xus2B22Z/B0XRho/ejKdN8Og1rrAecNycXDyQRXDzl7tUFwbxEGLon8xCU2WELX21P
         h9b4FbTX6ctUsKgpXFSDX9MiqhcdjYdKpglCRmMZGPbg38zMr7zWlskVZoMk+ll9O410
         4rwOhS5iOYVL892fvse1cNMw1C0PXTLLHGppegXG7mqigTycmCnltNgvR70hkBvv65iu
         OB/Q==
X-Gm-Message-State: AO0yUKUflfE9HhIhX6HXFbaHYYWRE+8YmMOQRlL92Vm9j2+hEE0LG30A
	T8Gawk1TDnM7mR7Di2pxzcvNcA==
X-Google-Smtp-Source: AK7set+YD+WKtr5uljCw7OMg2mxYnQvXh/iQJLpvyRH1GSJ3occlNOLlwK1vW7X06i2kukRlCD6kWA==
X-Received: by 2002:a5d:408e:0:b0:2c7:deb:c61 with SMTP id o14-20020a5d408e000000b002c70deb0c61mr3693164wrp.39.1677161850219;
        Thu, 23 Feb 2023 06:17:30 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f5-20020a5d5685000000b002c58f199a49sm8645294wrv.117.2023.02.23.06.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 06:17:29 -0800 (PST)
Message-ID: <76395d89-1c56-12b2-b6f7-e77603019b70@linaro.org>
Date: Thu, 23 Feb 2023 15:17:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] ARM: dts: mvebu: add device tree for IIJ SA-W2
 appliance
Content-Language: en-US
To: INAGAKI Hiroshi <musashino.open@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20230223132502.2045-1-musashino.open@gmail.com>
 <20230223132502.2045-2-musashino.open@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230223132502.2045-2-musashino.open@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/02/2023 14:25, INAGAKI Hiroshi wrote:
> Add device tree for Internet Initiative Japan Inc. (IIJ) SA-W2 appliance.
> 
> Specification:
> 
> - SoC         : Marvell Armada 380 88F6810
> - RAM         : DDR3 256 MiB
> - Flash       : SPI-NOR 32 MiB
> - WLAN        : 2x Mini PCI-E slots
>   - 2.4 GHz   : Atheros AR9287
>   - 5 GHz     : Qualcomm Atheros QCA9880
> - Ethernet    : 5x 10/100/1000 Mbps
>   - Switch    : Marvell 88E6172
> - LEDs        : 12x
> - Buttons     : 1x
> - Serial      : "CONSOLE" port (RJ-45, RS-232C level)
>   - port      : ttyS0
>   - settings  : 115200 8n1
>   - assignment: 1:NC , 2:NC , 3:TXD, 4:GND,
>                 5:GND, 6:RXD, 7:NC , 8:NC
> - USB         : 2x USB 2.0 Type-A
>   - Hub       : SMCC USB2514B
> - Power       : DC Input or PoE Input
>   - DC        : 12 VDC, 3 A
>   - PoE       : 802.3f
>     - module  : Silvertel Ag9712-2BR
> - Bootloader  : PMON2000 based
> - Stock OS    : NetBSD based
> 
> Image header for stock bootloader:
> 
> 0x00 - 0x07: Identifier      , ascii, "SEIL2015"
> 0x08 - 0x57: Copyright       , ascii
> 0x58 - 0x5b: Checksum (CRC32), hex
> 0x5c - 0x5f: Version Format  , hex  , 0x00000001
> 0x60 - 0x63: Major Version   , hex
> 0x64 - 0x67: Minor Version   , hex
> 0x68 - 0x87: Release Version , ascii
> 0x88 - 0x8b: Xor Key?        , hex  , 0x00000000 (if not encoded)
> 0x8c - 0x8f: Data Length     , hex
> 
>   example:
> 
>   Identifier     : "SEIL2015"
>   Copyright      : "ARM OpenWrt Linux-5.15.94"
>   Checksum       : 0xd575759f (calculated from kernel data)
>   Version Format : 0x00000001
>   Major Version  : 0x00000009
>   Minor Version  : 0x00000063
>   Release Version: "r22151-318ed84c8d"
>   Xor Key?       : 0x00000000
>   Data Length    : 0x35312d33 (length of kernel data)
> 
> Signed-off-by: INAGAKI Hiroshi <musashino.open@gmail.com>
> ---
>  arch/arm/boot/dts/Makefile                 |   1 +
>  arch/arm/boot/dts/armada-380-iij-sa-w2.dts | 391 +++++++++++++++++++++
>  2 files changed, 392 insertions(+)
>  create mode 100644 arch/arm/boot/dts/armada-380-iij-sa-w2.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index efe4152e5846..19119a3f4f1e 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1523,6 +1523,7 @@ dtb-$(CONFIG_MACH_ARMADA_370) += \
>  dtb-$(CONFIG_MACH_ARMADA_375) += \
>  	armada-375-db.dtb
>  dtb-$(CONFIG_MACH_ARMADA_38X) += \
> +	armada-380-iij-sa-w2.dtb \
>  	armada-381-netgear-gs110emx.dtb \
>  	armada-382-rd-ac3x-48g4x2xl.dtb \
>  	armada-385-atl-x530.dtb\
> diff --git a/arch/arm/boot/dts/armada-380-iij-sa-w2.dts b/arch/arm/boot/dts/armada-380-iij-sa-w2.dts
> new file mode 100644
> index 000000000000..beeecbb0f5f8
> --- /dev/null
> +++ b/arch/arm/boot/dts/armada-380-iij-sa-w2.dts
> @@ -0,0 +1,391 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Device Tree file for Internet Initiative Japan Inc. SA-W2 Appliance
> + *
> + * Copyright (c) 2023, INAGAKI Hiroshi <musashino.open@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include "armada-380.dtsi"
> +
> +/ {
> +	model = "IIJ SA-W2";
> +	compatible = "iij,sa-w2", "marvell,armada380";

It would be nice to start documenting the board compatibles, at least
for new boards.

Best regards,
Krzysztof

