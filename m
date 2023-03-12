Return-Path: <SRS0=qZpA=7E=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BEEC6FA99
	for <soc@archiver.kernel.org>; Sun, 12 Mar 2023 21:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3B814C433D2; Sun, 12 Mar 2023 21:02:29 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF4CFC433EF
	for <soc@kernel.org>; Sun, 12 Mar 2023 21:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EF4CFC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id cy23so40974510edb.12
        for <soc@kernel.org>; Sun, 12 Mar 2023 14:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678654946;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qj1cXXqLyWgdPfJI5vrHGJXiCzlKmBf4u+Esl1s34b8=;
        b=T1OZkXIBCs09tAfYSkatz+1Mz2Ikbdu8dhgkALbsDPtxy0ZsMa2o2phIJvAuCHG0tS
         KAxemf+GOfyP97Ws1Zjsp6elR476GQFXhXzfQyONzRsdEQ4KuB+NTMFUhCGLpGDE93iH
         l7heYL65QyTwYW36ZZl6ca17hUtwkCckPEIsmbg92gals1GvlTUrEoJfk8ZPkhLg+r4a
         EyKy4JBJesuzbGBHYJGYOH1LJSRwRfntFtwRL7k6BdF2pSnjsp/xpnWVGaQZgReVLf6y
         TPtUeQBm1M8H49k77eODeQap+iIWJNul9SynRQG9yFBiZdnCjdRPLTtQwHMgzbI2YLcB
         RUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678654946;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qj1cXXqLyWgdPfJI5vrHGJXiCzlKmBf4u+Esl1s34b8=;
        b=I0R8q4TFaFxdWwOsGmRFj0b3UDQ5t/Ae+zNQSrxaLB+p+Z+0HyOJwDIHyQEnwsiFjR
         fVSe9jcX8lfNENGZgiFj60tAaaHoNH9CrSYdhp0VF/c0MBRfraHK4bB/Fh7hLcIKbBDs
         BR0NQQu8Ap5STf2NZZoo4mW5XMbnEW/eU+kTuK4YGuURHSi7+GR5FQcxttewewQLD22u
         /P/lnZiMcwHQ1vvXYYkfwB8Vm0z0fACgGOtbyWfNIzpZ6BAiad6xUlwdCySn54lKpvmx
         lbh01atmXZ1Rgd8x7BFYQ1oElUkCvof4uc76Svsi5HkZd5Yg3EXk5CWBWcredjulMnOI
         vbPw==
X-Gm-Message-State: AO0yUKXvzhBe5zHW9zLHfLBF3A0KNWemmFWz5YXk+SNd4tJKOGLWcqar
	cipl0DukJb21L/kP1nNuPgA9+w==
X-Google-Smtp-Source: AK7set96PFCqqF1MKJuHdirnlZrt7ztdx50WnXYftY1biggqu8CPFxeJo84vWtfKtF9PWzj6YOCVBQ==
X-Received: by 2002:a17:907:6289:b0:91d:9745:407e with SMTP id nd9-20020a170907628900b0091d9745407emr9747007ejc.18.1678654946126;
        Sun, 12 Mar 2023 14:02:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id sg42-20020a170907a42a00b009202ce3c8adsm2322785ejc.27.2023.03.12.14.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 14:02:25 -0700 (PDT)
Message-ID: <1346ce4e-f1fd-1a77-f38e-cd87efc59082@linaro.org>
Date: Sun, 12 Mar 2023 22:02:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] ARM: dts: imx: Add devicetree for Tolino Vison
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, marex@denx.de,
 max.krummenacher@toradex.com, leoyang.li@nxp.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230312205236.2281466-1-andreas@kemnade.info>
 <20230312205236.2281466-3-andreas@kemnade.info>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312205236.2281466-3-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/03/2023 21:52, Andreas Kemnade wrote:
> This adds a devicetree for the Kobo Aura 2 Ebook reader. It is based
> on boards marked with "37NB-E60Q30+4A3". It is equipped with an i.MX6SL
> SoC.
> 

Thank you for your patch. There is something to discuss/improve.

