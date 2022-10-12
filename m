Return-Path: <SRS0=0I20=2N=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790F0C433FE
	for <soc@archiver.kernel.org>; Wed, 12 Oct 2022 13:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 351E2C433C1; Wed, 12 Oct 2022 13:10:46 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 39BACC433D7
	for <soc@kernel.org>; Wed, 12 Oct 2022 13:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 39BACC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f170.google.com with SMTP id o22so9973683qkl.8
        for <soc@kernel.org>; Wed, 12 Oct 2022 06:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C7G2Yq+rJ1ZhtKUz9+hk3hjumuAmKCtJeLM6FaHLR48=;
        b=EBBu9Jumc1NjlI14sXDx18bN/BhlEoRIemgjAThwEMFR4FDMdr837XPmF153c97kiv
         KgcAuD/nM2Euj12kgMiaOXwAOTRq++/xwzxIHQmpe6xRr1dqHJ9MqCeA0wdscFQgL02T
         CF1Hk19v2NS1ExOdWA0ZFZYbLAmAIWU+Xr5GoCiIpHRVVNzhVvWjKtRJH29P+eGXrADl
         6nbKtAfmckcRubnodOptTE8/cnKXnI8/6vjIoMXu3UUADv+mF4+YcqeTq3/VO7ndRtX1
         hOhdAW3sgs2C1nkaSDXIr6P4rIAH1T94fuJJEAZ3zc7ZiMBzfB3S499/GZOz10ZE7NX6
         cigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C7G2Yq+rJ1ZhtKUz9+hk3hjumuAmKCtJeLM6FaHLR48=;
        b=AICi38clSLcrTn3lol/vk2ZD/C1XkmEOfV1uIWWAYnmWNnmvVSZhc3Z2y2RRQP3wag
         vpTa0oSkXOFbkds1qL4757Xgh67jcyCJ6Oji66PppFljhgVYRkrHVz03JEaHvbZX2mmZ
         UjFjSLl9C5B1k+Lo7UxgRh3SU2PL/bCDtNCkslNtd4X43v5ZHFg4D+5zCvmoqpyhRLez
         rCvGHlvm0iPNePYxTH4GmmYbpNTU97d6KgcJEXiSuWHsEtZbZgEA5HtmhJBidfZclg8k
         KwuZ5HpCqGRBlGdz8snFF32F7fkNl7NyWBIbn5eOMQNcgko0BZP1ysk+hz68qx1gEBlr
         hnRw==
X-Gm-Message-State: ACrzQf2zJ2R6ozMAL178bRa+K0F3ZOtbg3gLWi9UzedaZgiQawQpnL1B
	0HfAf1fjh3IJYVMsPwh1fGwqyA==
X-Google-Smtp-Source: AMsMyM47s2HEd/ei/G/HHcLx+xnZuL6fbjDhrLQjxBM2msx4b/k/ATJETtbWtIuy6tjp4xspUJ11Ug==
X-Received: by 2002:a37:2e84:0:b0:6cf:8dd4:7adc with SMTP id u126-20020a372e84000000b006cf8dd47adcmr20148712qkh.723.1665580244143;
        Wed, 12 Oct 2022 06:10:44 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id br7-20020a05620a460700b006e9b3096482sm13642940qkb.64.2022.10.12.06.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 06:10:43 -0700 (PDT)
Message-ID: <4e5ed6bf-8af1-d8b9-b89a-e9207a6ea756@linaro.org>
Date: Wed, 12 Oct 2022 09:08:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 03/10] dt-bindings: usb: sunxi-musb: add F1C100s MUSB
 compatible string
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
References: <20221012055602.1544944-1-uwu@icenowy.me>
 <20221012055602.1544944-4-uwu@icenowy.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221012055602.1544944-4-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/10/2022 01:55, Icenowy Zheng wrote:
> Allwinner F1C100s has a hybrid MUSB controller between the A10 one and
> the A33 one.
> 
> Add a compatible string for it.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

