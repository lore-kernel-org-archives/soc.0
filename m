Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C5C41E6DC
	for <soc@lists.linux.dev>; Fri,  2 Oct 2026 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928590; cv=none; b=DGU1d65ELlT5TJ/yXVPgtCIfwXRQqScCRgYn/7XAwIQvcoU1PHv0+qkNeWJ6ZdzNohY1BdF4zTfjiK3XV+2OfQemMMB4B+fpXGHC7wlaKoKC7hDkzmryQYMAfEi/ExsEhOeNawSRfO8N7eZY5tL9g0gOa2/Zxl29BY5gqsgU6SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928590; c=relaxed/simple;
	bh=DGpTwbDIeBlS7xGbevsnPXJ7r9V5/qe6fW0JwCkuRoQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ueP2W/uKMlu3qgKLkWM02mx4sQP3hzH329HGJUeG2XYTm4MT+vHmwojHPGW3E5NSV2aZ23QpYaUIE5wf9WRrzGSDnU2nWokZTD+eRxhp5qw0PPxdlLDv3Ni85D0XUhOYNPaw04ppOAvqL+KKJuJgUbZbj5r/dl6MCZpW3h1E1cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YnR23ogL; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YnR23ogL"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ce364488dso13127475e9.0
        for <soc@lists.linux.dev>; Fri, 02 Oct 2026 01:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790928586; x=1791533386; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyfq5Z39i3Aa9ox1entG/vitb9px1bSDrzF3bMpTbqM=;
        b=YnR23ogLWRq31OVwW5Kh9/iRbFPkYxqqspvXpUOOkKhmZVC6SBVUyf3yD2b4tpT+5K
         Q+4kncnAUqQaoAHMWab2LLkD9ZKJ8DIn4aPyg0CBuap2XpLdrFm5gkP8PDvzR+tgho0r
         xFHG05hjBsqffkdnOrJucub2xpLPpCmPJEUA/Xy1o7G5iwZXZbMElsPH8PRhFfzVZw9D
         ParLz2bn7dQ64ADPGZh7HXva3SnK3ITxKNAQQ0FBjcs/GUiBz+r3GB/AOGjenARG5Bog
         tLw6m4Rmv1eiBZIHxh7rkSBmwUlkEfFzrfoy1gfXNMu5iP4CGhLz+MYk5HM6Cr5m3HI0
         Ru1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790928586; x=1791533386;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyfq5Z39i3Aa9ox1entG/vitb9px1bSDrzF3bMpTbqM=;
        b=PDUOMqtcmlZK9N09AKM2/R20YWyieEgI9HjSJaf0QcZ8syhWdCCj0EaM78OsTIZnD7
         nam3DXHpVF+aQVxMQOQVnTtoIKeYC0lfw46EpyCaDGsNX1SV1R6B55gGdHze/2MM1UVZ
         b6IDSBAtayWsRH9rAKjsHZZ6Ieow+zK9xkFpRlCT0DO8a0RvrWDlhYwADiZ2LXkL1/l0
         E0lxjfPLCmAke0+HT2Xn5mQWZ5exRf9m0bnKErpit+za0O9eukwZoQRZoQEyaZbjFK13
         Cauw+zg8YFS6t6kJZeeVhEYjgDXGX91umKf0KyREZlSio9jZvq9DmcpWEit2YiObBMW5
         6zkw==
X-Forwarded-Encrypted: i=1; AKwUvBxm3scx87SchvR0R1JsNtXmN1JnsRJ8ElzEkLQQyAKg5kTbMiy1d8xBCZ6C/P6dLgkTaxc=@lists.linux.dev
X-Gm-Message-State: AFuF++nLcnT3IeG6oqIHfDfejJemOqI9fZTfjYyIJJkBuZDEmYNB+x39
	E5ZImD7fPwANTH0pebsBlPhGJ6eGYcfy4O1K7+4kMFLL/7t0FChVEeZTVZWZ+0/43es=
X-Gm-Gg: AYBFou3HPJqBV/uGBxelEBqB9C0R6qCDtX3uep6f2ioo3UFtYUV80D9+I8ZpVw2AXnQ
	KT6rkwa3x65cYRpBIm+MyMrvHMVk25TMvpyM0LTMkzortGMtmNjPu7NzcV29T7vQBt+nBw0zLk2
	wxBhg2XiYsBgvbYJL6VVFG4kzbVbgTdRjp6wKmaHBoMiEXsXu4E/Z8uerClHRMnThHzGXXNg0El
	ftUCXaW/2snkUY6CDIInOk6fTK1GpC1dce28iwylY5jxIvio1+M15yTeO7LxYO98wWV/22GQtVV
	w8x8uQRwogFPlYuRyqE9XV8lDFAqWdiFNo7WdJWNeR9ap2iSjIxX8IqMyMBYzVFuZ/auFoS4Nj8
	2mSxwT7/w+K4N4FTprzhZ8b2XEZxuELEr/hZzBgtqNERbp4pSx8M7rSi76NN42P13GRSQHfvEDI
	OJTIj+ctaIOnbI7mJbJIgKlV4pw8v56bTuMlZBhHzWHMHgLwfulv/R4KcCOma/Ml+ffQ2JM6IzK
	uUqV6giMJOIhg+Mun4=
