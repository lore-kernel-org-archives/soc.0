Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9392FFF90
	for <soc@lists.linux.dev>; Tue, 27 Jan 2026 10:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769509315; cv=none; b=W13pKlHH41b108sNK/T0uvP8xnsQj++QxKokX3yOuZLa8h3FABop3uNyIMe9qm6N1RTDsoAhDq1FZgXe1+vr/Vm9JKjwGbbFkFj0gGz8NTa741WBtkVxnc50pUYXfkLunAirWQNgn0NIts2U7y52YWQXRpLSYEOP72adLuY1iI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769509315; c=relaxed/simple;
	bh=/y6Wd8skF/eyBjb1W5X2cj7DAkv/yjDGFdWCh+DTqvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NgscfzhR3mvhokZkv2+1J4NXhoX8KQKtq8Ofp7wdobHE7OAGLSZj7Pz+eUr0Es8cT0B/1ZagB1G/eTKRDjwytcK1LhywGeoZ1bB76gvzASsKpWJ00w8MwcnYPdan3RyPerOd+p+GX9CZZbUq8695w/PtRU1ERx4/j1pXQXHlmr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZW6UhxYB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZW6UhxYB"
Received: by smtp.kernel.org (Postfix)
	id D6B29C2BC86; Tue, 27 Jan 2026 10:21:54 +0000 (UTC)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53C87C19425
	for <soc@kernel.org>; Tue, 27 Jan 2026 10:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 53C87C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1233bb90317so5212258c88.1
        for <soc@kernel.org>; Tue, 27 Jan 2026 02:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769509312; x=1770114112; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TnKeWPcpe1rU91VMNBn+NfQOk11GPlwYGUqpu12X/mE=;
        b=ZW6UhxYB/09jy336CWRO1FJD8b900OXRRJSlC9Dq9JG5Fg5MxWga6eP6T5MbiAvdXM
         69gAOktWlJngPQDcXPVS6VMBjkqpubD8CM1FRVXbzOd7oMkOWUFATa/72ljqdVhfwUTv
         cf4byz4u8OFctkacsTZLFehH3AenMBnfUZK/MiWYlvycs5TCUc8bnw77g17GEt37sccm
         MCn0EpW3THn6nxw3fxHxF9jeIZtO+5T0lyewNdvMOOygL5adIG+dGw2Ab1aFVaHjBFe7
         wE6YWTHKi2LX6pxxnn6Zy10KWN0TvM+78zJf/RIn0MNL0KLAoD1FRq4VeZ34EnQwsGIg
         I+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769509312; x=1770114112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnKeWPcpe1rU91VMNBn+NfQOk11GPlwYGUqpu12X/mE=;
        b=iHNyTrBx67ij1is1c/B43Lhhl2qgMqfs8SSozqJ/Drg1T+dBJkfo7ohz6bxAe9w3hm
         nnNZLxHcblq7u3o3DCJcDIcL9/srchbA60bRszeqqRH9gkATM2Qlzs/XBWHA6BVDqs0L
         ybg1p89w+WCwByr9Fg2URVek1esORSuc3xOELpTe41pIEs9FKIb37IPtTMgSsZ21V8uW
         0w+EFbOdgtBxJWHQca8XXlDf4wxRsDUsdddOX0howD09eh7jyOIX3Q3hkpofbsFiDD6t
         OTkSdLPPOAEB85abcWLZrgvzFRf+9ffTbGFdrsO+o/OXwT2wkSZYKmWYAWUIsiiXqbE6
         ca8g==
X-Gm-Message-State: AOJu0YyfVx3o51OII2Q5a7fhxeA4eCrFbGux9MYCNOnBVPHVodnFk5lo
	KeUfRhX+2Gntto5foQPQiCdx7dYeEP3/tZdR0wP4NvN558ZmXbASNIp5yH7wTQ==
X-Gm-Gg: AZuq6aLZZYolLA1Xc133XpA5PdJs/Oam2i47CsnRyv2bQGQ+hdfNnQOidrKl5NcInZn
	Ojvok5cteuTbUZl8l6QLP3ZYI1HJZD57QQL+JIBChldSQvo6UTWq2MXMTq19RqjZ/57dTe0M2/J
	LGwLuZW30/07ix90EoLLh9bPspnJoeHs3xhGoIthXsHq02WdiIE8RVhf2b+LQ+KGefTt5mw2a8x
	MVdeYOHULkH6iKAtTcQZE0PyW48jMXpKzBW931TUSpJ1xkkRdcxczNZGachWqsawIcM3ISe3QPc
	dRr2gLMw2OuIBBNPiChFTKm0P+YUs+EAN4b1lQ1eUJWwRci279vX2FjG25B4sNRgN/NzPa7H/6E
	ueX12Q3Yy+lO00aSmygz2nyBZ4ObZSypYJW50ugh3DtpRkIL1YH0lh2R3x33wOGIbS3c5dhi8hx
	RLLicJt412da4ljhpXMRfkCUfv7o7IDAz3AJymZM7cCru2SlFXZjgyswKrhQlW/gApX2SYx9ic/
	Q==
X-Received: by 2002:a05:7022:123:b0:119:e569:f865 with SMTP id a92af1059eb24-124a0577c42mr662163c88.2.1769509312332;
        Tue, 27 Jan 2026 02:21:52 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d9a4698sm21833187c88.16.2026.01.27.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 02:21:51 -0800 (PST)
Date: Tue, 27 Jan 2026 11:21:46 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
Message-ID: <aXiOqLYwBxrvErjP@orome>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
 <176901122359.951664.14976320641854335179.git-patchwork-notify@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2ar2hzk5vjwypbhx"
Content-Disposition: inline
In-Reply-To: <176901122359.951664.14976320641854335179.git-patchwork-notify@kernel.org>


