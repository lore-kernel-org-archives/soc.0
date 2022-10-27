Return-Path: <SRS0=QEF6=24=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B69FA3740
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 14:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A33B9C433B5; Thu, 27 Oct 2022 14:54:28 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B08BBC433C1
	for <soc@kernel.org>; Thu, 27 Oct 2022 14:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B08BBC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f174.google.com with SMTP id f8so1078398qkg.3
        for <soc@kernel.org>; Thu, 27 Oct 2022 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nfbp8pspODEp+xRWH3kwW0z3nJyD6n0aVJFt78h3zaQ=;
        b=fSojX1LB55TUNsmuvX/srESk17bNDXREqM56f4nZb0T4+9OPmC75XPLFnWY3Rkqqf2
         hZJY5f51Y57FVj2WPAM1Ad1Wm4KoVcpPJ6mAGTcA8EtsoFDNTt46u4Ord36f7zLR+6DZ
         7a/Pnmjn8qUi2WqQUgNOfkmv7erH+HiwWz1oUp8Kgyby992HZsnsfUqVzcBczhhxgH3Y
         cGtL8xOrXK3i2O3x+Hs2+eMbz2eaNqnDFrw5wT+gCZ5jOQIsZ7aEv51UqMxensCgE3lG
         MR9QzIP58v4+ftlCoGCd+vXCcfvVTqKW0ZRVJy6/CPGJbXysJFn+RWmqfYROhFq4TEbA
         vbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nfbp8pspODEp+xRWH3kwW0z3nJyD6n0aVJFt78h3zaQ=;
        b=sdjrKxN07Hw24M26KGyL68I6KYHfycuRUoa8Fm5M1Wx6YmqXcmSrVdQwQteqAj7i1v
         /B+YtrqRJTdfW3/bal5DT4zYZKojI00gzrc3f7M5U1qHts/pFAOh9h3B6bWMbum3AJFZ
         MoG0RAelaR4y36GaRCE4CbFo7OGc5ct+eLBqcBW4+htWzKywM+4xuYD6uT9RO+snPHBi
         o2ZEohTCRDs3+UYEIeESKbzPNFyJ5X27Rd7j9LMElinfxgMHovpqYgugvk+B3ZOqVrac
         UDBjF7u0DpwQjcPoZ2rGby/QO4zx1Bas/9OqRbBhOpwil9sSpz4AiRUyrG6amsR5GEPV
         mqrw==
X-Gm-Message-State: ACrzQf2TYEEhkqy9zCVgdiM1JeRITbQ3ffpTdGXWzpi6iLBoXPZI2yRu
	8Y2iezLY2w3W2JJUKjURpmvP5Q==
X-Google-Smtp-Source: AMsMyM4DLzuxFqJwhZ46bXuWKN9iZ8lXhey8EdTFtw+NyLQ3GG4BP4qXN0IZ8R2Zt0qhU1YQijwceA==
X-Received: by 2002:a05:620a:4245:b0:6d7:6d51:f66e with SMTP id w5-20020a05620a424500b006d76d51f66emr34344135qko.617.1666882466686;
        Thu, 27 Oct 2022 07:54:26 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id bs15-20020a05620a470f00b006ec09d7d357sm1125319qkb.47.2022.10.27.07.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 07:54:26 -0700 (PDT)
Message-ID: <4b32310e-2f93-66ea-aa94-ceff3f0523d9@linaro.org>
Date: Thu, 27 Oct 2022 10:54:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 2/4] dt-bindings: timer: rockchip: add
 rockchip,rk3128-timer
Content-Language: en-US
To: Johan Jonker <jbx6244@gmail.com>, kever.yang@rock-chips.com,
 heiko@sntech.de
List-Id: <soc.lore.kernel.org>
Cc: sjg@chromium.org, philipp.tomsich@vrull.eu, zhangqing@rock-chips.com,
 hjc@rock-chips.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <da1252eb-85e9-bdb8-0542-207173523523@gmail.com>
 <939d9e2c-4431-5408-5884-12d328b6a4f2@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <939d9e2c-4431-5408-5884-12d328b6a4f2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/10/2022 20:52, Johan Jonker wrote:
> Add rockchip,rk3128-timer compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

