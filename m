Return-Path: <SRS0=MFSJ=W7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720E7C43334
	for <soc@archiver.kernel.org>; Fri, 24 Jun 2022 16:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5BCC5C341C0; Fri, 24 Jun 2022 16:09:48 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98752C3411C
	for <soc@kernel.org>; Fri, 24 Jun 2022 16:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 98752C3411C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id ge10so5646711ejb.7
        for <soc@kernel.org>; Fri, 24 Jun 2022 09:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6gvRufNhBM/xZmT8OAxBWgGHDBASE7DNVJwEcxuAfPE=;
        b=Cx89vn52ESGCQtTlL29RVi/XgLFvM8XFlt/SV26by6aXieczn+IDzFnSz+x/zBzUs4
         k4EcbfFFZectmSD7JHVjV7CciPu1YJpsG86QnPY5mkKoV9jOMgifYVe+iz1jU3C5sYMu
         td/R3lhGwizYszf1fpW2U3f3Xr8aoBaa63juyzjbJWA5A4g/m2GKvoH842Fs45mXj9o9
         Pq9t7p9dzSDl80bqodZpA/ndegN8ch1FwwPH+huColD8WyTwK63N2eRxj+8Oa38/pLwK
         hGgzK76csb7DvRGrqczRVYQJoYNeM0Eb6kt3xhCNKhWV1MMhgcm9i3/XYtFJILinYTH/
         dZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6gvRufNhBM/xZmT8OAxBWgGHDBASE7DNVJwEcxuAfPE=;
        b=mxKry5PS2DzCl3/GgPmZVCyC49kQaW43L412pFXYrgB5vp5/RZiVQsoyLoUTtRsbx0
         ty/XxKd8KAQn+TqwjBprwPZ5ISacq/lInAkCJCqAu0YldazLkm4Y/vLzEQwXBP4fcIXV
         hljl4KmUr1uBXPd9MHJjGX14WM398VqadJMeTUus0BRPewjS+7r86yOATIJMPvBws1tc
         yU9fAi3RPUK/Q2BpOFisae/CYuxcyWEEr/mibNvjQ+80vhtdv1MpVOczaONafQKOw3BL
         1qRecuba+ZAImomAmkObhz5fAQx4vFr8/LypkvO8tCxW75lxh4SGBgKMcFXzw0qhUbX6
         p+8g==
X-Gm-Message-State: AJIora+qSZz5yd8AtqCAZtrr8+gBkTQNUFIcqOxzCn/IPa28YX174lsZ
	hemQt0sjQYmcjx9w+ZUA+HHvcw==
X-Google-Smtp-Source: AGRyM1uDTyymsbqvcpqw+G1IN3KBCRl9t4C7Oh/bLTsQdKflpW3kLavW6JRGTF7d3TRyu/L5i0y9MA==
X-Received: by 2002:a17:906:2dd:b0:712:1293:3dd8 with SMTP id 29-20020a17090602dd00b0071212933dd8mr14164439ejk.448.1656086985840;
        Fri, 24 Jun 2022 09:09:45 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y26-20020a50ce1a000000b004357cec7e48sm2455312edi.13.2022.06.24.09.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 09:09:45 -0700 (PDT)
Message-ID: <dcd4be85-21ab-beb9-e6dc-bd7f570459fd@linaro.org>
Date: Fri, 24 Jun 2022 18:09:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 19/40] arm64: dts: tegra: align gpio-key node names
 with dtschema
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-19-krzysztof.kozlowski@linaro.org>
 <YrXhb5izGPNXEmMK@orome>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YrXhb5izGPNXEmMK@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/06/2022 18:08, Thierry Reding wrote:
> On Wed, Jun 15, 2022 at 05:53:12PM -0700, Krzysztof Kozlowski wrote:
> [...]
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
>> index f16acb4cabaa..62d58221ad3c 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
>> +++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
>> @@ -1030,7 +1030,7 @@ clk32k_in: clock-32k {
>>  	gpio-keys {
>>  		compatible = "gpio-keys";
>>  
>> -		lid {
>> +		switch-lid {
>>  			label = "Lid";
>>  			gpios = <&gpio TEGRA_GPIO(R, 4) GPIO_ACTIVE_LOW>;
>>  			linux,input-type = <5>;
>> @@ -1039,7 +1039,7 @@ lid {
>>  			wakeup-source;
>>  		};
>>  
>> -		power {
>> +		switch-power {
> 
> This one is actually a key.
> 
> [...]
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
>> index a263d51882ee..8494c7b2961b 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> [...]
>> @@ -1772,7 +1772,7 @@ lid {
>>  			wakeup-source;
>>  		};
>>  
>> -		tablet_mode {
>> +		key-tablet-mode {
>>  			label = "Tablet Mode";
>>  			gpios = <&gpio TEGRA_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
>>  			linux,input-type = <EV_SW>;
> 
> And this one more like a switch since it's triggered by a magnet, as far
> as I understand.
> 
> No need to resend, I can fix these up when I apply. Just let me know if
> you have any objections to me making those changes.

Sounds good, thanks for catching these.


Best regards,
Krzysztof
