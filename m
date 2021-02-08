Return-Path: <SRS0=Nkqh=HK=gmail.com=k.kozlowski.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C7AC433DB
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 10:27:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7FD4E64ECC; Mon,  8 Feb 2021 10:27:35 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E169464EC5;
	Mon,  8 Feb 2021 10:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E169464EC5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=k.kozlowski.k@gmail.com
Received: by mail-ej1-f52.google.com with SMTP id b9so23652123ejy.12;
        Mon, 08 Feb 2021 02:27:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/sXUHbfTSNaWe0Vrtyl40wVJaY9DiX1LwKI8X9Eee5A=;
        b=etLuROI9m8K5kMcFgLcNGs69DIZZ2/cQalDwubFoXV8AE9jelw+WC5GxDfLA4DH1do
         LMXKCYtYWXjVWoBFyWBcF7/FKB8LSi1lDpJH9uTR9MhXEIpsdgIwRjLdT6JI0eEi0q/v
         KqKM4B+rjm3+HXjpGkbO1KdtV0f0XzExSwHg01r0DKVQyqBg2ADI2UYcpHLbUo6URZs9
         W8twyDtg8u3Twjk+H9fHONzyjaX/E9Pg7JndvoUYHbwOKG2BMSz8fRnfYLb4dd0yU4I2
         x86pDuSPJE6Z2F4FCaZgiqrGxByJTp9pK7Hnav8f34HOJYF/r0igk1XwXCPgMHW9hxDl
         dFsw==
X-Gm-Message-State: AOAM531Ljug5XAkfQOb1tyTzCdjJU/W++r7z3pkvkouKOb8j97SkeFzj
	bEwypMvad8VTdM9xzndW/L8=
X-Google-Smtp-Source: ABdhPJy0w+9yYbPmP5ReyAJ8xWSe+CjI2MLaTbf6iSDnOvs1rvvIS/VC0J1GAivNVnbfEQN34Rlpyw==
X-Received: by 2002:a17:906:6bc5:: with SMTP id t5mr11941692ejs.253.1612780053394;
        Mon, 08 Feb 2021 02:27:33 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id b3sm9289294edw.14.2021.02.08.02.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 02:27:32 -0800 (PST)
Date: Mon, 8 Feb 2021 11:27:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, robh+dt@kernel.org,
	Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 01/18] dt-bindings: vendor-prefixes: add AAPL prefix
Message-ID: <20210208102730.p4nhsl35oowsklv2@kozik-lap>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-2-marcan@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210204203951.52105-2-marcan@marcan.st>

On Fri, Feb 05, 2021 at 05:39:34AM +0900, Hector Martin wrote:
> Amusingly, this wasn't yet documented, even though this vendor prefix
> has been used since time immemorial on PPC.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 041ae90b0d8f..d7950c723472 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -25,6 +25,8 @@ patternProperties:
>    # Keep list in alphabetical order.
>    "^70mai,.*":
>      description: 70mai Co., Ltd.
> +  "^AAPL,.*":

All prefixes are lower case... see ABB below (not mentioning that the
company name is not APPLE), so just "apple".

> +    description: Apple Inc.
>    "^abb,.*":
>      description: ABB

Best regards,
Krzysztof
