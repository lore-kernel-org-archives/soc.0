Return-Path: <SRS0=HpX/=3I=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6824DC4332F
	for <soc@archiver.kernel.org>; Tue,  8 Nov 2022 11:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0DDCBC433C1; Tue,  8 Nov 2022 11:09:40 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9DE28C43151
	for <soc@kernel.org>; Tue,  8 Nov 2022 11:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9DE28C43151
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id b9so20559281ljr.5
        for <soc@kernel.org>; Tue, 08 Nov 2022 03:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NUpbWABUTfzB/pi8dKsIix5VNK7uNSZkTxF1xyi8p6Q=;
        b=daN5I+/5Xw346JyVPdd1+XPv2eW52SdEi5GCLbHumqVdyvfYvxcJhaIx34QQ5Dn7os
         Fae392wuPFHszQMlyavcl29jJLneUBI8TK+Y6KRRu9xoBjwAtJD2swOVmH+ba/409k/S
         Dn50bdnfGF4BOz6p2nml/ojfgtxOofgKyorrOpR3Yc6vq7DAMbfNxjBIRoS0wfglbZAI
         CqjLQ3yfvB9BVugVfHxWYg5svx8ztRlkm1ePEz1U/O5t1g7/ypvKvMKDvVTOt55XLIzc
         aQjj36nbMXMIApSQW6W8pR5W8a1QiFotDDmfqT/6zXxhLlENE3GemEtvSjMKgf42fYNA
         MSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NUpbWABUTfzB/pi8dKsIix5VNK7uNSZkTxF1xyi8p6Q=;
        b=C4jbCpDp9zDCoCPRflkg+q17PpsLuT1iOOclrwc0Gnn0ZKvsDvdN5ufWqQv/yfhi1v
         V0YkBj+FsEYoDhgvruFCpBP3sHlA5XNVlV1o+klhkLG1Nq5QlPvVI0OIqVu9vQw1urh6
         Q+pzHYL3P3WNS0j6mYbEJzJ+5XXcNpz1/zoGIohL5M4tzW8w09mIiWDOkzqE0cKu9h/r
         shfy7X7yx/84omLlfG6L/Y3Eg8mGCftIEmtsdBspgGS8wv4YgY634sz+eGOWL2Inkafx
         /7So0pX53PCvqEZQMRLEjJST7vs70vpfJ/QIaXHBo/DbJvNRrliclhLviSnKhHqftfR+
         SlVQ==
X-Gm-Message-State: ACrzQf02hprdSGnuMYNDbKi6x59drAqr/dvd3K+8GIeC1bgiIYC82Qsy
	tgSD8uCAtibsMPGGE1Zh0zFuig==
X-Google-Smtp-Source: AMsMyM4r9X/im4Bovuy9Fj/WpKriNFPX2D47xTmO98ajKNR/1ytDR/C0epzDHfXxnbD43H3sSa6JuA==
X-Received: by 2002:a05:651c:542:b0:277:fb6:b88a with SMTP id q2-20020a05651c054200b002770fb6b88amr20496260ljp.208.1667905772151;
        Tue, 08 Nov 2022 03:09:32 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id bp9-20020a056512158900b004b19f766b07sm1745746lfb.91.2022.11.08.03.09.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 03:09:31 -0800 (PST)
Message-ID: <48988a50-3c3d-7a85-af28-66f7842e5893@linaro.org>
Date: Tue, 8 Nov 2022 12:09:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: uniphier: Add system controller
 bindings
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Masami Hiramatsu <mhiramat@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221107103410.3443-1-hayashi.kunihiko@socionext.com>
 <20221107103410.3443-2-hayashi.kunihiko@socionext.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107103410.3443-2-hayashi.kunihiko@socionext.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/11/2022 11:34, Kunihiko Hayashi wrote:
> Add DT binding schema for system controller implemented in UniPhier SoCs.
> This describes that the nodes defined here are treated as "syscon".
> 
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  .../socionext/socionext,uniphier-sysctrl.yaml | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/socionext/socionext,uniphier-sysctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/socionext/socionext,uniphier-sysctrl.yaml b/Documentation/devicetree/bindings/arm/socionext/socionext,uniphier-sysctrl.yaml
> new file mode 100644
> index 000000000000..be7cf72c232e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/socionext/socionext,uniphier-sysctrl.yaml

