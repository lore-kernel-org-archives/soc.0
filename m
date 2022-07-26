Return-Path: <SRS0=xttv=X7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3462EC3F6B0
	for <soc@archiver.kernel.org>; Tue, 26 Jul 2022 17:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E0D80C433C1; Tue, 26 Jul 2022 17:31:54 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 29BFBC43470
	for <soc@kernel.org>; Tue, 26 Jul 2022 17:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 29BFBC43470
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id m12so22585155lfj.4
        for <soc@kernel.org>; Tue, 26 Jul 2022 10:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=nUsqrIcncbnAblsl66lT/lEZJ2lw+9ku+eiTV2ZWI6Y=;
        b=OyRS/08wVlN551H9uCmoUeTFl2tMNki5reqZdw3CT81GT8LgTsXqk1jO57wdUodH2g
         xc0iJX8XCvFuVYwQ/TJofmliTWDifgjexn294tm1ofBY/7Dkr9wcE3a0RHERg68yW0BF
         9rS2N2dGVl2hPGLGPNDHr4BhG02/Gg1a0TpywMqZI2oScVjP9Q+tPkdGhZgbwHdPPlw+
         2mRzXFRQhiBmN/gldSjIrf6WnAU3VupQ4N9v0FxN/F02J9FkTy/8S8QqfDQFAnS3T9vT
         vybmAQ/bonklLF/sgF594c5gQRduNdZpShCNQ4bnixqwS575JB57AADT1wqextDJ1JFc
         qQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nUsqrIcncbnAblsl66lT/lEZJ2lw+9ku+eiTV2ZWI6Y=;
        b=Q37Bw4UCwkO99vrxDs+v40SeGI81ZNky4o1FwkmvAqq10ZO6UdTqbb11VyLag9tcoG
         pBdABD9s1EObJz3DeXDVMG3MZ6n81yGsD3BGZqAVt9ucIK1wiiuLAL9QW38hQEVgRzEJ
         AmhCQ6t/hjO79ugk+3U/G+YwncTaKexs/tRwCw4YU2xZTjfQi/m8n93T3VMl7+wOZ9wN
         qk7bkpjkKxUhrhIwSql0K2awdjwM8a6BqNS4l/PX0ENnAQ0aXz387lRWpTFUHbeg4cYW
         WrppKgFkd3W9tshPxQQnq1WdcRfHCmlL+9SsAucpjWCav5yQmi6elPT4v1LyUnjai39z
         ukGg==
X-Gm-Message-State: AJIora98WnFJJQR4b5XLv4N3f1vJvBNkFpJJLA3OR2pIfcus8U41RxHt
	C3pal0njJ0TcfH2wIsQHdqNikw==
X-Google-Smtp-Source: AGRyM1thhHPJv1gCsMqopzoDCU3kSSNaevw3WpkoAl9o10A2PSZBRyQoWCrT5Ve7WL8oKcVOHuWQbg==
X-Received: by 2002:a05:6512:1092:b0:48a:766e:7e20 with SMTP id j18-20020a056512109200b0048a766e7e20mr7071165lfg.646.1658856711127;
        Tue, 26 Jul 2022 10:31:51 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id t12-20020a19dc0c000000b0047f9cfa914csm3319933lfg.18.2022.07.26.10.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 10:31:50 -0700 (PDT)
Message-ID: <d83f7689-303f-cecd-882a-ed6e03a8db5b@linaro.org>
Date: Tue, 26 Jul 2022 19:31:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] dt-bindings: soc: bcm: use absolute path to other
 schema
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Saenz Julienne <nsaenz@kernel.org>, Conor Dooley
 <conor.dooley@microchip.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220726115841.101249-1-krzysztof.kozlowski@linaro.org>
 <20220726115841.101249-2-krzysztof.kozlowski@linaro.org>
 <a70148d3-c87f-969a-b743-11c679d161d3@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a70148d3-c87f-969a-b743-11c679d161d3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/07/2022 17:59, Florian Fainelli wrote:
> On 7/26/22 04:58, Krzysztof Kozlowski wrote:
>> Absolute path to other DT schema is preferred over relative one.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Are you applying those patches or do you want the SoC maintainer to do that?

The best if  you (SoC maintainer) would pick them up. If you cannot or
it is too late for this, maybe arm-soc could grab them (already Cced).

Best regards,
Krzysztof
