Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAEF10A1F
	for <soc@lists.linux.dev>; Wed,  2 Oct 2024 03:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727840945; cv=none; b=WEUNxlV8+MgG3jnsRYK+WxgrvpH2/nH3o1kAsEzxJLWWeYSbwPRc6xSi3Cupnkwungp8pez3EoMGqt1qpMAwVO2MC1dpB3CqGOE/62O0op77LKKmELJ9mg/gaOoZA6unDQ8iFkQDk+tVlNeoO/EzZcW42zTmaFbNxhSiZCnoKew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727840945; c=relaxed/simple;
	bh=nAEKTIpBmymWLR+e+hBkypCfwSNJotZOEB0oMjBgW3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qU4qu5t4/IvrbAjRIHOfoleV9IjSX2VsStbe7p6d9KuKAvjxUy3Sne1aR7UcUDdljiGu09nRo/X9lqJn/dqmhkADqy5qf/ep0YVtFFbmfAH3i6ywGTOT5cGQ79SQVrzqmbK80v8ivDLl/v11KksWtydxxLGEK9z/ApbSZ81MrCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Af2UjTVf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Af2UjTVf"
Received: by smtp.kernel.org (Postfix)
	id 42641C4CEDD; Wed,  2 Oct 2024 03:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21497C4CED5;
	Wed,  2 Oct 2024 03:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727840945;
	bh=nAEKTIpBmymWLR+e+hBkypCfwSNJotZOEB0oMjBgW3A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Af2UjTVfNh6y+KURqioy4b8Bj7Yu5BpvrE0pOuTAaCdsWVGE8VQdAPbay4eP9DqPg
	 vWMLCMNoxrjpq2dgf0Gkki5SuP7pwmk7jkH2meg7cuorJVxX/VF75raABEWvzkaMHi
	 vhhxdgRpR3b7B5ke0UhpF0oO9c3sZ7F6qfo5LaAZzh2DiImZJl6yUno80Km9y1f2VX
	 IIlH0yPKwIL8OBus0S8hdF72eqSA5xm2L3CztnHUgtzPMXEtvUhtadchDi41GC6Mt7
	 Ca1gozPG5gv1ZiW5uDRIVS53lJA/EuDl2IF4CK5RlPgdKNeNXNE2aGU70QMIY0HzW0
	 QHOaUeFAAHJ5A==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5399675e14cso3479989e87.3;
        Tue, 01 Oct 2024 20:49:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU58Fc8KglB08T+PH+9AfIXKmukF7t5Y85fsmEpgWdGQM5I1vpGobZjDYKNm6uV2K82C2lEIfU=@kernel.org, AJvYcCUQqgMhR4XWzKF4idnv2aWZ7G2GYuj5bjK0XQw2XYVBW3P3DqQm5GRGCMtv9vsK/JslY3ZpQyVW@kernel.org, AJvYcCUrkDxh1096ouFwn1EQ92hMlpDrEqh8zuTBVBHwVZgsXVqlArzB2GzQaOuX8vY8bh2Q8QW6LCPXk0w=@kernel.org, AJvYcCVgF+ej8780y84dt9828s8tj3j3eVnVfm4zLGlH+AGqOk2uTTuvTq+qmeBmInEQNmZwu7UWp3cfSQ==@kernel.org, AJvYcCVlK+LAWgsFfxqSe8T2201vgHHt6m3Owx9soQIXRU1DedQSXt9TmuavZkoQuKSosX18irpN@kernel.org, AJvYcCWWieru/AHqcDR/cvmUOBOIKwlPOOsurz0qp0lXzXWaJ6eWqo/iZ+5AsvLLcAd/D4gwXfyg2g==@kernel.org, AJvYcCWcIdvFCDLC0mlHnHLFO7sRkR2Vt2iSRCNWOHWki17Gp2K3I/NnEOaHof9XZKWe4imwHaAdThPz3A==@kernel.org
X-Gm-Message-State: AOJu0YwxuuCowpcCfPo2AnGlc1+FOsSgG2Z9ou5B+ee/osHd4jUAgFnP
	7BeUBb80vDVjM1BTvPIZw17Ipbb83ODRp9CtdRTt3ahcpIPcBOGmr938nnIWji/lgVyxyIdOmXA
	Nmxuz61al94Ue7DCG2YMY0Fmovg==
X-Google-Smtp-Source: AGHT+IEqtnQCtoRUlnvKJ/juvutRb8LD+WF2Ji1IL7egoXyMFlaAGJMVK219VrK0qM0doCIPbjzZD5sR9nPD1sht5+g=
X-Received: by 2002:a05:6512:1113:b0:533:4638:df40 with SMTP id
 2adb3069b0e04-539a067f65cmr743356e87.27.1727840943291; Tue, 01 Oct 2024
 20:49:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240930223550.353882-1-rosenp@gmail.com> <20240930223550.353882-3-rosenp@gmail.com>
In-Reply-To: <20240930223550.353882-3-rosenp@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 1 Oct 2024 22:48:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKNMhUy3HUAanod27FnJAz35w7FLp7tp0Uo3SeVbG7EGw@mail.gmail.com>
Message-ID: <CAL_JsqKNMhUy3HUAanod27FnJAz35w7FLp7tp0Uo3SeVbG7EGw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: assign reg to memory nodes
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Antoine Tenart <atenart@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	"maintainer:SPEAR PLATFORM/CLOCK/PINCTRL SUPPORT" <soc@kernel.org>, Marek Vasut <marex@denx.de>, Jisheng Zhang <jszhang@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, David Lechner <david@lechnology.com>, Nishanth Menon <nm@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Enric Balletbo i Serra <eballetbo@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, 
	Alexey Charkov <alchark@gmail.com>, Denis Burkov <hitechshell@mail.ru>, Arnd Bergmann <arnd@arndb.de>, 
	Stefan Wahren <wahrenst@gmx.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Nicolas Chauvet <kwizart@gmail.com>, Tomasz Maciej Nowak <tmn505@gmail.com>, 
	Robert Eckelmann <longnoserob@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	"moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"moderated list:ARM/NUVOTON NPCM ARCHITECTURE" <openbmc@lists.ozlabs.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>, 
	"open list:DH ELECTRONICS IMX6 DHCOM/DHCOR BOARD SUPPORT" <kernel@dh-electronics.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/RISC-V/RENESAS ARCHITECTURE" <linux-renesas-soc@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	"open list:OMAP DEVICE TREE SUPPORT" <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 5:36=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Fixes dtc warnings:

Unfortunately we cannot make this change treewide. Any platform that
relies on the ATAGS to DT bootloader support in the kernel
decompressor expects /memory.

Rob
