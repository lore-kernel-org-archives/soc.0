Return-Path: <SRS0=atzn=23=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973AFC38A2D
	for <soc@archiver.kernel.org>; Wed, 26 Oct 2022 14:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4BD74C433B5; Wed, 26 Oct 2022 14:51:13 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58F63C433D7
	for <soc@kernel.org>; Wed, 26 Oct 2022 14:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 58F63C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f182.google.com with SMTP id r19so10049223qtx.6
        for <soc@kernel.org>; Wed, 26 Oct 2022 07:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hva1foFrg4UuynYENfZjPsHhhI5SWAEl5ulETHYurM=;
        b=XC32+REtK7XMnBGAJOz6my8KQnH8XwzZIpBz/EF3R7R72XY4kBiCositUwuY/4E2ru
         Z7M9yzD/fH4hiuIsFt5HvvYVcJioKOIrmukOEk82s9bF2L4Yb1VZVaQsXRqAtb7yLzXW
         EL7G7vCRsjrxOWJvURY5BecGL7eO2y8m+rHmnlJjBgsbtdX4EjtrMHCCVtRQTU+3YkwH
         +3YTzOvvbDVzhCWvBACYAqz2pqf9bHkZ1vtyh/jEiCbMmF+ogWJerCVeMzxYKTtq8FFE
         AQZ8u9V+99aJ2N9/xEvO9aNofzjb/OKW1/KVrSP5iPvBpQ1DHk1S3K0MDYk/akZZ8LEI
         DrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hva1foFrg4UuynYENfZjPsHhhI5SWAEl5ulETHYurM=;
        b=v1uFyM3SwDQ08ujL1NZj9LS5WmNRcncbdMz1gXfog1UXAdkNNBoK9QfFaTOvzd85nm
         Fo4TWKUNiKY2sasp9chNRW2PLvUogQnmCnMgU6WmEsKo0Q7P0fuV4X2resCifQrNG9WU
         Vjj1u275ux5/EdEDztwPAzMdWJs80M9i/xmX/lireJw5n3wRXO39pGkOV8G8IHHxv9K/
         AQjbyi/0J9qv1ViausXhsRlNFWGbnt51hbmMssJap/tGkwYyjXe9/KqdTlZsj4UWCGgp
         dYJjL8Vq1anyfAhd8yt9CHNCN1abPVZgdASuYLEE+NmK1IWA1h3dR3XbI91Zi2hKfAQb
         QfJw==
X-Gm-Message-State: ACrzQf3apx7tuXrSE7qGXMj9XNROlH21bTXgmRPPPK/+KkxV0ulZELey
	i2R/Uz+XjHGP8N72WAYiiw5Ftg==
X-Google-Smtp-Source: AMsMyM606Yymwn1vyo/THsRRiBvagUrAx2MJFtn8L38IpAMBivLhYEk6qt+oDIkMU7nS88/imN/evg==
X-Received: by 2002:ac8:588b:0:b0:39d:13b5:1b63 with SMTP id t11-20020ac8588b000000b0039d13b51b63mr26811583qta.670.1666795871291;
        Wed, 26 Oct 2022 07:51:11 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id dt47-20020a05620a47af00b006b953a7929csm796294qkb.73.2022.10.26.07.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 07:51:10 -0700 (PDT)
Message-ID: <0482a4bd-e159-abc6-a641-46e1853506c4@linaro.org>
Date: Wed, 26 Oct 2022 10:51:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: add compatible strings for
 Lctech Pi
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, soc@kernel.org, Icenowy Zheng <uwu@icenowy.me>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
References: <20221025145909.2837939-1-andre.przywara@arm.com>
 <20221025145909.2837939-3-andre.przywara@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221025145909.2837939-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/10/2022 10:59, Andre Przywara wrote:
> The Lctech Pi F1C200s is a small development board using the Allwinner
> F1C200s SoC.
> 
> Add the compatible string list to the bindings documentation.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

