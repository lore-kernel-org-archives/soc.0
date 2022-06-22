Return-Path: <SRS0=z+b5=W5=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA690C43334
	for <soc@archiver.kernel.org>; Wed, 22 Jun 2022 08:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3FB4C341C7; Wed, 22 Jun 2022 08:34:12 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31E73C34114
	for <soc@kernel.org>; Wed, 22 Jun 2022 08:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 31E73C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id sb34so3556580ejc.11
        for <soc@kernel.org>; Wed, 22 Jun 2022 01:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=R4vnmBvyTgB7VQL9L4DU93Y2xJoD4qlt6c7m9FRyXPk=;
        b=caR2ZF88qlkUmI4v1K+MclQl1/pHAU7wiNKGA/LNsnrgGRCC2kOUVhSYvi3yZ5NQyP
         fWKooHD2934ov3/ibtMvscDHBKdY3k+smTlOA7lJX2t+Q0pOWgy39MJhY/NI+DMYXmAw
         0v2qd5M9VX6/a2CzHsyYqsZU+r0ZdLFiqbvSnWVm+/QXm88TtyxSLvHYLBmjxMOMZ08C
         W79o0ntOhC+mdTK3Wr8VaSPMnF+xIsmqMXvovNSmiNvTYOnXJl1+htsMstWDqe4ff9LR
         XRiws1J3h+Q3mZOFBGH5vbKAeS343RUCuxZuT5mFQPX1paC3Ath2gO0yjE/lcOgLlk6T
         lYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=R4vnmBvyTgB7VQL9L4DU93Y2xJoD4qlt6c7m9FRyXPk=;
        b=tsJCfDBpYqicUby170Dxhgb3/EjnNDTrD3un3s+I1CpTaWc55s7L5L0DxN+sFrTmJS
         bxnM0UlLau55IVrPjUTPABZdn20F3WnhNOow3z9IENfQv/TFBbklw1iQLQ9gWeRznbV5
         T0LGRy6H3cFVltEj6U7DIDRqoInSKhxGQ+Kedj1OBpVVqq6xTHP7cfxc5RPCmH2zwMwh
         qekUFmE4dYC+9ljRGoJVLdUCvrps/W5UC6HwB8xH7IOOalBrixXzMKG9rwFDfOqdnuTW
         EiZ6PVFqh+jlkTPXrUOAxZmnBpU1LafEyuWYJV9Bf4ZzQ8ywjBV3rzA7jqxdrnD4iMvs
         Qhzg==
X-Gm-Message-State: AJIora+GgvhZ3Orq51ksDsDgNTQUPvhcAKQG6XVfvSq1J1+l+MnFGoie
	+L/W42z26e3z62/HD1C5iR84HQsyaoAFcw==
X-Google-Smtp-Source: AGRyM1uLZ9XyaZBzuTPCedQ4tW57nGzMUgHyHNrqdKha/oPbwDycCtpdirMnJIx8fCOMyRMPoAspxw==
X-Received: by 2002:a17:906:7292:b0:712:3880:3e7b with SMTP id b18-20020a170906729200b0071238803e7bmr1984178ejl.118.1655886850491;
        Wed, 22 Jun 2022 01:34:10 -0700 (PDT)
Received: from [192.168.0.223] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id m13-20020a056402510d00b0042ddd08d5f8sm14817652edd.2.2022.06.22.01.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 01:34:09 -0700 (PDT)
Message-ID: <ca7f343f-fec0-a365-9263-06354c920b01@linaro.org>
Date: Wed, 22 Jun 2022 10:34:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 26/40] arm64: dts: rockchip: align gpio-key node names
 with dtschema
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-26-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616005333.18491-26-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2022 02:53, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v2:
> 1. rk3308-evb.dts, rk3326-odroid-go2.dts: different names according to
>    discussion.
> ---

Heiko,

Any comments on Rockchip parts? Can you pick them or shall I grab them
with rest of cleanups?

Best regards,
Krzysztof
