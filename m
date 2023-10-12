Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0527BCDB474
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 23:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4650C433CA; Thu, 12 Oct 2023 23:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92540C433C7;
	Thu, 12 Oct 2023 23:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697153656;
	bh=2hOV/A99q7Vw2ihfrRngmpOQSr3R2rMB6q/KtChtdlQ=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=larpwYHwnfF14OohEdapHA//IHTxle4bwtbkVzm+Uv9W89nmUV9cZxDKb/k1gKxqW
	 yfiRMP0zowW2HUFKSiqvLmqDd1QNyNBrnmvOmuy7QHonQDeOutX6zydQ7z1OxEd+Ko
	 fYflCwCix/Bu/hX3PVdnByDzmL2HMRqCMLvlVj65elPs6HqPFWjePx9tNGVPzptPoi
	 w+FCeSFtlkGYmEZJv3fMiZ+CLHh+J8fUTnfwlan9R2TfBMDc0F/HzDdZ0+k7OB6xoH
	 rceaN+CLTEt0avfItppsYaLzdoGwOCs1TlWwJS+OCg6EATRRJ/yBSjcSRlt4th6Vtp
	 Is0hG1yVLiP0w==
Message-ID: <c99033583cb9dc33eff3c427cdb6fb3f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231011184823.443959-3-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-3-peter.griffin@linaro.org>
Subject: Re: [PATCH v3 02/20] dt-bindings: clock: Add Google gs101 clock management unit bindings
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: peter.griffin@linaro.org, tudor.ambarus@linaro.org, andre.draszik@linaro.org, semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, kernel-team@android.com, linux-serial@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>, arnd@arndb.de, catalin.marinas@arm.com, conor+dt@kernel.org, cw00.choi@samsung.com, gregkh@linuxfoundation.org, krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org, linux@roeck-us.net, mturquette@baylibre.com, olof@lixom.net, robh+dt@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, will@kernel.org, wim@linux-watchdog.org
Date: Thu, 12 Oct 2023 16:34:14 -0700
User-Agent: alot/0.10

Quoting Peter Griffin (2023-10-11 11:48:05)
> diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.y=
aml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> new file mode 100644
> index 000000000000..f74494594b3b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> @@ -0,0 +1,125 @@
[...]
> +properties:
> +  compatible:
> +    enum:
> +      - google,gs101-cmu-top
> +      - google,gs101-cmu-apm
> +      - google,gs101-cmu-misc
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2

Can you remove clock-names from the binding and simply use the index of
the clocks property? That means less string comparisons in the kernel.
I'm not sure if other samsung clk drivers are doing this though so maybe
clock-names is preferred for historical reasons.
