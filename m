Return-Path: <SRS0=9v8K=7H=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCAAC61DA4
	for <soc@archiver.kernel.org>; Wed, 15 Mar 2023 06:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21D09C4339E; Wed, 15 Mar 2023 06:38:58 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3452C433D2
	for <soc@kernel.org>; Wed, 15 Mar 2023 06:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C3452C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id w9so604866edc.3
        for <soc@kernel.org>; Tue, 14 Mar 2023 23:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678862334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WgUA5CBj+bIEepqH5MtjCecA8l3Z+CMPwZZRyCaxM+s=;
        b=RZeWq6pIBxpuhHOtkNBaFRxPoG7LqH3rTTstr2EZypXSJ5cuUiTod26UFbuntuUy8H
         HZwH0IGZydrjM/Y8zzFaeGrFc6E0qglwHlVDNsdbgNnHBbISSd0BCUKwJQ+JMGAeglCJ
         JnF7d7vZM8CcqZUtNTw7j/5Sg2j8nbNS5cOmwvxvnA87qqnoeYWYALpnXoCdSJufC2El
         rZHGkXaO00n7NgEEWju76BqLsSRyVkHv5VknoQdsTzDRucNNryg+eTSad1YDQ2k90v22
         6iEx9gPUatbwrzBu013xlpHQyjFAD2mo9khCiQ4LtSeUn8nmVb6GiFBAm5HufPPMNprK
         hbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678862334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WgUA5CBj+bIEepqH5MtjCecA8l3Z+CMPwZZRyCaxM+s=;
        b=sbxjBqB5531GHbgjSBiXvO1zdnPE7pA37SNUj9NG6Xg68719ehjzgJNBsuWFy4eeo3
         thHGPZ2JleFURcetv+X249OANWXIt9U3YtOoyKf9CxduxfWfIFuyjQZD+FMC6Gd+tukd
         m7BRRujloCGCZVT5M8dK7+QNga1UiZV+cCw11v1kenf2g47FvUOi5Ms8K0jS/YSDBO9Q
         roSnDD2rFGxuYtMPQbvy8YlpiMxSsrWIHSv/15ENWhot8j+5dh2D+6BUPQO42CZ9EikK
         TH0RWCABX8bmcfJpldNKwtckwt9/v1vaHoalbWISqevHsiu4gepmM2Obo2zWV4tUx+hA
         cpDw==
X-Gm-Message-State: AO0yUKW0SPafKyb5SlUMFw3TXqSY71E/AcnflWilNeZm92FDUfG3wiSo
	f2+fgLCTLLiTkk9Dx8KgcJ2Mnw==
X-Google-Smtp-Source: AK7set9HIXoLlZmtLmKnOyG12Uun7Rm2xpw5Yo1/K2QQZL+uxTyFuYo5fSRiRUdnIb+otszNxDa85A==
X-Received: by 2002:a17:907:a649:b0:8f7:6ea6:b451 with SMTP id vu9-20020a170907a64900b008f76ea6b451mr5680613ejc.2.1678862334028;
        Tue, 14 Mar 2023 23:38:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id cb17-20020a170906a45100b008deba75e89csm2041781ejb.66.2023.03.14.23.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 23:38:53 -0700 (PDT)
Message-ID: <d6f7a967-a0ea-c5d0-93f5-683e02673ed1@linaro.org>
Date: Wed, 15 Mar 2023 07:38:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: dts: cisco: add device tree for Cisco CrayAr
 Argos.
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Daniel Walker <danielwa@cisco.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 xe-linux-external@cisco.com
Cc: Marcin Wierzbicki <mawierzb@cisco.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230315010920.2473206-1-danielwa@cisco.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315010920.2473206-1-danielwa@cisco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/03/2023 02:09, Daniel Walker wrote:
> From: Marcin Wierzbicki <mawierzb@cisco.com>

Also few nits: subject: drop full stop.

> 
> This adds device tree include file for Cisco CrayAR SoC and

Do not use "This commit/patch", but imperative mood. See:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> device tree file for Cisco CrayAR Argos EVB board.
> 
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Marcin Wierzbicki <mawierzb@cisco.com>
> Signed-off-by: Daniel Walker <danielwa@cisco.com>



Best regards,
Krzysztof

