Return-Path: <SRS0=4tTZ=ZX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8332FECAAD8
	for <soc@archiver.kernel.org>; Tue, 20 Sep 2022 16:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43A2EC433B5; Tue, 20 Sep 2022 16:04:28 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2998AC433C1
	for <soc@kernel.org>; Tue, 20 Sep 2022 16:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2998AC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id a2so4577767lfb.6
        for <soc@kernel.org>; Tue, 20 Sep 2022 09:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=FogWB2FGGdAF/PqnPcBa4/GS/a8YaiRAD23uITPI7zk=;
        b=VPtjkI+boNwBC+sWLXnbJiTs2CsMQODoEZj3Q0kXubJ1OMA7atWZnTUQo3A21KFhr5
         2o0mBVwGdsOseRpFB9A1MaP7T2wiTTdIX5iZVi6gKOMbKZDwowN+qRS/d+vmr+6BL+DR
         7upD5DidRQEW3/rzdkH3bfkK37GfiNWqULvwc004e+79nXstNxRmTJ0yIUdnXYZtBFzs
         1nc3H2BXgkJdpkNwirulQqMZj8A89XOI4U55svfxzpVdXLfm/ny3GyuCWsxm7sKmDHYO
         CMVfkQBkI+DzzAFJkAUZyk+nHI1YTRaJiQhBwILXjciTBDCs2Fc5chhz6PzVuIZ4hCbe
         WVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FogWB2FGGdAF/PqnPcBa4/GS/a8YaiRAD23uITPI7zk=;
        b=d3V/4REOc995p8WYb80ecSTBcEP2LJfjjhq57e82hw8FU+DhNCD9deooVpHq0NoqXp
         MBI/BzitgfWVI40yCnihL//ELQAq8HRJRrimc9wgLyq7CzsMeJVvnMqF+pSU5sh4rK7h
         g7AH4hG8evPn6Xv/0niBXHelxW5PbG7sJBEt0qbJqfW+1oP3C/3u0N+hQkU2cxE3r/4e
         0obHMZz1teLT26pgcFeQM8ccfl12mebyWgsh0TIHGfYw4xwJfwjMxnToaYfw0UrMKEdi
         V91ngsLv+aJOeNQRrYt+8t2vxD74DSyckrE7SQXYK0Lw3XQpknmCZTeBaxggsABv8gnr
         YhjQ==
X-Gm-Message-State: ACrzQf0DaA3zrD+ZKURjj0pJcHPEnPntyysWucOrvrdLYsZfiSv9WFTQ
	ccnTWFJ37a+XceEcbleGhnQYSg==
X-Google-Smtp-Source: AMsMyM6sD1Pr9eVFc6gnNTiuKWVfGjowPR9KRj0qBDptnRoLcvnkhKYp34+NmU7ATCCjXNm5ebQrWg==
X-Received: by 2002:a05:6512:3e26:b0:497:3a4f:d1f with SMTP id i38-20020a0565123e2600b004973a4f0d1fmr9455339lfv.31.1663689865187;
        Tue, 20 Sep 2022 09:04:25 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z13-20020a2e8e8d000000b00261a8e56fe4sm23885ljk.55.2022.09.20.09.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 09:04:24 -0700 (PDT)
Message-ID: <62aab493-fe9b-07af-2d9a-a85ba1d1060f@linaro.org>
Date: Tue, 20 Sep 2022 18:04:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add AMD DaytonaX BMC
Content-Language: en-US
To: Konstantin Aladyshev <aladyshev22@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
References: <20220920153928.6454-1-aladyshev22@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920153928.6454-1-aladyshev22@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/09/2022 17:39, Konstantin Aladyshev wrote:
> Add initial version of device tree for the BMC in the AMD DaytonaX
> platform.


Thank you for your patch. There is something to discuss/improve.

> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 05d8aef6e5d2..9eff88d410aa 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1575,6 +1575,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-ast2600-evb-a1.dtb \
>  	aspeed-ast2600-evb.dtb \
>  	aspeed-bmc-amd-ethanolx.dtb \
> +	aspeed-bmc-amd-daytonax.dtb \
>  	aspeed-bmc-ampere-mtjade.dtb \
>  	aspeed-bmc-arm-stardragon4800-rep2.dtb \
>  	aspeed-bmc-asrock-e3c246d4i.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts b/arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts
> new file mode 100644
> index 000000000000..0e066b5ae0fb
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts
> @@ -0,0 +1,320 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	model = "AMD DaytonaX BMC";
> +	compatible = "amd,daytonax-bmc", "aspeed,ast2500";

Missing bindings documentation.

> +
> +	memory@80000000 {
> +		reg = <0x80000000 0x20000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		video_engine_memory: jpegbuffer {
> +			size = <0x02000000>;	/* 32M */
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +	};
> +
> +	aliases {
> +		serial0 = &uart1;
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=ttyS4,115200 earlycon";

bootargs do not belong to mainline DTS. earlycon for sure.

> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		fault {

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).

Nodes are wrong.

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +			gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		identify {

Ditto

> +			gpios = <&gpio ASPEED_GPIO(A, 3) GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
> +			<&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>,
> +			<&adc 10>, <&adc 11>, <&adc 12>, <&adc 13>, <&adc 14>,
> +			<&adc 15>;
> +	};
> +};
> +
> +&fmc {

(...)


> +	fan@15 {
> +		reg = <0x07>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x0f>;
> +	};
> +};
> +
> +&video {
> +	status = "okay";
> +	memory-region = <&video_engine_memory>;
> +};
> +
> +&vhub {
> +	status = "okay";
> +};
> +

No need for trailing new line.

Best regards,
Krzysztof
