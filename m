Return-Path: <SRS0=Yznt=3L=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81616C4332F
	for <soc@archiver.kernel.org>; Fri, 11 Nov 2022 08:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F079C433D6; Fri, 11 Nov 2022 08:21:57 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0529BC433D7
	for <soc@kernel.org>; Fri, 11 Nov 2022 08:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0529BC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id d6so7258616lfs.10
        for <soc@kernel.org>; Fri, 11 Nov 2022 00:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RaXB6dN6ptekdk24JrkBO1mYR3sj0qJtXHnyugR9QHo=;
        b=a2g3SnvKK+xz2sLTjlgXMio5mgQbURrE6LawvamLerfbL6eLSdhUDPCIPevb/dnFbr
         Y7KnjrOgYh045wITt8Nkot3LveepWYCFC1txDsXBhLNne7ZzGdeis9E8I34Ewl1/Vcew
         no/tiezkwXS2HfLR2LlsPQJ2Qvr7G51IBgTLiby61DPCqjJAArYtq2rKDsfaNGudOK8g
         bU0F6sNXDijc0TkplafA4wvsztaKnz2VaVxYfw7aD+B7oicKI0RAiuv6hSwaKYkSl98V
         GiQN13fkkCQmatFEj9c4In6eToZO6ms+imQp3PmeQWnX4YSSAKlk1UnACGawwB9Sc9m+
         L3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RaXB6dN6ptekdk24JrkBO1mYR3sj0qJtXHnyugR9QHo=;
        b=61pWdl2MRVb5urE2xl53Hyp7G6cu0hrW6UwMhK7dgwO9VQgJm7sf4mhJt0qjKR/D8U
         ngvJPAIY8YrLQdGExZzMSBTXl9HorassCdi32JDtLGQ+/6IJI80KevlHFauq2kW13rZD
         +wjG6DLQgqarHvQSZEr0m21nxSpWh760zaqoT04QbpWoyUp+AyDX0mMsqBNrT0et3fqP
         BqEjwuVoSuZWPP8joKyNX3jl7avcb/vWbLxNSFQza1YXPbta+9fTS/zlOCtFFyNFttmk
         D7DbWsUihq/08radIVVTzpWNHmbh9J8q0dwwZmCVeyN5Aa6KNNMXegjUDcJ0aHdN/kfD
         r+Ow==
X-Gm-Message-State: ANoB5pkDKiEjdoNj1pnbTfgfxJ6wsQ8SJDtE5ZFMWDHQpuD+DaPA9+L/
	d7EySNeVrP04UUC30Rwmrrkqiw==
X-Google-Smtp-Source: AA0mqf5H8FEamvhBHsnS1Kb+wkjKZTuntz658YH1Sdaz0Lniv1d8nAxLjpLbjbvtqRkJtkzrb4z2ew==
X-Received: by 2002:a19:6553:0:b0:4b0:fbfe:84fb with SMTP id c19-20020a196553000000b004b0fbfe84fbmr367750lfj.417.1668154913117;
        Fri, 11 Nov 2022 00:21:53 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id f29-20020a05651c03dd00b0026e897e3236sm282161ljp.6.2022.11.11.00.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 00:21:52 -0800 (PST)
Message-ID: <affc49a4-ecbc-23c7-3d24-25cec1c302c7@linaro.org>
Date: Fri, 11 Nov 2022 09:21:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: aspeed: add Facebook Greatlakes
 board
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
List-Id: <soc.lore.kernel.org>
Cc: garnermic@fb.com, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20221007055346.3484180-1-Delphine_CC_Chiu@Wiwynn.com>
 <20221111034828.2377-2-Delphine_CC_Chiu@Wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221111034828.2377-2-Delphine_CC_Chiu@Wiwynn.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/2022 04:48, Delphine CC Chiu wrote:
> Document the new compatibles used on Facebook Greatlakes
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

