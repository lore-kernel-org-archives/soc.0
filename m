Return-Path: <SRS0=7lJw=U7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD0FC433F5
	for <soc@archiver.kernel.org>; Thu, 21 Apr 2022 08:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 402CBC385A9; Thu, 21 Apr 2022 08:33:13 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 61248C385A1
	for <soc@kernel.org>; Thu, 21 Apr 2022 08:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 61248C385A1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id z12so5564220edl.2
        for <soc@kernel.org>; Thu, 21 Apr 2022 01:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7hLXPIweBUa1OCSsueogoc1wGUx6MfJz9AL8E0t93jg=;
        b=U4hZWxQ15Dqk0wtSihPrY5dFY+Zd20Mw5s2nwZe/wuuUZNAPoYt6v3Y+Pk721XjIMY
         fN54vNkZUqedcCEZVb9LaQvCq4jyFloChkMzBlAMlwXRBBMOpjl3jV7yzfnn1L5h7d8f
         gjhu4UIgZeV4rPAHSvnAV2Tru+nY6L+szdOV0wm5scuOBPPtQ2b9FU3br17C+1P9v2my
         QgI/tuS6cJ4JdJCR74VtChP6CVi2iuGRe1XLq1ScwUPPjqsO+4RxTHGfZIg4aH9V8kPV
         xLTZEN0Zs5SPdj1FWHSeNgQ9DPxTfBTZwvt72oMiooqYosg12DekYECdb8i0nE2r9shF
         7FCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7hLXPIweBUa1OCSsueogoc1wGUx6MfJz9AL8E0t93jg=;
        b=OFmpyN0ediSGQL2hBRrko8BATixBk81or34c5X3QR9RZ+GOh2POwSCWXdL24JtmCMy
         trDOSqaexhTn79Sdhwj2MDhChBWPML3xAiTqzqO7C776opnxgW1k47b9jQ+TvvbC2B71
         iBIxRim30uCVIksn/1bEEP3/1WhdahsvYKsAgbG5478nqE1b7GKsNURnpClAnS5KuHY/
         +cwPQ56vlLBI97nUnUARELa6RuFaa5oJvwRnAig/sA4xggmNQgSlCeJU9spOOw1QXcwX
         XJVnLseNEEV9rBZ77vqIsj71t9BWZS3AOG3/AILt5PblEAeLKQgUAU+5WlS417yJzHvc
         dLew==
X-Gm-Message-State: AOAM532vDA04ju6ZSZqzHm3yqKXQQMyl+jMQkq+8rwlnEyUVh/xD1KVu
	PPxHOKwLNbxlFE+a+9r6aagwfA==
X-Google-Smtp-Source: ABdhPJyNiZUR5/1EAoV+iZUhUgCKupJDomQq/+l5hKN9S0IbtjtPAKPEGxqD9/YunVEWQ5kpF8Kh7w==
X-Received: by 2002:a05:6402:51d2:b0:424:536:94dd with SMTP id r18-20020a05640251d200b00424053694ddmr12066971edd.191.1650529990792;
        Thu, 21 Apr 2022 01:33:10 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id v8-20020a1709063bc800b006e898cfd926sm7546603ejf.134.2022.04.21.01.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 01:33:10 -0700 (PDT)
Message-ID: <51f47c39-4bd2-b378-2868-587c07caf399@linaro.org>
Date: Thu, 21 Apr 2022 10:33:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 5/5] dt-bindings: arm: Add initial bindings for Nuvoton
 Platform
Content-Language: en-US
To: Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ychuang570808@gmail.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org, arnd@arndb.de,
 olof@lixom.net, will@kernel.org, soc@kernel.org, cfli0@nuvoton.com
References: <20220418082738.11301-1-ychuang3@nuvoton.com>
 <20220418082738.11301-6-ychuang3@nuvoton.com>
 <fd9316a6-7df6-e1fa-50dc-ff50934afb5c@linaro.org>
 <caf4867f-7f71-9262-f190-463325eb13ab@nuvoton.com>
 <4e9eaede-2208-bd73-35ae-89e128562653@linaro.org>
 <80994f4b-136f-7669-4674-0c9826e88248@nuvoton.com>
 <43cb61ac-461f-e6ff-b495-44f8befde79f@linaro.org>
 <257d878e-8455-2770-7868-c9445b0eabba@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <257d878e-8455-2770-7868-c9445b0eabba@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/04/2022 10:13, Jacky Huang wrote:
> OK, I got it. Like this,
> 
>    compatible:
>      oneOf:
> 
>        - description: MA35D1 based boards
>          items:
>            - enum:
>                - nuvoton,ma35d1-evb
>                - nuvoton,ma35d1-iot
>                - nuvoton,ma35d1-som512
>                - nuvoton,ma35d1-som1g
>            - const: nuvoton,ma35d1

Yes, exactly. Thank you.

Best regards,
Krzysztof
