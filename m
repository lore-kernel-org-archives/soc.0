Return-Path: <SRS0=CKL9=FC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AF3C63697
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2020 10:59:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6481321534
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2020 10:59:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hA2rJQgw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ionA9ywt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6481321534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=IS4eC/iN/EkmJYp3+8D2u4F2jcwH0IHQogNMQWL+se4=; b=hA2
	rJQgwgMx1rMVpw7y3lDj3pdJGp1HGfFmevMMq0J2meRcSIGBixKZ15/FN08bZ4KwH/JMsNimE50FV
	cMBtg1NLWSp9JzjKjW6LEBnGqIo7VHP84JXJi319VJHjsER9RB04oX6aqTTb3iCiv67ky08uLIC57
	LtbiuCi46VGgJkNZpbDMvfTWWLlIKJsD6DqFbFS31KkzEhYpXo+RaXCNaGGR0w7yYvhJCXPngZzpY
	7FkhQFucUc+OozDjH1KSdfy4fMaJhrlgNgeob6IyEQcwItLZr1679u4XSfa+M4K3qr2HTiJAjsOwt
	CXDBpM/tm3SeaUqZYwaM+kIfqFWTMcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kixur-00016r-Ox; Sat, 28 Nov 2020 10:57:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kixun-00016N-PA
 for linux-arm-kernel@lists.infradead.org; Sat, 28 Nov 2020 10:57:19 +0000
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EA3C21534;
 Sat, 28 Nov 2020 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606561031;
 bh=/cYCB9ubtMCYTyW8pXjqV4uW11YWkL9TfmjWd+n+iag=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=ionA9ywttwYEAEJVyHYxwU4L0L0Gp3+elpQ9ISYpew0EXy+MQk92MbJCjNMTpJnmE
 1/JgQrrxEJnAv5LzFFmXrs1WpRU1TiPZyPMwUvV5nCAhrsfwzgVNPBZ5GBEfJQMbFx
 59xU9AC8aUM4OZyGuDVDrU1b146NlgQs77tnHQVc=
Date: Sat, 28 Nov 2020 11:57:09 +0100
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Subject: [GIT PULL] Allwinner Fixes for 5.10
Message-ID: <1280f1de-1b6d-4cc2-8448-e5a9096a41e8.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_055718_286954_4FA893BC 
X-CRM114-Status: GOOD (  14.73  )
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
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>
Content-Type: multipart/mixed; boundary="===============7971092200294667197=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201128105709.We9KNw0kqG2po7-rpsqVjoGFOYZoxPqwJHApQPFj_fg@z>


--===============7971092200294667197==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd, Olof,

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit 107954afc5df667da438644aa4982606663f9b17:

  arm64: dts: allwinner: h5: OrangePi Prime: Fix ethernet node (2020-10-29 10:29:49 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-fixes-for-5.10-2

for you to fetch changes up to a7361b9c4615951f52ffd2b1afa09a1384c7b4e4:

  ARM: dts: sun7i: pcduino3-nano: enable RGMII RX/TX delay on PHY (2020-11-24 15:24:28 +0100)

----------------------------------------------------------------
A few more RGMII-ID fixes, and a bunch of other more random fixes
-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8Is4AAKCRDj7w1vZxhR
xbAjAP4ohHei2PZ3mHF6wU9kBv4lM2aV60mqvKDFirMdfQBNoAD/Y5fMBAVp6yJn
lRECtoJdPWI4x97ZNZMR4xX1XVSXoQk=
=aO5k
-----END PGP SIGNATURE-----

----------------------------------------------------------------
Adam Sampson (1):
      ARM: dts: sun7i: pcduino3-nano: enable RGMII RX/TX delay on PHY

Icenowy Zheng (1):
      ARM: dts: sun8i: v3s: fix GIC node memory range

Jernej Skrabec (1):
      arm64: dts: allwinner: h6: orangepi-one-plus: Fix ethernet

Matteo Scordino (1):
      ARM: dts: s3: pinecube: align compatible property to other S3 boards

Pablo Greco (3):
      ARM: dts: sun7i: bananapi: Enable RGMII RX/TX delay on Ethernet PHY
      ARM: dts: sun8i: r40: bananapi-m2-berry: Fix dcdc1 regulator
      ARM: dts: sun8i: v40: bananapi-m2-berry: Fix ethernet node

Paul Kocialkowski (1):
      ARM: sunxi: Add machine match for the Allwinner V3 SoC


 arch/arm/boot/dts/sun7i-a20-bananapi.dts                      |  2 +-
 arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts                 |  4 ++--
 arch/arm/boot/dts/sun8i-s3-pinecube.dts                       |  2 +-
 arch/arm/boot/dts/sun8i-v3s.dtsi                              |  2 +-
 arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts             | 12 ++++++------
 arch/arm/mach-sunxi/sunxi.c                                   |  1 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts |  2 +-
 7 files changed, 13 insertions(+), 12 deletions(-)



--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8ItBQAKCRDj7w1vZxhR
xRJrAPoDDYc5fQDvi9gismOGix+4mdxZuVMpmRjezPkIhjGMgAD7B9Z9mZBTXkDS
CG1stNc0tv7CouM0c895t9wAe4rsWQg=
=63O7
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--


--===============7971092200294667197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7971092200294667197==--

