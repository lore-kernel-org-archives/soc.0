Return-Path: <SRS0=R85L=GU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B79C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Jan 2021 11:11:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F2DD2064C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Jan 2021 11:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F2DD2064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IxH+UlnnptTV72GU0AFW82JWeV3/FtfiimBEfmeqjbQ=; b=AVwFu9O3DwKS7BGPq+gjMp/1B
	Tnrmz139xLbLzqUHYNqQ9LM3IjLxL0cTSvYSwL3+/FVMAoYOz63swsKXpx8BUBnjHnaL4Es/obcE7
	jw1N/Fx1E0EKZ7AUVAwI8vTUTzcZ1F25ZqeIgu6O8AvG0cTDGWgUAjn4+7mfGvf6ufba9oqEAxE1W
	+3ew3d+Bd25rbQhsp3Hb5NMh8EFnpJv+pIAI+WKbt8eGegG3hexfl6S6Mz7P182oteZyCTLzXY+Ho
	Z/4stW6A/CiSWpMEVR0evaVqPdF4eh/akn308U3CbNqNdTQBuNrP89dVAM4LGHfUi0sLdUf5MRX5/
	ti+ArRfHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l15wE-0001Xc-GF; Sun, 17 Jan 2021 11:09:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l15wC-0001Wx-KS
 for linux-arm-kernel@lists.infradead.org; Sun, 17 Jan 2021 11:09:41 +0000
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
Subject: Re: [PATCH v2 5/7] i2c: Drop unused efm32 bus driver
Message-ID: <20210117110933.GA1983@ninjato>
References: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
 <20210115155130.185010-6-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20210115155130.185010-6-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_060940_740898_9D10FCB5 
X-CRM114-Status: GOOD (  10.20  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, linux-i2c@vger.kernel.org,
 kernel@pengutronix.de, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8578941779560614344=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210117110933.wLkKbi_K7aYpuDlPQgYHzcwhYUL52cpWu-MFb-pB6C0@z>


--===============8578941779560614344==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline


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


--===============8578941779560614344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8578941779560614344==--

