Return-Path: <SRS0=UpmX=PG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2A0C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Oct 2021 08:04:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F09561050
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Oct 2021 08:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F09561050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=zQPHn2twng40QyhQ9Kyj/65l9+KYy2lZXuIKPJwqg/E=; b=N3w
	LO9/lbaz7eZ2YBF2jU5PSnQztu36CYnqrDEWtK0F8UjngIbXWBd8NOLQ4fnqTi8eyLdSsVTyYoT81
	FZd0V3Baer4VHLYlRr+rSiuaA1Uf7ISh6dcZtzVunnT4PpdPR0vopv7cOTUo52lyz/g6nFI3+9VaU
	yUetU8moT7PfV8x68j/1QOlVWTXFBtpfQderVdCEkyI6mhyA5b3zIVtR3ju4893j1f5wz/YFArzMP
	3449xYEwd6qMIpMxwd/kloz/tL0gY0+Zfo1kYrP/Qp8uHer4NRaZCw7afuAfiIcxQnG9Udnd214rW
	/bFyeuVCro54lnAx0MDJNPNOoF9/UNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcNcH-00EYWd-M9; Mon, 18 Oct 2021 08:03:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcNcE-00EYVe-7k
 for linux-arm-kernel@lists.infradead.org; Mon, 18 Oct 2021 08:03:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C17F61076;
 Mon, 18 Oct 2021 08:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634544205;
 bh=jaRhVaaILmiksOarnXdu6B73cKiBj0r9Uzn6kzshOf0=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=tD9GnRJbfYHWmaRRE4miJQH/ryiJQXA2oHdC6Nuw1gGhrB0/dHlsh60EcWbcRWzAL
 VLCIOvO1IsiCEt4tky7KaRUp37e9+DxuOllBEWv26Op0GZTnqwtm1dVS4StizRfK2W
 Al8EpRTX3BEA3dMPbtiFaProPuNhETmObFMC7FE8/W6UWU3bp5Z4IT40I3mB6Gcqwv
 PYtLfS1zv1b1EneX7MypK03t2ae3Mf1RUo+uwN2NWDhFhp3GBTNLkzOF6W02fAp+05
 pcUHPxT2TLnZej0GjeO0hRwA8ZBBJ10V/dMQhF3ZpS+8lH8SBNNldkrDA8c6+s1LxU
 nUFnA7fbtkrmA==
Date: Mon, 18 Oct 2021 10:03:23 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Platform Changes for 5.16
Message-ID: <a2a51d7b-66ad-4c94-beb1-e793ae62766a.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_010326_319557_3F5864A9 
X-CRM114-Status: GOOD (  10.00  )
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
Content-Type: multipart/mixed; boundary="===============2291321499295326918=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211018080323.OOJDK_ACWyRM-0FaJXMAtRPWAphQ095awoKmJq6_bgg@z>


--===============2291321499295326918==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tH84veD4Dn/9IDHz"
Content-Disposition: inline


--tH84veD4Dn/9IDHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-core-for-5.16-1

for you to fetch changes up to 5923ddaa95a7e61e827a3d9b1d9c749963d8db90:

  ARM: sunxi: Add a missing SPDX license header (2021-09-13 09:03:47 +0200)

----------------------------------------------------------------
Platform core changes for the Allwinner SoCs, this time adding SPDX
headers to our files.

----------------------------------------------------------------
Jason Wang (2):
      ARM: sunxi: Add a missing SPDX license header
      ARM: sunxi: Add a missing SPDX license header


 arch/arm/mach-sunxi/platsmp.c | 4 +---
 arch/arm/mach-sunxi/sunxi.c   | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)



--tH84veD4Dn/9IDHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYW0qSwAKCRDj7w1vZxhR
xc1vAQCD8MyC1auExfRAgRfY0U2M6EjIVv7YVfp8Oawjy1Y1xwEAhlGb7av5rhOl
pGnph29e1aT2axf2ijOFcX+43BhYQAw=
=Kbn4
-----END PGP SIGNATURE-----

--tH84veD4Dn/9IDHz--


--===============2291321499295326918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2291321499295326918==--

