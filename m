Return-Path: <SRS0=+5zV=BY=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6D6C7EE29
	for <soc@archiver.kernel.org>; Sun,  4 Jun 2023 10:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2B6EBC433A0; Sun,  4 Jun 2023 10:30:48 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3AD99C433D2
	for <soc@kernel.org>; Sun,  4 Jun 2023 10:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3AD99C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-977c8423dccso185584366b.1
        for <soc@kernel.org>; Sun, 04 Jun 2023 03:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685874644; x=1688466644;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h3vNtqVcROm9cmZSGS8p4DNNUaV8+gQlhQTyNTjrVxA=;
        b=sIAWbBAdGBryZiwlY/mxdtpBJH501zroa5MrYPht8XNpeAuh3rCyvqrasCFIOIzj3Y
         ZSthWz30e9fCXpHBTQBqC9N8QevoGrxDGC3QqnusdLiNQg4cNeQ/DPmuu2Ocksp+Z+U1
         lPgQKtqcEYhr3kG0EDbhVFPpizaeRKwlD9u1+7BHwiKUR45OH5lh4fa86EjKtHvP4T5H
         aeX/xUxZLk/HHp47e9zJBgLwbxDkrLo5X02HbARjsTK/AAt8oD/6Jp+ZDWJSR0AQcmpt
         gZg2NXBSq5A3R6Mzxc6VR4jhonHy0N2GMBbThuna3Tszq7PDt5HGXCDIDGMVMCFRYsED
         8Vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685874644; x=1688466644;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3vNtqVcROm9cmZSGS8p4DNNUaV8+gQlhQTyNTjrVxA=;
        b=K03fEgUx4ul/WP6wo4BsPDiwtXCf9ioRAgasjIq9wSP+CVyguzilFqiqvHz2QoBqeJ
         LoAP+nfOklBP3NhonCXtXh+1yZgxr4HfYyzMGiVuRtE3RVkVA/1LAZWO9YWP4qX89zwr
         5zn4RW6cCzmh/xPmo42khIa4rrJaj0OwX/ivD3S9EKrta+m70N/w+aF0FKPXOzQEtQhc
         zmrz19oR4IsvLWiR9xyLto8hjRKc1bBKAadGmw/yAX02L6rjjA/54/DwlGvlUEcRguZi
         EVP+/hCkcBOZpVzIRqcx6m7hksacrSXeAbCx+of/1BEGelFponAYRPYpBL6OzeC+cKbZ
         LPFw==
X-Gm-Message-State: AC+VfDyN8SYVSZxiy3VYBL42wPBPwN2yksZonSL35iiEv80Iqw2JLda5
	U4b7Io5V1Cq8kuvEEJ++vItARQ==
X-Google-Smtp-Source: ACHHUZ4u0X18Wv6y5mJX9vW4ELGhL1rGBQ1iVfd46vcj0kfhIfImleIiVNDPTsUMG7E9UKpX3WbtOg==
X-Received: by 2002:a17:907:6d86:b0:96f:94f1:b0a5 with SMTP id sb6-20020a1709076d8600b0096f94f1b0a5mr3247852ejc.8.1685874644395;
        Sun, 04 Jun 2023 03:30:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id sd17-20020a170906ce3100b0095fbb1b72c2sm2910853ejb.63.2023.06.04.03.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jun 2023 03:30:43 -0700 (PDT)
Message-ID: <3c781ae6-4a45-1d6d-840c-d25f33684b00@linaro.org>
Date: Sun, 4 Jun 2023 12:30:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 2/4] dt-bindings: phy: qcom,usb-hs-phy: Add compatible
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
References: <20230604063032.365775-1-guptarud@gmail.com>
 <20230604063032.365775-3-guptarud@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230604063032.365775-3-guptarud@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/06/2023 08:30, Rudraksha Gupta wrote:
> Adds qcom,usb-hs-phy-msm8960 compatible
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> index aa97478dd016..63b6914993fe 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> @@ -13,7 +13,9 @@ if:
>    properties:
>      compatible:
>        contains:
> -        const: qcom,usb-hs-phy-apq8064
> +        items:
> +          - const: qcom,usb-hs-phy-apq8064
> +          - const: qcom,usb-hs-phy-msm8960

I have no clue what you want to achieve here. You break the bindings.

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

Best regards,
Krzysztof

