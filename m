Return-Path: <SRS0=5k/X=WY=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF2AC43334
	for <soc@archiver.kernel.org>; Fri, 17 Jun 2022 10:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 156D9C3411F; Fri, 17 Jun 2022 10:43:43 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05E88C3411D;
	Fri, 17 Jun 2022 10:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 05E88C3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id eo8so5699765edb.0;
        Fri, 17 Jun 2022 03:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=v5ecjoqfrtonTaDC6C0FL6A10bdamLrdFYiT8G5VOw4=;
        b=i9vP6RSHB3vHCWE4RcV+HJ7iNa3yq76y+QY1jM2hM3XW30wf/IpH2PYhW7PjjWYdPl
         FnqF4MY1FWpWmG/tInRWbGGRUlq5fOUBIRpqGOUPd00Y0fJI+wBSk0Sk/D/TyosFFW5R
         eDf3zmrZD/g1r7hS3VyzLNDAbbkl16Bhal3vADJhDYj3ELdqcONpuYcNn0AfBNvr6vGi
         VBSww3vMhxoeLHx3ZWL2K7B9n0zo1x4SBXkekziqpWI5BcKNBpIH12C66NB/XTdHMMl8
         k4KSyVmEIab/YXL6INbKpXWiiTJuNemZKohU4Afojnen0VzWidI7IsWlIxHRLKMHeyz7
         BIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=v5ecjoqfrtonTaDC6C0FL6A10bdamLrdFYiT8G5VOw4=;
        b=bVHBm0azSo+oky7/oB0EeTxKNjy9JuVS86u/dYIcA0dGvvdX0J4sr36yVith7JwSVG
         Dv/zd46klZqexalvgixv3LRR+44UKmqPi3F4d9/pi792Hnz6NapgF+EV7B5Y8feqXS4o
         suI/xbdcWe0KZl5xMHDfz13UOrcvZi//kVZB6DXSgtETahiQYOhk7GEmO+740W3s2xfj
         5n6RwyZcetuLrD4K37dlkDQzLlv0EJaJyCsCCLAaQ/wq9P+2lJPVMHv8RlWWKUY3KX2f
         dc/aKfF7M341ozRncKPsZShejzt57TTcGK9VmND/5jR7sOL7l7E8oCTWQssm4YFmVDA0
         uaxQ==
X-Gm-Message-State: AJIora9XJwWarBh+V3iFlBjXaNswclsVMNfd81Ubu6ZByEfO3z/f6wx0
	13KYdh9IeZHBquBHLJwpP7M=
X-Google-Smtp-Source: AGRyM1vGje4sUJAcYpjSJzolDvmR/43gla1gcSQu/6kGI0U0BANsb2e78Xdl4mzbofJwfzp3bj4U5w==
X-Received: by 2002:a05:6402:334:b0:435:584e:514c with SMTP id q20-20020a056402033400b00435584e514cmr6465853edw.410.1655462620199;
        Fri, 17 Jun 2022 03:43:40 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id x16-20020aa7cd90000000b0042fb3badd48sm3464631edv.9.2022.06.17.03.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 03:43:39 -0700 (PDT)
Message-ID: <7788acc5-a9b9-1be7-0e6f-217e9b54b28f@gmail.com>
Date: Fri, 17 Jun 2022 12:43:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 15/40] arm64: dts: mediatek: align gpio-key node names
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
 <20220616005333.18491-15-krzysztof.kozlowski@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220616005333.18491-15-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/06/2022 02:53, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks

