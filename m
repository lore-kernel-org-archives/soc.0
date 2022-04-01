Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFA2C433EF
	for <soc@archiver.kernel.org>; Fri,  1 Apr 2022 23:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 814D7C340F3; Fri,  1 Apr 2022 23:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58670C2BBE4;
	Fri,  1 Apr 2022 23:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648856062;
	bh=ruV9zfSbSuCpJNqX3iBN6oeJ1dam25nTvaBev2VkwHQ=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=bL0gySx1Yq9FEOPVGqqhrRFbIB3PRhH4Kwa7040AVxTSN4MJHDpADDpBWLajwf8Qx
	 K20SCYAdpnBcRaRX2SQuoh+IBHrisENz7i/4bILXIxtmn4NWf2CJXxgwttS7UzEJaO
	 8SOlnYBswwsmYGO9mzcdx1tUyH3ychmnKQ+Bt5sVni7LtkbmIixlsGrDnwYZ1aThLl
	 QW1Mm3XXQerdccwW67V+Rbg687+8YlkBj3eHoNssqUiHgn85ABHkXbFgI31EwSRlMp
	 VpvrSWfypPROpS/cKQor8XIVeWw0MXQ6yXdS6bYWaKyOgifXZapdZ6cjGuEj9ftsr5
	 08BmZ8Atj2ZBw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0c182962-0da0-c3b3-097a-090bf8d871e7@linaro.org>
References: <20220331024256.14762-1-ychuang3@nuvoton.com> <20220331024256.14762-4-ychuang3@nuvoton.com> <0c182962-0da0-c3b3-097a-090bf8d871e7@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: nuvoton: Add initial support for MA35D1
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzk+dt@kernel.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, cfli0@nuvoton.com
To: Jacky Huang <ychuang3@nuvoton.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 01 Apr 2022 16:34:20 -0700
User-Agent: alot/0.10
Message-Id: <20220401233422.58670C2BBE4@smtp.kernel.org>

Quoting Krzysztof Kozlowski (2022-03-30 23:32:04)
> On 31/03/2022 04:42, Jacky Huang wrote:
> > diff --git a/arch/arm64/boot/dts/nuvoton/Makefile b/arch/arm64/boot/dts=
/nuvoton/Makefile
> > new file mode 100644
> > index 000000000000..e1e0c466bf5e
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/nuvoton/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +dtb-$(CONFIG_ARCH_NUVOTON) +=3D ma35d1-evb.dtb
>=20
> NAK
>=20
> This is actually some resend, but you did not version it, did not
> provide changelog.
>=20
> What is more - you ignored previously received comments.
>=20
> We do not work like this. If you do not agree with a comment, please
> keep discussion, not resend ignoring it.
>=20

Please be kind to newcomers. Not everyone has been working on the kernel
for 10+ years.

Please read Documentation/process/submitting-patches.rst. We should
probably add some more details to that document about including
changelogs comparing previous rounds, links to previous rounds for ease
of discovery, cover letters for multi-patch series, etc.

At the least there's a section about replying to review comments.
