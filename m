Return-Path: <SRS0=hUq8=WD=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5B7C433EF
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 08:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5864C34100; Fri, 27 May 2022 08:18:37 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E930C34119
	for <soc@kernel.org>; Fri, 27 May 2022 08:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1E930C34119
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f47.google.com with SMTP id v17so684821wrv.2
        for <soc@kernel.org>; Fri, 27 May 2022 01:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=ZkFo19yN9FE8l6w1oc0IJiQl2EoWP33mdxcOBd2mVFc=;
        b=Fq9c32hxcx2ufnuS5yUUdwgf84fJ2V+HR5zXjKcBgRRQOBn4Oo+Y8PIBAAJ0eAGKis
         BFq8Tk+WkMh/OpMKqPxu/qDH20z/0g2Bu6S8gNtK+qUGjyVeDQ+QCHdDUEIhiM69KTww
         kB3Put3kNcCckMhB+JJdnh7Xq3M0LVZC8tIFMlpEgP3SxokQvFGjVw/RAL3kY8sTL1Kh
         pqEWSwQcYGhjLE01TMhH1jN7uXz6ebJsZ4yeKtRSOIOJpljU58WV9IlzyfOLS+A16ABz
         9GQnTG5cJGDEJHaTbumnaHlKut9Gc/NSmWOT5otOpcjqqnNXttpKcqTJXWtIV6XqOQYg
         iHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=ZkFo19yN9FE8l6w1oc0IJiQl2EoWP33mdxcOBd2mVFc=;
        b=4+2YXm6+kM8EowgF/jMUKmlsu8JMcnx1E/Rx7k01wqfb48Jcjqv187suTqiw7jwlcQ
         4AhcezhdM6qdSjOATYaHBLdiLJRiU6xmR7Z5I4eO3LGJ5F3n7Ls0HvM/jkzuLuQT+mPc
         fvsqYBZ5Bvy9513hc0ePK0ry64rUrfg55UjGFuX5gR342Nu7sc4yCOlWRn+MJW9ltw57
         sq/H475qFQqLJEaYGqPs7HlTtqBywoF/QLaO8X77Zz4P+SXiCDGa0L08IBkiOQzCX+G5
         a71Co80/8zzDcZ3pm36hBs/Pm0MmXZZXWCJVmbYncQmIrHp+nE/l7Jr/3tTUlkiFYWnR
         DauQ==
X-Gm-Message-State: AOAM5307APaYl0Ri3L9YZrMwhYzShmIFif4afpg0BQdeLmplXF+wzVtp
	1JJnwYUlSdJZq+i8ANbytyBDFQ==
X-Google-Smtp-Source: ABdhPJz+oqbBEG4R4LguW/AlVaAt1T7SUCg4RxJCopLYPsk+CUpf7UJyCqHBCjs0nVw/onX+8/KQFA==
X-Received: by 2002:adf:e28a:0:b0:210:b31:722 with SMTP id v10-20020adfe28a000000b002100b310722mr5408462wri.65.1653639515570;
        Fri, 27 May 2022 01:18:35 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:f081:5ded:fc86:365d? ([2001:861:44c0:66c0:f081:5ded:fc86:365d])
        by smtp.gmail.com with ESMTPSA id v18-20020adfebd2000000b0020c5253d8besm1130050wrn.10.2022.05.27.01.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 May 2022 01:18:35 -0700 (PDT)
Message-ID: <19a9260c-322b-10e1-e361-cc2d5fdd8ff9@baylibre.com>
Date: Fri, 27 May 2022 10:18:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] ARM: dts: meson: adjust whitespace around '='
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
 <20220526204552.832961-2-krzysztof.kozlowski@linaro.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220526204552.832961-2-krzysztof.kozlowski@linaro.org>
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
>   arch/arm/boot/dts/meson.dtsi   | 4 ++--
>   arch/arm/boot/dts/meson8.dtsi  | 2 +-
>   arch/arm/boot/dts/meson8b.dtsi | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
> index 26eaba3fa96f..8e3860d5d916 100644
> --- a/arch/arm/boot/dts/meson.dtsi
> +++ b/arch/arm/boot/dts/meson.dtsi
> @@ -214,14 +214,14 @@ aobus: aobus@c8100000 {
>   			ranges = <0x0 0xc8100000 0x100000>;
>   
>   			ao_arc_rproc: remoteproc@1c {
> -				compatible= "amlogic,meson-mx-ao-arc";
> +				compatible = "amlogic,meson-mx-ao-arc";
>   				reg = <0x1c 0x8>, <0x38 0x8>;
>   				reg-names = "remap", "cpu";
>   				status = "disabled";
>   			};
>   
>   			ir_receiver: ir-receiver@480 {
> -				compatible= "amlogic,meson6-ir";
> +				compatible = "amlogic,meson6-ir";
>   				reg = <0x480 0x20>;
>   				interrupts = <GIC_SPI 15 IRQ_TYPE_EDGE_RISING>;
>   				status = "disabled";
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index 9997a5d0333a..0f8bac8bac8b 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -430,7 +430,7 @@ mux {
>   };
>   
>   &ao_arc_rproc {
> -	compatible= "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
> +	compatible = "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
>   	amlogic,secbus2 = <&secbus2>;
>   	sram = <&ao_arc_sram>;
>   	resets = <&reset RESET_MEDIA_CPU>;
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index 94f1c03decce..cf9c04a61ba3 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -384,7 +384,7 @@ mux {
>   };
>   
>   &ao_arc_rproc {
> -	compatible= "amlogic,meson8b-ao-arc", "amlogic,meson-mx-ao-arc";
> +	compatible = "amlogic,meson8b-ao-arc", "amlogic,meson-mx-ao-arc";
>   	amlogic,secbus2 = <&secbus2>;
>   	sram = <&ao_arc_sram>;
>   	resets = <&reset RESET_MEDIA_CPU>;

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
