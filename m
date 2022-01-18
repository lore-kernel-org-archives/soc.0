Return-Path: <SRS0=YOi0=SC=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B84C4321E
	for <soc@archiver.kernel.org>; Tue, 18 Jan 2022 18:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70740C340E5; Tue, 18 Jan 2022 18:41:33 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF38DC340E2
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF38DC340E2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5D6A54004A
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642531291;
	bh=d4x+4xkW9gXvjz8GkGAmId26UTghAa2V8sVHpI1V4fA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type;
	b=Uic0rUQo9adNDKKg9RB/les9UIr0LjHTu4MxBVua3JcXn+AnoEkLjL0NDRNNUlSA9
	 YOK8eAbTig/UL+JaTputtaUjYVFc/ucUNV2HMu6pFV8FTs/I806XHDCYE1Gfn6FM+a
	 HDL+AK6g2fqWh+edztryATdWrU7/FPEVwC63VrVm/2hcanLylGyRpWDqXpAoZdlIV2
	 rgUIVZVOcKG+yB6edFzfXKXNBfj01sVy6FKoHjfxo0eDidf2EhMOCLBHAOAficIK2T
	 UAGVYOAMC5vS4pmBdumYj2tPhh4g4m+kxfuYuB32EuIz9cWg+wp3Py0lYXcI1ZwAIk
	 CO10AAFRSVoYg==
Received: by mail-ed1-f71.google.com with SMTP id bs4-20020a056402304400b004032af6b7ebso4590180edb.16
        for <soc@kernel.org>; Tue, 18 Jan 2022 10:41:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=d4x+4xkW9gXvjz8GkGAmId26UTghAa2V8sVHpI1V4fA=;
        b=5kN00+/ZG+BBgiPkwSFNmFBK+qPiztPr24KKpQ0GZrM6IqKyJusBuOWrPdTvWNi5Ls
         t1wR08NfHIszirGgyrsHkFvVg44Efe7B8mZC7/Qwvf23mm24d1gXt+z52WyHEsp6kHxX
         t5I9QFwTBo9AEsEB+kYTVzgNx4qphG8frXLu8VSp0egFU5Zo1nQhl1jrUidKuNF7VXVY
         sayNgDT54GibXL127ULwqXLltOMl7HqPJHmZyvlbNWykLLg6zR466CskJz5UE/DkM6bZ
         n6X5YLZtpK5XQzlE3kqN3+YBlGQ69vDSktNatDmKtSkJCHYyDyQxjY2U/WeFAqCeE5Ws
         v3pw==
X-Gm-Message-State: AOAM531wz748ImHm4b+ZKmBB8zPL9ot3zpox1fyah6mqK5ygRpV4M3rD
	gOR01KFiHtFuE72DZDk5818rdUvGQvP8/iXOcpAPk43SG3E6LZq0pS7GKjuHU88eOgxP67qRIWl
	hrW/x6q5gFbQ2bsAtW/ZEkik=
X-Received: by 2002:a17:907:7d8a:: with SMTP id oz10mr21220018ejc.320.1642531290047;
        Tue, 18 Jan 2022 10:41:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkNLpeCkuJ++ObHkzVuFE7m7/DGI74fZq5o+MQ9EhkoIL7QVnicxdhEZRzU5ffTMqzfAwbtQ==
X-Received: by 2002:a17:907:7d8a:: with SMTP id oz10mr21220001ejc.320.1642531289843;
        Tue, 18 Jan 2022 10:41:29 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id c30sm5719152ejj.190.2022.01.18.10.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:41:29 -0800 (PST)
Message-ID: <25795f7e-8e04-aaae-db47-05e5016a1890@canonical.com>
Date: Tue, 18 Jan 2022 19:41:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 13/16] dt-bindings: arm: add Tesla FSD ARM SoC
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, arnd@arndb.de, linus.walleij@linaro.org,
 catalin.marinas@arm.com, robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
 linux-fsd@tesla.com
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150104epcas5p4ac6fdc739d21c7d7eb2e53e469466487@epcas5p4.samsung.com>
 <20220118144851.69537-14-alim.akhtar@samsung.com>
 <b1bf4b43-639d-c09c-2fb2-0ac58a6eb858@canonical.com>
In-Reply-To: <b1bf4b43-639d-c09c-2fb2-0ac58a6eb858@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/01/2022 19:40, Krzysztof Kozlowski wrote:
> On 18/01/2022 15:48, Alim Akhtar wrote:
>> Add device tree bindings for the Tesla FSD ARM SoC.
>>
>> Cc: linux-fsd@tesla.com
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>>  .../devicetree/bindings/arm/tesla.yaml        | 27 +++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/tesla.yaml
>>
> 
> Looks good to me. I'll take it via Samsung-SoC after the merge window
> unless there are some comments/discussion.

Wait, no, I won't take it, it's not Samsung Exynos. :) I guess this
could go via arm-soc directly...

Anyway:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
