Return-Path: <SRS0=2kil=UK=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3844C433EF
	for <soc@archiver.kernel.org>; Thu, 31 Mar 2022 06:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 57E2AC34110; Thu, 31 Mar 2022 06:27:39 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F305C340ED
	for <soc@kernel.org>; Thu, 31 Mar 2022 06:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5F305C340ED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id qa43so45889466ejc.12
        for <soc@kernel.org>; Wed, 30 Mar 2022 23:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hnWdlmqxMOaLiEjonagZkR7OoglUhQY9jRtY4sA56yg=;
        b=TQGgkFMOMKjrhzhg1buAAt2dln2/Y76JCQKayw3/AFBjl/55VPEBjFtHJqvwUHABYk
         zx4NjQmIc+cYgyHYx8xMqr2J0u3y1FHnplY9mYqctDMDmYAmLsvETVP667ksLnSEaDyk
         4J+FT5x58ISqcbHNsc4f8ddXZ5H98q4AjI1NK63c7XiJUoTyAp/LIWuNdehwxpzTwVf0
         VsEfqqHBCDcJdln/X1o345dU1335IvQ4VHOEZUeNan3PtDj6FK0L2EbpidUsNX2qRCiX
         611Fe7bLspzdEEnWuHjeSxsE+Y9JWeO2xkeTxyZyy5k+JCfL94rKKOXkri7kenKsiFlF
         aqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hnWdlmqxMOaLiEjonagZkR7OoglUhQY9jRtY4sA56yg=;
        b=AWuK9yKavAhOvdPIpL9q4qnbyJlYknDzSLtuE2DcQDBUH8FzppSGX/fU6yLyjNCXMU
         dWNEbvZ5ntZUS8iiy4iWUN/nGVk7X9s+HRM+6QujJyT0ZsE3p11P0HD42FxosaIF5+24
         gmT+AZHmwaBvqn5ZmyxTgdoinuPF5d6A1OiC22Mihud8HJL/SCDzQFgiIQ2ihgSB53hS
         8Q63j/QowOdXONv0GB2K4M+homJg2TVQpuD58RwkfN9fMnru0x+dl5vBllcNGqACACRt
         yHAdwm25LXPfGVyVUceh+EZDUV0HqaPTZMs8U0uuIAVXOt1UaRFy2cj4F44U3vOCS1a3
         YZ1Q==
X-Gm-Message-State: AOAM532kKkaVoP6YzMuNYfMEQ3bkFXuSeGYGNqZ+odm6/WIHdJs4HIAn
	ax4Ml2Dq0aaEELy6Zid6qOP0OA==
X-Google-Smtp-Source: ABdhPJznK1yc+Q8z09lYsKMyARLvyV/F5B8LDTxytJ3B10ASFD6OyJpaHp5kCShMKGp4w4XQ85EeeA==
X-Received: by 2002:a17:907:a422:b0:6e0:238c:4f44 with SMTP id sg34-20020a170907a42200b006e0238c4f44mr3526205ejc.257.1648708056576;
        Wed, 30 Mar 2022 23:27:36 -0700 (PDT)
Received: from [192.168.0.164] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id e9-20020a170906c00900b006d4a45869basm9017489ejz.199.2022.03.30.23.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 23:27:36 -0700 (PDT)
Message-ID: <6be6ffd1-a303-f3f2-0424-0ce622de197f@linaro.org>
Date: Thu, 31 Mar 2022 08:27:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] dt-bindings: clock: Document MA35D1 clock controller
 bindings
Content-Language: en-US
To: Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, cfli0@nuvoton.com
References: <20220331024256.14762-1-ychuang3@nuvoton.com>
 <20220331024256.14762-3-ychuang3@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220331024256.14762-3-ychuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2022 04:42, Jacky Huang wrote:
> Add documentation to describe Nuvoton MA35D1 clock driver bindings.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---
>  .../bindings/clock/nuvoton,ma35d1-clk.yaml    | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml
> new file mode 100644
> index 000000000000..bf5474b10420
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/nuvoton,ma35d1-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 Clock Control Module Binding
> +
> +maintainers:
> +  - Chi-Fang Li <cfli0@nuvoton.com>
> +  - Jacky Huang <ychuang3@nuvoton.com>
> +
> +description: |
> +  The MA35D1 clock controller generates clocks for the whole chip,
> +  including system clocks and all peripheral clocks.
> +
> +  See also:
> +    dt-bindings/clock/ma35d1-clk.h

Full path needed.

> +
> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-clk
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  assigned-clocks:
> +    maxItems: 4
> +
> +  assigned-clock-rates:
> +    maxItems: 4
> +
> +  clock-pll-mode:
> +    maxItems: 4
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  # clock control module node:

Useless comment, remove it.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
