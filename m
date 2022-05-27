Return-Path: <SRS0=pUaZ=WD=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCD7C433F5
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 02:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7052C34116; Fri, 27 May 2022 02:39:01 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80AF2C34114
	for <soc@kernel.org>; Fri, 27 May 2022 02:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80AF2C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f53.google.com with SMTP id ge11so3444061pjb.0
        for <soc@kernel.org>; Thu, 26 May 2022 19:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ufJmyL4u6TL5xtH3DzBKqlIHbWXkaJJ+ESTImboH7N4=;
        b=PQVrB6z7gTUvlsnP3KfEk10k5SGJgsGe2ZrtFpSQtQbzN3uDQYq7N5cdefLWrO73ur
         baYf3ZUc3RE8VQaHyiQFM9GtvTHitFNm7VemEHL99rcxLf7gtOFxsVjuFVb+G1FrfI13
         l3CGOTIZ7P4D8/5r3EfDniCeVhG/f5ycoZ/nFmvW1C1nt1lAREKXdC++bG/8AYiIcC1g
         /xDJkgBqOjlPC+XRzBR7BuMZJO1xPml8cMIp7KFfVf3i+Yd7UX/70n6LLme+wcp+JJqg
         DlD3+BWhS27OQMYLs1qzg+4RA4iTLnqoHm+32oIDC/wKYg5WW1ZNIuF7sJuR7NoiMo8k
         mYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ufJmyL4u6TL5xtH3DzBKqlIHbWXkaJJ+ESTImboH7N4=;
        b=mYRYp0L/aOMtDr7HM8Zu9CQmcV1qERZN+DwsvVbAFyi8cAL+oGlC5bzMl7a98MekZH
         WWD/pW8zbS5UBO2AMoshe5nXwhHe4ATVRKiWamhHwu3Q0a2QJJCpy3yGVfyHCtyCShRm
         AdivMyViNsS/FJ3n+v/DEu+X0XQ/Cf3J3PfdTzlgkKX138SZl/cPCaRb0rtQZMG3FlMg
         5SYyxoKXrEcAprrWCCBDmd80XpLk0OBjisAO9K/uQAYcxFWERZCw5s15OIHqyrt2Zwr0
         Vf0JiNcqeAuDBuMbcB4Y8jfyMropzsIfdwgP+jXEmr3Bk1FHS6vKC0qqEKVAE9MUdK/M
         cXpA==
X-Gm-Message-State: AOAM531luBNWRZ7K87aRvH5lqmR5ViJeZfv8mBl68E9T6IQE9pv33E/2
	t/GKiXTSYqcvBz2ZnyvcZu8dfgdRZxlCmA==
X-Google-Smtp-Source: ABdhPJy4+4N4D3o+CwVPEnODYC+5nuXVxD+eTp3J99nDw6yfw878mrTd+QiTXtjQrvObyydy3KCBFQ==
X-Received: by 2002:a17:90b:1b07:b0:1e0:41c2:9e15 with SMTP id nu7-20020a17090b1b0700b001e041c29e15mr5795071pjb.20.1653619138985;
        Thu, 26 May 2022 19:38:58 -0700 (PDT)
Received: from localhost ([122.162.234.2])
        by smtp.gmail.com with ESMTPSA id h10-20020a63574a000000b003c25dfd7372sm2192904pgm.26.2022.05.26.19.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 19:38:58 -0700 (PDT)
Date: Fri, 27 May 2022 08:08:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: spear: adjust whitespace around '='
Message-ID: <20220527023856.zl2varrzuuf7huef@vireshk-i7>
References: <20220526203815.831383-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220526203815.831383-1-krzysztof.kozlowski@linaro.org>

