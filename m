Return-Path: <SRS0=UpmX=PG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2ADCC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Oct 2021 08:02:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A73A961283
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Oct 2021 08:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A73A961283
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=KUtbANKGw76mpWLXwy46VaZlU0PxfzJhTzZ6GJD6QIo=; b=GiQ
	K1r03Yegrzqk7DKSstNsablTvvETcxg+IjFKOTleBA8kdzeCDUs+ud69jVyAX//HyJK21r4qWtAvW
	gUrnipqWqXith4iYeLTSrWfsBnjPCNbcv73lHquSNk2ipD1AElvUU//RzM4jUPUP7t9ImdKIJsG7K
	hV4M4WmUEtA+yi6oAYyC/v4eusJglO578M655/fSou3ofe7BYUiJ7zviou5b5zReiM4KGOZBwCUa8
	uFlsbrHzgF68ZTHFQLANZmIX+goLOOgx3j95nTZrrVFxxsjS0ieb5cAdXjOZxNsmzCvP1s0Toztzd
	i+t1Yi3Jqziu0j7AgPKmH0Ri4oCDTrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcNaN-00EXyC-TI; Mon, 18 Oct 2021 08:01:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcNaK-00EXxS-3Y
 for linux-arm-kernel@lists.infradead.org; Mon, 18 Oct 2021 08:01:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49B0D6103B;
 Mon, 18 Oct 2021 08:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634544087;
 bh=yflOJDMKWIfetXVUpp9ljl8knVOI7slXvw5raYckLkY=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=m604JwsGx+0+UOOMtfiAxQ7nAJpiZtl5qTrGbpeg2lPqB/a7H0vRXtwY3oMR023IE
 Z9qrG9cm74IPU2DIKEGTVuysniSzBpPrFzgCgiC9Ob/e5sHBxFQaTKcgqalZ3lDI5O
 HYvhLKhuEKFyIyfGoh7ZzE3rbcmCivZh1uedH4r7bfQETxaoY9czCBCqOTohSmTsV0
 ar069hJIm8on14MbaKyiMQWbAE4h7hAikdEUTnYV6rnuo073iE5DMEch8zjWg8+KIP
 bl5dENHvtQsdCPF8Acn4+acy9WDkV9chY80cHtGUySYCpM8i29K+H2sRW5inm7dhvX
 RlCDUlXeewpCg==
Date: Mon, 18 Oct 2021 10:01:25 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Fixes for 5.15
Message-ID: <d4c41c71-f1ff-4464-a26f-1bfd4b52fd78.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_010128_187668_7B9391C3 
X-CRM114-Status: GOOD (  10.67  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1139514122284596704=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211018080125.azdJsb1werl2UjkcAE4GsmG9SRqurWXguSjSzfiP0Ds@z>


--===============1139514122284596704==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EHQGxgoMwBtoyP0k"
Content-Disposition: inline


--EHQGxgoMwBtoyP0k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags=
/sunxi-fixes-for-5.15-1

for you to fetch changes up to 55dd7e059098ce4bd0a55c251cb78e74604abb57:

  ARM: dts: sun7i: A20-olinuxino-lime2: Fix ethernet phy-mode (2021-09-24 0=
9:29:00 +0200)

----------------------------------------------------------------
Two patches to fix the GMAC PHY mode on some boards.

----------------------------------------------------------------
Bastien Roucari=C3=A8s (1):
      ARM: dts: sun7i: A20-olinuxino-lime2: Fix ethernet phy-mode

Cl=C3=A9ment B=C5=93sch (1):
      arm64: dts: allwinner: h5: NanoPI Neo 2: Fix ethernet node


 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts         | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)



--EHQGxgoMwBtoyP0k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYW0p1QAKCRDj7w1vZxhR
xfhYAPwMflBg2xBO5WSajPwlxLfGksNhktpQJegp1yhNkryplAD/el1PA6rnoL4E
WLZsynHR78Pkxe1pgAFKLQ+/GJZJygQ=
=FQ8z
-----END PGP SIGNATURE-----

--EHQGxgoMwBtoyP0k--


--===============1139514122284596704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1139514122284596704==--

