Return-Path: <SRS0=qp11=C6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EAAEB64DD
	for <soc@archiver.kernel.org>; Wed, 12 Jul 2023 08:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 53146C433CB; Wed, 12 Jul 2023 08:23:53 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6EB60C433C8
	for <soc@kernel.org>; Wed, 12 Jul 2023 08:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6EB60C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9936b3d0286so847455166b.0
        for <soc@kernel.org>; Wed, 12 Jul 2023 01:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689150230; x=1691742230;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GoWAyxLM68nERAkQpmx0i5zgpgXqPVi7D6ZJJROAh9I=;
        b=Gj90BQgmuftkYvA0l4Ooh6N1Y2ExFLxV0JKw5LVaYCep1g+FD8fD81wuYazmUzOV6S
         QgyseppeIghxUAE8LcT8iNQ9m5V2jc5rSLXwAOI5PxczACAvXcKkQollsFKVp94zNh9K
         /QvkADuGCbi49oCNzRyLMPDJnn3O2N+LVbm8oDA2nh/bk2nedQVhFaDnMAQhAIjxQjiW
         QPy6ff0xPADmJAVpnT0jUkWDq3pK1lEbz6RTZM6h9EVJKYtyD1+54LKcO+BT6Kc9gwsc
         Zlg2upivsLSa/WMQvmq3pSe6zHAgQ+DGV6huo5kk3h0MltpiWaY6b1IN9TASx/nl3vlz
         Q1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689150230; x=1691742230;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GoWAyxLM68nERAkQpmx0i5zgpgXqPVi7D6ZJJROAh9I=;
        b=Wb6FxHPdwzZES+qA6acgPsyLelAQNByVq00MRv4+6Xj1+UTw9xQ3VnoFgITghDUV+N
         kxjgoKaIPsNbp1tHHV1g1XlGWgtvTSOXaJZCZIJuidYKGUDvtaY6gawAJyVxG0UhFGw8
         z3gwx234PyiLPr7biuKOBmRRJBqcIOhaVqSUsXinOhFNjEt/dzvb4088Lw8C5rlHpqg9
         lktpZTg4Ks98J0mfsLsd97/DCClLZpue9Y3Zvm0YsqL79bionEfRq9Wd+6dL5HQpif4Q
         Wv7Mtie6fad8+T98pHU9tjPhBXq+LLNf6+iO6ZbHvpmbt6XJcX//urQRY6pcR/KBhsXI
         S5Xg==
X-Gm-Message-State: ABy/qLZvEnRx9OfMKXmW+JDPlPOc3BrLVnB++3OgE3ta5RNSqAkcLlct
	HkmZcocVX9x2/XCBSshgInh/ZA==
X-Google-Smtp-Source: APBJJlEVDQQfQgUOLip5inCMiTiDTMsHjp3rA0fGmDo6HsHEM7grTTl4v9xfKo7wZYmdTEDQa5gXow==
X-Received: by 2002:a17:907:f97:b0:992:a618:c3c2 with SMTP id kb23-20020a1709070f9700b00992a618c3c2mr18039068ejc.76.1689150230655;
        Wed, 12 Jul 2023 01:23:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id f26-20020a1709062c5a00b0098242730348sm2246342ejh.72.2023.07.12.01.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 01:23:49 -0700 (PDT)
Message-ID: <13854167-fe20-2568-4865-80f263898871@linaro.org>
Date: Wed, 12 Jul 2023 10:23:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: aspeed: add Facebook Yosemite V4
 board
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230712073752.54624-1-Delphine_CC_Chiu@wiwynn.com>
 <20230712073752.54624-2-Delphine_CC_Chiu@wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712073752.54624-2-Delphine_CC_Chiu@wiwynn.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/07/2023 09:37, Delphine CC Chiu wrote:
> Document the new compatibles used on Facebook Yosemite V4.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

