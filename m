Return-Path: <SRS0=5k/X=WY=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850BDC433EF
	for <soc@archiver.kernel.org>; Fri, 17 Jun 2022 10:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4C17EC341C0; Fri, 17 Jun 2022 10:44:37 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A7E7C3411B;
	Fri, 17 Jun 2022 10:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5A7E7C3411B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id s12so8017509ejx.3;
        Fri, 17 Jun 2022 03:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=otzMXO+UzjAVntuNvFzmToiaj0Xvl10WTmF2X1x20Gs=;
        b=NbYG0/ltrsRmRfUcWflVhrJw27NKwjWAIJLlH+BtGanROc2UkceKeROAUsMGYNWAYm
         uwjxjB4sww9rCvxZbMcmzK7/o+ko5hPycRmwL9Z41FT2agzVwgKMgk1bJZjOhg7IMdfH
         Erxa5b6ZPlPWptAUQ0GTIFYhFm7r5RO2nMOry269LSBYPA3G/CgBzAvadEGWF8wDHfPR
         IWysUmq0Jnp2S2O9LKnUd9akvLGUdYQOkjkyqzRZXnjMe4/4PuNyQfz0AeY//YMvqjz/
         wlPEWG3jjFg1wxOH2SA3BA0ladlyO8vWZH4kEiXJsrKgFRux5hSNtg4XX8z0Ysl1aCPd
         xEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=otzMXO+UzjAVntuNvFzmToiaj0Xvl10WTmF2X1x20Gs=;
        b=iilHf1pqXPg7Hzze5jLam4WVmWCkPm+WlFZOUQDOelswdbWzjSrfTEon0Og9zSyy4N
         q7CHI4lC4k6/yWWuyclgpJN6pNfzH3cfY8yNugsf7mZjYSshcfSrZ2c8aqmJ/oYMOJVa
         Hc8uWwnrzRlgJiYeK7iE+q/BS2lIOHgjdvGzAzHWRwZp95IsqHrbuo/vxHWSWip5JkTj
         Fa48DsJHepfHiQKLO3cx9yVLv9OWtwy8lGUogBQ+bU4b2ibh4l1irRijNqj7s0df2/kS
         7EYZF7S3j31CUG8RYsjCzrfwOG6rMGQwCJV99YanBiW4/7XxYpKcDdcReQpGql9tyoPo
         qXtQ==
X-Gm-Message-State: AJIora+NfzgdgMAdrgr0EDTdCq2qr20diWMzeXGannzDnxC+/Eett2tO
	nV4xL125/axoH//9Q5nO0GJZpZ9Eup8BnA==
X-Google-Smtp-Source: AGRyM1tTm4mmAhpPdwZ1D1xqJQ5B0eHb98NUmc1YWQWMSXAhfW1NR8KcCN8FzvGnAS9VZWpLUFAjtQ==
X-Received: by 2002:a17:906:2cc8:b0:6fd:d8d8:b8f3 with SMTP id r8-20020a1709062cc800b006fdd8d8b8f3mr8655303ejr.384.1655462674583;
        Fri, 17 Jun 2022 03:44:34 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id y3-20020a056402358300b0042dc25fdf5bsm3632843edc.29.2022.06.17.03.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 03:44:33 -0700 (PDT)
Message-ID: <edc8933a-5433-8fe9-f5ab-5efeaa6cde78@gmail.com>
Date: Fri, 17 Jun 2022 12:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 18/40] ARM: dts: mediatek: align gpio-key node names
 with dtschema
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, arm@kernel.org,
 soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-18-krzysztof.kozlowski@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220616005333.18491-18-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/06/2022 02:53, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!

> ---
>   arch/arm/boot/dts/mt7623a-rfb-emmc.dts        | 4 ++--
>   arch/arm/boot/dts/mt7623a-rfb-nand.dts        | 4 ++--
>   arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 4 ++--
>   arch/arm/boot/dts/mt7623n-rfb-emmc.dts        | 4 ++--
>   arch/arm/boot/dts/mt7629-rfb.dts              | 4 ++--
>   5 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/mt7623a-rfb-emmc.dts b/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
> index 13c86936d1c8..e8b4b6d30d19 100644
> --- a/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
> +++ b/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
> @@ -45,13 +45,13 @@ gpio-keys {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&key_pins_a>;
>   
> -		factory {
> +		button-factory {
>   			label = "factory";
>   			linux,code = <BTN_0>;
>   			gpios = <&pio 256 GPIO_ACTIVE_LOW>;
>   		};
>   
> -		wps {
> +		button-wps {
>   			label = "wps";
>   			linux,code = <KEY_WPS_BUTTON>;
>   			gpios = <&pio 257 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/mt7623a-rfb-nand.dts b/arch/arm/boot/dts/mt7623a-rfb-nand.dts
> index 88d8f0b2f4c2..61f5da68d4b0 100644
> --- a/arch/arm/boot/dts/mt7623a-rfb-nand.dts
> +++ b/arch/arm/boot/dts/mt7623a-rfb-nand.dts
> @@ -45,13 +45,13 @@ gpio-keys {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&key_pins_a>;
>   
> -		factory {
> +		button-factory {
>   			label = "factory";
>   			linux,code = <BTN_0>;
>   			gpios = <&pio 256 GPIO_ACTIVE_LOW>;
>   		};
>   
> -		wps {
> +		button-wps {
>   			label = "wps";
>   			linux,code = <KEY_WPS_BUTTON>;
>   			gpios = <&pio 257 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> index 027c1b0c6a98..5008115d2494 100644
> --- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> +++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> @@ -91,13 +91,13 @@ gpio-keys {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&key_pins_a>;
>   
> -		factory {
> +		button-factory {
>   			label = "factory";
>   			linux,code = <BTN_0>;
>   			gpios = <&pio 256 GPIO_ACTIVE_LOW>;
>   		};
>   
> -		wps {
> +		button-wps {
>   			label = "wps";
>   			linux,code = <KEY_WPS_BUTTON>;
>   			gpios = <&pio 257 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
> index 1b9b9a8145a7..bf67a8e9be59 100644
> --- a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
> +++ b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
> @@ -60,13 +60,13 @@ gpio-keys {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&key_pins_a>;
>   
> -		factory {
> +		button-factory {
>   			label = "factory";
>   			linux,code = <BTN_0>;
>   			gpios = <&pio 256 GPIO_ACTIVE_LOW>;
>   		};
>   
> -		wps {
> +		button-wps {
>   			label = "wps";
>   			linux,code = <KEY_WPS_BUTTON>;
>   			gpios = <&pio 257 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/mt7629-rfb.dts b/arch/arm/boot/dts/mt7629-rfb.dts
> index eb536cbebd9b..84e14bee7235 100644
> --- a/arch/arm/boot/dts/mt7629-rfb.dts
> +++ b/arch/arm/boot/dts/mt7629-rfb.dts
> @@ -23,13 +23,13 @@ chosen {
>   	gpio-keys {
>   		compatible = "gpio-keys";
>   
> -		reset {
> +		button-reset {
>   			label = "factory";
>   			linux,code = <KEY_RESTART>;
>   			gpios = <&pio 60 GPIO_ACTIVE_LOW>;
>   		};
>   
> -		wps {
> +		button-wps {
>   			label = "wps";
>   			linux,code = <KEY_WPS_BUTTON>;
>   			gpios = <&pio 58 GPIO_ACTIVE_LOW>;
