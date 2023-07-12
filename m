Return-Path: <SRS0=qp11=C6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1B9EB64D9
	for <soc@archiver.kernel.org>; Wed, 12 Jul 2023 08:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25494C433C9; Wed, 12 Jul 2023 08:27:42 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 16FFEC433C8
	for <soc@kernel.org>; Wed, 12 Jul 2023 08:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 16FFEC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51e292cf214so8645563a12.2
        for <soc@kernel.org>; Wed, 12 Jul 2023 01:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689150459; x=1691742459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xRswFWEq5Q0hoPRcdiuVBaZQX0PfVAZ2UDfle8aIlUE=;
        b=fJZ9RA/TOfW/IC7fCyPAJeek5s+alQxRdIrfd0JYbwONJWEN5wgmVtQk/uBwGvgMPi
         Ekj0s1QiHEf7pKE5viNqe93nyRpPCdXldCvPsxmA519pZqq+UG8khASlq2SKM7vxZS+A
         G/+H1qGbvFQ2nlo0bt0O41Lfl4tFxGyVZqXVI8eHmJAiA6JcnzGWqxcIPM3jYn0uVpv7
         B3nw6Qt1EApCxDwi8CHa9MXoWpa9FyU3I5jiNmROM9TalQCXSZ9xgvEKVBIJT9SFFpvH
         R5ZtzbqiKnI15Leik+DjJQm67U2RxOnoK1V3ONK9ToRnfJjI3pbuxgAAnTbpy9yoJsTQ
         R7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689150459; x=1691742459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xRswFWEq5Q0hoPRcdiuVBaZQX0PfVAZ2UDfle8aIlUE=;
        b=gnoTL15DGsB4UUUD65RXjRmOdEDMN+DnnXqzNHHt8q8QSKHqiju2+4lnQfWk7EwWR6
         pnE4DhLz1srh4rF+S+hUn5QJOsPdb8KRL1mY+tkoUDQL80NRtW8bmErIsJQAdgbebX/R
         6H9CPXsgeakpT57TaM/SipSTHuUvWSjCewFu2d6xVqOkYeCjcZsBVfYxlPz19Cro4rC5
         VW2NZ5l2pHhXzD5IhwoqiPgiPEla81vk/w8PsAoDy1IoPB1/n4DHSjmeB31n5u2+ACcO
         h8tlUw8QnBS9zYF78kB2HytiCExo9/wYMzGFk9kaHGJDU91fW1WEASmS2gWcReU7Glnz
         0UWA==
X-Gm-Message-State: ABy/qLbXYuS3MqBPMRmZuDBqNt0MbeuKzweRv5NVNWMJOb7Nc4MOpN6x
	geTvZkrgBaz42OLjgXAH1YNAlQ==
X-Google-Smtp-Source: APBJJlEB4GoTE616vRIXj8Fp6PjJajwca+FvJsVzLvw34glvBUNUVw6JKLoiRI+Op/NRBLNlScckxg==
X-Received: by 2002:aa7:d741:0:b0:51d:a483:6089 with SMTP id a1-20020aa7d741000000b0051da4836089mr18195659eds.24.1689150459132;
        Wed, 12 Jul 2023 01:27:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id j4-20020a50ed04000000b0051e2a6cef4fsm2397601eds.36.2023.07.12.01.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 01:27:38 -0700 (PDT)
Message-ID: <f5cd65fb-60b1-f470-8ad0-78dd5be9cf68@linaro.org>
Date: Wed, 12 Jul 2023 10:27:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 2/2] ARM: dts: aspeed: yosemitev4: add Facebook
 Yosemite V4 BMC
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20230712073752.54624-1-Delphine_CC_Chiu@wiwynn.com>
 <20230712073752.54624-3-Delphine_CC_Chiu@wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712073752.54624-3-Delphine_CC_Chiu@wiwynn.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/07/2023 09:37, Delphine CC Chiu wrote:
> Add linux device tree entry related to
> Yosemite V4 specific devices connected to BMC SoC.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../dts/aspeed-bmc-facebook-yosemitev4.dts    | 570 ++++++++++++++++++
>  2 files changed, 571 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev4.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 59829fc90315..871e6d271262 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1631,6 +1631,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-facebook-galaxy100.dtb \
>  	aspeed-bmc-facebook-greatlakes.dtb \
>  	aspeed-bmc-facebook-minipack.dtb \
> +	aspeed-bmc-facebook-yosemitev4.dtb \
>  	aspeed-bmc-facebook-tiogapass.dtb \
>  	aspeed-bmc-facebook-wedge40.dtb \
>  	aspeed-bmc-facebook-wedge100.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev4.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev4.dts
> new file mode 100644
> index 000000000000..1df151fb6ff3
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev4.dts
> @@ -0,0 +1,570 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2022 Facebook Inc.
> +
> +/dts-v1/;
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/leds/leds-pca955x.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +	model = "Facebook Yosemite V4 BMC";
> +	compatible = "facebook,yosemitev4-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial4 = &uart5;
> +		serial5 = &uart6;
> +		serial6 = &uart7;
> +		serial7 = &uart8;
> +		serial8 = &uart9;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyS4,57600n8";

Use stdout-path

> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x80000000>;
> +	};

...

> +
> +&i2c0 {
> +	status = "okay";
> +	bus-frequency = <400000>;
> +	multi-master;
> +	adm1278@40 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +		compatible = "adi,adm1278";
> +		reg = <0x40>;
> +	};
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +	bus-frequency = <400000>;
> +	multi-master;
> +	adm1278@40 {

Look, you already got such comment so you are repeating same mistakes.
https://lore.kernel.org/all/a8854c8e-8868-461d-9f7b-d5b44f7288c7@linaro.org/

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +		compatible = "adi,adm1278";
> +		reg = <0x40>;
> +	};
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +	bus-frequency = <400000>;
> +	multi-master;
> +	adm1278@40 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +		compatible = "adi,adm1278";

I stop here, there is no point to review same mistakes.

Best regards,
Krzysztof

