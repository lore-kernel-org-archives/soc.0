Return-Path: <SRS0=lBHs=XK=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAD3C43334
	for <soc@archiver.kernel.org>; Tue,  5 Jul 2022 11:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C8B2C341CB; Tue,  5 Jul 2022 11:39:51 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2DE64C385A2
	for <soc@kernel.org>; Tue,  5 Jul 2022 11:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2DE64C385A2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id u14so14178118ljh.2
        for <soc@kernel.org>; Tue, 05 Jul 2022 04:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=XqGBUv2bVR1BBSn8EmBr/HQnR9EoIw7gIb/DairnNFs=;
        b=PFKl7oPUIaa88zrn/8CuiC9DcDwgPU9BOA7TQp+ajBf9ok1bO4vKFtl3kvuBJPJOI9
         dGDn0fLKhP3juMGTXuKIiFXoOdfxnMm2KHHC16ifNTHxSOhAuF0P6WHNEOEdyTJeNFS7
         Sojpv2Dk21v+58u6CN8JG2J6KojXC/82auKbdYzsNcLeRI2+qPR6/pA8QCHkOHJfTX//
         doEauC0AzOHgVVSRHJCNmRebm4ur3hyPl4J51ByC6D/TgttQF/ZKMahwaA96xbXxp81R
         X3yTggTyd0ULkcukRCKknDBWI/aQaR9f04EdfHXP1jDVcZ30YYXsf6mbxSzj/iIUpjqS
         lXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=XqGBUv2bVR1BBSn8EmBr/HQnR9EoIw7gIb/DairnNFs=;
        b=ItIJ6Zc5d/RaOri4svMmW2eEO7Eq1k8SSQAwHLVdoG+Rj/gKUOqGV6joNhnHChn+d+
         GD3KMqQNQfPSLhjHHWfwA5VxQdrG0HSBBHAJFdEA84LF9URlhvpwuUqlT8aEt40sLuLf
         PoldNKG6HXL/Wk8GhFKFq45ZoGvZnC/GHSJiQY+QE45YPNiUg/UlrwVjL/0g2QOwXxMH
         fAMeScqKmV15+SyimEXJ/8XDomH1OA3RKZxGaVU2i5PUvxsyzOaJPOCl28fPGxnvMWOn
         E57McR9Uk7RpfRzfknEYsAYak15WOsd66ELNBRQj83E7yIRyZDkoAuuYhz6YRuZMakNL
         hy6w==
X-Gm-Message-State: AJIora9eDmqE3zlUQ1eqFGIVKJmAeQrXf06reI6dI72d7p2E38otSY2i
	TKHy899cdBOIQ7TwZmqto6iV4A==
X-Google-Smtp-Source: AGRyM1u/pjN+NyojeJVROuh8VlGN3O/Cf8pqXVDdLH/73GyJfjJZGzyKzW5enrA3dEZc9SxANQukzw==
X-Received: by 2002:a2e:bc22:0:b0:25b:c3b6:eb11 with SMTP id b34-20020a2ebc22000000b0025bc3b6eb11mr20157656ljf.122.1657021188242;
        Tue, 05 Jul 2022 04:39:48 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id s8-20020a056512202800b0047f750ecd8csm5663357lfs.67.2022.07.05.04.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 04:39:47 -0700 (PDT)
Message-ID: <c2c1cf0c-9462-9ba5-a297-70d13a063de1@linaro.org>
Date: Tue, 5 Jul 2022 13:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 01/40] dt-bindings: input: gpio-keys: enforce node
 names to match all properties
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
 Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh@kernel.org>, arm@kernel.org, linux-input@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-1-krzysztof.kozlowski@linaro.org>
 <cab6fd96-4b8e-42a3-4dce-db63656df92c@linaro.org>
In-Reply-To: <cab6fd96-4b8e-42a3-4dce-db63656df92c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/06/2022 10:17, Krzysztof Kozlowski wrote:
> On 16/06/2022 02:52, Krzysztof Kozlowski wrote:
>> The gpio-keys DT schema matches all properties with a wide pattern and
>> applies specific schema to children.  This has drawback - all regular
>> properties are also matched and are silently ignored, even if they are
>> not described in schema.  Basically this allows any non-object property
>> to be present.
>>
>> Enforce specific naming pattern for children (keys) to narrow the
>> pattern thus do not match other properties.  This will require all
>> children to be properly prefixed or suffixed (button, event, switch or
>> key).
>>
>> Removal of "if:" within patternProperties causes drop of one indentation
>> level, but there are no other changes in the affected block.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>  .../devicetree/bindings/input/gpio-keys.yaml  | 157 +++++++++---------
>>  1 file changed, 77 insertions(+), 80 deletions(-)
>>
> 
> Dmitry,
> 
> Any comments from your side? Are you planning to pick up the dt-bindings
> here (patch 1-3)?

Hmmm, I guess this should go via dt-bindings then...

Best regards,
Krzysztof