> ---
>   .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts      |  4 ++--
>   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts           |  4 ++--
>   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts  |  6 +++---
>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi           | 10 +++++-----
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi |  4 ++--
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi  |  2 +-
>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi         |  2 +-
>   arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi       |  4 ++--
>   8 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> index 2b9bf8dd14ec..c2311733d2de 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> @@ -40,13 +40,13 @@ cpu@1 {
>   	gpio-keys {
>   		compatible = "gpio-keys";
>   
> -		factory {
> +		factory-key {
>   			label = "factory";
>   			linux,code = <BTN_0>;
>   			gpios = <&pio 0 GPIO_ACTIVE_HIGH>;
>   		};
>   
> -		wps {
> +		wps-key {
>   			label = "wps";
>   			linux,code = <KEY_WPS_BUTTON>;
>   			gpios = <&pio 102 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> index 596c073d8b05..c28da9323a9c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> @@ -42,13 +42,13 @@ gpio-keys {
>   		compatible = "gpio-keys";
>   		poll-interval = <100>;
>   
> -		factory {
> +		key-factory {
>   			label = "factory";
>   			linux,code = <BTN_0>;
>   			gpios = <&pio 0 0>;
>   		};
>   
> -		wps {
> +		key-wps {
>   			label = "wps";
>   			linux,code = <KEY_WPS_BUTTON>;
>   			gpios = <&pio 102 0>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
> index 44f6149c1307..28433b94f7c7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
> @@ -21,7 +21,7 @@ cpu_crit: cpu_crit0 {
>   };
>   
>   &gpio_keys {
> -	/delete-node/tablet_mode;
> -	/delete-node/volume_down;
> -	/delete-node/volume_up;
> +	/delete-node/switch-tablet-mode;
> +	/delete-node/switch-volume-down;
> +	/delete-node/switch-volume-up;
>   };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index 9c75fbb31f98..d20378758213 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -53,7 +53,7 @@ gpio_keys: gpio-keys {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&gpio_keys_pins>;
>   
> -		lid {
> +		switch-lid {
>   			label = "Lid";
>   			gpios = <&pio 69 GPIO_ACTIVE_LOW>;
>   			linux,code = <SW_LID>;
> @@ -61,7 +61,7 @@ lid {
>   			gpio-key,wakeup;
>   		};
>   
> -		power {
> +		switch-power {
>   			label = "Power";
>   			gpios = <&pio 14 GPIO_ACTIVE_HIGH>;
>   			linux,code = <KEY_POWER>;
> @@ -69,7 +69,7 @@ power {
>   			gpio-key,wakeup;
>   		};
>   
> -		tablet_mode {
> +		switch-tablet-mode {
>   			label = "Tablet_mode";
>   			gpios = <&pio 121 GPIO_ACTIVE_HIGH>;
>   			linux,code = <SW_TABLET_MODE>;
> @@ -77,13 +77,13 @@ tablet_mode {
>   			gpio-key,wakeup;
>   		};
>   
> -		volume_down {
> +		switch-volume-down {
>   			label = "Volume_down";
>   			gpios = <&pio 123 GPIO_ACTIVE_LOW>;
>   			linux,code = <KEY_VOLUMEDOWN>;
>   		};
>   
> -		volume_up {
> +		switch-volume-up {
>   			label = "Volume_up";
>   			gpios = <&pio 124 GPIO_ACTIVE_LOW>;
>   			linux,code = <KEY_VOLUMEUP>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index 2d7a193272ae..3ac83be53627 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -73,7 +73,7 @@ volume_buttons: volume-buttons {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&volume_button_pins>;
>   
> -		volume_down {
> +		button-volume-down {
>   			label = "Volume Down";
>   			linux,code = <KEY_VOLUMEDOWN>;
>   			debounce-interval = <100>;
> @@ -81,7 +81,7 @@ volume_down {
>   			gpios = <&pio 6 GPIO_ACTIVE_LOW>;
>   		};
>   
> -		volume_up {
> +		button-volume-up {
>   			label = "Volume Up";
>   			linux,code = <KEY_VOLUMEUP>;
>   			debounce-interval = <100>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> index 28966a65391b..50a0dd36b5fb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> @@ -45,7 +45,7 @@ gpio-keys {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&pen_eject>;
>   
> -		pen-insert {
> +		switch-pen-insert {
>   			label = "Pen Insert";
>   			/* Insert = low, eject = high */
>   			gpios = <&pio 6 GPIO_ACTIVE_LOW>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index b035e06840e6..b50261e8b9ed 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -144,7 +144,7 @@ wifi_wakeup: wifi-wakeup {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&wifi_pins_wakeup>;
>   
> -		wowlan {
> +		button-wowlan {
>   			label = "Wake on WiFi";
>   			gpios = <&pio 113 GPIO_ACTIVE_HIGH>;
>   			linux,code = <KEY_WAKEUP>;
> diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> index 7a717f926929..8ee1529683a3 100644
> --- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> @@ -28,7 +28,7 @@ gpio-keys {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&gpio_keys_default>;
>   
> -		volume-up {
> +		key-volume-up {
>   			gpios = <&pio 42 GPIO_ACTIVE_LOW>;
>   			label = "volume_up";
>   			linux,code = <115>;
> @@ -36,7 +36,7 @@ volume-up {
>   			debounce-interval = <15>;
>   		};
>   
> -		volume-down {
> +		key-volume-down {
>   			gpios = <&pio 43 GPIO_ACTIVE_LOW>;
>   			label = "volume_down";
>   			linux,code = <114>;
