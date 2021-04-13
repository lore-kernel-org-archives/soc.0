Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97CDC433ED
	for <soc@archiver.kernel.org>; Tue, 13 Apr 2021 09:55:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 89F7D613B6; Tue, 13 Apr 2021 09:55:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E444661369;
	Tue, 13 Apr 2021 09:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618307743;
	bh=3yr28My6WXoo6CQW/YIHzqImC+8GIX9W8yNiJe7vnrE=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=HlHQfDs8VuzU1M9tViQ8vhwG4fJYOLYYMhQuLA4elC4cXfvVf8YNZ38//74DZHR9P
	 FqdtpoYxPho3wWAFYdUewtEm7J9ksZTKNqzvc/ZwCLSoOhzUT0AV19jkz9jqklAc4B
	 DmAq8AH9Sf9SXzVNsNqLrlrxqmGW7OWSOvBmfs19xX/FB5XMIKcGdtPjWuhx4cWegp
	 iILFfmzA9D7gFFeQx+1Hv3rTljR6mA6cMkLXolBkFZWMVHW9YC1J/gJrFPYsmup7ch
	 7uKy/7VluM1DxHm7aFroALTah6Y1ImpuqIOx5uHqtezlV5hCGVDqq+lzhUPjdV3Kok
	 td9ZQbyPPOdng==
Date: Tue, 13 Apr 2021 10:55:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	DTML <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	SoC Team <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: New 'make dtbs_check W=1' warnings
Message-ID: <20210413095522.GA5586@sirena.org.uk>
References: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
 <CAMuHMdWY0aGoAw6QfF5PQRFNFwAzNP9cmFCjbKnsSbHsMz45fQ@mail.gmail.com>
 <CAK8P3a3EaaTGvAYvffbf7AF-iaC05yMShdnTc2QMcKQGZv7N8Q@mail.gmail.com>
 <20210412160116.GA904837@yoga>
 <CAK8P3a1_YB944niA-ebk-nJx-JDBh1q7z6s-9mLGFjF2Nv9r9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <CAK8P3a1_YB944niA-ebk-nJx-JDBh1q7z6s-9mLGFjF2Nv9r9w@mail.gmail.com>
X-Cookie: Shake well before using.
User-Agent: Mutt/1.10.1 (2018-07-13)


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 12, 2021 at 08:52:37PM +0200, Arnd Bergmann wrote:
> On Mon, Apr 12, 2021 at 6:01 PM Bjorn Andersson
> > On Mon 12 Apr 08:14 CDT 2021, Arnd Bergmann wrote:

> > So the same binding patch is picked up both in the driver and soc tree?
> > I was expecting that to cause (harmless) conflicts when things arrive in
> > Linus' merge queue?

> > Or are you saying people go the length to create immutable branches for
> > each binding?

> I think it's usually one immutable branch for all the bindings of a given
> merge window. This avoids the merge conflicts, and you can add further
> bindings on the same branch before sending it off to the soc tree.

Even with a single branch for everything having to split serieses into
multiple branches seems like a pain, it'll break my automation for
example.

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB1aokACgkQJNaLcl1U
h9BYoAf/d8xl+p11Ol3VZqWHP5xhJep7Q+NToFMOwICDFa+dQGCm8AKljcF3Vhr1
gn9IA7MeOUIMv+mEVKnHr0p+UP3GG84Dn+uTn0E4DYZkipBpvb4pBz3pvl/kFr5Q
/o76CegXEwkycuW8AosKMCGhnrgPMsInV/Mu3sGv7DTI0IaLjDNH7TS14Az9genT
SSTsu/0L4TnLZIlRLRI1hZ/4KPLzjIR+rSfR/E7j71VOQNF5GnIAKj0xOQcGJv4H
vtW2j2WTKCkedDbDBvHxMsd7taiVnAYYFzbKU5gd66caudzHqJdJGh45irJLoJDM
EO3U4LepMpL/s/OTT263JrPdl9K1sw==
=kGwu
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
