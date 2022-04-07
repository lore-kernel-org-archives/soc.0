Return-Path: <SRS0=bijT=UR=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9568FC433FE
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 15:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 386ABC385AB; Thu,  7 Apr 2022 15:32:49 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A2935C385A5
	for <soc@kernel.org>; Thu,  7 Apr 2022 15:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A2935C385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id p15so11633254ejc.7
        for <soc@kernel.org>; Thu, 07 Apr 2022 08:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DFgO9JddDHmoRuVn2ZPzU+MXFPn5DQlDECjTYk/+IjM=;
        b=etnNwUNrZy+kn1KBn4YIpJwNbeshptJH4Fm6WZ+D4OqvvMVOUq0rLC0veEqzlPjQmB
         6jcYLMPVZ5rrNmVHisvWszE0xv0oteiK+4lHaPAuOktcV35kdr08ILA52HkCCCAFyEm3
         BGRrvucNz7UduF8B3mSY97tls+29nup8xDi3h+0XvvxUdncbBpUm65jRbM/KrU6En3q6
         qvkiGNHmtiNYbsH4Nkr8aI8UsKvI8DX46Xr0odQBjHxtz3893zyk9V6V+rWUzvBonVav
         AobD41RDLEWiY5+K0G49Q5CvjzqK7MV6ZFR75Rp+WMN2gQhiNBHIQag/sqzZsenvJ/p8
         Mcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DFgO9JddDHmoRuVn2ZPzU+MXFPn5DQlDECjTYk/+IjM=;
        b=8HkJ6I/5WLDdE93PcgiomHDzmOBQCxmEdXt29pkcavQIrYAnTfyEQwXFMZLUmX3k3u
         Hvfvft5kHWTisyyviARVdjJ3RMS4qBIZNSKdC3/niokB1Rj0prvlf+OlFcX28eUulwq+
         JubEwySYz+6SxEJxAHAn63FLh3uTMFY7yo+oc7zNXuO850b2Ab9lTjqtkuQStTTp/Nhf
         2hzGzBqS9+oeb3DrmraTDB4vQnrOsSqeeSL2nFDHiHuN4M4rcTLLPZHLifj/voEAeSql
         rdSCAZ+1okCls3gV+IfqBvygfhIu+sSZ0CphUL76nE9qiqnJsf5Mzfy7oWh5j+vWMRvP
         pvkQ==
X-Gm-Message-State: AOAM533WVc80XaN6x14th9xMF5rK14umrKFYJP132vh8gX8oLgd4LRXi
	kjQIRKFl6SZNKS23A9EiYfzVzA==
X-Google-Smtp-Source: ABdhPJyCd/4Er+epPFAKRZT1fWjWQhW/F7nuejDSiXLEHH7ibZ0yXXXeFBsJf3FdnumCHcknC+egKw==
X-Received: by 2002:a17:906:bb01:b0:6a7:df9:d67c with SMTP id jz1-20020a170906bb0100b006a70df9d67cmr13784767ejb.733.1649345565891;
        Thu, 07 Apr 2022 08:32:45 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id f3-20020a056402004300b004162aa024c0sm9283672edu.76.2022.04.07.08.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 08:32:45 -0700 (PDT)
Message-ID: <4c9161b2-0146-56c0-5c86-7df31f43b0ac@linaro.org>
Date: Thu, 7 Apr 2022 17:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [GIT PULL] ARM: samsung: Fixes for v5.18 (current cycle)
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, arm@kernel.org,
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>
References: <20220407080545.112290-1-krzysztof.kozlowski@linaro.org>
 <164933532417.2189563.2554142563906098629.b4-ty@arndb.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <164933532417.2189563.2554142563906098629.b4-ty@arndb.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/04/2022 14:42, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> On Thu, 7 Apr 2022 10:05:45 +0200, Krzysztof Kozlowski wrote:
>> For the v5.18, please.
>>
>> Best regards,
>> Krzysztof
>>
>>
>> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
>>
>> [...]
> 
> Merged into arm/fixes, thanks!

Thanks!

Let me just remind about possible conflict (but you were on CC):

-------

Documentation/devicetree/bindings/memory-controllers/renesas,h8300-bsc.yaml

between commit:

  8a1e6bb3f78f ("dt-bindings: update Krzysztof Kozlowski's email")

from the samsung-krzk-fixes tree and commit:

  1c4b5ecb7ea1 ("remove the h8300 architecture")
-------

Best regards,
Krzysztof
