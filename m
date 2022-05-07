Return-Path: <SRS0=5UIZ=VP=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957C6C433EF
	for <soc@archiver.kernel.org>; Sat,  7 May 2022 16:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60061C385A9; Sat,  7 May 2022 16:02:22 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A443EC385A6
	for <soc@kernel.org>; Sat,  7 May 2022 16:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A443EC385A6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id dk23so19489940ejb.8
        for <soc@kernel.org>; Sat, 07 May 2022 09:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZGe2WKTSwlYRLM8mEcooO0HHCmXLiPGKlmbzaSTlMLY=;
        b=Y7CCk9RztVEPm+vsTbcOLJTJtiVj2ZZJjSyaqRNaAkr8Nw8k7Y7ieul8PwDE80gQET
         6ghxH3wYw/sZgP5FJ4rVQhMSDxO7RJ2x7cEjyIV+VrGketdGNconKGkBLICLp9HVogzo
         uswvg9behkN+JUFyLCM+cMze1p30wnzMTXHKDzAS6Q8BrdzMJMPJDdCTHCnmkPoFhAwT
         MmfjPLtn1pWF9Ua9v7RhGlN+mbWMxYvZ2F2TmNGEQNqChh8lN9weHDoCxj9MSCYB5lcT
         XxsJ/YzVnwIbv9NGUxFV0ope1g4lsOjAmUqLscBnSiC5cAD4/K1guJ5RwgBeAESBVfXJ
         spDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZGe2WKTSwlYRLM8mEcooO0HHCmXLiPGKlmbzaSTlMLY=;
        b=wREwKDo5YP7Yr5FZS644GopaDRzxf3WatCmBwELfMgWi+jgJeJwi8UIgKyM6zTsXqU
         9mq9V16x/YSttF9A4BcAq1C9XUYNdnJIFSIWsKrrtsxcsIp040tpSoJ43QZIY/ux9Bs5
         eS22GjmXN16MKpDRJjiuMqGHq0K2GPnDMe5Z2nSnUdJ5fJLVaaDUsOzsRRYxD6slamGp
         YQqyyahTbztNdYk9xKkbw3hmOT5fkcWO+G3oppDg2mZaIv8MdFJGxpCe/wT9JBvL9cHC
         OUsxAL5SCGZaVs2l6QYzXH2/MzOPWzN6BCeud49ZUmlgElJzBaL7zw5NmEm5BNirojnO
         CNLQ==
X-Gm-Message-State: AOAM531542gUsFPEENcqT2K3M1NDlmyrU5VHwlQ0kNYCwM3IsSD2Y+L9
	P4wsZxkh4jz/p1d+w5ldqzhTWw==
X-Google-Smtp-Source: ABdhPJzSP4Dy5K1PH+U5uRNNx39K/egsLJrR1KNAavRKOW5qU1KGhssurkrAq+UlSXAI3qM/T90iAw==
X-Received: by 2002:a17:906:2652:b0:6f3:a042:6b51 with SMTP id i18-20020a170906265200b006f3a0426b51mr7764866ejc.565.1651939340028;
        Sat, 07 May 2022 09:02:20 -0700 (PDT)
Received: from [192.168.0.232] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ee38-20020a056402292600b0042617ba63a2sm3692833edb.44.2022.05.07.09.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 May 2022 09:02:19 -0700 (PDT)
Message-ID: <5dca492f-3afd-9da2-913c-00601dece441@linaro.org>
Date: Sat, 7 May 2022 18:02:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v7 7/8] ARM: dts: Introduce HPE GXP Device tree
Content-Language: en-US
To: nick.hawkins@hpe.com, verdun@hpe.com, joel@jms.id.au, arnd@arndb.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org
References: <20220506191339.78617-1-nick.hawkins@hpe.com>
 <20220506191339.78617-7-nick.hawkins@hpe.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220506191339.78617-7-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/05/2022 21:13, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> The HPE SoC is new to linux. A basic device tree layout with minimum
> required for linux to boot including a timer and watchdog support has
> been created.
> 
> The dts file is empty at this point but will be updated in subsequent
> updates as board specific features are enabled.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
