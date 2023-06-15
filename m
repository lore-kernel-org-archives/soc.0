Return-Path: <SRS0=swYH=CD=collabora.com=sebastian.reichel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E407EB64D9
	for <soc@archiver.kernel.org>; Thu, 15 Jun 2023 17:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21F7AC433CA; Thu, 15 Jun 2023 17:49:02 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C886C433C0;
	Thu, 15 Jun 2023 17:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8C886C433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from mercury (dyndsl-091-248-208-152.ewe-ip-backbone.de [91.248.208.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 88F9A6606F6E;
	Thu, 15 Jun 2023 18:48:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686851338;
	bh=SLeuROCJRaxby8+GxtmF6Jitvh7OaProeRiGkN5+RuE=;
	h=Date:From:To:Cc:Subject:From;
	b=oBlh03bLbAU5mp+avvQEfFt1QGqbs9OeDoFLIeqwCoC392BuGNaz8uO1eSTZReaUQ
	 qwG4OxRv6eCXeL2Lb6fmDOffgYAA/+ugbTWVfwJQq1rjdJVTxQ/tmcR77bkYBNl3Rp
	 F1UmUaX17P78/A8gNB5cfxW3GHNECa2JTlTURCSvcdNVIceO4f5CS2yqwyOACdjTIc
	 FZv/I+jLaD/0cwBi++/l+Cu924O7PfgZWJIRrzjwD164QbrmoZEVJTbVqlIAGzZXxe
	 NDo3kAjZ1ZWK2QrQUx3A1ZFNxJAD0+agwuGOeVTy4UQKJOoCPku6upY6XmsnzhuXNI
	 tsqiE/sdGEHeA==
Received: by mercury (Postfix, from userid 1000)
	id DFF4F1060DE4; Thu, 15 Jun 2023 19:48:56 +0200 (CEST)
Date: Thu, 15 Jun 2023 19:48:56 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@lists.collabora.com
Subject: [GIT PULL] ARM32 RK808 defconfig fix
Message-ID: <20230615174856.6z7ft3myebjlulen@mercury.elektranox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k4636gj4rt2y56i5"
Content-Disposition: inline


--k4636gj4rt2y56i5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Since I did not get any feedback for the defconfig patches from [0] and they
are fixing a KernelCI regression (Rockchip Chromebooks no longer boot because
of missing PMIC driver), I prepared a pull request with the defconfig change
instead as suggested by Tony [1]. It consists of the rk806 immutable branch
prepared by Lee Jones [2] and the multi_v7_defconfig defconfig patch. I will
send a second pull request for the arm64 defconfig.

[0] https://lore.kernel.org/all/20230518040541.299189-1-sebastian.reichel@collabora.com/
[1] https://lore.kernel.org/linux-omap/20230604060436.GT14287@atomide.com/
[1] https://lore.kernel.org/all/20230515152425.GV10825@google.com/

Thanks,

-- Sebastian

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git/ rk806-defconfig-fix-arm32

for you to fetch changes up to 6053cda09ba5398ef854b2bb3a9ffcde19854b61:

  ARM: multi_v7_defconfig: update MFD_RK808 name (2023-06-14 19:28:35 +0200)

----------------------------------------------------------------
Sebastian Reichel (10):
      clk: RK808: Reduce 'struct rk808' usage
      mfd: rk808: Convert to device managed resources
      mfd: rk808: Use dev_err_probe
      mfd: rk808: Replace 'struct i2c_client' with 'struct device'
      mfd: rk808: Split into core and i2c
      mfd: rk8xx-i2c: Use device_get_match_data
      dt-bindings: mfd: Add rk806 binding
      mfd: rk8xx: Add rk806 support
      pinctrl: rk805: Add rk806 pinctrl support
      ARM: multi_v7_defconfig: update MFD_RK808 name

 .../devicetree/bindings/mfd/rockchip,rk806.yaml    | 406 ++++++++++++++++++++
 arch/arm/configs/multi_v7_defconfig                |   2 +-
 drivers/clk/Kconfig                                |   2 +-
 drivers/clk/clk-rk808.c                            |  34 +-
 drivers/input/misc/Kconfig                         |   2 +-
 drivers/mfd/Kconfig                                |  21 +-
 drivers/mfd/Makefile                               |   4 +-
 drivers/mfd/{rk808.c => rk8xx-core.c}              | 352 ++++++-----------
 drivers/mfd/rk8xx-i2c.c                            | 185 +++++++++
 drivers/mfd/rk8xx-spi.c                            | 124 ++++++
 drivers/pinctrl/Kconfig                            |   2 +-
 drivers/pinctrl/pinctrl-rk805.c                    | 189 ++++++++--
 drivers/power/supply/Kconfig                       |   2 +-
 drivers/regulator/Kconfig                          |   2 +-
 drivers/rtc/Kconfig                                |   2 +-
 include/linux/mfd/rk808.h                          | 417 ++++++++++++++++++++-
 sound/soc/codecs/Kconfig                           |   2 +-
 17 files changed, 1465 insertions(+), 283 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
 rename drivers/mfd/{rk808.c => rk8xx-core.c} (71%)
 create mode 100644 drivers/mfd/rk8xx-i2c.c
 create mode 100644 drivers/mfd/rk8xx-spi.c

--k4636gj4rt2y56i5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmSLTwMACgkQ2O7X88g7
+ppu+BAAqSI3BwXNQ0j3p0ktFB1veZxbbiZg4cG2pXRRBb4yMMMQHknb8NU3PF36
DOKcBxvRLRbyXyZYF9VFAd5bjOimMwdG3gIFOFtNsR/O7Lps+onFOO7DCwnVGpxX
AV8PMjcbfhVZXieDSeaoZYVFZRb/Uf8BP2+jzRUMtSkZuIvL18P8qZjAIW7kRUnA
nigaj1z5sowmE83Id6HF0OfCSp0M623kleRZIwwOUIoA0vliD7bJLjlx9PLGRjiW
gDsKSmH7fu9lMhBpjNdS0QD7MD4a3g1UJ+9NqW1nuv9RaBmPeIrMURadmanKyjcw
dT80M32rWxH5KUkbiQ9u0qMGz8xntJRDKp9pNgQ0vQM/z/maNMi3v9v4bjcO/0z3
iWN+9o0eqT1hFrbvkItO4a2QRWC/p/7/hcaUpTmVUVAp6U1564uGuD2CGjhrJCss
p4qSEO7LiMggLLscgd0zYhRc6lvjlrknpFfn1MPOripv4se5pKXRfbCNxXNH9gmR
FynF3W/HFrLLoTQ+anjpBmXRE8bIMSfcqvQ75HyPh4vJ7fHkjdOQkPGQEO0mt+bn
f0IlwyxCi7JQhFTUJbjtrmctRWEQS0UcjDBW+ihvs+4UNWbjjOxajOfwOg7qEeqt
4n5PXKtHqsB79ZDuMyPX5tNEerzHoZ9VD60m6LNK3oMn8HWYpKg=
=rHv0
-----END PGP SIGNATURE-----

--k4636gj4rt2y56i5--
