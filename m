Return-Path: <lorenzo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECF7C47DB3
	for <soc@archiver.kernel.org>; Mon, 29 Jan 2024 15:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ECDF1C433B1; Mon, 29 Jan 2024 15:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F7AC433F1;
	Mon, 29 Jan 2024 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706541630;
	bh=TxFJqV+MPQp3rBIk+KVAYySlAAKCM6gBBzNb5Us9dHg=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=bj+it/LxFsaZVmzqnWJG18dOy4R5S0L+3bsQtSK2O3NDjWL/zC//R7bpYPp6PnCPW
	 RAQT0h8wGRKKlHAyrnmvE/iDR/mKOlf8LTXSXEyieQ3hReRVjQUIkhNJ88JV8QxjRN
	 pFAl1ssVpSjLas0SG9d1HaweOcaIC/pxXbMzr2BYnFwviexU7u9TMpNTWRNSKXy5wy
	 ble4k4a65BsWLYSSk5TK6Y1IrixhVn2bk4Zjpz+pm4AwIWaMYZnu0NFIXV814q6ENW
	 ygIQDQ8eamiZhBLIj56X76QPujMBRB2G6jn2+iQwEuJEX6IyAwiz+dWNVutTBERglr
	 ezM5UZn1H8J1w==
Date: Mon, 29 Jan 2024 16:20:27 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	devicetree@vger.kernel.org, John Crispin <john@phrozen.org>,
	soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dd@embedd.com
Subject: Re: Support for airoha en7581 Soc
Message-ID: <ZbfCO5-RoOG902e2@lore-desk>
References: <ZbeJ5okKQ66FXGxP@lore-desk>
 <9e1ad877-f55c-4045-bb92-c30614d6c1ff@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/zItrIba7pG8p+pU"
Content-Disposition: inline
In-Reply-To: <9e1ad877-f55c-4045-bb92-c30614d6c1ff@linaro.org>


--/zItrIba7pG8p+pU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 29/01/2024 12:20, Lorenzo Bianconi wrote:
> > Hi Matthias,
> >=20
> > I was wondering about the status of the following patches:
> > https://lore.kernel.org/linux-arm-kernel/20231001122418.2688120-4-dd@em=
bedd.com/T/#rbafabf4bf2473327f35ce7d79623f63838630537
> >=20
> > Do we need to respin them? Thx in advance.
>=20
> I don't see anyone from SoC maintainers CCed on that patchset, so no one
> will pick it up. Pinging makes sense if maintainers missed/ignored your
> email. But if you do not send stuff to maintainers, you need to resend
> to proper people, not ping.

I can't find any entry for airoha architecture in MAINTAINERS. Who is the
expected maintainer? (e.g. ARM variant)

>=20
> Additionally, this is a new arch, but it seems to miss any maintainers
> update.

I am not the original author of the series, I have just seen it on the ML a=
nd I
was wondering about the status since it seems there are no replies.

Regards,
Lorenzo

>=20
> Best regards,
> Krzysztof
>=20

--/zItrIba7pG8p+pU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZbfCOwAKCRA6cBh0uS2t
rNJZAQCu6JbfMmelSpBzqu8emhMj+R0qs8jlokRuvJG4/br/9wEAlYa9d1N/KZ7Q
cq1ItgU6mCWGXj2iqo0drjBUrBBH6Ag=
=YTIP
-----END PGP SIGNATURE-----

--/zItrIba7pG8p+pU--
