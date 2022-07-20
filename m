Return-Path: <SRS0=b8ul=XZ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70850C43334
	for <soc@archiver.kernel.org>; Wed, 20 Jul 2022 10:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F114C341CB; Wed, 20 Jul 2022 10:34:33 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59113C341C7
	for <soc@kernel.org>; Wed, 20 Jul 2022 10:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59113C341C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id by8so17004172ljb.13
        for <soc@kernel.org>; Wed, 20 Jul 2022 03:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=cAufcfrmkWuteWD367j9pVSwfJbo/oWC1itAdvShsqk=;
        b=ltJqGHsbiHXO2gIE5UMCyzKJ8bm+ulL2MHk28tc8dz9IQH3ZvLAOmAY+DFVByST3c5
         jQbvTx4K0y2+gpV5PJviqb06wrxVFSl9lidZqDzv3W6jxZqejRrs5NCB/oCwc2NIGoa/
         YQerNMqfBLihRlQkt85JThzJgrDhm8FXhKRD2o7Hq4gt5wFdRScKTAqfNWFfnIzLfULp
         rnCwQmE18vP0bAypXzz7rcnrPAoCMq5tcszPYxhrKJucKpX+Jjg7FPIcFdQBz0pcbmN/
         gJeAKSCQlAhOP4oD2WiiCeOydlLoC0HNgI+xUjhnUnwHgsJVY9zVoGPfJHRBDvduUAxR
         /nSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cAufcfrmkWuteWD367j9pVSwfJbo/oWC1itAdvShsqk=;
        b=N+inbOGX5WHUQ0Q710UN4LxCnBZQbScQLCT0nCgiZlA7b8duyajbfNPpQbmA6Tg0Rz
         7aRXcZORYbwuq22c4dfT3sRuMhFHQAqLYw0L1ml0NSrgYYzKDpDq3YLUmCAvVQroFmcH
         kFteoNuC4NMt2Ymvnx9j+MJ2zl1ngzHWSmMYwh+Bf4+C74LAgZb85DTPAP9g74RdpAPD
         tcxMEzUMQjuyr/DLIbwS5COS7xsVyCO53VUSSTQf3swKEDoqbAoZ7QFwxiWiy2TlG4NU
         VBHKTtYIi9q3SzsM+VCBmvaoX9ynfphmwLOvHoh7LWSspVTQ/Ncvk4unxudMT8DTrrwO
         aagA==
X-Gm-Message-State: AJIora+zV6+Doorb6gszTytvEdpyPu/3TTmzXai1Yqnamr2wF8D4/fSh
	IN64lm4pYdQjQ+aIFhymS7rYqA==
X-Google-Smtp-Source: AGRyM1sBD67/jtTKZ/dxu9zBMrKpp6yvgqRJYuzxj3GLE5Nuf02oFFNJCD8KmiGKyAMOt3cy4E6HEA==
X-Received: by 2002:a05:651c:204a:b0:25d:4ef0:80a9 with SMTP id t10-20020a05651c204a00b0025d4ef080a9mr17167757ljo.319.1658313270296;
        Wed, 20 Jul 2022 03:34:30 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id i10-20020a2ea22a000000b0025d9552fcafsm3153679ljm.97.2022.07.20.03.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 03:34:29 -0700 (PDT)
Message-ID: <0a5cbaaa-565a-7215-5e31-12c52f4bbcbd@linaro.org>
Date: Wed, 20 Jul 2022 12:34:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: document Ampere
 Mt.Mitchell BMC compatibles
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>, openbmc@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>
Cc: Phong Vo <phong@os.amperecomputing.com>, thang@os.amperecomputing.com
References: <20220720085230.3801945-1-quan@os.amperecomputing.com>
 <20220720085230.3801945-2-quan@os.amperecomputing.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720085230.3801945-2-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/07/2022 10:52, Quan Nguyen wrote:
> Document Ampere Mt.Mitchell BMC board compatible.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>

Thank you for your patch. There is something to discuss/improve.

> ---
> v2:
>   + Introduce in v2 to add Ampere Mt. Mitchell BMC compatible [Krzysztof]
> 
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index d61408194998..b8146d5c4431 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -71,6 +71,7 @@ properties:
>            - enum:
>                - aspeed,ast2600-evb
>                - aspeed,ast2600-evb-a1
> +              - ampere,mtmitchell-bmc

Put the entry ordered alphabetically.


Best regards,
Krzysztof
