Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1007BCD98F8
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 07:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1B87C433CB; Wed, 11 Oct 2023 07:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA45C433C8;
	Wed, 11 Oct 2023 07:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697010536;
	bh=whI12s+xP/WyKhnwJghEvRm/9Q3iMkjAyASaMzjt4AU=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=xObSPjwT6VfjYAbLH/8/jrqrLSbVn2GhcgqCKQJICeoIdle5F7lQmaZHBMJa1k+Bv
	 y+BGNJn32ARrr+jU0aLQNTMTZ+p1nSARRoXYzDPc5ViPMI/+XWLzrnZU87VvscwoP8
	 WIQiiMd0/vdOkwQ1Arc+xsUBw5Iaj9x/6jpK33Gw=
Date: Wed, 11 Oct 2023 09:48:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
	tomasz.figa@gmail.com, s.nawrocki@samsung.com,
	linus.walleij@linaro.org, wim@linux-watchdog.org,
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
	tudor.ambarus@linaro.org, andre.draszik@linaro.org,
	semen.protsenko@linaro.org, saravanak@google.com,
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 08/20] dt-bindings: serial: samsung: Add
 google-gs101-uart compatible
Message-ID: <2023101111-banknote-satin-1f77@gregkh>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-9-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010224928.2296997-9-peter.griffin@linaro.org>

On Tue, Oct 10, 2023 at 11:49:16PM +0100, Peter Griffin wrote:
> Add dedicated google-gs101-uart compatible to the dt-schema for
> representing uart of the Google Tensor gs101 SoC.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> index 8bd88d5cbb11..72471ebe5734 100644
> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> @@ -19,11 +19,13 @@ properties:
>    compatible:
>      oneOf:
>        - items:
> +          - const: google,gs101-uart
>            - const: samsung,exynosautov9-uart
>            - const: samsung,exynos850-uart
>        - enum:
>            - apple,s5l-uart
>            - axis,artpec8-uart
> +          - google,gs101-uart

These shouldn't be needed, just declare the device as the same as what
the chip really is (i.e. a samsung uart), that way no .yaml or kernel
driver changes are needed at all.

thanks,

greg k-h
