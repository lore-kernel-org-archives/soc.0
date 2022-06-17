Return-Path: <SRS0=5k/X=WY=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E143EC433EF
	for <soc@archiver.kernel.org>; Fri, 17 Jun 2022 10:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C2352C385A9; Fri, 17 Jun 2022 10:43:52 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F5A0C3411D;
	Fri, 17 Jun 2022 10:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8F5A0C3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id y19so7992817ejq.6;
        Fri, 17 Jun 2022 03:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=AiGd/G18mnXfAnwyT/vN2yw57fx/1UEELfONJBgsPiU=;
        b=VJGDBaLwKCaTN0E3YXVF9jHgxLrlNG7667EGq4tM8lH0Jj5v9IeJ8Bp5VWKq5NMyYb
         5iMXOXz2KivIOmNkOxjk4YgJL5l3L9HKBsazeqCv8lVt/dcBtU8qfDqfmHEQZZQdetrq
         97mTgq9S+mBB4iprd0LRRQxKEmQGn6d9auRVXTdQ3HImBt3EiTBui/aJIK98KA5pph6p
         OZNU0KgucPKhFX8qM53dhe3LQUOFyJCpS/tcexfirlbNPevl5K7UwUwf92nmrtSCtUHL
         t+BKrJoviExSkCSNDQLMaY3h82RHo66dvs7SjNMGC6SKbB9SZexPspyWcaBwwm7yTdJ/
         UKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AiGd/G18mnXfAnwyT/vN2yw57fx/1UEELfONJBgsPiU=;
        b=6O4BxUDIW0l/H8oxxhnU04wjsgAZakV60hPMU3ctpLjjQycHc9hewIhvSB1uEoj1lF
         VyI2W1OBUlKMVtlILHE6EMCK4ljZIZc3lirQxmTc6ZLb255N1XoRsL/xo7AQ0AJZ6ZJ6
         2fMxL4sorv8G7110k1mLL53wVhLQuhZr34WHs9Dc2XLuiVYSHNw1M6IVXYPkJAyl+z2J
         jxI1BdaFDE4vxuZ0Mp3yBKmCotNPQf091lWSg2STt7BGuJj+m/TCW6zmeNgStU2d8v/o
         mDgIxBlKVtVbBm49ATjbU8yrgcGZVXV+1+pT0GT1E6kJeM6vabjEFE8ze7dDLLRXZuxQ
         kGEg==
X-Gm-Message-State: AJIora9V4EVyb1C0kBPOFkp5cD1UvMHPo+QTshVjywzAjXUAIz6wzecV
	ZoaOkPTkTHoiWjyjd5XHv9M=
X-Google-Smtp-Source: AGRyM1u5wVHvSt+IqLZK0au6HLE1grAgjeBZEKVVVQaH/p4dMq24y0opu3PhRSo42Jyp+s1jT4scDg==
X-Received: by 2002:a17:906:7a57:b0:711:faf1:587d with SMTP id i23-20020a1709067a5700b00711faf1587dmr8328834ejo.581.1655462628898;
        Fri, 17 Jun 2022 03:43:48 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id i24-20020a05640200d800b0042dcac2afc6sm3425003edu.72.2022.06.17.03.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 03:43:47 -0700 (PDT)
Message-ID: <8f9d7850-fe31-41b3-cded-63a020356e13@gmail.com>
Date: Fri, 17 Jun 2022 12:43:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 16/40] arm64: dts: mediatek: mt7622-bananapi-bpi-r64:
 align led node names with dtschema
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, arm@kernel.org,
 soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-16-krzysztof.kozlowski@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220616005333.18491-16-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/06/2022 02:53, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> with 'led'.  Use generic color properties instead of the node name.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> index c2311733d2de..7d1ecf72a6c3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> @@ -8,6 +8,7 @@
>   /dts-v1/;
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
>   
>   #include "mt7622.dtsi"
>   #include "mt6380.dtsi"
> @@ -56,14 +57,16 @@ wps-key {
>   	leds {
>   		compatible = "gpio-leds";
>   
> -		green {
> +		led-0 {
>   			label = "bpi-r64:pio:green";
> +			color = <LED_COLOR_ID_GREEN>;
>   			gpios = <&pio 89 GPIO_ACTIVE_HIGH>;
>   			default-state = "off";
>   		};
>   
> -		red {
> +		led-1 {
>   			label = "bpi-r64:pio:red";
> +			color = <LED_COLOR_ID_RED>;
>   			gpios = <&pio 88 GPIO_ACTIVE_HIGH>;
>   			default-state = "off";
>   		};
