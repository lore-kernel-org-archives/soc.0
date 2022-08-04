Return-Path: <SRS0=2uS4=YI=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F05C19F2A
	for <soc@archiver.kernel.org>; Thu,  4 Aug 2022 18:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3EC37C433D6; Thu,  4 Aug 2022 18:11:30 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CC21C433C1;
	Thu,  4 Aug 2022 18:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4CC21C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id c3so211952qko.1;
        Thu, 04 Aug 2022 11:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=37y1pNEyQ+ddREX5K3poWhk+osrjYe1S/O8gGeEYV/s=;
        b=XcUgUM14PB1rlQx8PWU05XJdYwxpGH95vXAU1vNxBwwBGgsb5J9xX61pPBfV5V0ddc
         B7uuHsIwFNy5VdzmEYs4+v0lNIQlUJ6IzCg7B7ZWaqgKH4X7jJRzYmPjW/FR/1C07hGo
         FKzCQMGlZWq+oqTg8J7e1JhAo+VZI5vqD5FPqDoSnHqrx73iRxwiN/AvprUf7LNTAU1X
         4Q7Sven4ksdBwjhdXUYtHz7xsS6X2PwGc8/ZTzGxwninwdSkfyx3kgn4/ReO+Iqf7FGh
         mbLetj4EdRfGkqqGzSfpDINsGjm8KWaH37ksejtLjGWJ0IvHnBU2zckAVGIHuWW2CGJ+
         JX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=37y1pNEyQ+ddREX5K3poWhk+osrjYe1S/O8gGeEYV/s=;
        b=xJVDIdv7vl0soZkn/inQpmg+c/oayl22gavJWk7bv3Vmg4vJ1k9TpV6/3KfLU9gY8Z
         K+qUh0DB3Do5OoE4UJUD5E1tbV91UHYwYLYUrW01wzhxuD/PLxGlKC/KD5CUhNQPOxL6
         1uJSr0ip2U/kAVkqGpBNnEEjMi5xFNgCz1FY1gs0fYKaszq+gyKl2r/4x5pnIP5hrpUk
         jqPEwpVFZ+TzjbO/KyDffR7bE71nAJXuVu2I4aku8pUHyUUd7L8LKHcEPkwdvgaqax7T
         t8we27O+kyJPHkFV7HsW0t3bzlc7qFFR12Qma+00TQZDU1fWj+HtUR55hA8X3nYwvRjl
         nMyw==
X-Gm-Message-State: ACgBeo3AvV3iXjuyO6lT5qNtbzj2rLt84lA03JB4JzwycBUyyZtig6yK
	wm7R3QcvxKI2fgT1aQ1X2Zg=
X-Google-Smtp-Source: AA6agR4EMHKVAO4xz80mWJI5XkyalMXnqJMhr9DdtUfGt7By7jtilYYT3BzC5TDnMIh6vEefcLO2sQ==
X-Received: by 2002:a05:620a:bcc:b0:6b6:5746:f8f9 with SMTP id s12-20020a05620a0bcc00b006b65746f8f9mr2334700qki.729.1659636688203;
        Thu, 04 Aug 2022 11:11:28 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id bx7-20020a05622a090700b0031ef67386a5sm998062qtb.68.2022.08.04.11.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 11:11:26 -0700 (PDT)
Message-ID: <143a7faf-70fc-010f-bdbd-9f96f918c280@gmail.com>
Date: Thu, 4 Aug 2022 11:11:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] dt-bindings: soc: bcm: use absolute path to other
 schema
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
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
 <d83f7689-303f-cecd-882a-ed6e03a8db5b@linaro.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <d83f7689-303f-cecd-882a-ed6e03a8db5b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/26/22 10:31, Krzysztof Kozlowski wrote:
> On 26/07/2022 17:59, Florian Fainelli wrote:
>> On 7/26/22 04:58, Krzysztof Kozlowski wrote:
>>> Absolute path to other DT schema is preferred over relative one.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
>>
>> Are you applying those patches or do you want the SoC maintainer to do that?
> 
> The best if  you (SoC maintainer) would pick them up. If you cannot or
> it is too late for this, maybe arm-soc could grab them (already Cced).

Arnd ended up picking up patches 1 and 2, FWIW.
-- 
Florian
