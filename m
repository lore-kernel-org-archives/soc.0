Return-Path: <SRS0=2WOw=2T=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8465C433FE
	for <soc@archiver.kernel.org>; Tue, 18 Oct 2022 12:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ACA60C433D6; Tue, 18 Oct 2022 12:45:55 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB6C4C433B5
	for <soc@kernel.org>; Tue, 18 Oct 2022 12:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DB6C4C433B5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f172.google.com with SMTP id w3so9500881qtv.9
        for <soc@kernel.org>; Tue, 18 Oct 2022 05:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SWxKl23w6XMI7+5jEn1eePKGLm8+GZam2TRBB7nw/fU=;
        b=GZcjHVztgYOJHB6mAJbvi8Th0/QGV94wcDkolAkngJuS8QoerJe/nBj/jmhdKXQzrX
         gqxH1ttIA+M2ExM5khLwidXF1/n+PyXFRUjlnHq/rb2USCzW5TVrqRiGQrHZnVNWSixh
         DzWnw6w8R8yrmfFh8JTGIz8IwATL4WA1MNANq3VNOii9gPuWK0eARjbBA2wNeMeKusSE
         bwpRqROC7gfCVP9ufJEEfi8AblrCoUuGkCV+dFZild+XlG3GEvpT9+yg1aZ1jSeiuAAK
         BeXrzEdSWQoCpJScpb7wGRinN+6jIxuWmqxlvSV7uRlUDhHm2l8H+TsX2/bZSx8f6LQ9
         T+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SWxKl23w6XMI7+5jEn1eePKGLm8+GZam2TRBB7nw/fU=;
        b=UTAOVDmfTDMj90w6WYfvsGMpDjq4OnqXu1ULSEIYteT25Y+5pNOsfMUA1cEZugSpHM
         OKe3yeWmeVH6ixqZVH5NPmzAjKz2aQ3Agqx96T8E48hxBrdJ/FdZ4XR7NUq2RXzIUzM1
         twvgiZBMO6PPTpuI08dyU7md3nHYv4mVAuk6P7PsXUT0Up3wbRzPFglRwMPNdlY8ZRk/
         saQOBoOadMsxYciviatHh0I4nSKIRRogPX0uZSa7vOuefgu2iPYOcLb7faO/K79sNVw/
         U8xNGrTKLS3+YZBaAR+XKBWS6B6okjdpr0z2ljAFuy6yifzFKoLFu00KYWok+jdMyKRk
         Vjqg==
X-Gm-Message-State: ACrzQf1Wajy7t0MiHNV3RU6KzAxsTb977Pkx/xMzsRX6a59fWEY3KZhs
	+pYmt7ypAp4NPs+bS9NqCpVHaw==
X-Google-Smtp-Source: AMsMyM6Vm4QBG6EQYbErftl1Bfd4F9lOWC02IlvQ57Iue1RblKX7llB4Nn053ohiLxXnC+/4oqWTsQ==
X-Received: by 2002:a05:622a:554:b0:39c:ef65:bc66 with SMTP id m20-20020a05622a055400b0039cef65bc66mr1892322qtx.550.1666097152810;
        Tue, 18 Oct 2022 05:45:52 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id ay40-20020a05620a17a800b006bb78d095c5sm2212951qkb.79.2022.10.18.05.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 05:45:52 -0700 (PDT)
Message-ID: <5f9515e3-aa46-eba6-4c2d-9cd4d2e585aa@linaro.org>
Date: Tue, 18 Oct 2022 08:45:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [GIT PULL] memory: late (3rd) for v6.1
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20221003073237.11488-1-krzysztof.kozlowski@linaro.org>
 <79d9b77f-f7e1-61d9-2e86-301f07a03721@linaro.org>
 <0991a91e-384b-4be1-ab41-e29f8ad88d84@app.fastmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0991a91e-384b-4be1-ab41-e29f8ad88d84@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/10/2022 03:18, Arnd Bergmann wrote:
> On Mon, Oct 17, 2022, at 11:51 PM, Krzysztof Kozlowski wrote:
>> On 03/10/2022 03:32, Krzysztof Kozlowski wrote:
>>
>> This was a late pull and missed the merge window. It was based on
>> previous pulls. Shall I rebase on 6.1-rc1 and resubmit?
> 
> I'd prefer a rebase to -rc1 before you resubmit, but sending the
> same pull request again would work as well.


Thanks, I'll rebase.

Best regards,
Krzysztof

