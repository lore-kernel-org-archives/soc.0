Return-Path: <SRS0=l5IZ=SR=bgdev.pl=brgl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F88C433F5
	for <soc@archiver.kernel.org>; Wed,  2 Feb 2022 09:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B3D7C340F1; Wed,  2 Feb 2022 09:17:08 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B28C9C004E1
	for <soc@kernel.org>; Wed,  2 Feb 2022 09:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B28C9C004E1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ej1-f51.google.com with SMTP id a8so63139339ejc.8
        for <soc@kernel.org>; Wed, 02 Feb 2022 01:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x9rntTeDhb6XRDh9/nW9Vd6mnOlOZBc9Iqn9gcca+t4=;
        b=BHT96a9j020XxUsQWDK20Qo2NUtO20lg55wm++jPoJnYThjUUezbh67CjJK7F0rhHM
         WMR0SlUFQ67HKnd5UAq3t8wQw0/IcfiDR64E3Bl3ek5iU+rwGtlsQZv4EhHS3HlLll70
         vz81NfQyhvIr/DEWlvNCdVHwVdrYwjwE9rJGuyve+JUZRxMWWVM4Ob6EneixpLbaAEL3
         mL8ezHkwZky0WbKNDvZRzGI3ZK6UaCQ70KIPB4ePlH3jMJWTS1GZycbEkrbm1j6fw1Um
         8sXv5bQxeCXb57VdMFBZNPF2Oeyyi4RN6dtQaE8SAPEe1FFoplZ5LDWHWcIAME4ULSu0
         Kj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x9rntTeDhb6XRDh9/nW9Vd6mnOlOZBc9Iqn9gcca+t4=;
        b=YuVmAWSUSCKI6QovitTLUlOEiVIWxWB7syT1csdQMxmhZtpTmk6D+m1WbKCGeCM4NM
         i0o6j75OFLdh88bf0exYU/t3k2yyinYP7e6g0pxj2EHgMqQGt6D8TcJ8/zAHU9E2PW+Q
         O8mOJS8xKkvfNNYrvuYV2gkhUexvBaJpBagObUnV5gAUjtmyt+fEIBn0j7kIRnf9+lIZ
         aFaJbKLcWZoe9Gi6PjSvpbYz10t+nyj+APcTwPTUSYz49/73fBL+D97AMI4rY4xxGSqa
         cA+GAh4LRCCWpV8XwSHnTchbMP+Xmwe7hMmY1SVC8pNdU8pEO2Jugl7c5rg2WyV9O+Ag
         xRUA==
X-Gm-Message-State: AOAM531eq184kzpAdUvU907Ukj6asIK+to9chWknFIvZoeqlMVB/QHJ5
	/JZkSI6HVfzw8fzZoBWY7hiOZS35iK7tu+aageBvuw==
X-Google-Smtp-Source: ABdhPJxO+YT7KVoH0Asl2I194MEaiGQV+55OzPqr2jrXyPvrkGNsigRcmzQHLC5k4+p9ZlceBbVedREV04aU+lGUj4w=
X-Received: by 2002:a17:907:6e1f:: with SMTP id sd31mr24802407ejc.286.1643793425982;
 Wed, 02 Feb 2022 01:17:05 -0800 (PST)
MIME-Version: 1.0
References: <20220130145116.88406-1-nbd@nbd.name> <20220130145116.88406-12-nbd@nbd.name>
In-Reply-To: <20220130145116.88406-12-nbd@nbd.name>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Feb 2022 10:16:55 +0100
Message-ID: <CAMRc=McAvYmjvCU8-OA3Yb+YuXF7KaGC6E3RnFMN7eSUXiUz+Q@mail.gmail.com>
Subject: Re: [PATCH v9 11/13] dt-bindings: arm: airoha: Add binding for Airoha
 GPIO controller
To: Felix Fietkau <nbd@nbd.name>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	John Crispin <john@phrozen.org>, soc@kernel.org, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 30, 2022 at 3:54 PM Felix Fietkau <nbd@nbd.name> wrote:
>
> From: John Crispin <john@phrozen.org>
>
> Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
> GPIOs
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  .../bindings/gpio/airoha,en7523-gpio.yaml     | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml b/Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml
> new file mode 100644
> index 000000000000..66c00ec85731
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/airoha,en7523-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha EN7523 GPIO controller
> +
> +maintainers:
> +  - John Crispin <john@phrozen.org>
> +
> +description: |
> +  Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
> +  GPIOs.
> +
> +properties:
> +  $nodename:
> +    pattern: "^gpio@[0-9a-f]+$"
> +
> +  compatible:
> +    items:
> +      - const: airoha,en7523-gpio
> +
> +  reg:
> +    description: |
> +      The first tuple points to the input register.
> +      The second and third tuple point to the direction registers
> +      The fourth tuple points to the output register
> +    maxItems: 4
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio0: gpio@1fbf0200 {
> +        compatible = "airoha,en7523-gpio";
> +        reg = <0x1fbf0204 0x4>,
> +              <0x1fbf0200 0x4>,
> +              <0x1fbf0220 0x4>,
> +              <0x1fbf0214 0x4>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };
> +
> +    gpio1: gpio@1fbf0270 {
> +        compatible = "airoha,en7523-gpio";
> +        reg = <0x1fbf0270 0x4>,
> +              <0x1fbf0260 0x4>,
> +              <0x1fbf0264 0x4>,
> +              <0x1fbf0278 0x4>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };
> +
> +

I removed this unnecessary newline when applying.

> +...
> --
> 2.32.0 (Apple Git-132)
>

Queued for next, thanks!

Bart
