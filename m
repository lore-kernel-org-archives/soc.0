Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBC2CD6E46
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 08:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D2AF6C433C8; Wed, 11 Oct 2023 08:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A06C433C9;
	Wed, 11 Oct 2023 08:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697014662;
	bh=Jar50BFpn4ceL/3BwwKcIxNp41CppbmOA2Rnf4Rq1ro=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=smiCqcy4A3aWoGUpE+ucN12YoEtgDlT073krkVtUOe/syLT85lqWUhzcd8rOHHnQM
	 4CGcIjeAL2q/7+zEMKIrwPdBzhaO0qK6Ne2aICxJ2ghKzCdHlYgVIFGHf6UTJdzMM1
	 S4CkuiCGt/O0l+wy0LMVYybV1XRKWNFUWtq6t8As=
Date: Wed, 11 Oct 2023 10:57:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
	s.nawrocki@samsung.com, linus.walleij@linaro.org,
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de, olof@lixom.net,
	cw00.choi@samsung.com, andre.draszik@linaro.org,
	semen.protsenko@linaro.org, saravanak@google.com,
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 08/20] dt-bindings: serial: samsung: Add
 google-gs101-uart compatible
Message-ID: <2023101137-fester-rerun-5c39@gregkh>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-9-peter.griffin@linaro.org>
 <2023101111-banknote-satin-1f77@gregkh>
 <a6c57156-d3a5-4524-8ef8-6f27cf0a2c97@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6c57156-d3a5-4524-8ef8-6f27cf0a2c97@linaro.org>

On Wed, Oct 11, 2023 at 09:49:07AM +0100, Tudor Ambarus wrote:
> Hi, Greg,
> 
> On 10/11/23 08:48, Greg KH wrote:
> > On Tue, Oct 10, 2023 at 11:49:16PM +0100, Peter Griffin wrote:
> >> Add dedicated google-gs101-uart compatible to the dt-schema for
> >> representing uart of the Google Tensor gs101 SoC.
> >>
> >> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> >> ---
> >>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> >> index 8bd88d5cbb11..72471ebe5734 100644
> >> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> >> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> >> @@ -19,11 +19,13 @@ properties:
> >>    compatible:
> >>      oneOf:
> >>        - items:
> >> +          - const: google,gs101-uart
> >>            - const: samsung,exynosautov9-uart
> >>            - const: samsung,exynos850-uart
> >>        - enum:
> >>            - apple,s5l-uart
> >>            - axis,artpec8-uart
> >> +          - google,gs101-uart
> > 
> > These shouldn't be needed, just declare the device as the same as what
> 
> We should have SoC specific compatibles so that any further quirks or
> incompatibilities can be easily addressed.

"further" work on quirks or incompatibilities can be added when they are
found and needed.  We don't add stuff for no good reason to the kernel.

> It's not only the IP itself
> that can differ, it's also the integration of the IP into the final
> product that could have an influence on the behavior.

This is for the Pixel 6, a device that is no longer even shipping.  The
"final product" is long stable, so this should not be an issue.

thanks,

greg k-h
