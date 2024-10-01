Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339BE1CCB53
	for <soc@lists.linux.dev>; Tue,  1 Oct 2024 20:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727812812; cv=none; b=Imn2gMDm6rtHrL5/EOf1K9RDxxm16lKliPlAh5QiAPnzSxfcGPSdMXaoNdfcrz5dn1IkzYq3+20Dxwoa4/Mds/qPfTSsfGq+tRBgG/0vTyjOIzrvq1Bo7JrGJoGEueUZBXyPmlNOi8U66DV1LIytYq3hY7ljUrL+hutMFgqxiZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727812812; c=relaxed/simple;
	bh=9nxNhpLrx3HJEq9JhEouMSM4YNgGI4tmenEeJnI7KaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uv3R5UQQFHXY4/67gY2qRHQb+mwRPUm3qcOsVmfUDEEcZVtVOt8oQ/WURwSl0yTqJLLneMGENwRtqOYM/oHnRU0UYRWe7Wl01C78Gj57mHI0i1PYOj669xWpRdebsWaSrFHuXvgS4PHfbCD8JyhSiNgmAe0Rd365/lWom24HPwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=GRoLV0X0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="GRoLV0X0"
Received: by smtp.kernel.org (Postfix)
	id C9460C4CECD; Tue,  1 Oct 2024 20:00:11 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5DC2C4CEC6;
	Tue,  1 Oct 2024 20:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5DC2C4CEC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20b7a4336easo20243055ad.3;
        Tue, 01 Oct 2024 13:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727812810; x=1728417610; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Txj9X25LmbjQ//MeIX5ksz2p7RxnM6sQFO6w2mk7FrQ=;
        b=GRoLV0X0mdZmj7+eCdi2jy1bYRH1M/HDV/VFp6rEgxJNXcKKCdBERfrzhXZhs2nds5
         ntzr4LTp28a9KJ4EztUF76PYJh8UUEKrNmbosy9dy9Uafuvl0mGSpb973DL+TnIwdacL
         2QDFeeB8cYCjmTll8fecuFWlCoJfresQ1DfAg+KYI+U/jGEiW2TqUeNyudFNBEg/hY4J
         zDjOs/4dF4uNxcSSgKbTh1lxv5hxpoz20uAdlEVkCFR00piXEzDfLjZUZZoWgP1fu/gZ
         2igFCrhE5c/dWVdDL71DjiOFau5YOulwziCKSfw8B6Tal1QT0fgHFRJ6Ss9fzZFu1+CW
         23Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727812810; x=1728417610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Txj9X25LmbjQ//MeIX5ksz2p7RxnM6sQFO6w2mk7FrQ=;
        b=bSkuEaVQ9NiRSOYWkOBdwOKr3e+EQ0ygGnQBE1Ss/OgcaFED/NU9Ley5Jl1y+1EgGs
         nQNpnECuacQaV0Ggkb8ruVHHqosRqDWWrWT66YbcP4vngbJypzawCCS7S9TVEWf/iv1t
         U8ibJbpOFo7FgcLQUcy0KoN15Rcfq9X53j9DXD7epBTIoMDr6kacGVZpYQA3GAOHWMoS
         2UknPcxes3qdYLOvU7CwHYHZ6oHqn2phVQVZHKV9z94YTF4fbWQpnKJ7SDDv4ZUimDob
         iw19FibTgX3kct6RrVAay+gROTKKfeEUMDJcRd2X7dzO/J7HtEL+gfI08rgUvB18th9Z
         N8rA==
X-Forwarded-Encrypted: i=1; AJvYcCUIeKniPRWaMPVgfHcF7r7HZDOAfPh6e1b1TYqoz3qozAFYQvEq4iEaeraZ98W+9R3cf5ZTSZHx@kernel.org, AJvYcCUL0LpHGn2Qc4f108446zeSulbFeYwdrRjJY21oVeOO0lpeGSUxB/tm/KGmFVisfDsMv7APl2pEng==@kernel.org, AJvYcCWTfdeaJGNEBEMZtYeyByQLyuwNHlfYGsLkSWWeb/lmHYA6ciq/sv2LIC2uxmXEI71/XgwQlJo0cQ==@kernel.org, AJvYcCWXZzaSpxboE2C1QpKtABMvqkftD1emQG69cAqFbP9a0SsLzHWwuzZ3fS/R86AYHuYPrYgDdw==@kernel.org, AJvYcCWlhOtDSxWZ4LeuGkmdQSezjGZb5oX2HNP/9egU1WATUMAuBns8klRXPJkBmSb6ffz1NT/bEw==@kernel.org, AJvYcCWxV6/7vMMOwIaVknFwWTxn1ccW+mE0mN/Sey1HrG5IAvVV7zE9R3iZF7OqI0VKSVdcydE+QWrgil8=@kernel.org, AJvYcCX3seRqfZSJmTkpgJXZnPANqHiwejF4TN6XAcygkjGWRVDv9WoC6pXKLPerfB+cCfVge2BH5oA=@kernel.org, AJvYcCXjV5NSghuKUBPBR9au4DNhFwDFeRN5PUr7lTgus4CXyujS29hxgzU6R9Sk0sILDlD6QnPy@kernel.org
X-Gm-Message-State: AOJu0YzKEaUBnymYCp54JbkSPGEAipc91WYTyc22mOXnmsgrBj0IQETR
	TghQjMxbH7vf6GenRpUrmRJcA9x9MQ2oa7jAtHRz9Cq1MwpfPHDlzNcWy+7mhW6ZHQz+1zdeSCu
	8747VNmvZK0BgcvqmgdMhbBcFLI0=
X-Google-Smtp-Source: AGHT+IEzN68oFH6UETNrpbvCGpopcDsigqPvgYKygFNF7D6FUqPz4x1zQ8ZA7UoZNXXUi84OPMM6AhdceSvhM1DdNJ4=
X-Received: by 2002:a17:902:e550:b0:20b:720d:734 with SMTP id
 d9443c01a7336-20bc5a5cd06mr11151925ad.41.1727812809889; Tue, 01 Oct 2024
 13:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240930223550.353882-1-rosenp@gmail.com> <20240930223550.353882-3-rosenp@gmail.com>
In-Reply-To: <20240930223550.353882-3-rosenp@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 1 Oct 2024 21:59:58 +0200
Message-ID: <CAFBinCB1Rz+C=Tj+RJAL5KZbk9K7cnpF_uR6rKkMeqyCuDBo4A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: assign reg to memory nodes
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Antoine Tenart <atenart@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
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

Hello Rosen,

when you re-send this, please drop the Amlogic files.

On Tue, Oct 1, 2024 at 12:36=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
[...]
>  arch/arm/boot/dts/amlogic/meson6-atv1200.dts                    | 2 +-
This file was dropped with [0]

>  arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts               | 2 +-
>  arch/arm/boot/dts/amlogic/meson8b-ec100.dts                     | 2 +-
>  arch/arm/boot/dts/amlogic/meson8b-mxq.dts                       | 2 +-
>  arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts                  | 2 +-
>  arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts               | 2 +-
These got updated with [1]


[0] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/commi=
t/?h=3Dv6.13/arm-dt&id=3De2a3f11ae11c9f9ee780bf49f00a69f12dce3529
[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/commi=
t/?h=3Dv6.13/arm-dt&id=3D7947fd2d350e6057e7514459c7ee2db39d1096a2
