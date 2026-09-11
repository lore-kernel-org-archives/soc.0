Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84651478E57
	for <soc@lists.linux.dev>; Fri, 11 Sep 2026 12:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131343; cv=none; b=C6nhGj0FWwniczQTTfd3eD2NNK3HMXZevxVghKeO8/GWfKpn9Pp5c6x0HsflMS70qb1AAQvoEccyLiiYOWK2DPIhv5jFRJB2h5NdBG+9W0pkNvO77lyVsJOluElk/Z0GFnxBHMdhywqvpLGdkrLftvPPk98rqwN9NjA1+GIapls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131343; c=relaxed/simple;
	bh=q5hfUmnX5cI2moI5VNKfCuehyKZytH+0Gd0A3JKIhQ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i9HbVy1SuZER+GbF1qhmSJ678tYinoFKioskv8GO3cv1HFAa6LTstThcWnOUnKjV0cDv7y7jDdE8hkLV3Tbj02oT3eJesWZz6tCEbpAMIZ4Yrrj3eL3sEitdTi5OX3s0fl2RHRvS3VgiY8WbjOb36vtvFlLlsLH99slwAlUbUS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=h9wrj8bb; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="h9wrj8bb"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso9103995e9.3
        for <soc@lists.linux.dev>; Fri, 11 Sep 2026 05:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789131328; x=1789736128; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+ZHt1Hv90ZffrGNuf1k0Rp2yL5IB44JRHsPcN8IeA0=;
        b=h9wrj8bb7AovYhG3LJEIZG6PbA/zfZ7CsOmDWvgdL+4tKH5dMy8uS5DnEsYbNVrI1A
         lBCfb4j18V5GW7uG7eBQRNnw0IUN7S1D1M/HsHbZjyO4m9U15FulaFaeoKfOne0PxLx/
         nofnVkuex5qNJ9PJ8/3x3Tlkkf/p/hmq8I9ii/NsefBkQI6QEZBRQyx9abTnAp3MBkov
         yi7YnFUCeGMuS7RsSxw4KSJ4V1P/48daVAaTKbHXHpu1OIuKQDlcmTQYTu1eBrSSp3KA
         mUCd88xlA37xg5r3otBxDPb5V5yIgCtAe5AJdI6s6XUAoLiRwuLB1U8QbD9aw8osn3Js
         6tzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131328; x=1789736128;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V+ZHt1Hv90ZffrGNuf1k0Rp2yL5IB44JRHsPcN8IeA0=;
        b=jEgRiFsL1HyG8tJf/pDu34NauMcPGPuhV7ewWTDa2nHVP4/MrQBs3G/s8V/PhY1FF1
         /moZIfzljvc0RgCwAl/RJyr6uj0lkI0P2s4m6N60BeqUqkhcbA/rCkhTdz2K5yV+1N1l
         ljY4xs3zehuFoBcEU2EItn6+ujjwuVDsvws8nSM0XfYAwtNi2A1vswXmy+2KT7IasaR4
         d/LmbbPwDDbh7edrJrGe1AtjutOEHQBOhVj7IUmbUS68zFR+FH6bAN7Zk5fJko+18NI6
         ruYnCsHEQrfOJSV0LBT4H4oBl3BFepjRKbbAfW/Q7Wl5Jp3YqBQ96J3mujrwND9rOjns
         LkvA==
X-Forwarded-Encrypted: i=1; AKwUvBxV7T6AYMHJyFRn60bqDZ0zAkjCWwtxiE5vnqyWimScPC1QzSj6x+fD/Ar34N2mMP4Fci0=@lists.linux.dev
X-Gm-Message-State: AFuF++nI3KQlyLOeW4q/7q37lNh6IxNi696XurIFqeOOSJw9PfzAjp2p
	sQJtQF656yDjwRiH/smrtBEpvg5CXxCdwaUqOrz6YexCEaritfRKy55VrvPbUnFQhYg=
X-Gm-Gg: AYBFou3WWE+mZGCHXOtLsZ79DjAusm5Bat1KBo84xmWagU0AP4dV0JSkP/kH/WEiIkC
	LZRJgP3K4fBBbgbx+3S6/2RWYaiqsg2STCmiACk/FV3NAUQe+TVaUfxEAxiDdx3k362rgbHQi4n
	dSh6wTMJ9/k8aykSmVYQlu2zv+nd2q3hwwdLptGoahUD9vj9JxQByzSqOoF1DSvKJjDf2ERmGLQ
	cJEvDIfeKkcWG2wB/lKbXIPe3l8HWQ4Q4JCrcGR7hnYU71587OpdKBqCQJ2XPAfvzOr7MVBA3S/
	b8kvgJc7YFc31PmX+oKlfclUG0ILAt3f9vyRkeGq3rFSX0X988KwCfXpvascX2QEvSjysmymW/Y
	z49DLdeJditS8AP6JpcxokNUXNUn1STPEpgkSPzn2YtBgtrs6ugewAtfaO+i9055M1FKtGMD26a
	lmcAhfKNMJdlaho0//3ofdFb38Z989xI1r+RDqukscd7lX5W+vv4UYT04j6rnUvaXdcpA58IeIo
	e8UXKSXwK7ArIK4R8w=
