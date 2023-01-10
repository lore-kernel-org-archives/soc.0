Return-Path: <SRS0=trVk=5H=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEF7C54EBE
	for <soc@archiver.kernel.org>; Tue, 10 Jan 2023 09:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0049C433F0; Tue, 10 Jan 2023 09:49:41 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 607FCC433D2
	for <soc@kernel.org>; Tue, 10 Jan 2023 09:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 607FCC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id ay40so8341985wmb.2
        for <soc@kernel.org>; Tue, 10 Jan 2023 01:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3yg0yWxaO3D77Rc0YvK78QrEddXCLnXNXF1NfjRw2ik=;
        b=p0+wGr50kzPrjqKDE6iMoVByKnfBTswHllyJ0hbTRrcv6KmotSkY9fXD0ucOZHCXg7
         UrGyLCQD2cNuR2Pv/UCVKtIgWL7SJ3J9ldLEJ1mLC0dca5dNETHiYiY5EUmHtI+64fKM
         8kmCedm+aUmlSpmmnL8EkQLGWIQt5UMElxFD7swiH0Y6C8NUM0vkia35z0HZdZJEL3wk
         CAnSjbq4HBkHcU/OEQyvyILwKqGfuoUZSK4AIXXqL9QQjlNJu7XZlYP2OJvRqyxf12JX
         oGsp5QGCtnbKbBcZuvo1qPOjYJAIDxft+NYlwey/Z5SpnUN/Ww3JTVSCYXykUWnPTAZK
         acAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yg0yWxaO3D77Rc0YvK78QrEddXCLnXNXF1NfjRw2ik=;
        b=U38AX+sblLV2Hk6SkDRql3XZ/iOh7l2YQ3ckZcbU51chLkgarzsEE3D0t92EzbnKsR
         c4WYw/hdLWAsPAn+U/aAvfDQD4Z9JVrYVWVZSGkeTdAot0jor1cQ0QfbCUDGKuunZw70
         oZAIy8mInNR27wwtl6aLr1cO46mInIms8+4aE9gcid/NQbBwS/gcD0mLHYqGzs/gRVKx
         NBlaX8mjR3WG4gCuhnUZs6Alxh/V76TnPtZLF8k8CBGJDupFezbD3JekuZJq5P0orUFl
         gbdMzmQWfSQccesGbXCanaaGaL1IoUxNlpQDjZR6ocIKF9o5Cff/roth3OTcF5i8cYyE
         FrNg==
X-Gm-Message-State: AFqh2kpZGl7DYI7Jqc3KpIdi/YqLijWSefHWx67oByyji/IYsX7LcXvK
	aIMGig3sbwQhd20/uR+bKyv0Bg==
X-Google-Smtp-Source: AMrXdXuASSZzKeUfOw9NJX7VERkz88BE+g/9yYKsDXnLCZOI/iHYipX/l8kBD+iUSPDp91rG1gf3AA==
X-Received: by 2002:a05:600c:2142:b0:3d5:365b:773e with SMTP id v2-20020a05600c214200b003d5365b773emr58864982wml.39.1673344178638;
        Tue, 10 Jan 2023 01:49:38 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c18-20020a05600c0ad200b003d9c97d82f2sm14117592wmr.8.2023.01.10.01.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 01:49:38 -0800 (PST)
Message-ID: <110af65f-9c18-524d-a073-ef7be60d1f5a@linaro.org>
Date: Tue, 10 Jan 2023 10:49:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/5] dt-bindings: soc: hpe: hpe,gxp-srom.yaml
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: clayc@hpe.com, linux-kernel@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 verdun@hpe.com, nick.hawkins@hpe.com, arnd@arndb.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk, olof@lixom.net
References: <20230110042533.12894-1-clayc@hpe.com>
 <20230110042533.12894-3-clayc@hpe.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230110042533.12894-3-clayc@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/01/2023 05:25, clayc@hpe.com wrote:
> From: Clay Chang <clayc@hpe.com>
> 
> Document binding to support SROM driver in GXP.
> 
> Signed-off-by: Clay Chang <clayc@hpe.com>
> ---
>  .../bindings/soc/hpe/hpe,gxp-srom.yaml        | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/hpe/hpe,gxp-srom.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/hpe/hpe,gxp-srom.yaml b/Documentation/devicetree/bindings/soc/hpe/hpe,gxp-srom.yaml
> new file mode 100644
> index 000000000000..14ad97d595c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/hpe/hpe,gxp-srom.yaml

Don't drop stuff to soc. Put it in respective directories. This also
applies to your driver.

SROM controllers go to memory-controllers. What is this, I have no clue.
"SROM Control Register" is not helping me.

> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/hpe/hpe,gxp-srom.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HPE GXP SoC SROM Control Register
> +
> +maintainers:
> +  - Clay Chang <clayc@hpe.com>
> +
> +description: |+
> +  The SROM control register can be used to configure LPC related legacy
> +  I/O registers.

And why this is a hardware? No, you now add fake devices to be able to
write some stuff from user-space... Otherwise this needs proper hardware
description.

> +
> +properties:
> +  compatible:
> +    items:

Drop items, you have only one item.

> +      - const: hpe,gxp-srom
> +
> +  reg:
> +    items:
> +      - description: SROM LPC Configuration Registers

Drop items and description. Just maxItems: 1

> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    srom: srom@80fc0000 {
> +      compatible = "hpe,gxp-srom";
> +      reg = <0x80fc0000 0x100>;
> +    };

Best regards,
Krzysztof

