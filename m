Return-Path: <SRS0=hUq8=WD=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C08C433F5
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 08:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7977C385A9; Fri, 27 May 2022 08:18:32 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0DC72C34100
	for <soc@kernel.org>; Fri, 27 May 2022 08:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0DC72C34100
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f47.google.com with SMTP id v17so684821wrv.2
        for <soc@kernel.org>; Fri, 27 May 2022 01:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=Mlq0w9Sq3JAXLiq6IKhnHlUUJ+iRXBtNrFRhNgWew5s=;
        b=rqDgQ/xG2NU4MxSBvqKUCi8BfTiMBmKzGuJqymLNx/P6r8Ygk6b/uNL7tAFv3T/Pl9
         hHkuZ5L1OoGwXcznnrPtr5IIKBdU2UfgPoMa4hLydT6SBOQZ7+X7xK2t4Z9K3UnDSito
         6UxRheR447juFCnK1od/iMsKLAmWlkjbAJYXi0QnO2MmqL3ZJ/Vj99HB5HH0GxBz/xM+
         dFUyhfC0oVDkB3rbWbon/vFqxJI5VaHfFgmgFHMrIxT15SbCtYS/PkXEc8mSGg96ilAA
         rDavvVRqb3fIqM4xEmJF319s4jfwUl198h+I+E+BpdMR0D6D/B3K8qec81fmXDny0aNR
         ub6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=Mlq0w9Sq3JAXLiq6IKhnHlUUJ+iRXBtNrFRhNgWew5s=;
        b=pCTTo6q210R2/V7AeEbtsRtFf0c3AykrgSOD+RCJNB8tY4WHs8cAftTbROMtNU+QTi
         QBdbeFSdD5VQi0hTNJq+dplarOyBZ38Lanfc6aG9J+FJj0twIp4pB5gqNALkRjhTeszM
         Yq6DcEiCHaBVMfF9aIl1xhKAKQfqBgmR930gtuyO8HhlAnkXB/jE65S/ikSHCahOLbDA
         Z+q+fAbVJ6EACr/OuoHhXtb9NdtKtGWydVSXKAx54GOefg+E3YfQusyrjD94Ol5ttNZo
         vHaEFsU/Ihs6bCgQWx3g/sCz84M/mtTdTSquzkNH6ligPQifyYyXTo4R0NpaFmed9v6h
         gtdA==
X-Gm-Message-State: AOAM531NLN5vv+bDGZkx8Cu07TUNgMV6Vnd6IWTrqcj91NE7T5J541Ud
	2vqtC18B8lA+lDrrvIh2HnfwEA==
X-Google-Smtp-Source: ABdhPJyYzDfcTwaDTmQ8hJx/lTQ/NCKoiSSHk/AYU3xNnZteyuNsH7HPgEVmJ+crsBlwaPJ1cqlX9g==
X-Received: by 2002:a5d:6041:0:b0:20d:8e4:7bb8 with SMTP id j1-20020a5d6041000000b0020d08e47bb8mr33591979wrt.652.1653639507562;
        Fri, 27 May 2022 01:18:27 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:f081:5ded:fc86:365d? ([2001:861:44c0:66c0:f081:5ded:fc86:365d])
        by smtp.gmail.com with ESMTPSA id 129-20020a1c0287000000b0039748be12dbsm1439480wmc.47.2022.05.27.01.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 May 2022 01:18:27 -0700 (PDT)
Message-ID: <4b3aa028-fd29-0053-e8d3-ce16c5d4b078@baylibre.com>
Date: Fri, 27 May 2022 10:18:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: adjust whitespace around '='
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/05/2022 22:45, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Output compared with dtx_diff and fdtdump.
> ---
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi                      | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-gx.dtsi                       | 2 +-
>   .../boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts     | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index 3f5254eeb47b..04f797b5a012 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -1535,7 +1535,7 @@ aobus: bus@ff800000 {
>   
>   			sysctrl_AO: sys-ctrl@0 {
>   				compatible = "amlogic,meson-axg-ao-sysctrl", "simple-mfd", "syscon";
> -				reg =  <0x0 0x0 0x0 0x100>;
> +				reg = <0x0 0x0 0x0 0x100>;
>   
>   				clkc_AO: clock-controller {
>   					compatible = "amlogic,meson-axg-aoclkc";
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index aa14ea017a61..023a52005494 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -450,7 +450,7 @@ aobus: bus@c8100000 {
>   
>   			sysctrl_AO: sys-ctrl@0 {
>   				compatible = "amlogic,meson-gx-ao-sysctrl", "simple-mfd", "syscon";
> -				reg =  <0x0 0x0 0x0 0x100>;
> +				reg = <0x0 0x0 0x0 0x100>;
>   
>   				clkc_AO: clock-controller {
>   					compatible = "amlogic,meson-gx-aoclkc";
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> index fcb304c5a40f..6831137c5c10 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> @@ -216,7 +216,7 @@ &uart_A {
>   
>   	bluetooth {
>   		compatible = "realtek,rtl8822cs-bt";
> -		enable-gpios  = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
> +		enable-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
>   		host-wake-gpios = <&gpio GPIOX_18 GPIO_ACTIVE_HIGH>;
>          };
>   };

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