On 26-05-22, 22:38, Krzysztof Kozlowski wrote:
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
>  arch/arm/boot/dts/spear1310-evb.dts | 2 +-
>  arch/arm/boot/dts/spear1340-evb.dts | 2 +-
>  arch/arm/boot/dts/spear1340.dtsi    | 2 +-
>  arch/arm/boot/dts/spear300-evb.dts  | 2 +-
>  arch/arm/boot/dts/spear310-evb.dts  | 2 +-
>  arch/arm/boot/dts/spear320-evb.dts  | 2 +-
>  arch/arm/boot/dts/spear320-hmi.dts  | 2 +-
>  arch/arm/boot/dts/spear320.dtsi     | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/spear1310-evb.dts b/arch/arm/boot/dts/spear1310-evb.dts
> index ddd1cf4d0554..05408df38203 100644
> --- a/arch/arm/boot/dts/spear1310-evb.dts
> +++ b/arch/arm/boot/dts/spear1310-evb.dts
> @@ -170,7 +170,7 @@ sdhci@b3000000 {
>  
>  		smi: flash@ea000000 {
>  			status = "okay";
> -			clock-rate=<50000000>;
> +			clock-rate = <50000000>;
>  
>  			flash@e6000000 {
>  				#address-cells = <1>;
> diff --git a/arch/arm/boot/dts/spear1340-evb.dts b/arch/arm/boot/dts/spear1340-evb.dts
> index 3a51a41eb5e4..7700f2afc128 100644
> --- a/arch/arm/boot/dts/spear1340-evb.dts
> +++ b/arch/arm/boot/dts/spear1340-evb.dts
> @@ -168,7 +168,7 @@ sdhci@b3000000 {
>  
>  		smi: flash@ea000000 {
>  			status = "okay";
> -			clock-rate=<50000000>;
> +			clock-rate = <50000000>;
>  
>  			flash@e6000000 {
>  				#address-cells = <1>;
> diff --git a/arch/arm/boot/dts/spear1340.dtsi b/arch/arm/boot/dts/spear1340.dtsi
> index 13e1bdb3ddbf..818886e11713 100644
> --- a/arch/arm/boot/dts/spear1340.dtsi
> +++ b/arch/arm/boot/dts/spear1340.dtsi
> @@ -88,7 +88,7 @@ pinmux: pinmux@e0700000 {
>  		};
>  
>  		pwm: pwm@e0180000 {
> -			compatible ="st,spear13xx-pwm";
> +			compatible = "st,spear13xx-pwm";
>  			reg = <0xe0180000 0x1000>;
>  			#pwm-cells = <2>;
>  			status = "disabled";
> diff --git a/arch/arm/boot/dts/spear300-evb.dts b/arch/arm/boot/dts/spear300-evb.dts
> index 2beb30ca2cba..303ef29fb805 100644
> --- a/arch/arm/boot/dts/spear300-evb.dts
> +++ b/arch/arm/boot/dts/spear300-evb.dts
> @@ -80,7 +80,7 @@ sdhci@70000000 {
>  
>  		smi: flash@fc000000 {
>  			status = "okay";
> -			clock-rate=<50000000>;
> +			clock-rate = <50000000>;
>  
>  			flash@f8000000 {
>  				#address-cells = <1>;
> diff --git a/arch/arm/boot/dts/spear310-evb.dts b/arch/arm/boot/dts/spear310-evb.dts
> index 1c41e4a40334..ea0b53036f7b 100644
> --- a/arch/arm/boot/dts/spear310-evb.dts
> +++ b/arch/arm/boot/dts/spear310-evb.dts
> @@ -94,7 +94,7 @@ gmac: eth@e0800000 {
>  
>  		smi: flash@fc000000 {
>  			status = "okay";
> -			clock-rate=<50000000>;
> +			clock-rate = <50000000>;
>  
>  			flash@f8000000 {
>  				#address-cells = <1>;
> diff --git a/arch/arm/boot/dts/spear320-evb.dts b/arch/arm/boot/dts/spear320-evb.dts
> index c322407a0ade..3c026d021c92 100644
> --- a/arch/arm/boot/dts/spear320-evb.dts
> +++ b/arch/arm/boot/dts/spear320-evb.dts
> @@ -95,7 +95,7 @@ sdhci@70000000 {
>  
>  		smi: flash@fc000000 {
>  			status = "okay";
> -			clock-rate=<50000000>;
> +			clock-rate = <50000000>;
>  
>  			flash@f8000000 {
>  				#address-cells = <1>;
> diff --git a/arch/arm/boot/dts/spear320-hmi.dts b/arch/arm/boot/dts/spear320-hmi.dts
> index b587e4ec11e5..34503ac9c51c 100644
> --- a/arch/arm/boot/dts/spear320-hmi.dts
> +++ b/arch/arm/boot/dts/spear320-hmi.dts
> @@ -167,7 +167,7 @@ sdhci@70000000 {
>  
>  		smi: flash@fc000000 {
>  			status = "okay";
> -			clock-rate=<50000000>;
> +			clock-rate = <50000000>;
>  
>  			flash@f8000000 {
>  				#address-cells = <1>;
> diff --git a/arch/arm/boot/dts/spear320.dtsi b/arch/arm/boot/dts/spear320.dtsi
> index 47ac4474ed96..b12474446a48 100644
> --- a/arch/arm/boot/dts/spear320.dtsi
> +++ b/arch/arm/boot/dts/spear320.dtsi
> @@ -78,7 +78,7 @@ spi2: spi@a6000000 {
>  		};
>  
>  		pwm: pwm@a8000000 {
> -			compatible ="st,spear-pwm";
> +			compatible = "st,spear-pwm";
>  			reg = <0xa8000000 0x1000>;
>  			#pwm-cells = <2>;
>  			status = "disabled";

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
