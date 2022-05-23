Return-Path: <SRS0=CAhr=V7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974DDC433F5
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 07:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5F2D1C385AA; Mon, 23 May 2022 07:31:40 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0AB4AC36AE3
	for <soc@kernel.org>; Mon, 23 May 2022 07:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0AB4AC36AE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id br17so11735233lfb.2
        for <soc@kernel.org>; Mon, 23 May 2022 00:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KyV9lT9+ytqJp/YOSL0Uwp6DljeF8AaxfinieX67j3o=;
        b=lYKCMl/RGy09NhRM6yiabyzHYXnCsb6xykBD2OmT7C4UGXL/tS5cDHEr01DiJT8wXk
         GDf9X9/aRLHK1aymH4u5opnx2hngCfPwvCdog5UoF6q/sWbvrzunVSLIQmEhmPnLAFAi
         VkrnAqF0VCikJaynFl5OSGuVIeoLsaCeMiLJuorcsw08+U7Lmi9vU+0A0pLIzwN6ScZn
         y2TLWJEJ+umDzjeFsXXL9+fYVXTyfd2nsJS7sZCg1RQY4LOavXbz94DUAJQUCzyY34RA
         8CFQAdnNMsY/ImY0bdfrrWurLzTAAB7MumIRewwvAImYXo0/Tel3qr5Cu0dKYX4hsIPB
         Gr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KyV9lT9+ytqJp/YOSL0Uwp6DljeF8AaxfinieX67j3o=;
        b=wRl/femTtna5x9SiiQqE4iRleAu8giIjx3K+3uLmyEdHM9Dq/ZaZxRnCIg9WMa47yW
         vv5Q/0yaDd9hkC+XoykQyolV+eQQoXk8H2UGv/TuPdCkp8ZKTCm9QkInt3ud9uRQnVz+
         Z06fmgU/txfK/F/b3GTVGZQXFcNp3j/gaXnaDAwmYI7p2UjISUNIeeBQSVj2vsIQ3Nym
         ZZC6RwedwAd1F+Y2I84ajoppRgwlR13BUzT0JKbbAL8dIiJ5cH+ktMq1TldSsLJoilKn
         S4jCNpuPG8W6622fxsSAoQncHGI508eCmKBK9hZXH3q+mCom3eeX/o/DN0qtCOlB33oP
         33hQ==
X-Gm-Message-State: AOAM530Io1yZdBJAdAEiwLjfrGH2zH9wA/mr8PhjzN3nLQ5xS2H/w1Rj
	4mohCCCalJEahAy7AkebwpzwUg==
X-Google-Smtp-Source: ABdhPJyGZyOu9VIxr33EGSOKBZFSxGoiwpEjxX4VFoXSuoPjjAbUXKOBkNH955vm37QLR3a4tkoUxQ==
X-Received: by 2002:a05:6512:927:b0:473:ebb9:ec7d with SMTP id f7-20020a056512092700b00473ebb9ec7dmr14833260lft.637.1653291097068;
        Mon, 23 May 2022 00:31:37 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 10-20020a05651c00ca00b00253e88591f1sm817885ljr.23.2022.05.23.00.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 00:31:36 -0700 (PDT)
Message-ID: <bff38fba-86c7-36b6-c616-cd96d2a22111@linaro.org>
Date: Mon, 23 May 2022 09:31:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 01/19] dt-bindings: timer: npcm: Add npcm845 compatible
 string
Content-Language: en-US
To: Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com,
 tali.perry1@gmail.com, joel@jms.id.au, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, wim@linux-watchdog.org,
 linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 olof@lixom.net, jirislaby@kernel.org, shawnguo@kernel.org,
 bjorn.andersson@linaro.org, geert+renesas@glider.be,
 marcel.ziswiler@toradex.com, vkoul@kernel.org, biju.das.jz@bp.renesas.com,
 nobuhiro1.iwamatsu@toshiba.co.jp, robert.hancock@calian.com,
 j.neuschaefer@gmx.net, lkundrak@v3.sk
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220522155046.260146-1-tmaimon77@gmail.com>
 <20220522155046.260146-2-tmaimon77@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220522155046.260146-2-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2022 17:50, Tomer Maimon wrote:
> Add a compatible string for Nuvoton BMC NPCM845 timer.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
