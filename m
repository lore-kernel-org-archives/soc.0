Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A05FC433EF
	for <soc@archiver.kernel.org>; Mon,  4 Apr 2022 20:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15C2CC34112; Mon,  4 Apr 2022 20:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD58C2BBE4;
	Mon,  4 Apr 2022 20:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649103276;
	bh=ENjl3Yg3M/VlMjEc/7PptM87xn56Fp+aS8VlMlcp/jI=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=j1AqQelAEJuN+itWEGlEjPBamQylGpKooVj5c5YgX8++QQoofxPYobiawx2bSvMmT
	 wrrxR8+TkNbUhMQekIIol8BkC7gIa5XWtkI9qh+7L8CS+2Xah+8/yV8kYDfhGKSWSf
	 qDhAzFSyC0zgPk9fwWSP1XJrL913ZgVIGDnydkcwleD2e44EmLE65Mxhc2xXLDU9C+
	 6Y6pcc0dCZ+dhKi5RDsg7SzJYDN/v0YGZ2EMM8mhJthwiv+wHiQokH3FDMTRlHuJa+
	 Sz9XDjv80kysChqN4oz4dp7zQgl6sTYWPN8UP1bfkfqnwTpuLqX2cb0GStxJs93DdF
	 H3YR/HhDiKEBg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e7b2d7d3-b0a8-3937-1947-acb65090dc87@linaro.org>
References: <20220331024256.14762-1-ychuang3@nuvoton.com> <20220331024256.14762-4-ychuang3@nuvoton.com> <0c182962-0da0-c3b3-097a-090bf8d871e7@linaro.org> <20220401233422.58670C2BBE4@smtp.kernel.org> <e7b2d7d3-b0a8-3937-1947-acb65090dc87@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: nuvoton: Add initial support for MA35D1
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzk+dt@kernel.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, cfli0@nuvoton.com
To: Jacky Huang <ychuang3@nuvoton.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 04 Apr 2022 13:14:34 -0700
User-Agent: alot/0.10
Message-Id: <20220404201436.DDD58C2BBE4@smtp.kernel.org>

Quoting Krzysztof Kozlowski (2022-04-02 02:55:58)
> On 02/04/2022 01:34, Stephen Boyd wrote:
> > Quoting Krzysztof Kozlowski (2022-03-30 23:32:04)
> >> On 31/03/2022 04:42, Jacky Huang wrote:
> >>> diff --git a/arch/arm64/boot/dts/nuvoton/Makefile b/arch/arm64/boot/d=
ts/nuvoton/Makefile
> >>> new file mode 100644
> >>> index 000000000000..e1e0c466bf5e
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/nuvoton/Makefile
> >>> @@ -0,0 +1,2 @@
> >>> +# SPDX-License-Identifier: GPL-2.0
> >>> +dtb-$(CONFIG_ARCH_NUVOTON) +=3D ma35d1-evb.dtb
> >>
> >> NAK
> >>
> >> This is actually some resend, but you did not version it, did not
> >> provide changelog.
> >>
> >> What is more - you ignored previously received comments.
> >>
> >> We do not work like this. If you do not agree with a comment, please
> >> keep discussion, not resend ignoring it.
> >>
> >=20
> > Please be kind to newcomers. Not everyone has been working on the kernel
> > for 10+ years.
>=20
> Sorry for being harsh.
>=20
> >=20
> > Please read Documentation/process/submitting-patches.rst. We should
> > probably add some more details to that document about including
> > changelogs comparing previous rounds, links to previous rounds for ease
> > of discovery, cover letters for multi-patch series, etc.
>=20
> This is in general explained in:
> https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submi=
tting-patches.rst#L311
> Just no one really reads it...

I see there's
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#resp=
ond-to-review-comments

and there's a more detailed guide at=20

https://www.kernel.org/doc/html/latest/process/development-process.html

>=20
> I'll extend that section slightly.
>=20

Awesome! Having documentation about best practices makes it easier to
reply with "read this document" vs writing an email each time it happens
(which is usually quite a lot).