--2ar2hzk5vjwypbhx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
MIME-Version: 1.0

On Wed, Jan 21, 2026 at 04:00:23PM +0000, patchwork-bot+linux-soc@kernel.or=
g wrote:
> Hello:
>=20
> This pull request was applied to soc/soc.git (for-next)
> by Arnd Bergmann <arnd@arndb.de>:
>=20
> On Sun, 18 Jan 2026 09:03:00 +0100 you wrote:
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027c=
b1e8:
> >=20
> >   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> >=20
> > are available in the Git repository at:
> >=20
> > [...]
>=20
> Here is the summary with links:
>   - [GIT,PULL,1/4] dt-bindings: Changes for v6.20-rc1
>     (no matching commit)

Hi Arnd,

is it too late to back out this particular pull request? I missed that
Mark had already pulled some of the patches in this branch to the ASoC
tree, so now we have two version of this (well, actually three because
Rob had a set of changes that were also cleaning up some warning that
these patches were) and everyones getting really annoyed.

I think you mentioned at some point that you can't easily undo these
merged, in which case that's fine too and I'll take the full blame for
this. But if it's possible, below is an updated pull request.

Thanks,
Thierry

--- >8 ---

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-=
for-6.20-dt-bindings-v2

for you to fetch changes up to d262d030baef287da33344a932639aab5f913c3a:

  dt-bindings: display: tegra: document Tegra30 VI and VIP (2026-01-17 01:3=
1:19 +0100)

----------------------------------------------------------------
dt-bindings: Changes for v6.20-rc1

This series updates various DT bindings for Tegra architecture,
primarily focusing on schema validation fixes and new feature
documentation for Tegra234 and Tegra264 SoCs. Key changes include
converting Tegra20 NAND bindings to YAML, and updating memory, DMA, and
IOMMU definitions for Tegra264 (introducing CMDQV and DBB clock
support). Additionally, it resolves legacy warnings for Tegra30/132
display and VI interfaces.

----------------------------------------------------------------
Ashish Mhetre (1):
      dt-bindings: iommu: Add NVIDIA Tegra CMDQV support

Charan Pedumuru (1):
      dt-bindings: mtd: nvidia,tegra20-nand: convert to DT schema

Jon Hunter (1):
      dt-bindings: tegra: pmc: Update aotag as an optional aperture

Svyatoslav Ryhel (2):
      dt-bindings: display: tegra: document Tegra132 MIPI calibration device
      dt-bindings: display: tegra: document Tegra30 VI and VIP

Thierry Reding (1):
      dt-bindings: memory: tegra: Document DBB clock for Tegra264

sheetal (1):
      dt-bindings: dma: Update ADMA bindings for tegra264

 .../bindings/arm/tegra/nvidia,tegra186-pmc.yaml    |  11 ++-
 .../display/tegra/nvidia,tegra114-mipi.yaml        |   1 +
 .../bindings/display/tegra/nvidia,tegra20-vi.yaml  |  19 ++--
 .../bindings/display/tegra/nvidia,tegra20-vip.yaml |   9 +-
 .../bindings/dma/nvidia,tegra210-adma.yaml         |  15 ++-
 .../devicetree/bindings/iommu/arm,smmu-v3.yaml     |  27 +++++-
 .../bindings/iommu/nvidia,tegra264-cmdqv.yaml      |  42 +++++++++
 .../memory-controllers/nvidia,tegra186-mc.yaml     |  13 +++
 .../bindings/mtd/nvidia,tegra20-nand.yaml          | 102 +++++++++++++++++=
++++
 .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 -------------
 MAINTAINERS                                        |   2 +-
 11 files changed, 225 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iommu/nvidia,tegra264=
-cmdqv.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/nvidia,tegra20-na=
nd.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/nvidia-tegra20-na=
nd.txt

--2ar2hzk5vjwypbhx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAml4kboACgkQ3SOs138+
s6FLRg//XsDUpcJM0kfBM7t/pJQkRwZXRjWaejAELwFLvVohhxLeSkHjm2D9Pelb
WuOBI4Sa1Zo/OnTXvd3p+upXoJe46m+fsI0GJnY8TjWvm+1PCs+EvCXjV/LHcNmi
Ev9WhuedfrNqq3+gPzn67yLOVbmAIyMIlNf5AEb8ywaulG2FbnYQXOdmqJauM1+h
UwazQ2dzhxunh8A7xifXHxN5MCJjFt+m+gWdsnAa4ImVfCwsWzcs9xORQ6KVRj9i
cPSpw4YZfHz1heL0wHn1ouIofgK5LGP3zo/TggU2x14eka+f1uCSOfWi9NG77YIE
JRhAydUBzfTEW0FR5cMOT/0NfYzyYbnEEwD2ATbRC5JbEyrSNCvZYKYpkqBQl6Xq
IAFQK4/xAE9USQMn8rNGfiJHCTslqNe1Gx6Wq1hLcFrY/SNfEKNyQLdYFLnfjsSp
NAiN1aQeyRJ3g6/vI8fhBLo1f08ouGG1+dmLhJnWvHXGDN+/Cy18c3BNU39nXbck
QZzIRci+b9+pDHNQ1CEz/TvVmQngdO0cpUQ2KqCVVocFXKLgrLrJt1SgXittQWJl
ZcaXJsEXaAfNLfUhd/4kM4K4LsD2ljr9v1KQUqSyzQWrLgYeUQ0CairVb8I/JxeW
fEuDIjsZtqG2NqX3o7SRhijz29PIR004ClVrpo+nX4fAseSKlss=
=qtTg
-----END PGP SIGNATURE-----

--2ar2hzk5vjwypbhx--
