Return-Path: <SRS0=UpmX=PG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BE7C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Oct 2021 08:02:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E0BC6103D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Oct 2021 08:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E0BC6103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=KcgKzeGzsCvoOzhhfbqikQJBbHecqSmfbv58F0eETS8=; b=wXy
	GJfO3jc41U7AmJ2OdJIsIw90HP0iuhdhAkGqSNSHG7hel/TI6ZsPx/HvtB+gYLuF8IZsT0GMRsWmG
	IZcaOKtMFPa3R68xLUfWx0ft4yUvtbNlWbQ+1Chflg8UdKoVBIJq7kunbhCTkZQpvZysAlZGSMQyL
	k0KccoYJCkg7HClc/vkryM1I02t04Zej+L96hrJS1sJEH73h49/FNpfQLWe0E2YMnI7alR0Ihqr4l
	ySGNYxlJQO/eQI9lWeNsj/wdTz2twRA1Qxp5UXLuEkSaHyobqjMJf+1+yw1MoGYEeYJLmbiWBDhhg
	VXQkQN8eAJ2UoxeLUiSWIqQAPTWn2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcNZn-00EXsn-Bw; Mon, 18 Oct 2021 08:00:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcNZj-00EXs3-H2
 for linux-arm-kernel@lists.infradead.org; Mon, 18 Oct 2021 08:00:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 522936103B;
 Mon, 18 Oct 2021 08:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634544050;
 bh=Fvjzc4T5TjBhoyKMz3427aDPyksy8MLYHcJyJ514b2M=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=fWpYpup4rAnWuXvn6EGywhuskVBXJ20+QoEzRTTeEcEj6NVVzFnwmbIPMjHsQrQR5
 2gXEOt4IHgXFHpi56ESjuuXYjXZz8eCCad9QRP/X3XwMQAqelG7Tq45taRnr1A/+jX
 Q2p4NbbvJ9z0BXTzhHZBzc/TVjQLivnVvuT5BIStueFlIDJOhLAYu7nTC+1GmF2Cn/
 I2FSJMQqOyg8nQzhI4DZ9gKU4VJOjvFA3yTE4FGTjggzk1G88EZsnavfeeTHI4EIl6
 O1JqU3xViO8q0yZ5qhtsIpiJ45HoxksS8WSZ7kxAXa/hdQah9cuTkoSYf25ge/cMDW
 6M5WVQd5LMMFw==
Date: Mon, 18 Oct 2021 10:00:48 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Device Tree Changes for 5.16
Message-ID: <5cad5ac6-187d-4d36-9437-5821c6e8242d.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_010051_659953_C1D1B01A 
X-CRM114-Status: GOOD (  15.34  )
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
Content-Type: multipart/mixed; boundary="===============3395563497965898734=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211018080048.IeiJsmnSe6jVyBuw5dG_IohuF4r8upbYxDnjW7zxmSk@z>


--===============3395563497965898734==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FS2jB7Fm9+cP35Vs"
Content-Disposition: inline


--FS2jB7Fm9+cP35Vs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-dt-for-5.16-1

for you to fetch changes up to d7b101a35ad0a72868da227cdee83bcac0303b80:

  dt-bindings: interconnect: sunxi: Add R40 MBUS compatible (2021-10-15 10:07:16 +0200)

----------------------------------------------------------------
Our usual round of DT patches for the 5.16 merge window, with:
  - DT schema fixes
  - I2S support for the R40
  - HDMI support for the pinetab
  - devfreq support for the A64 GPU

----------------------------------------------------------------
Chukun Pan (1):
      arm64: dts: allwinner: NanoPi R1S H5: Add generic compatible string for I2C EEPROM

Dang Huynh (1):
      arm64: dts: allwinner: pinetab: Add HDMI support

Jernej Skrabec (3):
      dt-bindings: sound: sun4i-i2s: add Allwinner R40 I2S compatible
      ARM: dts: sun8i: r40: Add I2S nodes
      arm64: dts: allwinner: a64: Add GPU opp table

