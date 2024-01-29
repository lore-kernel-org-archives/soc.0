Return-Path: <lorenzo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D2DC47422
	for <soc@archiver.kernel.org>; Mon, 29 Jan 2024 11:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 64C53C43394; Mon, 29 Jan 2024 11:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA01AC433C7;
	Mon, 29 Jan 2024 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706527210;
	bh=EmN8RznQlcv3XJVtMjnrACuEdVkzu+e2XyXTojClPv0=;
	h=Date:From:To:List-Id:Cc:Subject:From;
	b=PH9we1ggCYxn4Q5BZ49a6vZ0G/ucZeZFCqfA03kqiDx40XbyB0Pci2kCfOZtAsLAa
	 tAQqe4xf5ZT4xZobWJtNcUrdow2docIM35hOLyrgegISpvIClS7FP0Wy49CPpAzICB
	 fznDQCgaAlOvU0tUD4dlHVZrsU8WhDT/YChEwAr23j3LTscvkJ4KWq+hnUaow+ZM1o
	 6B31tfGJbHU+M5+PI8zlAbTBfzSpkSaH9BrXHqR1CSjdMHmC99GGM+pFcKv/mjbnz9
	 IIAq3fl7kDw5qeYrdpfmskT7/MHzASmobNqXeK8UqFGhpw1A0TDOKJfGGeYv5Yvi9C
	 R9Jyxluc5f6pg==
Date: Mon, 29 Jan 2024 12:20:06 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	devicetree@vger.kernel.org, John Crispin <john@phrozen.org>,
	soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dd@embedd.com
Subject: Support for airoha en7581 Soc
Message-ID: <ZbeJ5okKQ66FXGxP@lore-desk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="30fnfXUcwDqiOIse"
Content-Disposition: inline


--30fnfXUcwDqiOIse
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matthias,

I was wondering about the status of the following patches:
https://lore.kernel.org/linux-arm-kernel/20231001122418.2688120-4-dd@embedd.com/T/#rbafabf4bf2473327f35ce7d79623f63838630537

Do we need to respin them? Thx in advance.

Regards,
Lorenzo

--30fnfXUcwDqiOIse
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZbeJ5gAKCRA6cBh0uS2t
rH6UAP4qkxn7CkKcLaOW7Wu0RgdFjYWNJ4a1a/eLgMiAr1GwYgD/TXzi5bwXyZqG
xTWAJFSl4n/BbU8cIyL2LGCy8Y4afQE=
=fdcj
-----END PGP SIGNATURE-----

--30fnfXUcwDqiOIse--
