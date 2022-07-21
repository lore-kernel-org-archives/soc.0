Return-Path: <SRS0=i+5e=X2=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B63C43334
	for <soc@archiver.kernel.org>; Thu, 21 Jul 2022 06:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9D3EC341C6; Thu, 21 Jul 2022 06:46:22 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DAE0BC3411E
	for <soc@kernel.org>; Thu, 21 Jul 2022 06:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DAE0BC3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id by8so680796ljb.13
        for <soc@kernel.org>; Wed, 20 Jul 2022 23:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6ebqScyVCL5xtjaYG+MWDobiZU7shkrkf2/xCeYnqTo=;
        b=cnNPNF6p5XEVyBPgnDIoPk2a55l5wVTjYAGOx9lKKj+nLyGm/ggYZMxUHnMR8u+QcT
         1N61AswMKoA1NNRB/BvUZ/k5WXPko0h8u6ojHSM51BHJXeQTiJkSH41em82J3CPZUzCc
         5AQJK6GpA9EAUTZRDsYOmpM1o6bvpE2MZrXHLObG57mLY6yPmpZyItDJb5XbCKcXFnhD
         IWwoAe9TvwIjeCUSX8519cufzESYT6aLzhRkFRFEzmpwk7RODzxaM8Fwqw8EE3I9aJ2v
         8rzGknfknGjRPNpY7Jn927hi1IU1vsbcFeuvrPNRluErWnMzPHZcOxodjBIFR1P0LtL0
         EYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6ebqScyVCL5xtjaYG+MWDobiZU7shkrkf2/xCeYnqTo=;
        b=f1wy/TOHo0Rylh136zKFujBtcBHanmYDEU1Q65OKSPKCQi1Sd2Rdo4PVj6SndlC3f9
         00OYf4+LZ9gxvoHdSXec4OKKtBy51Bi3s0CMUv6QmVqlqcLc1l7dXfIZsn4zgui0EYNl
         z+yPLZ4WnfqYFj6boSK5+PNqTLHIoZO4l0hLyv1v4p7aRuqozEsbq+Nhib/FS5Wd1q/k
         FPPt+d4+4TxSrmqqpkwybLyVtSuuBL0A1zdOHGQhcHVV3ZzmI3d9531OUBOz3XoaCje7
         el0OjDQONXNTSpYVf9ti+W3DH1B/P7jgPw1OzSNI/CYMjjMvGlTKn0QFDJJdKfteZflp
         wQMA==
X-Gm-Message-State: AJIora/AWVIp68VPcFaNKoZbg4IqCMNfa1nY4V45rmr3OqTbBZkkYibp
	sALW4TkXLXy20J5gJBuFKshEfA==
X-Google-Smtp-Source: AGRyM1sYM/moheTL9vxo8wPQwgwFru+XwB8ZKQ7WV6dGO46MCFpk7mzsGMi5V3SSFRP0Dify8FztGQ==
X-Received: by 2002:a2e:8705:0:b0:25d:da25:e7c2 with SMTP id m5-20020a2e8705000000b0025dda25e7c2mr1491219lji.139.1658385980013;
        Wed, 20 Jul 2022 23:46:20 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id k3-20020ac257c3000000b00478de10cf5esm239195lfo.247.2022.07.20.23.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 23:46:19 -0700 (PDT)
Message-ID: <d66aae55-1615-1bbc-4f56-2b4806635db4@linaro.org>
Date: Thu, 21 Jul 2022 08:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: at91: add lan966 pcb8309 board
Content-Language: en-US
To: Horatiu Vultur <horatiu.vultur@microchip.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 UNGLinuxDriver@microchip.com, maxime.chevallier@bootlin.com
References: <20220720194904.2025384-1-horatiu.vultur@microchip.com>
 <20220720194904.2025384-2-horatiu.vultur@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720194904.2025384-2-horatiu.vultur@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/07/2022 21:49, Horatiu Vultur wrote:
> Add documentation for Microchip LAN9662 PCB8309.
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> index 4e495e03264b..9dc9ad81193a 100644
> --- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> +++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> @@ -169,6 +169,12 @@ properties:
>            - const: microchip,lan9662
>            - const: microchip,lan966
>  
> +      - description: Microchip LAN9662 PCB8309 Evaluation Board.
> +        items:
> +          - const: microchip,lan9662-pcb8309

This and other lan9662 boards should be just an enum. You grow the file
needlessly... Unless it is clear preference of maintainer. Other boards
follow normal enum approach, so it seems there is no such preference.


Best regards,
Krzysztof
