Return-Path: <SRS0=QEF6=24=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637DBECAAA1
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 14:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2125AC43142; Thu, 27 Oct 2022 14:59:30 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07472C4314E
	for <soc@kernel.org>; Thu, 27 Oct 2022 14:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07472C4314E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f181.google.com with SMTP id x26so1114031qki.0
        for <soc@kernel.org>; Thu, 27 Oct 2022 07:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FsQVftKSeBAc1FbMNJ35HF2pgqCq1gNRi3OVMUbJA30=;
        b=H6mjRFz9bKTBGET0cIaEajnv1a9/LQ6ojXq8xpg3JdPEvWTzteKUm8ggA8TNOTqip+
         NvTeAzaBYcGBmNclHrqexy/c1jDbht/2LK76s9cCVKJTrsq/M26MpH9SAr/q6TsvYXE4
         B1BeD1A/JBohH2FvRqeoX/kHniSnk8Uh9IfFhX3TRMhlgLl4sfTUClUsm5UkOG8YvJwZ
         FZGFvkoc2UsuK7bE2kqg0nfSaf5X41YxRtpPobxCVRNRO9Qbi4ERufAfJoXOzqnymK0p
         ADQR2T0jn9jOmvfNDb5d48CO/MCJY9hWj7RfTuJproiTSGoXLBQAOebTIzkVMFwyn4ic
         Ra0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FsQVftKSeBAc1FbMNJ35HF2pgqCq1gNRi3OVMUbJA30=;
        b=6U3Oi40yl9OcE4AmFobPZKZyTcJRszjDK9liCex6jy/Ddhlb1h3QOfCRxcZIOd/fge
         WxSc8l1jgd13m3KZRMPKV9V+wHsyeaZzbnZwMyFUDVNoxjcPcPH8IoDD6oS364vq9bdE
         VQdO+Sfqwome19qXk3g2bZDdLgghxw62F3ZV9GEqr9Dti+3A8iIY4HE3bo209TrQ7ZWZ
         /qMKOhJVXVXxShLTh6/9OS3eR3YFtfrL5NLtsbDyexvfCAg9T1NkVyvnz3jfCEyCBRn/
         5km1j/DnJQVry8kAv0DgObVd27rcavR+MI7vH0np+Eu3FvqeolHTs5ybOk3Ls7oI8OA8
         f2SQ==
X-Gm-Message-State: ACrzQf2Hp/U7sOF5QPgm+VfS/E/mWLcrQLhxhyrTHT3dGvrtRMjZ93AA
	2BgqVrexEIjKoYSfeHO4haJYog==
X-Google-Smtp-Source: AMsMyM55HGtvEs91o/AnOm1jyLgdQjFebhs2S+lDBlp0J8R+GXQThXx6GckPGpFjWXZu/LjC33Chow==
X-Received: by 2002:a05:620a:45ac:b0:6f8:7c0c:20f with SMTP id bp44-20020a05620a45ac00b006f87c0c020fmr8425800qkb.270.1666882767987;
        Thu, 27 Oct 2022 07:59:27 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id j4-20020a05620a410400b006cfc01b4461sm1091819qko.118.2022.10.27.07.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 07:59:27 -0700 (PDT)
Message-ID: <35ed0b8f-04f1-d544-a0d8-19d12e7c0ef8@linaro.org>
Date: Thu, 27 Oct 2022 10:59:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 4/4] ARM: dts: rockchip: add rk3128-evb.dts
Content-Language: en-US
To: Johan Jonker <jbx6244@gmail.com>, kever.yang@rock-chips.com,
 heiko@sntech.de
List-Id: <soc.lore.kernel.org>
Cc: sjg@chromium.org, philipp.tomsich@vrull.eu, zhangqing@rock-chips.com,
 hjc@rock-chips.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <da1252eb-85e9-bdb8-0542-207173523523@gmail.com>
 <e0679728-7a15-50e1-8a5e-847db1528726@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e0679728-7a15-50e1-8a5e-847db1528726@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/10/2022 20:54, Johan Jonker wrote:
> Add rk3128-evb.dts
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  arch/arm/boot/dts/Makefile       |   1 +
>  arch/arm/boot/dts/rk3128-evb.dts | 105 +++++++++++++++++++++++++++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rk3128-evb.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 68ac9b360..0f26539d2 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1127,6 +1127,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
>  	rk3066a-marsboard.dtb \
>  	rk3066a-mk808.dtb \
>  	rk3066a-rayeager.dtb \
> +	rk3128-evb.dtb \
>  	rk3188-bqedison2qc.dtb \
>  	rk3188-px3-evb.dtb \
>  	rk3188-radxarock.dtb \
> diff --git a/arch/arm/boot/dts/rk3128-evb.dts b/arch/arm/boot/dts/rk3128-evb.dts
> new file mode 100644
> index 000000000..6ad4549d5
> --- /dev/null
> +++ b/arch/arm/boot/dts/rk3128-evb.dts
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * (C) Copyright 2017 Rockchip Electronics Co., Ltd
> + */
> +
> +/dts-v1/;
> +
> +#include "rk3128.dtsi"
> +
> +/ {
> +	model = "Rockchip RK3128 Evaluation board";
> +	compatible = "rockchip,rk3128-evb", "rockchip,rk3128";
> +
> +	aliases {
> +		mmc0 = &emmc;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart2;
> +	};
> +
> +	memory@60000000 {
> +		device_type = "memory";
> +		reg = <0x60000000 0x40000000>;
> +	};
> +
> +	vcc5v0_otg: vcc5v0-otg-drv {

Generic node names, so at least regulator prefix or suffix.

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_otg";
> +		gpio = <&gpio0 26 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&otg_vbus_drv>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +	vcc5v0_host: vcc5v0-host-drv {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_host";
> +		gpio = <&gpio2 23 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&host_vbus_drv>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&emmc {
> +	bus-width = <8>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&emmc_clk &emmc_cmd &emmc_bus8>;
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	hym8563: rtc@51 {
> +		compatible = "haoyu,hym8563";
> +		reg = <0x51>;
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		clock-output-names = "xin32k";
> +	};
> +};
> +
> +&usb2phy {
> +	status = "okay";
> +};
> +
> +&usb2phy_host {
> +	status = "okay";
> +};
> +
> +&usb2phy_otg {
> +	status = "okay";
> +};
> +
> +&usb_host_ehci {
> +	status = "okay";
> +};
> +
> +&usb_host_ohci {
> +	status = "okay";
> +};
> +
> +&usb_otg {
> +	vbus-supply = <&vcc5v0_otg>;
> +	status = "okay";
> +};
> +
> +&pinctrl {
> +	usb_otg {

No underscores in node names

> +		otg_vbus_drv: otg-vbus-drv {
> +			rockchip,pins = <0 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	usb_host {

Ditto

> +		host_vbus_drv: host-vbus-drv {
> +			rockchip,pins = <2 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> --
> 2.20.1
> 

Best regards,
Krzysztof

