Return-Path: <wsa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F900C433DB
	for <soc@archiver.kernel.org>; Sun, 17 Jan 2021 11:09:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3AFE220657; Sun, 17 Jan 2021 11:09:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B94E2064C;
	Sun, 17 Jan 2021 11:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610881779;
	bh=3HdbUlzqs9Es6Fh3Wo/CkC6EtbrIoXgcKRggOopDs3M=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=g2A8VFw1cbxawfOGUYKPGJ/weClrLoCQw0vgvL8Ys1aex7uztOLERcO3CKzcVun8A
	 7DT3Tiu7JpvU9OEQYOY0gv2H4EIEoBp8YjQSY8HCNi9SKI+rgWbgNTUUaqNvfXmf0n
	 gpwwY7K5CxHpzFyFcybEuiboPn8lbTVXvuV+tIMbO4i8+63MS0wtZQ2N5cOY2OqEop
	 yW91ON9U7EQuUmBYmtbg0eHWH6eMDn7k0M4RJQ+rAWTEmocaRUEr5qK+Gzk99ZmIPX
	 bdcAIHwxOyWV5Kf0jUtnflAAjo+I+jcGX8HFu9yok//s5W/A5SmPcUrIweIxQOdK6j
	 T4Voi3S35B1vw==
Date: Sun, 17 Jan 2021 12:09:33 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 5/7] i2c: Drop unused efm32 bus driver
Message-ID: <20210117110933.GA1983@ninjato>
References: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
 <20210115155130.185010-6-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <20210115155130.185010-6-u.kleine-koenig@pengutronix.de>


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2021 at 04:51:28PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Support for this machine was just removed, so drop the now unused i2c
> bus driver, too.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to for-next, thanks!


--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAEGukACgkQFA3kzBSg
KbYHlQ//ek9eh8st3vu8svr62KU8HEzhRH44ii+LITGD7iMtqEPTQx46fanEQNhW
AXdXyPygRCxv78r+U47usGZbfDrpWLKQfyzns34kHg9omIPa+1CAIyzQGCAJHOk+
sFx6OEMe9XF4b5B7AxOX3qUwNIlJlttU/lR1acHD/OMVmlAlWvEEHxxZ7JGLH/1c
RaWL2F3P2/eGsMBH3R9GQ8OifFbaGAOXJykCmu1BfIdWrlkW+b7mNNmHVwhHQLtD
iAyljFQYrCwxOp5HigfKcRLlhg4xHh4Imb7qKvLBC66nBfT6P5p92mYUZoplIvWo
14rjXhczTofyiTEeAk0sqhrTuaU9nZWKtlr8Z0evLPKo40nUZbWRwyf+YN5HObZu
uRrJ/b4wffHOTYjvNtnrSW+rLsai3Z8uSLDvJ1WblzumsXDTR7DCGPHM6Ht/golT
QkAigGpSIHqoR7i+1K8Pcmcn/HKDkmALrrW5wN0lOc//IIHG+4V2KB+jbFEvQvZw
eQoOOzEW/iE8hA0DDREYHK7BpaiddMe9R32lcvAWHnljfcloR6FRMvVBTyBkYI+W
qKldkvpIGmz5rRjDjtNZrLebvDH+1XjMloB0ouo+CnL41wpV601Fb5GUkA8FoW0u
hRESGpek8H27q8oeOCPXtqPAYtet2cRDqOLiqyaQmTdfl/5yu8o=
=eOUm
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