> +	wifi_pwrseq: wifi_pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_wifi_reset>;
> +		post-power-on-delay-ms = <20>;
> +		reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default","sleep";
> +	pinctrl-0 = <&pinctrl_i2c1>;
> +	pinctrl-1 = <&pinctrl_i2c1_sleep>;
> +	status = "okay";
> +
> +	touchscreen@15 {
> +		reg = <0x15>;
> +		compatible = "elan,ektf2132";

compatible first, then reg.

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_ts>;
> +		power-gpios = <&gpio5 13 GPIO_ACTIVE_HIGH>;
> +		interrupts-extended = <&gpio5 6 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +
> +	accelerometer@1d {
> +		reg = <0x1d>;
> +		compatible = "fsl,mma8652";
> +	};
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default","sleep";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	pinctrl-1 = <&pinctrl_i2c2_sleep>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c3>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +
> +	ec: embedded-controller@43 {
> +		compatible = "netronix,ntxec";
> +		reg = <0x43>;
> +		#pwm-cells = <2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_ec>;
> +		interrupts-extended = <&gpio5 11 IRQ_TYPE_EDGE_FALLING>;
> +		system-power-controller;
> +	};
> +};
> +
> +&snvs_rtc {
> +	/*
> +	 * We are using the RTC in the PMIC, but this one is not disabled
> +	 * in imx6sl.dtsi.
> +	 */
> +	status = "disabled";
> +};
> +
> +&uart1 {
> +	/* J4 */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	/* J9 */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart4>;
> +	status = "okay";
> +};
> +
> +&usdhc2 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 = <&pinctrl_usdhc2>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
> +	pinctrl-3 = <&pinctrl_usdhc2_sleep>;
> +	cd-gpios = <&gpio5 2 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +
> +	/* removable uSD card */
> +};
> +
> +&usdhc3 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +	pinctrl-3 = <&pinctrl_usdhc3_sleep>;
> +	vmmc-supply = <&reg_wifi>;
> +	mmc-pwrseq = <&wifi_pwrseq>;
> +	cap-power-off-card;
> +	non-removable;
> +	status = "okay";
> +
> +	/* CyberTan WC121 (BCM43362) SDIO WiFi */
> +};
> +
> +&usdhc4 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 = <&pinctrl_usdhc4>;
> +	pinctrl-1 = <&pinctrl_usdhc4_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc4_200mhz>;
> +	pinctrl-3 = <&pinctrl_usdhc4_sleep>;
> +	bus-width = <8>;
> +	no-1-8-v;
> +	non-removable;
> +	status = "okay";
> +
> +	/* internal eMMC */
> +};
> +
> +&usbotg1 {
> +	pinctrl-names = "default";
> +	disable-over-current;
> +	srp-disable;
> +	hnp-disable;
> +	adp-disable;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_backlight_power: backlight-powergrp {
> +		fsl,pins = <
> +			MX6SL_PAD_EPDC_PWRCTRL3__GPIO2_IO10 0x10059
> +		>;
> +	};
> +
> +	pinctrl_ec: ecgrp {
> +		fsl,pins = <
> +			MX6SL_PAD_SD1_DAT0__GPIO5_IO11  0x17000
> +		>;
> +	};
> +
> +	pinctrl_gpio_keys: gpio-keysgrp {
> +		fsl,pins = <
> +			MX6SL_PAD_SD1_DAT1__GPIO5_IO08  0x110B0
> +			MX6SL_PAD_SD1_DAT4__GPIO5_IO12  0x110B0
> +			MX6SL_PAD_KEY_COL1__GPIO3_IO26  0x11030
> +		>;
> +	};
> +
> +	pinctrl_i2c1: i2c1grp {
> +		fsl,pins = <
> +			MX6SL_PAD_I2C1_SCL__I2C1_SCL	 0x4001f8b1
> +			MX6SL_PAD_I2C1_SDA__I2C1_SDA	 0x4001f8b1
> +		>;
> +	};
> +
> +	pinctrl_i2c1_sleep: i2c1grp-sleep {
> +		fsl,pins = <
> +			MX6SL_PAD_I2C1_SCL__I2C1_SCL	 0x400108b1
> +			MX6SL_PAD_I2C1_SDA__I2C1_SDA	 0x400108b1
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			MX6SL_PAD_I2C2_SCL__I2C2_SCL	 0x4001f8b1
> +			MX6SL_PAD_I2C2_SDA__I2C2_SDA	 0x4001f8b1
> +		>;
> +	};
> +
> +	pinctrl_i2c2_sleep: i2c2grp-sleep {

Shouldn't all groups end with 'grp' suffix? Are you sure this passes
dtbs_check?

...

> +
> +	pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {

Name looks wrong. Same in other places further.



Best regards,
Krzysztof

