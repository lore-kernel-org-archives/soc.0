Return-Path: <SRS0=JHH0=AH=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06934C77B61
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 07:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E0758C433D2; Sun, 16 Apr 2023 07:22:12 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95D62C433EF
	for <soc@kernel.org>; Sun, 16 Apr 2023 07:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 95D62C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id vc20so1362411ejc.10
        for <soc@kernel.org>; Sun, 16 Apr 2023 00:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681629730; x=1684221730;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GrJuCakYyfV5iCG/jhcx42zwUS3Y7qdP1AOHSydzsDU=;
        b=wgnYeb3CMbuHs6JXpwgIezACl6gPPa7WysSjJEa4/uyObY7OChHZ4n8bUiR4sSFTcz
         CMtdmmPKDLkm4xFFDzby3qv0ADV0h82cxXFZ5t1QILrPy9h6OoPyrAuwEEAbed0ELmXl
         alsE5O5RUn8CBTSUl04zR5VSZ9Xi3xByqVe42+ftGp6JQcQClVzDwQHpuTVTi/82WaVp
         Y/aJa37lo4T41FZO38toU0E1+gE6z+yDV46YBI6Kx4aCIgnGnv+KxPI4gRyT4DYpNDzd
         89q3DV6oYJ3YRtDAxtUn3ck5i13qCWExX7/Hic64EYpbMZIQIaawzO9+2IobL0UIMbCS
         aXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681629730; x=1684221730;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GrJuCakYyfV5iCG/jhcx42zwUS3Y7qdP1AOHSydzsDU=;
        b=RPY6vptSyGNWETSz94hGif2tUnH0epv+Otn9mp9/zYpuhXeQre1l0/4oq86NwHHMzU
         iHODFnuGr/rybzy4KAWoKr0XHaVdmafPSpS8G8JsF+VVN520ciXqH75ghh0FXVNIgkcC
         vbxAg0rLSXjOTdSzMzGLL2vt5Sxld6aMDzel9FMUXDNWuZdB1lm7/RlFCMfMFxCTwUM5
         dsLu04U1JPeZmyRgV7IyRd2McUwzqPgI+5JX2mnDTbw8jHEzZPwfH1g1haeqlbh1nSRr
         oh3oAaSOfjzJtjjg5fuevItcHANra+0agKlLdfV7fVmDNOkvmrg+wmHTSciLXdztUc0W
         CbnQ==
X-Gm-Message-State: AAQBX9fcfr3lkYQcqm7g29+8y91KIyItpQwD+Xb12U100w4NG0qaRQuv
	eBVZzExYBI9/R4b4bKwal9IH+g==
X-Google-Smtp-Source: AKy350bPcBcJ76oBB2ejRwHsu8kO9N7yc4y4FnZ+vG8e2Xy/bMtBRVwSYX4GmRi9Ctmx96Ksm10e0w==
X-Received: by 2002:a17:906:9813:b0:94e:ee18:1228 with SMTP id lm19-20020a170906981300b0094eee181228mr3577846ejb.35.1681629729841;
        Sun, 16 Apr 2023 00:22:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:29dd:ded4:3ccc:83db? ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
        by smtp.gmail.com with ESMTPSA id ji12-20020a170907980c00b0094e1272bd12sm4725455ejc.159.2023.04.16.00.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 00:22:09 -0700 (PDT)
Message-ID: <9e7ccb2c-265b-befb-ceaa-30fb4d0e379e@linaro.org>
Date: Sun, 16 Apr 2023 09:22:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 12/15] w1: omap-hdq: allow compile testing
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Evgeniy Polyakov <zbr@ioremap.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
 <20230415104304.104134-13-krzysztof.kozlowski@linaro.org>
 <f5683efc-733e-a5ee-b3ba-6b35e04e23b4@infradead.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f5683efc-733e-a5ee-b3ba-6b35e04e23b4@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/04/2023 18:05, Randy Dunlap wrote:
> Hi,
> 
> On 4/15/23 03:43, Krzysztof Kozlowski wrote:
>> omap-hdq does not depend on anything from ARCH_OMAP for building.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> It appears that patches 4 and 12 are the same...

Yes, I messed with git format-patch a bit. #4 can be ignored.

Best regards,
Krzysztof

