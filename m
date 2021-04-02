Return-Path: <SRS0=Uu9Z=I7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B52C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Apr 2021 13:54:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54B0B61056
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Apr 2021 13:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54B0B61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=iaUkOtRVGq3S9J3iNQGvDQjXDEJbM1Ivzgt5cPn8UQA=; b=QhP
	hFNFYsHD/onW5wBplN1VYjDEzaPqfbumn7/wDgm8saq7geSwFBaIcBcJ2z6ld6LFUZ2MMfl2+iRCe
	GLgNEcIveQHGFKKS7j5SzxtjdIdVbHbMN4PUmWz2wrGw5xCabUgqnUjaGigmstW29EQwrfmf39ZX0
	k9qViwo8ZuMp/GXieWASG7CCt05WN2VCMAI5Sf+gL1baKfc+oB/H32m2bGepErf1Owotc6/O4AYWz
	iaO7zK9Ru571fB0d6PZKb5d/qT3X4mTj5NZpIhXley5EIfKim3Uhk48QvQy5PI6n9FSuLdGRgUHPm
	ZUPa9i8l5THNMfRLUUJREq4ciWoohqA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSKE8-00D6SS-JO; Fri, 02 Apr 2021 13:52:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSKE4-00D6S1-0P
 for linux-arm-kernel@lists.infradead.org; Fri, 02 Apr 2021 13:52:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D987C61029;
 Fri,  2 Apr 2021 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617371558;
 bh=BjmiQtDOTt1N3g8KZzsk+p2yMAhjSkJoKDEVC+4tDjE=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=rPWoqUHFj1gfU7Qo6tiCxqP9WwUd2EPdJRvJ8YOJ+n2a6uR6xALcg3kbMdfdw9HvU
 3YTi5US3ksGxxsy0gpumIkxm5V/aqOwypHUQnf4z6vbJfsztxheSHDXt1ozyBqf9zW
 mGvMbj6aySqsR1xEa4i+vHeIQfLisV//QPRUjWBBfuIA2qzA/x19KLZgvfTM5qjyQ5
 xgiAG0vwRR20Fmw2Bbu0lDsukrKQI5voPoPfh7z5WeMNP6NFXucn+urW13TtIPYoOS
 zZfCAGWmHsmiKfOSKTEkhnL+kGX9wNyE/AiPkAGAuAStgXz3B8RkABS4sV6FT+p+uU
 Vnw7XBdr9fqOA==
Date: Fri, 2 Apr 2021 15:52:36 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Device Tree Changes for 5.13
Message-ID: <8a3e3271-bebe-4d27-a9e7-7b7a6311a38d.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_145240_436521_44FCE84C 
X-CRM114-Status: GOOD (  14.75  )
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
Content-Type: multipart/mixed; boundary="===============7349358835345152193=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210402135236.Q5S4Qj7aEMCMazwKnMQcj9wpmPseoCbV4AvMe6a072A@z>


--===============7349358835345152193==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V0foJ2CtgLcZAjcW"
Content-Disposition: inline


--V0foJ2CtgLcZAjcW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd, Olof,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags=
/sunxi-dt-for-5.13-1

for you to fetch changes up to d580e6f0ec3ab42e81f3825ef4438836ead88c5f:

  ARM: dts: sun8i: h3: beelink-x2: Add power button (2021-03-24 10:25:37 +0=
100)

----------------------------------------------------------------
Our usual bunch of patches to support the Allwinner SoCs, this time
adding:
  - New secondary interrupt controller binding to support the wake-up=20
  - Use the RSB bus instead of I2C for the PMIC on the H6
  - HDMI support for the BananaPi M2-Zero
  - New board: Topwise A721

----------------------------------------------------------------
Jernej Skrabec (1):
      ARM: dts: sun8i: h3: beelink-x2: Add power button

Pascal Roeleven (2):
      dt-bindings: arm: Add Topwise A721
      ARM: dts: sun4i: Add support for Topwise A721 tablet

Pieter Beers (1):
      ARM: dts: sunxi: h2-plus-bananapi-m2-zero: Add HDMI out

Samuel Holland (6):
      ARM: dts: sunxi: Use the new r_intc binding
      ARM: dts: sunxi: h3/h5: Add r_intc node
      ARM: dts: sunxi: Move wakeup-capable IRQs to r_intc
      arm64: dts: allwinner: Use the new r_intc binding
      arm64: dts: allwinner: Move wakeup-capable IRQs to r_intc
      arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection


 Documentation/devicetree/bindings/arm/sunxi.yaml           |   5 +-
 arch/arm/boot/dts/Makefile                                 |   3 +-
 arch/arm/boot/dts/sun4i-a10-topwise-a721.dts               | 242 +++++++++=
+++++-
 arch/arm/boot/dts/sun6i-a31-hummingbird.dts                |   2 +-
 arch/arm/boot/dts/sun6i-a31-m9.dts                         |   2 +-
 arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts           |   2 +-
 arch/arm/boot/dts/sun6i-a31.dtsi                           |   6 +-
 arch/arm/boot/dts/sun6i-a31s-primo81.dts                   |   2 +-
 arch/arm/boot/dts/sun6i-a31s-sina31s-core.dtsi             |   2 +-
 arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts           |   2 +-
 arch/arm/boot/dts/sun6i-a31s-yones-toptech-bs1078-v2.dts   |   2 +-
 arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi       |   2 +-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi                       |   6 +-
 arch/arm/boot/dts/sun8i-a33-olinuxino.dts                  |   2 +-
 arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts             |   2 +-
 arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts     |   4 +-
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts               |   4 +-
 arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts           |   4 +-
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts                  |   4 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                          |   5 +-
 arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts       |  25 +-
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts                  |  11 +-
 arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts               |   2 +-
 arch/arm/boot/dts/sun8i-r16-parrot.dts                     |   2 +-
 arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi       |   2 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                         |  12 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts  |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts    |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts     |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts  |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts        |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts      |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi    |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts       |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi       |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts       |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi              |   6 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts    |  40 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts     |  16 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi      |  24 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts       |   4 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi               |   8 +-
 43 files changed, 395 insertions(+), 82 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun4i-a10-topwise-a721.dts



--V0foJ2CtgLcZAjcW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYGchpAAKCRDj7w1vZxhR
xZrQAQCtCJFpKz93E8gfAbsFHzj45li7qsIqcPSm5x8pu6rzbAD7BOFZ7K9EbUwU
3zp+QTala2qklh/cbk9Hvk47sTWgMAc=
=Ui0h
-----END PGP SIGNATURE-----

--V0foJ2CtgLcZAjcW--


--===============7349358835345152193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7349358835345152193==--

