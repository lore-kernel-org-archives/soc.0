Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C492374735
	for <soc@lists.linux.dev>; Fri, 10 Jul 2026 17:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706166; cv=none; b=APldoyxsmbWu2Co/zZ4NpydjrxbePyl8TNvVuj3wbxNU7CC0Oq+437iXUtfs/WARAOYawI5k3fW0/Kk6S5k4niasDWjWiTILt0SQP86Wf6XoIwBGxReTxkzSmBIBIkzXg+F6iLixvRm91qTHzoeiVPPpYIbSmj7FRD+TJuPPgc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706166; c=relaxed/simple;
	bh=H+JAdkk/icBGLpiDSeVFi+MbloVDEqkSjm0JbVP23i8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S6YM/rRzAGEU1KgKhxnu4IiHONZNTgq8mTJHIOkaVnZrhGZ1RdV/VCklzIOmPUPDnvFkFqhx1oUX2gO6RNb8ngyZ7TRZKi2mqUqT2Nn5z62T+GpqIHQ7iUWEAtF1YcQGUaowqB0/g02FuzwF52bAzoDSUjV6z6LBkTjJ3Kva+34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTPAQvwe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTPAQvwe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E281E1F0156A
	for <soc@lists.linux.dev>; Fri, 10 Jul 2026 17:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706164;
	bh=384tdzMvS7W0JS7A89aeTWZ+bDvLCNV8ohHo3USeMhA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YTPAQvweaJ2rFvz/5+d9QB+Zi2rIZf+lbhYo22L3FT/NCEUt69qDU6lbRTRfuVnrv
	 W05ru/0+mVmgzlkjo5+0qz4o+PAMg2QCzuBk9NhDBNKC6De4RkhR1RM1Y2yEVmLkH5
	 3CDfB6FVZvlGdrQ5XiKrveHg5rNSfxbZHWjBIdFzIuioROnL2IYiG0Viaer8eiXS1a
	 2vuxhnlAGPFfUXjSG/DSAa/49sN0VNGmgQPWxrFVxzpMTUay2lubsYe1Uay+gfcfql
	 402oZPPo5Q7kUkvb9Ra2ZK5TByHRP5h34Q7NQMlwFc943IaTOUtqIKUXJC/RBdVFsQ
	 b7Dqarf508Mmw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b021916bd3so537825e87.3
        for <soc@lists.linux.dev>; Fri, 10 Jul 2026 10:56:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrfk/Bc3+2t9ULdRSGSoBfSX7jfG1OgLWSH5VPJ7CpKTvCWPy9R1Ef9iA9er0upID76CvA=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgn0TZr3Zy+zTfyu50O6tiLTnsmeRSrmxzLOafaUIBDejG9mx2
	/jPIHPuKetDZ1SY1P2heJBnr/WZAtj2dv+8mEh+IRWBRl/14sOSWzMD3qmrk0CRA6PBR2SvqSXo
	wEsM5zEp+RA7/UNycY3IXmVoiHq2kmv8=
X-Received: by 2002:a05:6512:618b:b0:5ae:a9ec:bb1a with SMTP id
 2adb3069b0e04-5b0236bbe03mr47320e87.54.1783706163539; Fri, 10 Jul 2026
 10:56:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701212353.2196041-1-arnd@kernel.org> <20260701212353.2196041-7-arnd@kernel.org>
 <CAD++jLmX9Kt0TJ7ZV5z6C71STSFasj+tteAuRZf1kskLPyg+8w@mail.gmail.com> <60541bca-b0ec-4ffc-a2f8-31f196f43dc2@app.fastmail.com>
In-Reply-To: <60541bca-b0ec-4ffc-a2f8-31f196f43dc2@app.fastmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 19:55:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLktA7VBbFQUiW2WxiL7xNHrQmLhSJOOTfc_6Q74-CDK+Q@mail.gmail.com>
X-Gm-Features: AUfX_mzw5ThMPydCgYk0-odWP4AK8yu5yX74qvfO2aeQzV6CzbOV8NG9eL21qpc
Message-ID: <CAD++jLktA7VBbFQUiW2WxiL7xNHrQmLhSJOOTfc_6Q74-CDK+Q@mail.gmail.com>
Subject: Re: [PATCH v2 06/19] ARM: mark CPU_ENDIAN_BE8 as deprecated
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, "A. Sverdlin" <alexander.sverdlin@siemens.com>, 
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

On Sat, Jul 4, 2026 at 12:33=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:

> >>  config CPU_BIG_ENDIAN
> >> -       bool "Build big-endian kernel"
> >> +       bool "Build big-endian kernel (DEPRECATED)"
> >
> > I'm not so sure about this patch because it will look like IXP4XX is
> > using a deprecated feature. The IXP4xx actually has many OpenWrt
> > users.
>
> How about the version below? If you like that better, I'll give
> it a thorough build test and use that for v3.

We figured out LE on IXP4xx so I'm fine with this now, provided
we can fold in the LE32 fixes for IXP4xx at the same time.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
