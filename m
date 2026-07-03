Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6542B3C0602
	for <soc@lists.linux.dev>; Fri,  3 Jul 2026 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783081851; cv=none; b=lchxVqUnPdvcsv7wdSzzcEzZZLpvrPo7KHqvPkJ8x9G7buoQftnv4xoKHzk0dsrxP33NWbpImQRk1XKFjzg0gCzF6ntQvz04EvYHlz7Y7lpnlIsbhxxarajOot70ck8AMZo0eSd96vjMsfvp2GBU5nDOAOkP21R17Szl+C3SqYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783081851; c=relaxed/simple;
	bh=vZixvdv8KzjjZ427UX89Rcdev9mRIal5kpYzm/15pxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RMr3juwEaFTg/E2AjkM0MHHcxEOLlIDACHTQf4eDSkeLCKuRYi8qN9MTwjaCBC3dJ1C28+OPVFEn48IA/+IiaX6JrIVG8CnV5N0RPhtcXrTaJcIC333KcGbM2K55aaJVW6xp16+arCvEgTQgknufEFQM3tock9xWxzxEQNNutIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KK38QZdk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KK38QZdk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5761B1F0155C
	for <soc@lists.linux.dev>; Fri,  3 Jul 2026 12:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783081848;
	bh=vZixvdv8KzjjZ427UX89Rcdev9mRIal5kpYzm/15pxo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KK38QZdkYThkiPWF7B4/xn4yFq8aFWwRGHuWNO6Dt8k4/5flB1up3vEw88Q9UXjdT
	 xcTwHectQlmeHF94GulOiqMDpyw7k5hQHkgFvLq0yKA/ePbHqtYlqFIpjDA/JoICDK
	 AX/Xw7T60GbqkEwg4HTtp2Xp/zMWDVpUEe36bHzqkEaE5Qww5KitbS+0nzxDPRuE3S
	 3BHmNOWeIEwOH3VFIcx2A4QEm+no3zn4JHdMZPP3jW8UYzVsI/wKLecsTrSPlcF75A
	 giK0pVtCVzMNGREYvqOQ6/pUPskxcAYUgFxn2oI/MXzUhzXBWpUO4vxsQQfcH79az2
	 UqUS4NRlBJluA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39af87c4589so5198201fa.2
        for <soc@lists.linux.dev>; Fri, 03 Jul 2026 05:30:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrhvGF5FWowHWlzlcYyeVjHzpFAUe+4Y54HXpvUF09aFP5EZT6QisC/cWUdc/7/e4R6Wfw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYDkXu7fD/NS2wcLDp7o9prxi8pVBH9J6kHyiHxetLlDYOgsfV
	1dJr2G/fH6crG8czl+05Q5TehyPMTat25DmkuBqoBCwIdi/EcFInwJra5ttAfgftK0QkqTlvK3Q
	ODeO6AxUABEKLDXLOJur9u6583K/McTs=
X-Received: by 2002:a05:6512:a356:b0:5ae:b2bc:826e with SMTP id
 2adb3069b0e04-5aec68b4312mr1674503e87.36.1783081847047; Fri, 03 Jul 2026
 05:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701212353.2196041-1-arnd@kernel.org> <20260701212353.2196041-15-arnd@kernel.org>
In-Reply-To: <20260701212353.2196041-15-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 14:30:34 +0200
X-Gmail-Original-Message-ID: <CAD++jL=+GTZ0FfzPUvp-4y+Hvkh9MCnr2imsoxkRAZtWdKNEyQ@mail.gmail.com>
X-Gm-Features: AVVi8CdS3NptlkPctMN0dKhVs2Ory6SkB5Eg2wUpTs3s1VvY0UZbJATjoG4Svc4
Message-ID: <CAD++jL=+GTZ0FfzPUvp-4y+Hvkh9MCnr2imsoxkRAZtWdKNEyQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/19] ARM: mark mach-sa1100 as deprecated
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
	Vladimir Zapolskiy <vz@mleia.com>, Will Deacon <will@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 11:26=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> If anyone is still running one of these four machines and planning
> to keep updating their kernels, please speak up now so we can adapt
> the plans as needed.
>
> If nobody is found using StrongARM1100 any more, it can be removing
> during 2027, leaving 6.12-LTS as the last longterm support kernel
> for it.

I thought for a while I would do it but didn't have the time or
energy, so I dropped the ball on this.

That said, the current LLM code agents are a bliss for tedious
tasks like this, it should be pretty straight-forward to convert
SA1100 to DT-only if (and only if) there is active interest.

Yours,
Linus Walleij
