Return-Path: <SRS0=6Gkx=5U=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835A2C05027
	for <soc@archiver.kernel.org>; Mon, 23 Jan 2023 17:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66A32C4339C; Mon, 23 Jan 2023 17:10:54 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70D4FC433EF
	for <soc@kernel.org>; Mon, 23 Jan 2023 17:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 70D4FC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id t5so11499699wrq.1
        for <soc@kernel.org>; Mon, 23 Jan 2023 09:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ye4fqaKuWEQ0VBJGa/puIN6G52G7rZfX+7Sp2w5Asa0=;
        b=AlS6Sy28XmPmahGHyCVVZnddWfq6aZfGYwtLhUOGOyec1e+pMe6bqP7BPl9dY713as
         MJX4cKz6YOw8bn2XwZiOqmaejGMBWD9m9aFGdI25RYHHbDn/EE0865XGFZPYyimqYEiX
         Ohw54jWTPZmbkKVbT6kOZmv3U1teLSUv3hD15eDClAkZFwv2/pBt4EeHLlrrlh8ABgnI
         ddbwTh/KTg+YBE8JZbebMtkU0+2eS4vIbv2MP2wCQKkKt78FWZHJg3J2K/R8gqfuHKjQ
         A5tdKyucw8DNEzT1X0yXdst2/HdRPMTc0X98ogylsAAukdCZgV7AmBibVI/LVaFkx0Zy
         MHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ye4fqaKuWEQ0VBJGa/puIN6G52G7rZfX+7Sp2w5Asa0=;
        b=GaGghHjhHESMSyzMGeBK7MmTKevIUPcTOeBTHMZcUNBYRJJ9teulZV3AaNSbIOYq6I
         4FLEoEsG+/uRTtlSl/qpfikdvGWUfhZ9T/M/dt4ZSTw9tPpj0lzH0VxAyVsoFUW6fTGA
         bLKBMH3yEec0WD9kiDLoIYrtz95s2iGNkgfplmyigejCDNyZxP6XJSh2/6RMiGF+2Hxw
         tgyt+51whQ0mjwz2Zh4KTHIXxpIzF40Wo2WonM5u6t4P0b6EawBBpUVRQcvdju/uRAOh
         8iYZJx1RiH5+fR5FMSoMT2dWC0ni4DnCfgpgDKihS3VpAPxUH3qTuhFs/cJB1hf2UUeX
         KFng==
X-Gm-Message-State: AFqh2kpHdQ1U2VGHN9DWOaXHTUEfoYxymicfxykPtLkL9tp52EBbZWSW
	o9dkBG044y9SarW3Pj85XX8mGA==
X-Google-Smtp-Source: AMrXdXsJQ6qklnvii5yk83hLv4husOGcpBtpe2KAI5knLsCK/7V4f29aoYZQd+RytVPnb8G58WONiA==
X-Received: by 2002:adf:f0c1:0:b0:2bd:e7a0:6b5e with SMTP id x1-20020adff0c1000000b002bde7a06b5emr22897157wro.40.1674493850759;
        Mon, 23 Jan 2023 09:10:50 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h10-20020a05600016ca00b00267bcb1bbe5sm5304137wrf.56.2023.01.23.09.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 09:10:50 -0800 (PST)
Message-ID: <f67b23e8-a476-7f8c-b692-e85ebbe669f5@linaro.org>
Date: Mon, 23 Jan 2023 18:10:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom: Add MSM8926 and Samsung
 Galaxy Tab 4 10.1 LTE
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 matti.lehtimaki@gmail.com
References: <20230122144749.87597-1-newbyte@postmarketos.org>
 <20230122144749.87597-3-newbyte@postmarketos.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230122144749.87597-3-newbyte@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/01/2023 15:47, Stefan Hansson wrote:
> MSM8926 (also known as Snapdragon 400) is very similar to MSM8226 and
> APQ8026 with the primary difference being that it features an LTE modem
> unlike the former two which feature a 3G modem and a GPS-only modem,
> respectively.
> 
> This also documents Samsung Galaxy Tab 4 10.1 LTE (samsung,matisselte)
> which is a tablet by Samsung based on the MSM8926 SoC.
> 
> Signed-off-by: Stefan Hansson <newbyte@postmarketos.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 47913a8e3eea..7a0b2088ead9 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -35,6 +35,7 @@ description: |
>          mdm9615
>          msm8226
>          msm8916
> +        msm8926
>          msm8953
>          msm8956
>          msm8974
> @@ -219,6 +220,11 @@ properties:
>            - const: qcom,msm8916-v1-qrd/9-v1
>            - const: qcom,msm8916
>  
> +      - items:
> +          - enum:
> +              - samsung,matisselte

1. matisse is the code name, lte is version/suffix. I don't think they
should be together, because then it looks like "matisselte" is a name.
It actually sounds like one word.

2. You base on other SoC but you do not include its compatibles. Why? Is
it intended? None of the properties applicable to other SoC will match
here, thus I actually wonder if you run dtbs_check...

Best regards,
Krzysztof

