Return-Path: <SRS0=2UBY=B2=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39B2C77B73
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 08:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AEDC1C4339B; Tue,  6 Jun 2023 08:46:17 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ADA62C433A1
	for <soc@kernel.org>; Tue,  6 Jun 2023 08:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ADA62C433A1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-976a0a1a92bso635405266b.1
        for <soc@kernel.org>; Tue, 06 Jun 2023 01:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686041174; x=1688633174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zhXwQM1axbZVP2R8OTg/nTjRF7LjBSXFyA1Pe1rgXwU=;
        b=rz3hnPVFfhJzaBCsj7KdnoW0gEFzBX+E4PmxU2fSGOXzX9Z736UZEzGJVbPU95rVXF
         yWbhRTdZQWTQUmRR6Al75izbMAIlNO/eI3RTB4MKzlhjY+6DitK2Ozp8ne9ElMAv8GKr
         Nqbb1sS5lku0wui9HJAOnwLD4DfDzzj2cM2j8VFtnMU/n90z0lAy1JNUb/KpNHxwz6cr
         cpCjh2bApJio4b/SQcgC5OixLa4idbENmrjA/k/8P+SxNnORYDSp6z3CCyhLWbBxpU9q
         MuDzunhAflP9gXTmwyPVs7k1gj01Z6Vth9HXUd9tAWbAIaJ0NFsaL3l2aIuDZb6VuQAM
         6f9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686041174; x=1688633174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zhXwQM1axbZVP2R8OTg/nTjRF7LjBSXFyA1Pe1rgXwU=;
        b=iHiNiFGlkac0QZ7l5ypQXzGMyKNkemgABiRanmANkVoTELuaDfTJAqRG1yugNDAHuv
         o0QYC2QK/n49XgTL9UW8/WKgL6pXoDIGK8j8eQvdFrFHxkeDBslbw1KXn1iGceRG1JF4
         DEWyooiZg7JYRQ5O0rWAhLvDMtOtROucoO6gTY1S3/9NT0RRppJWe3LNjpRgAcMoeC2D
         PEXj2JaPIyZZEFNtI4Ujfj69ZMCz/tHyFRWWp+d03bkDd9iafh47maDVkaayj3SigAmF
         2bVdmKyXRYIFG/YGKJBfDQXKgpEVGDxoPPcpZbjrI0ihxUMOEzWZTyES0iJTYniLChdj
         BRHg==
X-Gm-Message-State: AC+VfDyRExBryKA3+J8qd1CHJk63/EHnLAbOFTcITbnto7na0bd/mgVe
	cU5f/c6vXoIAg4pOq6dgCZAqLw==
X-Google-Smtp-Source: ACHHUZ6XPMkYalRlyNWE2pAPL43aV20Dl8/aCIgapDRm3k9iQeuNZMX/aNkFgm3+1GqDSzEW+qa8mg==
X-Received: by 2002:a17:907:9496:b0:970:19a2:7303 with SMTP id dm22-20020a170907949600b0097019a27303mr1672203ejc.19.1686041173683;
        Tue, 06 Jun 2023 01:46:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id e4-20020a170906504400b0095342bfb701sm5455841ejk.16.2023.06.06.01.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 01:46:13 -0700 (PDT)
Message-ID: <2c3fa1f1-1859-0914-b39f-05f1f4186179@linaro.org>
Date: Tue, 6 Jun 2023 10:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v4 2/4] dt-bindings: phy: qcom,usb-hs-phy: Add compatible
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Rudraksha Gupta <guptarud@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230606040529.122433-1-guptarud@gmail.com>
 <20230606040529.122433-3-guptarud@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606040529.122433-3-guptarud@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/06/2023 06:05, Rudraksha Gupta wrote:
> Adds qcom,usb-hs-phy-msm8960 compatible
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> index aa97478dd016..bdeffb52340b 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> @@ -13,7 +13,9 @@ if:
>    properties:
>      compatible:
>        contains:
> -        const: qcom,usb-hs-phy-apq8064
> +        anyOf:

Look at existing bindings how this is done. This should be enum.
Best regards,
Krzysztof

