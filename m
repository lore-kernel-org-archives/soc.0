Return-Path: <SRS0=u+Dz=FU=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A19CE81DF0
	for <soc@archiver.kernel.org>; Fri,  6 Oct 2023 12:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E028AC433CA; Fri,  6 Oct 2023 12:43:29 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50AD5C433C7
	for <soc@kernel.org>; Fri,  6 Oct 2023 12:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 50AD5C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6c4cbab83aaso1319292a34.1
        for <soc@kernel.org>; Fri, 06 Oct 2023 05:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696596207; x=1697201007; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fwWxeuceb8WkZK3t4npS23+dHV1ytpfGbO0OHoDKjDk=;
        b=waG12RVAjzf/HkVG/6Dwni/YUsP87KjF+jCqrSzkvoLt457S+vWve69yph4CBvOTRA
         iUHwHhvNzZM2WzJw4GSctR//GDaDl/oSZwyfsNMihb56Q03yxjqGyHyCrn53EEhIRjUV
         VY9jB/WgDMC/dtqpMr7Tu0AI2xMIC9VzP6NMZg0io/iJSscllPQHJhrLdobmZNxjKZHq
         IgY2jleJKy+ypNcWBha7e8ICkv0Esx1ChH4x7hH+2spfOBMbcEjda1NfotqTm0HbBQbK
         posiq4J6T2542SpF6EbGpwxSw6Lf3gUjmSVRbHD5V1o23Orc622/3zGLhfb+sVvRTvA9
         z0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696596207; x=1697201007;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fwWxeuceb8WkZK3t4npS23+dHV1ytpfGbO0OHoDKjDk=;
        b=jElImeO29lacvMZEWcYtDn2PgWWVQ7OEIh5M7jFEGIL/846v/lBt5Tuwaog88rnQSq
         KlLS39gliNa8O6Ue3ZHjbEhQkhDPj6IjKtPkiGyCgHBndRq9VdQrQph3KKvpeKT0vH4j
         PzXLs+MOXp7iUNb3l9GtvLbCvpgIdgHq4mh+eMp4U7/waJIZQyJOHn+fIGOBnUmNy2n1
         hOLJMMqRAortpiaOHyNYAbyTzwIK+3SOUCUlrevElAdqZuh0HmhLRPpdFl9ONARPum2P
         7RMkUy2q5jdP3gyQRc1wZfuCflCjBFHwvZ5tAnIrmRQMLVOJp6ax3rtawdOuH1VWYIsC
         U/0Q==
X-Gm-Message-State: AOJu0YwMbEQ14OHJTDtu+qFCarpHma6FFTvSj+6dhESX5Q4UF97JRhGe
	SfJVzohbzCy+CcgdDy/Pe/MXeA==
X-Google-Smtp-Source: AGHT+IEmDMF4j3XAl6PVhOWYq5+R1tK7zwGWo2XRjPF8+o1STz2c3bCBIQBJ9EcI+QqvL/g6hkgaEQ==
X-Received: by 2002:a05:6870:e393:b0:1dd:4271:3a88 with SMTP id x19-20020a056870e39300b001dd42713a88mr7989849oad.58.1696596207317;
        Fri, 06 Oct 2023 05:43:27 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id sq48-20020a05620a4af000b0076d9e298928sm1271809qkn.66.2023.10.06.05.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 05:43:26 -0700 (PDT)
Message-ID: <951e9dfc-613c-48ff-85c4-dc78ad167de2@linaro.org>
Date: Fri, 6 Oct 2023 14:43:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/21] dt-bindings: soc: google: exynos-sysreg: add
 dedicated SYSREG compatibles to GS101
Content-Language: en-US
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
 tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org,
 wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com,
 will@kernel.org, arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
 tudor.ambarus@linaro.org, andre.draszik@linaro.org,
 semen.protsenko@linaro.org, soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-5-peter.griffin@linaro.org>
 <f997c21d-d85b-4ad1-ad5b-999524fc72ac@linaro.org>
 <CADrjBPpHTydVZdi+x6V-QoV++oQEuv4n6-NPXGB2=+AERNETyA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CADrjBPpHTydVZdi+x6V-QoV++oQEuv4n6-NPXGB2=+AERNETyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/10/2023 14:41, Peter Griffin wrote:

>>> +          - enum:
>>> +              - google,gs101-peric0-sysreg
>>> +              - google,gs101-peric1-sysreg
>>> +              - google,gs101-apm-sysreg
>>> +          - const: google,gs101-sysreg
>>
>> Please drop this one compatible. Exynos has it only for backwards
>> compatibility.
> 
> Just double checking, you mean I should drop this one compatible?
>  +          - const: google,gs101-sysreg

Yes.


Best regards,
Krzysztof

