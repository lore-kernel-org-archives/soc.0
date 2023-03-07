Return-Path: <SRS0=Mj3k=67=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6389EC678D4
	for <soc@archiver.kernel.org>; Tue,  7 Mar 2023 08:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1ECFCC4339C; Tue,  7 Mar 2023 08:21:36 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A659C4339B
	for <soc@kernel.org>; Tue,  7 Mar 2023 08:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8A659C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id j11so29503963edq.4
        for <soc@kernel.org>; Tue, 07 Mar 2023 00:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678177293;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wYZSGOL1Ow+nU2BHp0S6DvwtM6Br5RJflXI+aGJp8DI=;
        b=nIpfykpjdzp7eHd3xcBCadvRWTdNewlsBPqYaR1gE/qXErxk3gTT+7db6GyL+OZ1tX
         VZy7pTReKEbW516DviDgp/3ai4rCkzWK2b5RpvslsvLJ3jbIsNsk2tHDxU4NNyCeng9M
         yp+bXl0amE1joK1vkbEAp1/63ALBN8eZ60DueSLhz4QamOe0NWczEZplLtFbNzqgEEqs
         ObqGf78xb3cVAkAwLeCP8HJ7qzfFfF4WkvXeRG5g9RlJj63ick/EV/whvuxH7QU/tZTT
         G1wWWZLv8+B/sCMYYltmvIs3g6Gfu7wZoGOuJLfDiIq/u1fCZNYob4L1TOl/iLcIEQaZ
         QbZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678177293;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wYZSGOL1Ow+nU2BHp0S6DvwtM6Br5RJflXI+aGJp8DI=;
        b=NZKVuxCGGftCOgBKeXPYrlrstjjkeWIAeFl1+9SqaQEcrstEhu72E7IfBYspbDNnOz
         2GKfW2mIk6SjCBxWe+xOt69P1dbr5iDbNxIjeRc6oRd08Yjl/Nlr7hjXIrh+QXyvha3C
         ZLdBGakaC2JUztyUge9lZ50jLLi+UFl0mc6le4sXJv5TjwuR3zoVzMRYHV4TGQLKzRgl
         AtSWV6dd4eV92KtiPd3OtFdFeJCXt4rxa//qeBzgKnFqrL1p87i4+ysQAKJA4CTJulgv
         gyxkJvbPFo6Nk1KzoC1z/xqQ2fx+mXvu1JuRLD4jcqGbOUW9duspr4IWWR5e0F+5e3LK
         c6Zg==
X-Gm-Message-State: AO0yUKWyaQh3ceBUEj8wbhvZDA1V8C0n/U1QWrUYuICMJQCKG9tz/1bJ
	CApnH0ZYPSdaeV1n7Q/m9MlR5g==
X-Google-Smtp-Source: AK7set/RllsDUnQJiE9pBV+kNYTNsrpeLeY7SGr0sAut9Djjfj0rOuaN+/iBn/YZCJAGCsThxCxhTQ==
X-Received: by 2002:a17:906:794e:b0:8df:e176:4837 with SMTP id l14-20020a170906794e00b008dfe1764837mr16460726ejo.19.1678177292824;
        Tue, 07 Mar 2023 00:21:32 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:5310:35c7:6f9e:2cd3? ([2a02:810d:15c0:828:5310:35c7:6f9e:2cd3])
        by smtp.gmail.com with ESMTPSA id de19-20020a1709069bd300b008ec4333fd65sm5697210ejc.188.2023.03.07.00.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 00:21:32 -0800 (PST)
Message-ID: <88761a86-a115-c676-bb32-f76cdd61f9f3@linaro.org>
Date: Tue, 7 Mar 2023 09:21:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/8] dt-bindings: vendor-prefixes: add chargebyte
Content-Language: en-US
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Evgeniy Polyakov <zbr@ioremap.net>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, Li Yang <leoyang.li@nxp.com>,
 Denis Ciocca <denis.ciocca@st.com>, soc@kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <stefan.wahren@chargebyte.com>
References: <20230306172249.74003-1-stefan.wahren@i2se.com>
 <20230306172249.74003-2-stefan.wahren@i2se.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230306172249.74003-2-stefan.wahren@i2se.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/03/2023 18:22, Stefan Wahren wrote:
> From: Stefan Wahren <stefan.wahren@chargebyte.com>
> 
> chargebyte supplies hardware and software products for all
> aspects of charging communication.
> https://chargebyte.com/
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

