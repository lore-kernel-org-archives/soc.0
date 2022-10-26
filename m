Return-Path: <SRS0=atzn=23=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004EFC38A2D
	for <soc@archiver.kernel.org>; Wed, 26 Oct 2022 14:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7809C433B5; Wed, 26 Oct 2022 14:50:17 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E938C433C1
	for <soc@kernel.org>; Wed, 26 Oct 2022 14:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E938C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f53.google.com with SMTP id o8so11628087qvw.5
        for <soc@kernel.org>; Wed, 26 Oct 2022 07:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i+Z+gNNMU3McZjMUVCV+bq5PaQ/StJP31GeGMFY00yQ=;
        b=iIPefOFcajYIabwygnBa2cr7q2N+oLtPVvhqegJSA0Ufhe7KdZ3TGqotABFnYJ0C1D
         W/NlNprE6YWePgE7Nc63LJF3EPTdaWqlceh9ze/sa8prd8ksNY1jja6yqU6JEyH95Z5L
         rQZ3+qAkbUkke5RYamqTFblSuClAZkDL+XhUYDy6vuEsXLh3WmlgcnY0ZIJNEA5VYoVx
         z0wLXQJ7vBkkOHMYgJysMz7AKiWUmVWF7OFi8IIC83dc+gOHzblo9KjbjJlSJTQ1JiUp
         L2Y3x7HRjvNzQYvoXHs65umOrL/GcvVwnHGCfM17MjXJEEIRmI/oTo4K0qlFFKNqIQAN
         tzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+Z+gNNMU3McZjMUVCV+bq5PaQ/StJP31GeGMFY00yQ=;
        b=WlvGhcZkTMck75MEAznYwP9or8aK7w4ssEtJyTPLdFdeFCvTxG2PHILMP1JfYCfIr7
         rIPU2n9x1Ht1UzSBwTcqoucOYRfmYELJBYX+Jh9Jm1BSwupWvHbv3wP5y8JN0n4zTDgX
         I4OZpduxDDOgs5EYXPa+wlmQY67IvO7slotJxABsnG/FEJFw//nhKkeHrL4Yn7BP/SU7
         9rfNZh8s4amKj3WZ3i03GY6E3yJGIlU5lq8peDNFlqNz6hg28cz9v7FPKsTl0T0K5SdJ
         BINB2RfGAyG0kw2+q8mV6yTjYjaDUVHdqV/y78NZER0hYvJv1YUHv/yQMKfcCaMX1jMY
         smtw==
X-Gm-Message-State: ACrzQf3E21hxUNtw3l7bs1n2jwIwzSqkjc89iPrTmZgyKVSdHD5wDbyr
	fcRlgUHXDWT9Ua0CuA8knnR7aw==
X-Google-Smtp-Source: AMsMyM6lqOGZD8a58+vf/bzIrwSNh5y/+CDdt5z9ZFq8Nfee+R0BXi3KqPEj+WUUXgJioniaHeafkA==
X-Received: by 2002:a0c:aa96:0:b0:4bb:5ed3:49b6 with SMTP id f22-20020a0caa96000000b004bb5ed349b6mr18945896qvb.80.1666795815276;
        Wed, 26 Oct 2022 07:50:15 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id m17-20020a05622a055100b003994bbe91bdsm3306333qtx.60.2022.10.26.07.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 07:50:14 -0700 (PDT)
Message-ID: <df14e401-4ee3-920b-aeb4-6bcf52ba85cf@linaro.org>
Date: Wed, 26 Oct 2022 10:50:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add Lctech name
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, soc@kernel.org, Icenowy Zheng <uwu@icenowy.me>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
References: <20221025145909.2837939-1-andre.przywara@arm.com>
 <20221025145909.2837939-2-andre.przywara@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221025145909.2837939-2-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/10/2022 10:59, Andre Przywara wrote:
> Shenzen LC Technology [1] is a company making various boards and related
> products around IoT and AI technology.
> They used to use the "Cherry Pi" brand before.
> 
> Add it to the vendor prefixes list.
> 
> [1] http://www.chinalctech.com
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 035ef859fbc58..e273bf9235946 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -695,6 +695,8 @@ patternProperties:
>      description: Lantiq Semiconductor
>    "^lattice,.*":
>      description: Lattice Semiconductor
> +  "^lctech,.*":
> +    description: Shenzen LC Technology Co,, Ltd.

Drop one comma.

Best regards,
Krzysztof

