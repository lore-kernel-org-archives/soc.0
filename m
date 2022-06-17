Return-Path: <SRS0=L7aB=WY=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F438C43334
	for <soc@archiver.kernel.org>; Fri, 17 Jun 2022 23:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 57DA0C3411B; Fri, 17 Jun 2022 23:18:42 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6FD0EC3411D
	for <soc@kernel.org>; Fri, 17 Jun 2022 23:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6FD0EC3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id x138so5318206pfc.12
        for <soc@kernel.org>; Fri, 17 Jun 2022 16:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=dnlvDERG8oowX1HgALJdegPeU3FrNxjdXcUUPk217Kc=;
        b=dYgOoOJ+N1WQxKWgcZXmEa3c1hdI0FiUiq4kjgxMtELC1+LGpzl7e3X18OpxsPSLM6
         Z/Md1Q8QQHTehEao5xTscQMo7T5Lz4/pzDY3ntkLraiKoKzWL7ROaL2cao0FuDoT9stK
         Y6P4ABr9fN3CpUeRy0JOTZbpI9REGz0+47sTJIsSUOPeGNaoMlC+f+NCcpS6t8dOO/i0
         k26TzfWBvaDMUogUbaw/ePh4I1gdsJWFEU4PXk4hYL0DfC4g6chOMd3nJE1h86wiO1et
         1I9ZkUSlHIQ81Yj27Bv60tr/T2MsJF/eku397IM1VZwlVgBppgapkFlTfY5NfCWNSsqt
         MDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dnlvDERG8oowX1HgALJdegPeU3FrNxjdXcUUPk217Kc=;
        b=3U/hMhJE6+BUKB58JNxckW963mC9ns80NhBcj1OUgYH2t8jRq/r280pkYcvZ6Flqum
         euh7EC8WCJmjV9c4P3Ri65KUR1DCzN9xWJXLR2Og7kf/ixA0/j6qHwSx2J3BbPUKFkwL
         r38K4LBzRlm7Kc+Fn2x0NT15NazSny+yrS9wVnZer8efFpOTgImhgznTcfefQlNphnKp
         mGzbx8ex08KRTkK4WpQGogBNuZqLOENtKgFHuKKPmKGradfJTbvi+NJuto88EjqT1K9c
         8SUyGYnZchPV+kXxlXROYV6PKeb1/qLuYNwkjEPcESPlFosyGzxwakGp7Pg/TwfMXgxN
         mxFg==
X-Gm-Message-State: AJIora8IOCbK/DWbMHRUTEQY2lagJsYj9XjsFdCgOe2/rUWTEhrKyuJ/
	RdfAClPPJ/LZtuIS4HldM7h/Mw==
X-Google-Smtp-Source: AGRyM1u/txoKu7R37NfERg5G/UkpHCJc9k3H5j4ALGDpTt/qdkZUdeh8lUa7533JzX4jdxzHyO1UDw==
X-Received: by 2002:a05:6a00:2410:b0:522:9837:581f with SMTP id z16-20020a056a00241000b005229837581fmr12316295pfh.11.1655507920906;
        Fri, 17 Jun 2022 16:18:40 -0700 (PDT)
Received: from [172.31.235.92] ([216.9.110.6])
        by smtp.gmail.com with ESMTPSA id l4-20020a170903120400b001620eb3a2d6sm4088846plh.203.2022.06.17.16.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 16:18:40 -0700 (PDT)
Message-ID: <542f4f86-7bf9-b5fb-16d2-849121b6ee6d@linaro.org>
Date: Fri, 17 Jun 2022 16:18:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 17/40] arm64: dts: mediatek: mt7622-rfb1: correct
 gpio-keys properties
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, arm@kernel.org,
 soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-17-krzysztof.kozlowski@linaro.org>
 <fcc5f00b-0776-9511-845a-5eac5d4c7876@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fcc5f00b-0776-9511-845a-5eac5d4c7876@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/06/2022 03:41, Matthias Brugger wrote:
> On 16/06/2022 02:53, Krzysztof Kozlowski wrote:
>> gpio-keys children do not use unit addresses.
>>
> 
> Is it me or doesn't the commit message match the actual commit? Change looks 
> good, but message puzzles me.
> 

Indeed, wrong commit msg. Thanks for spotting it, I will send a v4 of
this patch alone.


Best regards,
Krzysztof
