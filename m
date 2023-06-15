Return-Path: <SRS0=swYH=CD=collabora.com=sebastian.reichel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9EBEB64D9
	for <soc@archiver.kernel.org>; Thu, 15 Jun 2023 17:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59DE8C433CA; Thu, 15 Jun 2023 17:49:45 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 460E8C433C8;
	Thu, 15 Jun 2023 17:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 460E8C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from mercury (dyndsl-091-248-208-152.ewe-ip-backbone.de [91.248.208.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 660DB6606F6E;
	Thu, 15 Jun 2023 18:49:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686851382;
	bh=LBXhXrA7LDalNxXhdPzqibZYlYyjem8MKx+tIXAQuL8=;
	h=Date:From:To:Cc:Subject:From;
	b=TB/t4dM0Zka/BiawlsHVvTaPgBKLc+eElFaw1eZPav/uFJkYob3TpckXXFTG8Zt1i
	 aLEUIOU6BZwzkDYDAVqB7+OftWG80vc8tXBMMwUq7vZMIyw7EyNEoukV8jD7T8C8R7
	 j0Vi8dR/0hJSmmbYNM3lLFE/KQEm25Y4OE8jzk9c3cXZKdJtoKOsggUHLJ3+ykl1lN
	 TEOGJCxR37NY++GzgKVbr0AixwzzXBJDK3E71eg4mbz9AVG9a0VcDVEpfkYu/tcUmM
	 M+VERZVxyReAeo6AlLTbF5uz3euV9dxVwdtlUCANHInr7bGOBYfMs9CSpcXI0dRq+E
	 wysqABrIwC3BQ==
Received: by mercury (Postfix, from userid 1000)
	id A955C1060DE4; Thu, 15 Jun 2023 19:49:40 +0200 (CEST)
Date: Thu, 15 Jun 2023 19:49:40 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@lists.collabora.com
Subject: [GIT PULL] ARM64 RK808 defconfig fix
Message-ID: <20230615174940.jmzuv5kb6o7htkwo@mercury.elektranox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fwbqteb5ytrdisia"
Content-Disposition: inline


--fwbqteb5ytrdisia
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Since I did not get any feedback for the defconfig patches from [0] and they
are fixing a KernelCI regression (Rockchip Chromebooks no longer boot because
of missing PMIC driver), I prepared a pull request with the defconfig change
instead as suggested by Tony [1]. It consists of the rk806 immutable branch
prepared by Lee Jones [2] and the arm64 defconfig patch. I will send a second
pull request for the arm32 multi_v7 defconfig. This is targeting linux-next.

[0] https://lore.kernel.org/all/20230518040541.299189-1-sebastian.reichel@collabora.com/
[1] https://lore.kernel.org/linux-omap/20230604060436.GT14287@atomide.com/
[1] https://lore.kernel.org/all/20230515152425.GV10825@google.com/

Thanks,

-- Sebastian

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git/ rk806-defconfig-fix-arm64

for you to fetch changes up to 787614e7c48437ea5764f9cff824b45357c912ed:

  arm64: defconfig: update RK8XX MFD config (2023-06-14 19:33:04 +0200)

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
      arm64: defconfig: update RK8XX MFD config

 .../devicetree/bindings/mfd/rockchip,rk806.yaml    | 406 ++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   3 +-
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
 17 files changed, 1466 insertions(+), 283 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
 rename drivers/mfd/{rk808.c => rk8xx-core.c} (71%)
 create mode 100644 drivers/mfd/rk8xx-i2c.c
 create mode 100644 drivers/mfd/rk8xx-spi.c

--fwbqteb5ytrdisia
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmSLTzQACgkQ2O7X88g7
+po17hAAjEdzHpgxW3TaKd6DatJHgyP3LUKSRZgDTa56rl3NceGpziU6eDK15xC1
q0FlqXgBcSYOG/H1UR9x0r/Bvpz5BhQ84sjbPRGrFW5rQvKcVqqB5Wg3KXtx+eRH
fDP5jCKZpueeU3+wK0/aZB8Wl1Re9NRgmJhz/tdFtaHXAhVFI7rQOwigSjqdmYQR
EZkQNT8p3GBTOEw3CPxm9RSQMv10h8dqQm2m7u3Vp7zpJo6Tq5xZvsufBYIF3c6+
94TlguXDMY2ZUMEshZQx8aTYRXT+QMt2l9OWQEROY+THejwjiWfhTAjziAl5sAZH
iHSIPO3uLlBwmUk66BqAzUJDsOhyUc+Ay91Di+BmbslvOBYJOzReMZVOy7kaed0e
HQgY+z084AdAC54e982kmFkOPVfmo6SrrkkU7zTdEIOZwfn1QrFWRp7JmDpT532j
orjO3e/q091RIolmaqXu+CtdS2n1eC2UvMCugB4L50wkS1YbCe9/YRMMEZLwCsqp
RCdXbu23SK4Oyb0mOWaN9nO7aiVP/wffHZd5b+qsTp4Yov1Mb2JkKUoDGawFF/SA
sm2xfIlQba0VnstEaxQCfWNZOZMVq/VArpvxUnXiXyRA+BujwEKCMLqr6Be+kjMC
w+VT6Kodp5Sq8DYRXpU2bl0i+H20w+0sLbJCr6eIp/9o2yukM/o=
=+K2u
-----END PGP SIGNATURE-----

--fwbqteb5ytrdisia--