X-Received: by 2002:a05:600c:3ba9:b0:49c:fa21:e73e with SMTP id 5b1f17b1804b1-49e619c0558mr56438145e9.20.1789131327727;
        Fri, 11 Sep 2026 05:55:27 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a34cacsm41600045e9.0.2026.09.11.05.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:55:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Long Zhao via B4 Relay
 <devnull+longzhao.ambarella.com@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: Long Zhao <longzhao@ambarella.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Ilpo =?utf-8?Q?J=C3=A4rvi?=
 =?utf-8?Q?nen?=
 <ilpo.jarvinen@linux.intel.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao
 <zl020895@163.com>, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 00/13] Ambarella CV75 SoC minimal bring-up
In-Reply-To: <46d21889-6b52-4c09-8f77-7c08dba93777@kernel.org>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <1jwlt1ld6c.fsf@starbuckisacylon.baylibre.com>
 <46d21889-6b52-4c09-8f77-7c08dba93777@kernel.org>
Date: Fri, 11 Sep 2026 14:55:25 +0200
Message-ID: <1jld986j7m.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 04 sept. 2026 at 08:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 04/09/2026 08:54, Jerome Brunet wrote:
>> On ven. 04 sept. 2026 at 14:38, Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org> wrote:
>>>
>>>  .../devicetree/bindings/arm/ambarella.yaml         |  24 +
>>>  .../bindings/clock/ambarella,cv75-rct.yaml         |  64 ++
>>>  .../devicetree/bindings/gpio/pl061-gpio.yaml       |  32 +-
>>>  Documentation/devicetree/bindings/mfd/syscon.yaml  |   1 +
>>>  .../bindings/pinctrl/ambarella,cv75-pinctrl.yaml   | 239 +++++++
>>>  .../bindings/serial/snps-dw-apb-uart.yaml          |   1 +
>>>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>>>  MAINTAINERS                                        |  14 +
>>>  arch/arm64/Kconfig.platforms                       |   6 +
>>>  arch/arm64/boot/dts/Makefile                       |   1 +
>>>  arch/arm64/boot/dts/ambarella/Makefile             |   3 +
>>>  arch/arm64/boot/dts/ambarella/cv75-evk.dts         |  30 +
>>>  arch/arm64/boot/dts/ambarella/cv75.dtsi            | 177 +++++
>>>  arch/arm64/configs/defconfig                       |   1 +
>>>  drivers/clk/Kconfig                                |   1 +
>>>  drivers/clk/Makefile                               |   1 +
>>>  drivers/clk/ambarella/Kconfig                      |  13 +
>>>  drivers/clk/ambarella/Makefile                     |   6 +
>>>  drivers/clk/ambarella/ccu-cv75.c                   | 296 ++++++++
>>>  drivers/clk/ambarella/ccu_common.c                 |  60 ++
>>>  drivers/clk/ambarella/ccu_common.h                 |  25 +
>>>  drivers/clk/ambarella/ccu_mux_div.c                | 234 +++++++
>>>  drivers/clk/ambarella/ccu_mux_div.h                |  35 +
>>>  drivers/clk/ambarella/ccu_pll.c                    | 421 ++++++++++++
>>>  drivers/clk/ambarella/ccu_pll.h                    |  70 ++
>>>  drivers/gpio/Kconfig                               |   2 +
>>>  drivers/gpio/gpio-pl061.c                          | 342 +++++----
>>>  drivers/gpio/gpio-regmap.c                         |  24 +-
>>>  drivers/pinctrl/Kconfig                            |  15 +
>>>  drivers/pinctrl/Makefile                           |   2 +
>>>  drivers/pinctrl/pinctrl-ambarella-cv75.c           | 561 +++++++++++++++
>>>  drivers/pinctrl/pinctrl-ambarella.c                | 761 +++++++++++++++++++++
>>>  drivers/pinctrl/pinctrl-ambarella.h                |  50 ++
>>>  drivers/tty/serial/8250/8250_dw.c                  |  34 +
>>>  include/dt-bindings/clock/ambarella,cv75-rct.h     |  15 +
>>>  include/linux/amba/bus.h                           |   1 +
>>>  include/linux/gpio/regmap.h                        |  13 +
>>>  37 files changed, 3439 insertions(+), 138 deletions(-)
>> 
>> That is a lot of stuff mixed into a single series that could easily split
>
> Well, not easily, because each split patchset would rely on non-existing
> CONFIG which could trigger warnings.
>
> Contributors follow here the correct and documented process of new SoC
> platform, I don't get why now only this patchset has to be split...

Are you referring to this or something else ?

"""
one patchset containing new arch/foo/Kconfig entry, DTS files, MAINTAINERS file entry and *optionally initial drivers* with their Devicetree bindings
"""

No problem with that, I was merely trying to say that mixing 4 or 5 trees
in a single patchset is pushing it a little and it does not solve the
dependency problem you've mentioned, it just move it.

>
>
> Best regards,
> Krzysztof

-- 
Jerome