arm is only for top-level stuff. System controllers go to soc.

> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/socionext/socionext,uniphier-sysctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Socionext UniPhier system controller
> +
> +maintainers:
> +  - Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> +
> +description: |+
> +  This describes the devicetree bindings for system controller
> +  implemented on Socionext UniPhier SoCs.

Drop "This describes the devicetree bindings for" and instead describe
the hardware.

> +
> +properties:
> +  compatible:
> +    oneOf:

You do not have more than one entry, so no need for oneOf.

> +      - items:
> +          - enum:
> +              # sysctrl
> +              - socionext,uniphier-ld4-sysctrl
> +              - socionext,uniphier-pro4-sysctrl
> +              - socionext,uniphier-pro5-sysctrl
> +              - socionext,uniphier-pxs2-sysctrl
> +              - socionext,uniphier-ld6b-sysctrl
> +              - socionext,uniphier-sld8-sysctrl
> +              - socionext,uniphier-ld11-sysctrl
> +              - socionext,uniphier-ld20-sysctrl
> +              - socionext,uniphier-pxs3-sysctrl
> +              - socionext,uniphier-nx1-sysctrl
> +              - socionext,uniphier-sysctrl
> +              # soc-glue
> +              - socionext,uniphier-ld4-soc-glue
> +              - socionext,uniphier-pro4-soc-glue
> +              - socionext,uniphier-pro5-soc-glue
> +              - socionext,uniphier-pxs2-soc-glue
> +              - socionext,uniphier-ld6b-soc-glue
> +              - socionext,uniphier-sld8-soc-glue
> +              - socionext,uniphier-ld11-soc-glue
> +              - socionext,uniphier-ld20-soc-glue
> +              - socionext,uniphier-pxs3-soc-glue
> +              - socionext,uniphier-nx1-soc-glue
> +              - socionext,uniphier-soc-glue
> +              # perictrl
> +              - socionext,uniphier-ld4-perictrl
> +              - socionext,uniphier-pro4-perictrl
> +              - socionext,uniphier-pro5-perictrl
> +              - socionext,uniphier-pxs2-perictrl
> +              - socionext,uniphier-ld6b-perictrl
> +              - socionext,uniphier-sld8-perictrl
> +              - socionext,uniphier-ld11-perictrl
> +              - socionext,uniphier-ld20-perictrl
> +              - socionext,uniphier-pxs3-perictrl
> +              - socionext,uniphier-nx1-perictrl
> +              - socionext,uniphier-perictrl
> +              # sdctrl
> +              - socionext,uniphier-ld4-sdctrl
> +              - socionext,uniphier-pro4-sdctrl
> +              - socionext,uniphier-pro5-sdctrl
> +              - socionext,uniphier-pxs2-sdctrl
> +              - socionext,uniphier-ld6b-sdctrl
> +              - socionext,uniphier-sld8-sdctrl
> +              - socionext,uniphier-ld11-sdctrl
> +              - socionext,uniphier-ld20-sdctrl
> +              - socionext,uniphier-pxs3-sdctrl
> +              - socionext,uniphier-nx1-sdctrl
> +              - socionext,uniphier-sdctrl
> +              # mioctrl
> +              - socionext,uniphier-ld4-mioctrl
> +              - socionext,uniphier-pro4-mioctrl
> +              - socionext,uniphier-sld8-mioctrl
> +              - socionext,uniphier-ld11-mioctrl
> +              - socionext,uniphier-mioctrl
> +              # adamv
> +              - socionext,uniphier-ld11-adamv
> +              - socionext,uniphier-ld20-adamv
> +              - socionext,uniphier-adamv
> +          - const: simple-mfd
> +          - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties:
> +  type: object

No, instead you should describe the children. This must me
additionalProperties: false

You also miss example.

Start from example-schema as your template or guidance.

Best regards,
Krzysztof

