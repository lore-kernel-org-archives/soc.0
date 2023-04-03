Return-Path: <SRS0=gdDO=72=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879F0C76196
	for <soc@archiver.kernel.org>; Mon,  3 Apr 2023 18:14:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F1FEC4339C; Mon,  3 Apr 2023 18:14:10 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 219A3C433D2;
	Mon,  3 Apr 2023 18:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 219A3C433D2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id x8-20020a9d3788000000b0069f922cd5ceso16107230otb.12;
        Mon, 03 Apr 2023 11:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680545648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diAU2gDNpfvEkf0KkvkJMk9DSdJLB8pM+UR1PjlRd1Q=;
        b=zzJzejZFYY7kVCmzObd5Bi40HDPKctjr46vO0DJzxE5Q6Vo2Zhlmc26bk3MWLCsQrn
         2CVND5I3mOfczaZ3HXvNjAsJ2mWLug64BUOZLZplDim4/JwGY7vYgO6xCOmv6/xEHiwi
         I9jT/iOtnxLzFCwnzxwKEd/iRyewut0o7pERyIsGuIZUSsb3lQ49yMFsyIKrGss0zC2P
         X+qijVcmGZ1ThytQ2WkBbJIyxQCvUcy2wIdhz0CvtzYAZ283NXkxwzLMyUMQ4IiJrIJ8
         l6aKQglygY7VxyJKquOb3kA8RoBJEadaD+eJ3FC9SIDNXiSm7NcXExWRnUUaHMDfOIT2
         tpPw==
X-Gm-Message-State: AAQBX9fYgoy0guoY7X9nHt3zrplIsCBc9CC96vbu9htJWxUpUWqfYsiW
	Cpvpg9p+QdSuJ9hyLY3efg==
X-Google-Smtp-Source: AKy350YIttDvDJ7Vo5p8cx/PBF4e+AWAEha5v/UWeHolpwFR8Usk5pByB0bDAyqoZKGl66OTAz+Yfw==
X-Received: by 2002:a9d:6f8f:0:b0:6a1:7eaa:3836 with SMTP id h15-20020a9d6f8f000000b006a17eaa3836mr56953otq.5.1680545648143;
        Mon, 03 Apr 2023 11:14:08 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i26-20020a9d68da000000b0069dd3d98ec6sm4635107oto.44.2023.04.03.11.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 11:14:07 -0700 (PDT)
Received: (nullmailer pid 1277282 invoked by uid 1000);
	Mon, 03 Apr 2023 18:14:07 -0000
Date: Mon, 3 Apr 2023 13:14:07 -0500
From: Rob Herring <robh@kernel.org>
To: Stefan Wahren <stefan.wahren@chargebyte.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Evgeniy Polyakov <zbr@ioremap.net>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com, soc@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, stefan.wahren@i2se.com
Subject: Re: [PATCH V4 2/6] dt-bindings: w1: Add DS2482/DS2484 I2C to 1-W
 bridges
Message-ID: <20230403181407.GA1242137-robh@kernel.org>
References: <20230331210840.4061-1-stefan.wahren@chargebyte.com>
 <20230331210840.4061-3-stefan.wahren@chargebyte.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331210840.4061-3-stefan.wahren@chargebyte.com>

On Fri, Mar 31, 2023 at 11:08:36PM +0200, Stefan Wahren wrote:
> Even this binding look trivial, the actual hardware supports more
> features (e.g. sleep mode control GPIO). So add this as a dedicated
> devicetree binding for the Maxim DS2482/DS2484 I2C to 1-W bridges,
> which can be extended later.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
> ---
>  .../devicetree/bindings/w1/maxim,ds2482.yaml  | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/w1/maxim,ds2482.yaml
> 
> diff --git a/Documentation/devicetree/bindings/w1/maxim,ds2482.yaml b/Documentation/devicetree/bindings/w1/maxim,ds2482.yaml
> new file mode 100644
> index 000000000000..fd692a3a7400
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/w1/maxim,ds2482.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/w1/maxim,ds2482.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim One wire bus master controller
> +
> +maintainers:
> +  - Stefan Wahren <stefan.wahren@chargebyte.com>
> +
> +description: |
> +  I2C to 1-wire bridges
> +
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/ds2482-100.pdf
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/DS2482-800.pdf
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/DS2484.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,ds2482
> +      - maxim,ds2484
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

To allow children, all that's needed for 1-wire is:

additionalProperties:
  type: object

> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      onewire@18 {
> +        compatible = "maxim,ds2484";
> +        reg = <0x18>;
> +      };
> +    };
> -- 
> 2.17.1
> 
