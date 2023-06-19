Return-Path: <SRS0=YV+F=CH=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D61EB64DB
	for <soc@archiver.kernel.org>; Mon, 19 Jun 2023 06:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8FC47C433CA; Mon, 19 Jun 2023 06:56:29 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9B9B0C433C0
	for <soc@kernel.org>; Mon, 19 Jun 2023 06:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9B9B0C433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b46d270ea1so19643101fa.1
        for <soc@kernel.org>; Sun, 18 Jun 2023 23:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687157785; x=1689749785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVQvPmZfMjyE4EriF44N+ZqOy+pXJULp7jhybIMTZRg=;
        b=Nz7oMq/2JerE/qSJ0p1lmM0Tc6F/T4n0tY/5puv07oURkxjNaE3hnag7QPHhBQjjtu
         pVxH+uT/izoeyx1d4ygzWZPMkHcF3kXs3BSobsB0Z/iATiWJ9slFaccqjZs+5nVaRg9l
         xaKTFpVuIW6y12JVg0ZeDuO+vLXn8SIDk8GUMppBI4UXBKFzuGKyX1xVaYDLDQjWsubT
         550gEcY9B6WXteuUHKUJk3DU3p4BUHhK3cLpmq4h93naDBxH8tvUzPG3dSwkmteTcnxE
         pIXu6PX7TznbjL37tyhAa4kt9fasvG4OKhMLYeiqIOMBjWBxam5eGAM8trzdor1oITs/
         yIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687157785; x=1689749785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qVQvPmZfMjyE4EriF44N+ZqOy+pXJULp7jhybIMTZRg=;
        b=Hwi6UH0B0tRBR7AkZt81lFLo1Z6DBODVhtJsW6sgKJMKcTxZqRSu7ZP8hSwZS6xs2j
         1RzHIgVz5sHG+nEc9qFJsL6k9z6wL7zsMj73umF/l7F5al9Zwgs5f3HQxAYmt1MbHEOV
         YfNQ8BcEdEuxK8eAGTTxV0h5ICnp4r+PiDF3Iuz1SsDu7hYd8MWHQg+9kbxsfiR240k4
         71BuJOlXaHhfaDj7o8xqlfNKkffx4T57211rH3TgbC6XUls18Vu6YWcxebxLUVILiv47
         tZXrFKPE18oZHqAgBnWE1q9wyc8ZGq7aVCcqzysGJGNiVvB1cX0MKtlW7IVlCb66f/Yk
         yBLw==
X-Gm-Message-State: AC+VfDw9KJ+E0FxcqMTQMbh4UIn7odDypHxLJORYLfIf6AoEtjPcQB6i
	RP74v2x8QEyrGPHoMZm7IJpN/w==
X-Google-Smtp-Source: ACHHUZ73QHeatxNWNXWGjtENaICZG2mDwLhCI1onbdo3FjYTjn3nlSLNYVQvlsMOir4Fl3iZo9lkMQ==
X-Received: by 2002:a2e:9a8f:0:b0:2b4:470e:8447 with SMTP id p15-20020a2e9a8f000000b002b4470e8447mr5553201lji.34.1687157785301;
        Sun, 18 Jun 2023 23:56:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id o8-20020aa7d3c8000000b0051a575c76e6sm1172846edr.43.2023.06.18.23.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 23:56:24 -0700 (PDT)
Message-ID: <2a9e503b-7a5b-3b1e-a912-5d54a23c1ca1@linaro.org>
Date: Mon, 19 Jun 2023 08:56:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Inventec
 starscream-bmc
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: PJ Chen <chen.pj@inventec.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Cc: ye.vic@inventec.com, Huang.Alang@inventec.com
References: <20230619064249.3623-1-chen.pj@inventec.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230619064249.3623-1-chen.pj@inventec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/06/2023 08:42, PJ Chen wrote:
> From: Chen PJ <Chen.pj@inventec.com>
> 
> Document the new compatibles used on Inventec starscream-bmc
> 
> Signed-off-by: Chen PJ <Chen.pj@inventec.com>

https://lore.kernel.org/all/3106c4a1-ce5b-a9c4-5cf4-6adead7fce80@linaro.org/

https://lore.kernel.org/all/2e06e7db-64f9-51f8-adf1-b240f30a2608@linaro.org/

What's unclear here? You did not care to respond to that (the second
part of that message).

Best regards,
Krzysztof

