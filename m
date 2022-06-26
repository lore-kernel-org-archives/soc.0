Return-Path: <SRS0=a3Ev=XB=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C14C433EF
	for <soc@archiver.kernel.org>; Sun, 26 Jun 2022 10:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F8A7C341CB; Sun, 26 Jun 2022 10:29:00 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76130C341CA
	for <soc@kernel.org>; Sun, 26 Jun 2022 10:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76130C341CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id fi2so13282476ejb.9
        for <soc@kernel.org>; Sun, 26 Jun 2022 03:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UryUvcXWPpBXfvIflu4cxT9Q9H+kMYtJGeIQndtNQSc=;
        b=J9tW/hh8Vxxadht/p2/HAMoeJuD8BWvbcQU5buW1oPKBF4wwnwGo/ZM3n8OW6CQXuD
         5mjg0BBbRFeYvbBBswoKiH8Nbz81NRywcdfXpQYOxtZLI1dT8LzI4cFstgjEiZJhz8VM
         driBZpRUvCocFX4X+8w8SS5DlKb/V8wHXD+128Tu9R8bCYuJ8Z/BPKyw8gv//AwYV9/G
         PPhsFg1QKpoAYqdaJVlzvI0T3S9gfR4fwWSd5Us7/0luZ357gQTHlBtZFBOJ7J8YJ+Dr
         fL3wNWwKTak0D+5iZ9XIr1LkoaOR8IHORl3UPQy5QiDc4PoVTaMiT3IuhuLbBuZOnbvF
         6m4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UryUvcXWPpBXfvIflu4cxT9Q9H+kMYtJGeIQndtNQSc=;
        b=MBmdu6UXfTQUAVbYzVOzeAGUjn6terL1+Ki/tW8CkpTXJW3jX+qcqQxQTPpbWT9UWT
         /A4Kq5+0Tj1CXSJhMuNiROCI11fwWZ+HMz7AvuaXMDSEW8Ors40NhjUifW5gMujh4e8S
         4eN8xGEgeDPZqTaxs6zUlBYU8jsCZzOCRHGWuW0d8XoFtpX2VAiu4Yuy5XmiJ6EI4xjY
         ZC/sZ3H4cwmyyUuzTF7IbRs1L/fsevmcwvBHE+FEaASrUDdR3Q5tIv7E1tXu/EsWQ14u
         2nsEJN1xAXex87Na/BZHqB20JYv5ifmeBeAjrWaxcvOuXpSqAdYDER65gWxooH/7XGV2
         Y1TQ==
X-Gm-Message-State: AJIora8Fxi/EKV9ZlJ+TJe97uIAEnMN8kpd9rA39bIexiSjy4CK7UW+4
	7IdnNDnMccnF6ScosPMUNTPE/w==
X-Google-Smtp-Source: AGRyM1sblJgmEXbxMeGf+RD2dHMi4zVazxPkN9rudj8RaT/bHUJavjCmx8LIYG68F1Q3UPK3+2Rsgg==
X-Received: by 2002:a17:906:7303:b0:722:f008:2970 with SMTP id di3-20020a170906730300b00722f0082970mr7234670ejc.491.1656239337624;
        Sun, 26 Jun 2022 03:28:57 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x10-20020a170906298a00b00705cd37fd5asm3637815eje.72.2022.06.26.03.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 03:28:57 -0700 (PDT)
Message-ID: <ec660b83-998e-3a53-ce17-8f7d9d8728cc@linaro.org>
Date: Sun, 26 Jun 2022 12:28:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 04/40] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl:
 align key node name
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?=
 <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
 <CACRpkdYVPeEtKKA9xdiSAP6oJrX5eAKoOVaLnrELTv_ZQOEMUw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkdYVPeEtKKA9xdiSAP6oJrX5eAKoOVaLnrELTv_ZQOEMUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/06/2022 01:28, Linus Walleij wrote:
> On Thu, Jun 16, 2022 at 2:54 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> 
>> gpio-keys schema requires keys to have more generic name.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> OK, do you want me to apply this one patch to the pinctrl tree or
> will you collect a series?

I would prefer if you picked it up. I am not aware of any conflicts.

I am picking up only some left-overs and in general better if the
subsystem maintainer takes these.


Best regards,
Krzysztof
