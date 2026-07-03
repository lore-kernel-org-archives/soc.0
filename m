Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BEF3254A8
	for <soc@lists.linux.dev>; Fri,  3 Jul 2026 20:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110588; cv=none; b=AU20LFhYdbbb/L2sXv15LHoC1YvsXcVcBD5WO1DSP2C6v5eMhBL2omt/Kq8e/kzKl5iDi3JJGmkXCS517vBz75LD6mZCPR7zlajwR7g44HBK4VJ/stiex2vhu462uXPoPM6WgKgMalFG4T1unb/CGpL/nIV/KEzegKjszTgZK20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110588; c=relaxed/simple;
	bh=pxpXbgMHco1/SoGO6bowf6P7VhFikoIBvAVNemBJ7m4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LfmRVoqQ4L94kCrHLoy+8vtqLhtbaYLP86+nHmpngUytz6wsdqy9YochhY/q4NQPGc1fmnqnn6egDqrUnK5KBcQozIhYScbC29IcV8fII8KBMaN5p4hC1KHecn2YHOSr1uxS8/AmmrWPDl/COa9VuEpyq0GoAuryBE7pCz5hFsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aGKFdNxy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aGKFdNxy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006291F01558
	for <soc@lists.linux.dev>; Fri,  3 Jul 2026 20:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110587;
	bh=Ax00npaur3Kx2vEm2lwqTG6mCucVrxlLU3BWge3a1sE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aGKFdNxyWvTOC+T8XIHEaXu8dWXQ9e5X32MeGnPwP60lRibp2w9QYehkWNbKUxYXr
	 7jct3ztl/GJ3HPi6mWYOGbtHDmDl5AeEE7yKhW3X9oF1CnRv6t2TvA5GA/npiRT0KA
	 yhepArPWpr5qEmvUFu58AxJ5FR4rY2HJbhvHcNpeIxnT2Ka+7uPyCwc/s9aPogat1v
	 /PKfqhDLxn/DX48eNwF9OfB4s3qtgqYegOE8D7YDv8hwvz7MnYMfUDhVinqpN1xORc
	 994hSjQOfTkdHhE+1XII/NyMU5wKB8nx0OBVNAgyx1QSQ/Hr/aZ8oDpzE5U2VgEa2s
	 fMjTy3f/Kr1SA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3997a448ecbso9171501fa.0
        for <soc@lists.linux.dev>; Fri, 03 Jul 2026 13:29:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roq+OpdvA60yd9/xGVFS3Rnf06d6SCZtdXQV0XfhSxtyN5lIcpc26Q0mcHN7yVSLzFs1ls=@lists.linux.dev
X-Gm-Message-State: AOJu0YwL4pQFmN+NyRbu1y41OgMjwxJDcDj5agefBbeZoRjfttT8PqZv
	rQQ9nv2qYuOK1auOdj3f4Z4sfIxG4iePRVKjbv5J0d6u63vudL0BLZy3NKgKnvv/WUBUYywFHW9
	8AQVDQtFVo+PdDEkoURIpyik5u/3rOWM=
X-Received: by 2002:ac2:5692:0:b0:5ae:b688:8b9f with SMTP id
 2adb3069b0e04-5aed509045amr84106e87.15.1783110585654; Fri, 03 Jul 2026
 13:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701212353.2196041-1-arnd@kernel.org> <20260701212353.2196041-7-arnd@kernel.org>
In-Reply-To: <20260701212353.2196041-7-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 22:29:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLmX9Kt0TJ7ZV5z6C71STSFasj+tteAuRZf1kskLPyg+8w@mail.gmail.com>
X-Gm-Features: AVVi8CcuZBhH0CBAHhIVaixVPU2Zy7Zyv-gFQ3BsH65cnHDfWbC27Khp2xsrQZQ
Message-ID: <CAD++jLmX9Kt0TJ7ZV5z6C71STSFasj+tteAuRZf1kskLPyg+8w@mail.gmail.com>
Subject: Re: [PATCH v2 06/19] ARM: mark CPU_ENDIAN_BE8 as deprecated
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Daniel Mack <daniel@zonque.org>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Stefan Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren <tony@atomide.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

thanks for your patch!

On Wed, Jul 1, 2026 at 11:25=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

>  config CPU_BIG_ENDIAN
> -       bool "Build big-endian kernel"
> +       bool "Build big-endian kernel (DEPRECATED)"

I'm not so sure about this patch because it will look like IXP4XX is
using a deprecated feature. The IXP4xx actually has many OpenWrt
users.

As mentioned on IRC I tried *very* hard to boot IXP4xx in LE mode,
by adding some code to the kernel to force-switch to LE but failed:
the bit in cp15 can be cleared for sure but after this the machine
nevertheless stays in BE mode.

If someone has done this successfully and can tell of magic tricks
I'm all ears...

> +       depends on ARCH_MULTI_V5 || BROKEN

... but this is all fine.

Yours,
Linus Walleij