X-Received: by 2002:a05:600c:1e24:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a0275507d7mr31998105e9.11.1790928586168;
        Fri, 02 Oct 2026 01:09:46 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm38823805e9.4.2026.10.02.01.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:09:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: zl020895 <zl020895@163.com>, Linus Walleij <linusw@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, longzhao@ambarella.com,
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Ilpo =?utf-8?Q?J=C3=A4rvi?=
 =?utf-8?Q?nen?=
 <ilpo.jarvinen@linux.intel.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Lee Jones
 <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v9 13/15] serial: 8250_dw: add Ambarella CV75 quirks
In-Reply-To: <4405a61f.505.1a0fa675e43.Coremail.zl020895@163.com>
References: <20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com>
 <20261001-cv75-v5-v9-13-486cc289a4b8@ambarella.com>
 <2026100140-overbite-mundane-fc79@gregkh>
 <CAD++jLnv1Q7ChHuLo=ad9edqhZL8MNaMab8huMAepK_LwqVzGQ@mail.gmail.com>
 <4405a61f.505.1a0fa675e43.Coremail.zl020895@163.com>
Date: Fri, 02 Oct 2026 10:09:44 +0200
Message-ID: <1j1pa834mv.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On ven. 02 oct. 2026 at 10:17, zl020895  <zl020895@163.com> wrote:

> Hi Greg, Linus,
>
> Thanks.
>
> This series follows the new-vendor, new-SoC process and is sent
> as one set, so the new Kconfig symbol and the drivers that use it
> land together.

What Greg and Linus say here is basically what I already suggested on
v6 [1]

Giving the whole context of a bring ups, mixing many trees, might be
nice at the RFC stage but then it makes a lot more difficult.

[1]: https://lore.kernel.org/all/1jld986j7m.fsf@starbuckisacylon.baylibre.c=
om/

>
> If it has to be split, the GPIO patches and the UART patches can
> go out as their own series. The SoC patches and the CV75 clock
> driver should stay in one series: the clock Kconfig depends on
> ARCH_AMBARELLA, which is added by the arm64 patch.
>
> Would that split be acceptable for you?
>

I don't get why clock is any different here. Just state your
dependencies in the cover letter. `b4` can help you there as well.

> Best regards,
> Long Zhao
>
> At 2026-10-02 03:20:51, "Linus Walleij" <linusw@kernel.org> wrote:
>>On Thu, Oct 1, 2026 at 2:52=E2=80=AFPM Greg Kroah-Hartman
>><gregkh@linuxfoundation.org> wrote:
>>> On Thu, Oct 01, 2026 at 08:41:02PM +0800, Long Zhao via B4 Relay wrote:
>>
>>> > From: Long Zhao <longzhao@ambarella.com>
>>> >
>>> > The Ambarella CV75 UART is Ambarella IP, not a Synopsys DesignWare
>>> > licensed block. At the register level it is close enough to DW APB UA=
RT
>>> > that a full custom UART driver is unnecessary: reuse 8250_dw with a
>>> > small platform quirk.
>>> >
>>> > Quirks:
>>> > - keep IER ETOI (bit 5) set for RX timeout behaviour
>>> > - skip set_rate; baud clock is managed outside the UART block
>>> >
>>> > Reviewed-by: Linus Walleij <linusw@kernel.org>
>>> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> > Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
>>> > Signed-off-by: Long Zhao <longzhao@ambarella.com>
>>> > ---
>>> >  drivers/tty/serial/8250/8250_dw.c | 32 +++++++++++++++++++++++++++++=
+++
>>> >  1 file changed, 32 insertions(+)
>>>
>>> When you submit lots of different subsystem patches all in one series,
>>> it's hard, if not impossible, for subsystem maintainers to take them :(
>>
>>In my experience people do this in cases like this it is because they
>>essentially dump out their "bring-up" tree, the thing they have
>>booting on the hardware so they know the pieces work together.
>>
>>Long: can you split it up in topic branches and work on e.g. the
>>serial driver on a separate branch?
>>
>>A better way to test the whole set of patces is to just create a
>>mixdown branch where you merge all the topic branched into
>>one "test" branch, then you boot and test this before sending
>>out each branch separately.
>>
>>Each topic branch can be versioned separately with b4.
>>
>>Yours,
>>Linus Walleij

--=20
Jerome
