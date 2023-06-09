Return-Path: <SRS0=qGgT=B5=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93093C7EE29
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 12:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58279C433EF; Fri,  9 Jun 2023 12:13:25 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E5C2C433D2
	for <soc@kernel.org>; Fri,  9 Jun 2023 12:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E5C2C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-97668583210so258733366b.1
        for <soc@kernel.org>; Fri, 09 Jun 2023 05:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686312802; x=1688904802;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/d+dHBgEekjDSHClTJsQ6wFO80YgJRYqTq5jLwHrLwA=;
        b=ypCdboJHyF8Pl/ysbJkoYgLbs2KgBOkv6jkgGU15xvwv23HstfZfrsJpg3tC1MEEuz
         vXmsyfIHbJSOHw3ZFkrvJooHvlXZN2EMJ8xsL2krSz5bWH5IZwiqmMvvw9Qc0sSy30vD
         NmqHwwxnfIoReQ4ETAfHr5AdQJ2M5iARlfood5WIeTn8qAk9NBXlbuPplX6UMwgJGrL5
         kASZo4ZlpTQE5zwrRUKwOgB1ygNTimN3wYxxF54lXaeqr/qaccSB26ev+k4Voe5O6/CE
         fP7zDagujvUUHxFk7N8/5CMjkBKJ8IbqJMASia8SWduXSrKaejVH9jyhSMqygHKbz3VE
         kK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686312802; x=1688904802;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/d+dHBgEekjDSHClTJsQ6wFO80YgJRYqTq5jLwHrLwA=;
        b=YoFykNKA85oXr+T3YiErSjgvNa5obrJNnt+YOt8XHePSYLVd3WrKoD0NGuSQ1chAqX
         hSa7U0Zbcn9gEs4I5XIm1yr5f6hlvGc8JTfybt37njHrGZ3rH9ILuxIFIc6XqhX7wGEU
         gqOf7P/mMNvj3pIfnOb7B3grX8HdeZ1xan3wg9sN7VclVuNo5FJuzWxh34heNft0Wk9k
         MOl3/0EAMVlFgLwOolyU1z+t4aEb2W5oDUPfIJOZFnAiaw7aftXT0GsVnb+RDQ+JGCQ3
         45W2g8sqzPTOOQICd8xN/Wq/lmlTQ8BFm7zv4L2ohHQuDLPTXkEoVPMDPlmMZaiSal+G
         N30Q==
X-Gm-Message-State: AC+VfDylG8905SVqWtydH4L4NF2neQ/ZbPOdDhGxCfYEGJxhC74POdyj
	1iDhWrYPcZQjH2+F0xVp6Y/hsQ==
X-Google-Smtp-Source: ACHHUZ448AEQ91mBl1jmqqcGkRQTF/d2BTQKH4v4bK07JoAJsj99mIAC7VHg/3tDLGCNWOO1iKpbXA==
X-Received: by 2002:a17:907:d9e:b0:974:630a:fbac with SMTP id go30-20020a1709070d9e00b00974630afbacmr1485064ejc.18.1686312802221;
        Fri, 09 Jun 2023 05:13:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id e26-20020a1709062c1a00b00974556e50a6sm1223271ejh.114.2023.06.09.05.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 05:13:21 -0700 (PDT)
Message-ID: <3106c4a1-ce5b-a9c4-5cf4-6adead7fce80@linaro.org>
Date: Fri, 9 Jun 2023 14:13:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Inventec
 starscream-bmc
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?B?Q2hlbi5QSiDpmbPmn4/ku7sgVEFP?= <Chen.PJ@inventec.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Cc: =?UTF-8?B?WWUuVmljIOiRieWuh+a4hSBUQU8=?= <ye.vic@inventec.com>,
 =?UTF-8?B?SHVhbmcuQWxhbmcg6buD6Iux6YOOIFRBTw==?= <Huang.Alang@inventec.com>
References: <b039b1b2673644af84db8f803bc7d156@inventec.com>
 <c5f1fbb0e6754394af41eb5083f64d89@inventec.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c5f1fbb0e6754394af41eb5083f64d89@inventec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/06/2023 13:52, Chen.PJ 陳柏任 TAO wrote:
> Document the new compatibles used on Inventec starscream-bmc
> 
> Signed-off-by: Chen PJ <Chen.pj@inventec.com>
> ---

Any reason to ignore what I wrote?

https://lore.kernel.org/all/2e06e7db-64f9-51f8-adf1-b240f30a2608@linaro.org/

You got there clear instruction, didn't you?

Best regards,
Krzysztof

