Return-Path: <SRS0=0I20=2N=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D2CC4332F
	for <soc@archiver.kernel.org>; Wed, 12 Oct 2022 13:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A0EEC4347C; Wed, 12 Oct 2022 13:11:16 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63428C433D7
	for <soc@kernel.org>; Wed, 12 Oct 2022 13:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 63428C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f175.google.com with SMTP id w3so2341178qtv.9
        for <soc@kernel.org>; Wed, 12 Oct 2022 06:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=duZMII461PybSOKzGZSZqhJJ/qLu0MRfPY5z6dxigmI=;
        b=a7bw5Q23wINBvoFwz/iFZmdlemcJRCm9fhL7eS0XFlNQBZ19p4im/mcGTwHU1NAtzD
         jk6jZhamKzPFSoVWO4p59MOJu3n5voX+W74YhAqC7zhP2wesfnJPhWUO72deAIFWJSC7
         1p84rOHvcqZr6MaJnxgvtHgl8Y7lZOjcflhrDrkG1Qpr8tBoWZAXn7m+cbyhPn418YZX
         PzSlw2xNcMvMAr0PyXBqclS6lkLZ6DWGl3D4omft/y9F/Aic/TZwQ8Dz3yxFtaCJM/lm
         JFVVbcwmfcVn4kc6k5L7cHk5gOn9ei/ckUCjW4d+no+hO8d6nJWpK6ew5z4KYzrgRvwn
         V2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=duZMII461PybSOKzGZSZqhJJ/qLu0MRfPY5z6dxigmI=;
        b=sRWIv/H647jyP7w3THcMQrWh36+wKVYjfvpOHZ2gcmqcevcltRHI7YemLstrxfkmXA
         eMDPZAaUu7ym6c/3i1IK4s3oKyev1UJp52vRshbkBJDsNC+EbZWQJJKFCYDmL5Ea8FES
         LPYd2A81t3KiFTAmibJVsLgy3O7vuMNOvba+y0y35JstKcZfbu2E+W1cxLvjKw2YZvbR
         0Kj0MXPlBmsVitV4e+phivrHJreHuJHXcs7UPvaMvWPu+emPKTdvZeY5oE7Nm9qyL3JS
         aXNuo2f+jmt5p5fP8EDDM0QTb/4myeg+XSa2Z2AUPmy+G5Ca/q+LL4dX8gz0ViG4fbJY
         xqKQ==
X-Gm-Message-State: ACrzQf27etDAIlLirI5NX8U8LBqgnACoQoNkbS41CAmxSWV37Xhme76M
	5NKk9ivbvJzppCjd7Gr7oAudZQ==
X-Google-Smtp-Source: AMsMyM5zJrz3dx98rqmztHfBVMqSLyUW8p6tkWsBylvPbfbtBcCaSwdh6OYo7aZ0HedmoRQQhkOkng==
X-Received: by 2002:ac8:7fcc:0:b0:39c:bdf4:6323 with SMTP id b12-20020ac87fcc000000b0039cbdf46323mr2836670qtk.201.1665580274377;
        Wed, 12 Oct 2022 06:11:14 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id he35-20020a05622a602300b0039a55f78792sm6338703qtb.89.2022.10.12.06.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 06:11:13 -0700 (PDT)
Message-ID: <12461098-aea7-e486-f303-ef2387a6ae1f@linaro.org>
Date: Wed, 12 Oct 2022 09:11:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 10/10] ARM: dts: suniv: add device tree for PopStick
 v1.1
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
References: <20221012055602.1544944-1-uwu@icenowy.me>
 <20221012055602.1544944-11-uwu@icenowy.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221012055602.1544944-11-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/10/2022 01:56, Icenowy Zheng wrote:
> PopStick is a minimal Allwinner F1C200s dongle, with its USB controller
> wired to a USB Type-A port, a SD slot and a SPI NAND flash on board, and
> an on-board CH340 USB-UART converted connected to F1C200s's UART0.


(...)

> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&pio 4 6 GPIO_ACTIVE_HIGH>; /* PE6 */
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +
> +	reg_vcc3v3: vcc3v3 {

Generic node names, so at least generic "regulator" prefix or suffix.

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +};
> +
> +&mmc0 {
> +	cd-gpios = <&pio 4 3 GPIO_ACTIVE_LOW>; /* PE3 */
> +	bus-width = <4>;
> +	disable-wp;
> +	status = "okay";

Keep status as last property.

> +	vmmc-supply = <&reg_vcc3v3>;
> +};
> +
> +&spi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi0_pc_pins>;
> +	status = "okay";
> +
> +	flash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "spi-nand";
> +		reg = <0>;

compatible and reg are by convention the first properties.

> +		spi-max-frequency = <40000000>;
> +

Best regards,
Krzysztof

