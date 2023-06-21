Return-Path: <SRS0=KCR3=CJ=collabora.com=sebastian.reichel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB4CEB64D7
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 12:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D8B0C433CA; Wed, 21 Jun 2023 12:29:00 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D8655C433C0;
	Wed, 21 Jun 2023 12:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D8655C433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from mercury (dyndsl-091-248-190-194.ewe-ip-backbone.de [91.248.190.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A49D46606F96;
	Wed, 21 Jun 2023 13:28:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1687350536;
	bh=GTW/CL2ysVF/wvCsb3GSydyy7zrXhZOYuHVcNs377r8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bbVDvQMsu3C7VsWl9Nz56r6OoiHniYX40+IjSGAlLApRZaoo9jkS8Ng/x10tB+NSN
	 oDShDktLljzrUCTGn/Oka4LL//zx/UFJXmWDIIY0hkT2Vmi704XEnguH6PMDlhCYzE
	 D3UaXoIkG+29RDt2cA/Jc1GSjbt3JiaSGIGnzTMNOpJLwVjMfkAAbbiY20CHHaU3f4
	 Yd8VMnL0oG+j6aWoPnO6RsLuykYl5hguBM5q5opOwR+4V0ke7a48p1Zm+JYMb7RE5/
	 +W72p6KTUGtzuvf4t+dgZsSfrI4OWS5ulzWxR0U96VimxO9A1qmvnD2VoDMXrmrrKM
	 KgAiJSV7DsR8Q==
Received: by mercury (Postfix, from userid 1000)
	id 53A9F1060EE8; Wed, 21 Jun 2023 14:28:54 +0200 (CEST)
Date: Wed, 21 Jun 2023 14:28:54 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, arm <arm@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kernel@lists.collabora.com
Subject: Re: [GIT PULL] ARM64 RK808 defconfig fix
Message-ID: <20230621122854.yvffeuhhp4ywqcla@mercury.elektranox.org>
References: <20230615174940.jmzuv5kb6o7htkwo@mercury.elektranox.org>
 <5dd55b3f-9a12-4c3e-99a8-b81add924cbb@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mtewff6phpthd27a"
Content-Disposition: inline
In-Reply-To: <5dd55b3f-9a12-4c3e-99a8-b81add924cbb@app.fastmail.com>


--mtewff6phpthd27a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Wed, Jun 21, 2023 at 11:36:48AM +0200, Arnd Bergmann wrote:
> On Thu, Jun 15, 2023, at 19:49, Sebastian Reichel wrote:
> > Since I did not get any feedback for the defconfig patches from [0] and=
 they
> > are fixing a KernelCI regression (Rockchip Chromebooks no longer boot b=
ecause
> > of missing PMIC driver), I prepared a pull request with the defconfig c=
hange
> > instead as suggested by Tony [1]. It consists of the rk806 immutable br=
anch
> > prepared by Lee Jones [2] and the arm64 defconfig patch. I will send a =
second
> > pull request for the arm32 multi_v7 defconfig. This is targeting linux-=
next.
> >
> > [0]=20
> > https://lore.kernel.org/all/20230518040541.299189-1-sebastian.reichel@c=
ollabora.com/
> > [1]=20
> > https://lore.kernel.org/linux-omap/20230604060436.GT14287@atomide.com/
> > [1] https://lore.kernel.org/all/20230515152425.GV10825@google.com/
>=20
> I don't think it's important to have bisectable defconfig changes,
> and I'd prefer to just cherry-pick the two defconfig patches in
> this case if that's ok with you.

Sure, please go ahead. I just want to make sure that the regression
is fixed.

By the way, what's the merge strategy for defconfig patches? Apart
=66rom my RK808 fixes we have some other pending defconfig updates and
nobody seems to care:

https://lore.kernel.org/all/20230504201916.1121243-1-cristian.ciocaltea@col=
labora.com/
https://lore.kernel.org/all/20230604171345.1215276-1-cristian.ciocaltea@col=
labora.com/

> > The following changes since commit ac9a78681b921877518763ba0e8920225434=
9d1b:
> >
> >   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> >
> > are available in the Git repository at:
> >
> >  =20
> > ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.g=
it/=20
> > rk806-defconfig-fix-arm64
>=20
> This is also not a public git URL, you may need something like this
> in your .gitconfig to generate better pull requests:
>=20
> [url "https://git.kernel.org"]
>     insteadOf =3D ssh://git@gitolite.ra.kernel.org

oops, I actually have the reverse thing in my .gitconfig and didn't
notice it gets applied for 'git request-pull'. Thanks for the hint.

Greetings,

-- Sebastian

--mtewff6phpthd27a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmSS7PQACgkQ2O7X88g7
+ppJNg//eD3LxJzkyjLtogzFD3DGucEVMQwZlCchJPo124rMCmheQ9+60LSk1KRF
hhMGuCYnF2eMCjS51PmcscrefUyvu4R8Vs0/bdXaekIgbGC5xntezzEr+jVRQ/ZV
U2xTTNvgShbk4BkKoYxxJFuPn6vRPZ1iq16Iyhn2aaqm2vw9fly173v5wqoJNQdp
CpSgy+7Nx5kyFhuWR55E+VvU5Ha/SL45/RLc1e7qLIDpywboYQqTeaidmHp1TM2w
zg5j2uEtZ5Fw3AipzfelkhxLOblg/9YiQz/TdFSrJTwn8qGJ5W+YCkfwJmSw6A/P
mjfBdBL7SMWgEOojfkl1mXZbUDYRqEm5kJS/g3/mJ226QKkikXqpDvWXElQifTfV
zuIILyBtmywMpMU9DNPTO+aV9ue1AVmH6nte6FySw9lGtxm9UtwEJ4g4wdj+NeJL
J21r0tBbXReqWNowDQ4/piKMl/tgA92nc/MSPKA4U5ii1w0NyIwQLjrVOnzzNSGm
v/nkOfzDRoyXeT0XBnTA6p8Hl0n+AuuXk9ZMo+nFMqD5x3aLHbDv1g3vezu65+fi
5DnTsNkLb+VocfAYE6BSSe5dmSfqg+6NK/E+HiSJELXcCD2M2TrfoiKv+SvresIP
+Dy6+fTYYgWDnJIEQ54RrczucA59bkpAJcwCAreFcZDDGLpMUIg=
=IGgi
-----END PGP SIGNATURE-----

--mtewff6phpthd27a--
