Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F96C7EE23
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 22:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2B43C4339B; Tue, 30 May 2023 22:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADC7C433EF;
	Tue, 30 May 2023 22:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685485587;
	bh=7rp9wAWtDhQDYsMgdQiWYP6ugM4phxn4mXycUT5voBs=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=p38sWHVxHv40xfvM9o9e1TsfZnto835h0QGvq2rJEAyY5+HZ9nLQRy9Anubw4d8Sz
	 SPBXn94DybEnNXkKmq4WmYggh25SyMdSW2RzvaHzbCJ+AWcVYEU3AeEHtyzjQjnLFC
	 cvBOnjHAOAOCufbYN0F0MUN2o2IXZtNULQmlgjHds8KrHvXjak27DMKYocPhr7+ZZH
	 RZU3kdQACCMBihrY12SSo6wOVYojrIZnOk/GzSgwFnLYc1aG2jFw2I/xhxeSjniUxc
	 f6sBkfjgHoTor11yfEoy92Rz4p3Y68v1Fq1M25/OcTqrIcUNhOOsFHd3toUGQ7LPej
	 88CcvegHSlfeA==
Date: Tue, 30 May 2023 23:26:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
List-Id: <soc.lore.kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, soc@kernel.org,
	corbet@lwn.net, devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	olof@lixom.net, palmer@dabbelt.com, robh+dt@kernel.org,
	arnd@arndb.de
Subject: Re: [PATCH v2] Documentation/process: add soc maintainer handbook
Message-ID: <20230530-paragraph-putdown-389d45fb16c5@spud>
References: <20230530-multiple-whooping-ee5706fceb67@wendy>
 <44a247a3-e349-94da-8235-1b6911463d78@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5ixE0R1BTF2i8UQE"
Content-Disposition: inline
In-Reply-To: <44a247a3-e349-94da-8235-1b6911463d78@infradead.org>


--5ixE0R1BTF2i8UQE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Randy,

On Tue, May 30, 2023 at 08:28:44AM -0700, Randy Dunlap wrote:
> On 5/30/23 05:49, Conor Dooley wrote:

> >  Recommended is also to install yamllint (used by dtschema when present=
).
>=20
> I don't see anything in Documentation/ about where to find yamllint...
> please.

Sounds like an unrelated fix to me ;)

> submaintainers and sub-directories ? hm.

I had sub-maintainers before being asked to change! I think that
subdirectories is correct though & the hyphenated form is incorrect.

> > +named $soc.dtsi, for example, jh7100.dtsi.  Integration details, that =
will vary
> > +from board to board, are described in $soc-$board.dtsi.  An example of=
 this is
> > +jh7100-beaglev-starlight.dts.  Often many boards are variations on a t=
heme, and
>=20
>                             ^^^ Why not dtsi, like the sentence before sa=
ys?
> or is the $soc-$board.dtsi wrong?

$soc-$board.dtsi is wrong.

> > +Another common way to split up changes is to send an early pull reques=
t with the
> > +majority of the changes at some point between rc1 and rc4, following u=
p with one
> > +or more smaller pull requests towards the end of the cycle that can ad=
d late
> > +changes or address problems idenfied while testing the first set.
>=20
>                                identified

Surprised nvim didn't whinge about that one.

Thanks for pointing out the wee mistakes all over the place,
Conor.

--5ixE0R1BTF2i8UQE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHZ4DgAKCRB4tDGHoIJi
0lm7AP9Tn8XkODxDD/Y9jRyyF3lHAYBn79wRbkAqg1Dka5NeIgD/WsKBbcxFr4Ks
et3Z56fXDZi0KyIAmfihjseOYRVfYwM=
=A2WC
-----END PGP SIGNATURE-----

--5ixE0R1BTF2i8UQE--
