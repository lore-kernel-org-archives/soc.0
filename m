Return-Path: <SRS0=yC9D=4K=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EBAC4332F
	for <soc@archiver.kernel.org>; Mon, 12 Dec 2022 06:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C544C433EF; Mon, 12 Dec 2022 06:01:57 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C9F5C433D2
	for <soc@kernel.org>; Mon, 12 Dec 2022 06:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C9F5C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f41.google.com with SMTP id u5so10855445pjy.5
        for <soc@kernel.org>; Sun, 11 Dec 2022 22:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CtZbo9Uwr6mAiSS4K9joB67mf1cSBtb5VzmSLOnn2BA=;
        b=feGDuEqDfW7doSqcTAYoSzv+D7I72/VtlAP9SODJ0tmxCS82qjFyPUpdAUHMt6tMy8
         kmKjYZcnuQw23DqrQxUbYDreyr0qKhDF30tJKb/H0zThXZXWmOdMNQqL+8vtCjTVrzpf
         /+fDjiuHjCPjmd6qXQyQvxaqXqIOtoqrw4lF9nR1hBuCJcFBdaGPTCUEYir4n35JnuUg
         ZQvXxBiVf73Zyj8nGG3yzL5mwNzSVlGHCNuTbiQTxO2sltAjyFdzQbXSKyV3taP/Ohy7
         z4aauu+sNzrZJWy9nZaH7UonI8WKyvnnfrr55oqzhZQek7MK5UZvLx4HHDaSlSUS8Djw
         ahWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtZbo9Uwr6mAiSS4K9joB67mf1cSBtb5VzmSLOnn2BA=;
        b=RC4ff9IfWy/U5gtZ5E5HssI4bxmkGp8O2fDVUB7ZzkiHE4wjK1Okob8sMFLMHj6bcA
         5ucCIhn600fla9C056LCnlK0m8i0+BacJNKeqzqU8grPGFX+SxS4N5uW30RGwSDFlYfR
         at3dUMGuJmKg8hwWiXfZJa8SB5i3z5OKxZs6x65aO6VzvH9Sb3hT9/bRfIkc6ecpoc69
         SdOGaMmj6UE8ZB7g79yjQoCObrUYPhMR27en4F1cn3yl+/0JFfONdFVv4UJoUmrTV8KX
         g0EHbPPbIWuIoim9OlXXRbLEP2tK2RcQmKtXoR3XBEodEWpX6PqYKJ7AKBis/YCg12AI
         3y5w==
X-Gm-Message-State: ANoB5pkV2idwsD6IoHluMKRnvmYwunIQjH8CCICWOm/WbK59ns0gkJnv
	eH4+jGHoKc0srQ1oNxovGj8+aD3t048EmBve
X-Google-Smtp-Source: AA0mqf5+eaVtJ2ibhZx/7OHXPEfud2Yg6uvPqQP6gHqOu8YKIq3xFBm7jDraoJAlecduL321ZZVFxw==
X-Received: by 2002:a17:902:e311:b0:189:dc9e:cef3 with SMTP id q17-20020a170902e31100b00189dc9ecef3mr13725691plc.16.1670824915071;
        Sun, 11 Dec 2022 22:01:55 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id e14-20020a17090301ce00b0017fe9b038fdsm5344579plh.14.2022.12.11.22.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 22:01:54 -0800 (PST)
Date: Mon, 12 Dec 2022 11:31:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: spear: drop 0x from unit address
Message-ID: <20221212060151.p7ziztnxny42pi4n@vireshk-i7>
References: <20221210113347.63939-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221210113347.63939-1-krzysztof.kozlowski@linaro.org>

On 10-12-22, 12:33, Krzysztof Kozlowski wrote:
> By coding style, unit address should not start with 0x.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/spear300.dtsi | 2 +-
>  arch/arm/boot/dts/spear310.dtsi | 2 +-
>  arch/arm/boot/dts/spear320.dtsi | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/spear300.dtsi b/arch/arm/boot/dts/spear300.dtsi
> index b39bd5a22627..f1135e887f7b 100644
> --- a/arch/arm/boot/dts/spear300.dtsi
> +++ b/arch/arm/boot/dts/spear300.dtsi
> @@ -46,7 +46,7 @@ sdhci@70000000 {
>  			status = "disabled";
>  		};
>  
> -		shirq: interrupt-controller@0x50000000 {
> +		shirq: interrupt-controller@50000000 {
>  			compatible = "st,spear300-shirq";
>  			reg = <0x50000000 0x1000>;
>  			interrupts = <28>;
> diff --git a/arch/arm/boot/dts/spear310.dtsi b/arch/arm/boot/dts/spear310.dtsi
> index 77570833d46b..ce08d8820940 100644
> --- a/arch/arm/boot/dts/spear310.dtsi
> +++ b/arch/arm/boot/dts/spear310.dtsi
> @@ -34,7 +34,7 @@ fsmc: flash@44000000 {
>  			status = "disabled";
>  		};
>  
> -		shirq: interrupt-controller@0xb4000000 {
> +		shirq: interrupt-controller@b4000000 {
>  			compatible = "st,spear310-shirq";
>  			reg = <0xb4000000 0x1000>;
>  			interrupts = <28 29 30 1>;
> diff --git a/arch/arm/boot/dts/spear320.dtsi b/arch/arm/boot/dts/spear320.dtsi
> index b12474446a48..56f141297ea3 100644
> --- a/arch/arm/boot/dts/spear320.dtsi
> +++ b/arch/arm/boot/dts/spear320.dtsi
> @@ -49,7 +49,7 @@ sdhci@70000000 {
>  			status = "disabled";
>  		};
>  
> -		shirq: interrupt-controller@0xb3000000 {
> +		shirq: interrupt-controller@b3000000 {
>  			compatible = "st,spear320-shirq";
>  			reg = <0xb3000000 0x1000>;
>  			interrupts = <30 28 29 1>;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
