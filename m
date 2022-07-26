Return-Path: <SRS0=0qZW=X7=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59116C00140
	for <soc@archiver.kernel.org>; Tue, 26 Jul 2022 15:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2B776C433B5; Tue, 26 Jul 2022 15:59:23 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A3BBC433D6;
	Tue, 26 Jul 2022 15:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5A3BBC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id y15so13707803plp.10;
        Tue, 26 Jul 2022 08:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=57o1v3WV4ubipwS3abJpah9hJJPNNRgMDiHh3namw3I=;
        b=WcVN2HanxONRGtLe8KqmdrJozSjLhVzY+wmRxSjqz1fQWrfLaSUfT1Oic9Fz/sJAWD
         8K4kHje+I2el/DpNX1yqJH0zDrf2aqvCsArGN5jMyadNrU1nEYvJb3kcINX4Afll2IMi
         53yIun0jyE9Lqvp0+O6P8vxzMSkCcRIlc8bzFrZoeQV+3qJbcqv9xOxRsi8ByCe9EGSs
         3Z4HOkjU2TJduL2tSpxiFFLku1qLy8Zm9PERgLpCaxkFS//p/dHtR/UP6EOPEmWJUAtV
         38zTl4meS1Woeqrd8NxGvHP96rQVfjR+KFKnmJ2kiNFB/l6q2QTHooj1EVAbzqrg66CH
         LK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=57o1v3WV4ubipwS3abJpah9hJJPNNRgMDiHh3namw3I=;
        b=N67vapztSJurMo1OJqPqi7MRrVziTqEzWNlJArVQT1i2KUCDdoyClEgVoFXCMBJZA0
         nTbTtyMbGl3YDqOcMPrYu+ntAWqWB3TBSjhSjvU2lSycFT8TsaqIALVeavIUTEPzutDS
         0iF92vFStUyCD223ZYXyqRzTe0VDLremhpdHhlp162ifPk1yUQB8AUaQDlJYagUFrfPA
         enyiYSo/MjUjJt0EAyehBuGcGxDYrfPJv4U/Pe6b+7JdBm6H0SlN2nZpVIpraYYMoayH
         OWk1lxTBf4m//cjHj0scFff8CM4SR+/S6sCGlc0yptpaDqEB939fcowaXvlZ2h3u+tCd
         XRgg==
X-Gm-Message-State: AJIora+ji5jRbcwtqf9TR0uelB96o3FI5zxCny8mzQubeYjGOqMEb4ut
	T6hFismCXC+wrIAm/q4ynBM=
X-Google-Smtp-Source: AGRyM1tbdXRJNvLagf6KQtq7gWhtRWdov/3CcSwRZ96bA4SvoNXcT+j2yMwVGZ8DxvVKa0R7hq9NQA==
X-Received: by 2002:a17:902:cf09:b0:16d:69ad:e496 with SMTP id i9-20020a170902cf0900b0016d69ade496mr12248813plg.6.1658851161643;
        Tue, 26 Jul 2022 08:59:21 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id i29-20020aa796fd000000b0052b94e74e45sm11792118pfq.204.2022.07.26.08.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 08:59:21 -0700 (PDT)
Message-ID: <a70148d3-c87f-969a-b743-11c679d161d3@gmail.com>
Date: Tue, 26 Jul 2022 08:59:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] dt-bindings: soc: bcm: use absolute path to other
 schema
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
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
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220726115841.101249-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/26/22 04:58, Krzysztof Kozlowski wrote:
> Absolute path to other DT schema is preferred over relative one.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Are you applying those patches or do you want the SoC maintainer to do that?
-- 
Florian
