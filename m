Return-Path: <SRS0=ZujC=FN=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99EEFC433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 16:35:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 78AF4239E5; Wed,  9 Dec 2020 16:35:39 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 403D222BF3
	for <soc@kernel.org>; Wed,  9 Dec 2020 16:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 403D222BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-oi1-f194.google.com with SMTP id l200so2323223oig.9
        for <soc@kernel.org>; Wed, 09 Dec 2020 08:35:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/5eXeZ1rOl1SnuLrH50s341Cy25jly+HKj6684KUWPc=;
        b=Vdlnz01konUMd8Oob044CbApTpv5RUw5ZatnbDi4M1ygNkz0PUMwkYpBQrBBNVkHJW
         /cLotSQumPJbS+oi61KuebfnSwWjJvXfIFFJEVKN9JlS2M323tYrvvsuYO3BSGYp8FVW
         nXLjwEs7Usw7IBhSkJ5ZA3EX0I5oIGtZA+lFLkRW9yOiQwGFXldQROGYMinm13RYLgGh
         PIsi/PxHLkoQyztyWeSRgE5zS9WYww8+hcGy+L3SMQKN04OFnpPkRy58HGmZmJmAopYu
         9MROB6ltvDUQAEmfaMMceaO1HHYpbLSW7InNlEAlPdHeP565kv7Oweyldqqfsc5U1ITn
         LWUw==
X-Gm-Message-State: AOAM530MDsjTvmxTPvBpdloemyHm1P7I/PfpNFfr4nrzese0+RAWSUuK
	DzXFjnYqd4XaOYh6d+2ZFkXkMao0Fw==
X-Google-Smtp-Source: ABdhPJyRz0Ow15DwwuB85ognDOjEEsa6IIR6nWF8zZkU2X8hroQcLUEZZWkbV0eiPUgWqqrlivMqdw==
X-Received: by 2002:aca:d5c3:: with SMTP id m186mr2314853oig.73.1607531738289;
        Wed, 09 Dec 2020 08:35:38 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r12sm413774ooo.25.2020.12.09.08.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 08:35:37 -0800 (PST)
Received: (nullmailer pid 569438 invoked by uid 1000);
	Wed, 09 Dec 2020 16:35:36 -0000
Date: Wed, 9 Dec 2020 10:35:36 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, olof@lixom.net, arnd@arndb.de, w@1wt.eu
Subject: Re: [PATCH v2 01/10] dt-bindings: mstar: Add binding details for
 mstar,smpctrl
Message-ID: <20201209163536.GB566058@robh.at.kernel.org>
References: <20201201134330.3037007-1-daniel@0x0f.com>
 <20201201134330.3037007-2-daniel@0x0f.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201134330.3037007-2-daniel@0x0f.com>

On Tue, Dec 01, 2020 at 10:43:21PM +0900, Daniel Palmer wrote:
> This adds a YAML description of the smpctrl node needed by the
> platform code for the MStar/SigmaStar Armv7 SoCs to boot secondary cpus.

You need an 'enable-method' string defined too.

> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  .../bindings/arm/mstar/mstar,smpctrl.yaml     | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mstar/mstar,smpctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mstar/mstar,smpctrl.yaml b/Documentation/devicetree/bindings/arm/mstar/mstar,smpctrl.yaml
> new file mode 100644
> index 000000000000..599c65980f5d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mstar/mstar,smpctrl.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2020 thingy.jp.
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mstar/mstar,smpctrl.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MStar/SigmaStar Armv7 SoC SMP control registers
> +
> +maintainers:
> +  - Daniel Palmer <daniel@thingy.jp>
> +
> +description: |
> +  MStar/SigmaStar's Armv7 SoCs that have more than one processor
> +  have a region of registers that allow setting the boot address
> +  and a magic number that allows secondary processors to leave
> +  the loop they are parked in by the boot ROM.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - sstar,ssd201-smpctrl # SSD201/SSD202D
> +      - const: mstar,smpctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    smpctrl@204000 {
> +        compatible = "sstar,ssd201-smpctrl", "mstar,smpctrl";
> +        reg = <0x204000 0x200>;
> +    };
> -- 
> 2.29.2
> 
