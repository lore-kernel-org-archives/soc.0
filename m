Return-Path: <SRS0=z+b5=W5=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBB0C433EF
	for <soc@archiver.kernel.org>; Wed, 22 Jun 2022 08:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94134C341C6; Wed, 22 Jun 2022 08:33:33 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E512C34114
	for <soc@kernel.org>; Wed, 22 Jun 2022 08:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E512C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id es26so21131652edb.4
        for <soc@kernel.org>; Wed, 22 Jun 2022 01:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=qRakZp5pSMYhL6XIJv26moqr0Al+sHh6pOGmxdJQIII=;
        b=o2n9rxPaSrA4T+KJc8P6WKj85N0u6YbvtL8c9ZO8j6Ofr8tYdESYqjOnlqn3YTEb6t
         ewwm0FT5KkFSAQdTRQvufxPG6NkZt/grwOruVj7u5Qhar+id93/l1h0mfpXnbBlNb4kd
         GSFh/0pJ6IAT+kOpKBbzPz++6BxyDWh47cwoWZP0yfOhLIlYJ9rLZhY/YmWs0V9W9/a/
         H6k8jU8EcEPbSIpFtQ/BsIPeZffKahhPOsF9UBM5VxocyUAYbGKXZC2I+JQIS98fHT3G
         mA+EXb/LZXZgwggcUkQedgW4x22mrVPVy1oMt5rZUlKqOEGjFNReokhpu6WzJrvxnWmO
         PPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qRakZp5pSMYhL6XIJv26moqr0Al+sHh6pOGmxdJQIII=;
        b=ykQef5oorViOyoP5kwQTbb1icRd+2Fh/aOYf+MxaO55oQHZD8yKbK/Z9a8HNlCaxtg
         +xi4sKoOwtu1o6GNCdy7uYKksNEQGSoXFAD+I6SH84tqByShbM0PfWmeOPWQmupmkJIG
         nf2baEfbdfgQItlZ7sVo79FDICB84RWqNS1jsoVeYm/hFPGCQI5divuMdfQULvFfpuMq
         p48N0S3gAjF1rn71/gcmzzO+ZnTngyd9JvolcsFGFLKvxpr2iuxZ0V2D3WbecqtlNLP3
         +SJD648w351oIAlX3Df9NVemy0oUU2LuXn4jvc1KckT++0cCSPrhW/hzpldddLHIydwo
         Hurw==
X-Gm-Message-State: AJIora+hr4X9SbtcgLfysoRHDSIAk6i+wwByftc60kA8Ui6Qki2ph9Vn
	ebzq7sSg97nmQesVwGxy8AE5Pw==
X-Google-Smtp-Source: AGRyM1vZAfoRBSAbcGlOtrkZW9xrmbi2gm+avyL7ia7RJgDzQXicYVnr6RnRLuw7MjtdyfMoV1dGFw==
X-Received: by 2002:a05:6402:278e:b0:431:73ab:49b9 with SMTP id b14-20020a056402278e00b0043173ab49b9mr2696567ede.415.1655886810677;
        Wed, 22 Jun 2022 01:33:30 -0700 (PDT)
Received: from [192.168.0.223] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l2-20020a1709060cc200b006feed200464sm8902090ejh.131.2022.06.22.01.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 01:33:30 -0700 (PDT)
Message-ID: <6aa08062-4587-edc7-1638-fed797874eaf@linaro.org>
Date: Wed, 22 Jun 2022 10:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 21/40] arm64: dts: qcom: align gpio-key node names with
 dtschema
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-21-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616005333.18491-21-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2022 02:53, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dts   |  2 +-
>  .../boot/dts/qcom/msm8916-alcatel-idol347.dts |  2 +-
>  .../arm64/boot/dts/qcom/msm8916-asus-z00l.dts |  4 ++--
>  .../arm64/boot/dts/qcom/msm8916-huawei-g7.dts |  2 +-
>  .../boot/dts/qcom/msm8916-longcheer-l8150.dts |  2 +-
>  .../boot/dts/qcom/msm8916-longcheer-l8910.dts |  2 +-
>  .../qcom/msm8916-samsung-a2015-common.dtsi    |  6 +++---
>  .../boot/dts/qcom/msm8916-samsung-j5.dts      |  4 ++--
>  .../dts/qcom/msm8916-samsung-serranove.dts    |  6 +++---
>  .../dts/qcom/msm8916-wingtech-wt88047.dts     |  2 +-
>  .../boot/dts/qcom/msm8992-xiaomi-libra.dts    |  2 +-
>  .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  | 10 +++++-----
>  .../qcom/msm8994-sony-xperia-kitakami.dtsi    |  2 +-
>  .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  |  6 +++---
>  .../boot/dts/qcom/msm8998-fxtec-pro1.dts      | 20 +++++++++----------
>  .../boot/dts/qcom/msm8998-oneplus-common.dtsi |  6 +++---
>  .../dts/qcom/msm8998-sony-xperia-yoshino.dtsi |  8 ++++----
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  2 +-
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi      |  2 +-
>  .../dts/qcom/sdm630-sony-xperia-nile.dtsi     |  8 ++++----
>  .../boot/dts/qcom/sdm632-fairphone-fp3.dts    |  2 +-
>  .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  |  2 +-
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |  2 +-
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  4 ++--
>  .../boot/dts/qcom/sdm845-oneplus-common.dtsi  |  4 ++--
>  .../boot/dts/qcom/sdm845-shift-axolotl.dts    |  2 +-
>  .../dts/qcom/sdm845-sony-xperia-tama.dtsi     |  2 +-
>  .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts |  2 +-
>  .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |  4 ++--
>  .../qcom/sm6125-sony-xperia-seine-pdx201.dts  |  2 +-
>  .../boot/dts/qcom/sm7225-fairphone-fp4.dts    |  2 +-
>  arch/arm64/boot/dts/qcom/sm8150-hdk.dts       |  4 ++--
>  .../dts/qcom/sm8150-microsoft-surface-duo.dts |  4 ++--
>  arch/arm64/boot/dts/qcom/sm8250-hdk.dts       |  4 ++--
>  .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi |  2 +-
>  .../dts/qcom/sm8350-sony-xperia-sagami.dtsi   |  2 +-
>  36 files changed, 71 insertions(+), 71 deletions(-)
> 

Bjorn,

Any comments on Qualcomm parts? Shall I grab them with rest of cleanups?

Best regards,
Krzysztof
