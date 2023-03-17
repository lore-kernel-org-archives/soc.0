Return-Path: <SRS0=IDeX=7J=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519B5C74A5B
	for <soc@archiver.kernel.org>; Fri, 17 Mar 2023 09:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0DA88C433D2; Fri, 17 Mar 2023 09:16:11 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7ADABC4339B
	for <soc@kernel.org>; Fri, 17 Mar 2023 09:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7ADABC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id w9so17828889edc.3
        for <soc@kernel.org>; Fri, 17 Mar 2023 02:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679044567;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p0oeLyNfd8INjHtERjaxe36cGB4+loSHIwbTN8QYeus=;
        b=r1Ey9awg5yYcy4na36SfkGZgDeBbTR70Klqn5vB6SjfNI+wN0ESrIrpJdduu0/mSx4
         spsbHUdTur6CMBjZW37DdhgOH1eJV3KRJFaV5Uzudjs1CUha4Tft8QDNU6CPwrBpRO/X
         8vAUeJaA7Mk0t6BFlnDhMd0Q7Qj/KbqzeneEz9yLoUL4H6qh9JakQlqqeCIsAO+TaoAY
         RijF60AkHzlCljHSPM/K2y2yv2t2r5edMj9NjtFNVEeGCLjww5WcNDEfKmXBemHHYSsz
         eW6m4kPttL+W86qLQSjXyYtywp/gDLC/qeplKYQ6WBjv0kaWcTXp0rWIPdGzVj6cvuCc
         rpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679044567;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p0oeLyNfd8INjHtERjaxe36cGB4+loSHIwbTN8QYeus=;
        b=YVoVhACADQOAVn2oe9RI10WB33BfxR2L8+TFSnSorUea5XhmW5zvJTLzRWim2KF8BD
         7OgdvG+boyxhcGObCBUZmrd3TngEaPFjLG5f8tqdxlmKJsrNwk5Um+TDl7zKqBEEoiTK
         kZeS4YzPUCv19mb9gSby4x/LzZUJ3Oq6tbRFuYSGNcHg/XY4r1ucEmQ7q2LkkP0yX44O
         egJqvMNrj0p1WcsfgKo1EmNdX9D9bEqabgbofHyVqiO9wHsn2f1AWZ8qKglIXAqR3IsC
         QqbDEMwFJ9K64DBK5owO0t5YjxWU2THz9OGepAMCItZUiZbSjG4aqwSYAA3pkyVGDpXe
         1Vfg==
X-Gm-Message-State: AO0yUKWIDT5pJFrgx5jXl63Y4E547GgQPtwHZnX0JEVi3+qKuCDnfu9i
	fFjXM0brX/rFlDwBQjoDEjP9aA==
X-Google-Smtp-Source: AK7set/wACy7YqjpgaUoezd1YxrsDIHP34IU0l2uHdUCEgocAK4gqmYO1KivPl3ykrSMyiCvh8o8fw==
X-Received: by 2002:a17:906:3417:b0:92a:f756:28fa with SMTP id c23-20020a170906341700b0092af75628famr2289156ejb.31.1679044567716;
        Fri, 17 Mar 2023 02:16:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465? ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id lt2-20020a170906fa8200b00930bbf7e894sm746627ejb.35.2023.03.17.02.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 02:16:07 -0700 (PDT)
Message-ID: <de305bbd-b912-a1bd-6bd1-b9c1835ed47c@linaro.org>
Date: Fri, 17 Mar 2023 10:16:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: add compatible string for
 Tolino Vision
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, marex@denx.de,
 max.krummenacher@toradex.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230317081618.2387407-1-andreas@kemnade.info>
 <20230317081618.2387407-2-andreas@kemnade.info>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317081618.2387407-2-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/03/2023 09:16, Andreas Kemnade wrote:
> Add a compatible string for the Tolino Vision eBook reader.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

