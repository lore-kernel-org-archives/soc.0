Return-Path: <SRS0=UKN7=CK=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F89EB64D8
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 15:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADCC0C433CA; Thu, 22 Jun 2023 15:18:07 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88AD6C433C9
	for <soc@kernel.org>; Thu, 22 Jun 2023 15:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 88AD6C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-98d2fb1bb23so93427066b.3
        for <soc@kernel.org>; Thu, 22 Jun 2023 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687447083; x=1690039083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TP/3FQHMmn6RlV6mzj99uRIgWCscxlsWWyg8WN59HdI=;
        b=lJIK/yH3nbnXvWsDZuW+QWrf6YwAPDDc8/1G8lsfca1YAW88nTfJO8BXwgLKVc4saf
         dRUddeuJGjeXzDOEKUvXZUC/DZkf69bo8VrYUbMCY3XaTSO6CUYrvAI4MNL4UZkKzf7J
         iAUCXxZ6x5hw3A3hdhfxe7ARP3A6YOnLgmF2/jLT2D0T6VeTC/zQKjbBXX1xy+xX/Gmc
         Ay9g8RP4jpdK1vi4We93lj8Tuh2nph6vOOv1KuPXfScI3VlS1xYBQrEXEfsJWEzaKZvA
         56gnd/Q7FIEicLm7c84+9swor0NtEcWArj2+Q7L9DGh7NkXFXStHIPobtQYLa/IPTDbn
         E1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687447083; x=1690039083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TP/3FQHMmn6RlV6mzj99uRIgWCscxlsWWyg8WN59HdI=;
        b=Dk+9AIdpk0fsQ3+Yo2z4baanYiHxftZeZNYvElfltaw9cpAlMUcpPUyl0v23LQEF2G
         xQAK7uogDj0rlhND+PawyRNxPbLmN35JGs8yzg0qEP+yr6i9Rf/mXtRxlf1f51Bk+D5c
         c+7mnVZ7w6S4bglJUI6gso7AdO9diETGmOd8+izSYFpoGRGAmF16phE4/WZHWiLuT8FC
         7ZZailvaj3/8h6wVIVu6oDWfqLfSmpwHeg5Ig9DkoQy65vx2zVBoclmU37pbPvmsQuCw
         rHoa8FirEAYmkCO07okdqbJepCDWi7jZSzoiktwDhtC8MQYxyDAAwscpsjhZV+OeHhzI
         R6/g==
X-Gm-Message-State: AC+VfDxI2OMv7mle73bwKLElBoPeRnk5RQXLcRZVDAse46LslUW/6izN
	FBEN5ZFTjgIa2gc8trScAFEi/g==
X-Google-Smtp-Source: ACHHUZ7HTn1t0/6v5JA/MdJ0FjEHkC3btRqN4bImVtZYQPsAKKnKoK87PYfs9u5bd+kjU5xHuSTSpQ==
X-Received: by 2002:a17:906:6a07:b0:989:ca:a0a2 with SMTP id qw7-20020a1709066a0700b0098900caa0a2mr8810615ejc.69.1687447083554;
        Thu, 22 Jun 2023 08:18:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id l15-20020a170906230f00b0098807b33996sm4679533eja.107.2023.06.22.08.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 08:18:03 -0700 (PDT)
Message-ID: <ac12c499-a4d5-74c7-42ec-f9789253108e@linaro.org>
Date: Thu, 22 Jun 2023 17:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 6/7] arm64: dts: qcom: msm8916-samsung-fortuna: Add
 accelerometer/magnetometer
Content-Language: en-US
To: "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
 linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Stephan Gerhold <stephan@gerhold.net>,
 Nikita Travkin <nikita@trvn.ru>, soc@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 Joe Mason <buddyjojo06@outlook.com>,
 Siddharth Manthan <siddharth.manthan@gmail.com>
References: <20230622000007.48219-1-linmengbo0689@protonmail.com>
 <20230622000418.48350-1-linmengbo0689@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230622000418.48350-1-linmengbo0689@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/06/2023 02:05, Lin, Meng-Bo wrote:
> From: Joe Mason <buddyjojo06@outlook.com>
> 
> gprimeltecan and grandprimelte use a Bosch BMC150, and fortuna3g has
> ST LSM303C accelerometer/magnetometer combo.
> fortunaltezt and rossa have only ST LIS2HH12 accelerometer.
> 
> Add support for them.
> 
> Signed-off-by: Joe Mason <buddyjojo06@outlook.com>
> [Add LSM303C]
> Signed-off-by: Siddharth Manthan <siddharth.manthan@gmail.com>
> [Move sensors to fortuna.dtsi. Disable them by default]
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> [Enable on grandprimelte. Add LIS2HH12]
> Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
> ---
>  .../dts/qcom/msm8216-samsung-fortuna3g.dts    |  8 ++
>  .../qcom/msm8916-samsung-fortuna-common.dtsi  | 80 +++++++++++++++++++
>  .../dts/qcom/msm8916-samsung-fortunaltezt.dts |  8 ++
>  .../dts/qcom/msm8916-samsung-gprimeltecan.dts |  8 ++
>  .../qcom/msm8916-samsung-grandprimelte.dts    |  8 ++
>  .../qcom/msm8916-samsung-rossa-common.dtsi    |  8 ++

Your split of patches is difficult to follow and understand. You bring
now, within your first submission, few boards. Then adding one feature
to this board is not a separate commit. Commit, so a logical change, is
adding a board. Please organize your patchset so it will be easier to
review. Now with such changes touching multiple files, seems not
organized correctly. Your previous patch added multiple boards in one
commit - also not easy to review.

One commit for the binding, one commit for each board. Optionally common
file could be a separate commit.

Best regards,
Krzysztof

