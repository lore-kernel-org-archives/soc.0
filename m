Return-Path: <SRS0=dex8=HC=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0224C61D90
	for <soc@archiver.kernel.org>; Tue, 21 Nov 2023 15:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9EBB3C433C9; Tue, 21 Nov 2023 15:16:36 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8569C433CD;
	Tue, 21 Nov 2023 15:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A8569C433CD
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-359c1f42680so15578835ab.2;
        Tue, 21 Nov 2023 07:16:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700579794; x=1701184594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHBJbcTYAJFzd8BQozdA+OUJ8WFFDeZmUm9glBYXWMY=;
        b=qqapA3q/+8MXdLabw2YnHNlW1XQvZdzx6oYpbL/DVTkziKEAmmf5voqj/cnDrOugib
         VufENioXOzMG04mYHjt2Flz3homm92f9uCBiwI/MBLQml6w8LJUedFTL9D1kbCzeqt/f
         RXi2zX+B74evItrigaBjZL0XijCw2BjQaQLtuCM6+KXkyDcC99ynPaEDVRvpvWeUi3+X
         Qpj5gyP0cQuhH+VXNhiRjL0okgicZyDH1Pnda/rlUQkCdR7VKoCYVGBj1ur+IkU0fWgr
         +uvcXhFBlj0u/lO3abs6PojQWFS2UI+ZNjHplxa4RMM4JVoyheW4LGcQ86rtnJVKDWGO
         j2Zw==
X-Gm-Message-State: AOJu0YziYY47kCO9Goz6ShPZ4nHOSXOcR0a/piYFYPVRU0l4O/BSgkSr
	ZGBgVTjafb/H1JfMGNaqfQ==
X-Google-Smtp-Source: AGHT+IGs+KFHExCqkcg3K0j2WE48eh5fwSy6aeVyBcCWydv816/PY/81hpz3b4X9rc/LANFLxc7uYA==
X-Received: by 2002:a92:c90e:0:b0:35b:4b9:7883 with SMTP id t14-20020a92c90e000000b0035b04b97883mr6859544ilp.25.1700579794614;
        Tue, 21 Nov 2023 07:16:34 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id s16-20020a02cf30000000b0046676167055sm170383jar.129.2023.11.21.07.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 07:16:33 -0800 (PST)
Received: (nullmailer pid 1791730 invoked by uid 1000);
	Tue, 21 Nov 2023 15:16:30 -0000
Date: Tue, 21 Nov 2023 08:16:30 -0700
From: Rob Herring <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 09/19] dt-bindings: serial: samsung: Make
 samsung,uart-fifosize required property
Message-ID: <20231121151630.GA1692178-robh@kernel.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
 <20231120212037.911774-10-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120212037.911774-10-peter.griffin@linaro.org>

On Mon, Nov 20, 2023 at 09:20:27PM +0000, Peter Griffin wrote:
> Specifying samsung,uart-fifosize in both DT and driver static data is error
> prone and relies on driver probe order and dt aliases to be correct.
> 
> Additionally on many Exynos platforms these are (USI) universal serial
> interfaces which can be uart, spi or i2c, so it can change per board.
> 
> For google,gs101-uart and exynosautov9-uart make samsung,uart-fifosize a
> required property. For these platforms fifosize now *only* comes from DT.
> 
> It is hoped other Exynos platforms will also switch over time.

Then allow the property on them.

> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../bindings/serial/samsung_uart.yaml           | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> index ccc3626779d9..22a1edadc4fe 100644
> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> @@ -133,6 +133,23 @@ allOf:
>              - const: uart
>              - const: clk_uart_baud0
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - google,gs101-uart
> +              - samsung,exynosautov9-uart
> +    then:
> +      properties:
> +        samsung,uart-fifosize:
> +          description: The fifo size supported by the UART channel.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          enum: [16, 64, 256]

We already have 'fifo-size' in several drivers. Use that. Please move 
its type/description definitions to serial.yaml and make drivers just do 
'fifo-size: true' if they use it.

> +
> +      required:
> +       - samsung,uart-fifosize

A new required property is an ABI break. Please explain why that is okay 
in the commit message.

Rob
