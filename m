Return-Path: <SRS0=ycs+=UK=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9ABC433EF
	for <soc@archiver.kernel.org>; Thu, 31 Mar 2022 20:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7762CC340F0; Thu, 31 Mar 2022 20:37:47 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97661C340ED;
	Thu, 31 Mar 2022 20:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 97661C340ED
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-de48295467so558248fac.2;
        Thu, 31 Mar 2022 13:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aC+tCijUVPKI7nGBwd+nln2pgwufchUfIBD5KMT91Xk=;
        b=M3s0pbAw+8OsVzX4uZPbTLg/oSS92V/wE8+v656bJhgNmMQcYRqLKeHgr5dIxp/B8r
         uQtqGF38iMlqNm141EGeFg+Mn8GqZWEL4bYMwFezrF62ya2Olh2UmwF8k6n4Mc2Ygsze
         r6oLD89giDyk7HFy3AY/aYHZ0evb/NILVPIlBY0kuIOPVPxDcMQrm5y3U+FzisPBPWnG
         JUS6cTq/Xi1qwAMdfyKsr/zs+AP4aDrFohX8jFXYpe8GHkvFXWN8Togy3i31whdlsaJf
         4YTpiyzvHkEjlZKesqT4t8Vgv6R1vKrI7soEGowSuvVCUkMqAENSfxCQXtMIfkuErqOZ
         GANQ==
X-Gm-Message-State: AOAM532RVn46ezFa5auxusXfhkEVA3sRyqPS7WGfK3lJgR8KzB+tBrf/
	zgVdn5K0wZ3JbEW3vOvUYA==
X-Google-Smtp-Source: ABdhPJxZPwZTST4T5zDJ7hQZzH4dKiGtYUkP7MRT9ZWl+bcyWzED9bnOP3hWhIPAXY/E4rf4oXLl5Q==
X-Received: by 2002:a05:6870:d1c7:b0:de:f3a2:c6f4 with SMTP id b7-20020a056870d1c700b000def3a2c6f4mr3571342oac.164.1648759065707;
        Thu, 31 Mar 2022 13:37:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q11-20020a4a330b000000b003289cbe97c6sm268863ooq.13.2022.03.31.13.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 13:37:45 -0700 (PDT)
Received: (nullmailer pid 1450145 invoked by uid 1000);
	Thu, 31 Mar 2022 20:37:44 -0000
Date: Thu, 31 Mar 2022 15:37:44 -0500
From: Rob Herring <robh@kernel.org>
To: Jacky Huang <ychuang3@nuvoton.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, krzk+dt@kernel.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, cfli0@nuvoton.com
Subject: Re: [PATCH 2/3] dt-bindings: clock: Document MA35D1 clock controller
 bindings
Message-ID: <YkYRGNr1o087/6MM@robh.at.kernel.org>
References: <20220331024256.14762-1-ychuang3@nuvoton.com>
 <20220331024256.14762-3-ychuang3@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331024256.14762-3-ychuang3@nuvoton.com>

On Thu, Mar 31, 2022 at 10:42:55AM +0800, Jacky Huang wrote:
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

These aren't usually in the clock controller...

> +
> +  assigned-clock-rates:
> +    maxItems: 4
> +
> +  clock-pll-mode:
> +    maxItems: 4

What's this? Not a standard property. Needs a type, description, and 
vendor prefix.

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
> +  - |
> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +
> +    clk: clock-controller@40460200 {
> +        compatible = "nuvoton,ma35d1-clk";
> +        reg = <0x40460200 0x100>;
> +        #clock-cells = <1>;
> +    };
> +...
> -- 
> 2.30.2
> 
> 
