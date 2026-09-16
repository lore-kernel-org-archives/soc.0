Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026D547F77E
	for <soc@lists.linux.dev>; Wed, 16 Sep 2026 09:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550060; cv=none; b=Vtb+B52EyTjRi9tZ5fUAcxrs1PHuskLBRDnQs2fr9TRJeW3dOf6apLzOUmUieR+4soO+3ZI49000z6TIK0cg60swl5EE4dcjYMEwQe0xitKsgLJr0Vvjox5Hp+7NlamsEluiNJ6u+jDkM61zKLm2qObmKpF0/oW14M9TF91oSho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550060; c=relaxed/simple;
	bh=IqWr3OCkEbgbUvmDu/uRyxYgoRP9YkYUb5hBzz6eFS4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fTUB/L2QXndiRxp6NjlFMQ1IzBVqVvKH3DXfd/HdwnH62MXFDRtJNG7MdQfHl0rT4KbBs1WfHbo0KktZkBma6FH0rj5SmBEu9kruOQm0f0zvycfHjkc1NWb3j9E32alVjFq1pGNAIEBbwCYigNfCnLbbTyKqvzD24xHHz40WO1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4629f/U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4629f/U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 123BD1F0089D
	for <soc@lists.linux.dev>; Wed, 16 Sep 2026 09:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789550045;
	bh=IqWr3OCkEbgbUvmDu/uRyxYgoRP9YkYUb5hBzz6eFS4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=G4629f/UcKe7I5SlFPmwy6hXIMvYowntf5zI+TVR5dUYVPVgiH/HGqzVVCQI9+K9x
	 r9HPN+Oq8a/822bZWof702+JiwGheNgxzoaFwJMc07QmoyD69TKuZGt8ZvBqRKU6E5
	 ydySK/Mu/7VVjVD/79Z1Y5Ol/GL3efea9FLw+lj2hnBatbnfO+98mZlzKsTeq8+fcr
	 iPlHBdT68m0oPDLgPCIoPG7jwOFP+zKzdDXx3QpR6bSNenfMopFTUSZwA8SdG+this
	 V4rtdEx7iar3eLNPj3luvexbGMwq2uVwhh9X4fLIgHt12mph04moHTNd7A89RwSgXR
	 KdWQOXnCs808g==
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a2ff16c0e6so5416261fa.0
        for <soc@lists.linux.dev>; Wed, 16 Sep 2026 02:14:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxoQq/IP+9b3UtqidaQsd3gxKzSMXIFA+j76FKh6otMQl2IXzLHYKlQ3SWvaqlgjuy9x9A=@lists.linux.dev
X-Gm-Message-State: AFuF++lS68w4xAo5vXLbSnL+7+d9vf+7pfqjc1f5H8EQXXXGGvxneZjG
	vw0Q4vrwzaMMlwXxK0B7vHmw0suI5o8M3331EwUvzIn1JD1uJqc4AE846BVTQeKXBNpO4iPc+pd
	CEqGVEPTFxqAiMuP4Z1xGEZFPCW2v+CZNuVxwz5ZBUQ==
X-Received: by 2002:a2e:b8c3:0:b0:3a2:72c:cde9 with SMTP id
 38308e7fff4ca-3a5dc9a7cefmr3078451fa.4.1789550043681; Wed, 16 Sep 2026
 02:14:03 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 05:14:01 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 05:14:01 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
Date: Wed, 16 Sep 2026 05:14:01 -0400
X-Gmail-Original-Message-ID: <CAMRc=McEOcWq8i3B01AR1PnfBzSQaLEaOzE6Qa+QdVXrvS_YrA@mail.gmail.com>
X-Gm-Features: AcwNN1V2X8i9yMMrAT1QmpJK0AF7EkMhYvRTvc6M9zTS3HHfv-L8qE4KXcdtIiI
Message-ID: <CAMRc=McEOcWq8i3B01AR1PnfBzSQaLEaOzE6Qa+QdVXrvS_YrA@mail.gmail.com>
Subject: Re: [PATCH v7 00/15] Ambarella CV75 SoC minimal bring-up
To: longzhao@ambarella.com
Cc: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sep 2026 13:15:30 +0200, Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> said:
> This series adds minimal Ambarella CV75 support for early bring-up with
> a serial console: DT bindings, RCT clocks, pinctrl, PL061 GPIO via
> gpio-regmap, 8250_dw UART quirks, ARCH_AMBARELLA, CV75 EVK DT, and
> MAINTAINERS.
>
> This is a single unified series. Please apply via the SoC
> tree; subsystem maintainers are Cc'd for their pieces.
>

I would prefer to take the GPIO regmap bits through the GPIO tree and provide
an immutable branch to the SoC tree as it has potential for conflicts that
early into the cycle.

Bart