Maxime Ripard (16):
      dt-bindings: sunxi: Add CPU Configuration Controller Binding
      dt-bindings: sunxi: Add Allwinner A80 PRCM Binding
      ARM: dts: sunxi: Rename power-supply names
      ARM: dts: sunxi: Rename gpio pinctrl names
      ARM: dts: sunxi: Fix OPP arrays
      ARM: dts: sunxi: Fix OPPs node name
      ARM: dts: sunxi: Fix the SPI NOR node names
      ARM: dts: tbs711: Fix touchscreen compatible
      ARM: dts: cubieboard4: Remove the dumb-vga-dac compatible
      arm64: dts: allwinner: h5: Fix GPU thermal zone node name
      arm64: dts: allwinner: h6: Fix de3 parent clocks ordering
      arm64: dts: allwinner: a100: Fix thermal zone node name
      arm64: dts: allwinner: pinetab: Change regulator node name to avoid warning
      arm64: dts: allwinner: teres-i: Add missing reg
      arm64: dts: allwinner: teres-i: Remove wakekup-source from the PMIC
      dt-bindings: interconnect: sunxi: Add R40 MBUS compatible


 Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml      |  1 +
 Documentation/devicetree/bindings/arm/sunxi/allwinner,sun6i-a31-cpuconfig.yaml | 38 ++++++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/arm/sunxi/allwinner,sun9i-a80-prcm.yaml      | 33 +++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml           |  3 +++
 arch/arm/boot/dts/axp209.dtsi                                                  |  6 +++---
 arch/arm/boot/dts/axp22x.dtsi                                                  |  6 +++---
 arch/arm/boot/dts/axp81x.dtsi                                                  | 10 +++++-----
 arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts                                 | 11 +++++------
 arch/arm/boot/dts/sun4i-a10.dtsi                                               | 11 +++++------
 arch/arm/boot/dts/sun5i-a13.dtsi                                               | 15 +++++++--------
 arch/arm/boot/dts/sun6i-a31.dtsi                                               | 44 ++++++++++++++++++++------------------------
 arch/arm/boot/dts/sun7i-a20-bananapi.dts                                       | 17 ++++++++---------
 arch/arm/boot/dts/sun7i-a20.dtsi                                               | 34 ++++++++++++++++------------------
 arch/arm/boot/dts/sun8i-a33.dtsi                                               |  4 ++--
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts                                      |  2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                                              |  4 ++--
 arch/arm/boot/dts/sun8i-h3.dtsi                                                |  4 ++--
 arch/arm/boot/dts/sun8i-r40.dtsi                                               | 39 +++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/sun8i-v3-sl631.dtsi                                          |  2 +-
 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts                                    |  2 +-
 arch/arm/boot/dts/sunxi-libretech-all-h3-it.dtsi                               |  2 +-
 arch/arm64/boot/dts/allwinner/axp803.dtsi                                      | 10 +++++-----
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi                                 |  6 +++---
 arch/arm64/boot/dts/allwinner/sun50i-a64-cpu-opp.dtsi                          |  2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts                      |  2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts                           | 28 +++++++++++++++++++++++++++-
 arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts                           |  3 ++-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi                                  | 17 +++++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h5-cpu-opp.dtsi                           |  2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts                      |  9 ++++++++-
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi                                   |  2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-cpu-opp.dtsi                           |  2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi                                   |  8 ++++----
 33 files changed, 267 insertions(+), 112 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/sunxi/allwinner,sun6i-a31-cpuconfig.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/sunxi/allwinner,sun9i-a80-prcm.yaml



--FS2jB7Fm9+cP35Vs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYW0psAAKCRDj7w1vZxhR
xaU1AQDAzfPdbm/SX8NwtbhE68n4NsbFqfq6TykoDz8YdznakQEAzfHO5yBfWMpm
t2rSj2B32ZdapEiJLaBfF8tdm+lPoQo=
=s1DX
-----END PGP SIGNATURE-----

--FS2jB7Fm9+cP35Vs--


--===============3395563497965898734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3395563497965898734==--

