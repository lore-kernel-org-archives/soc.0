Return-Path: <mripard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63ACC433DB
	for <soc@archiver.kernel.org>; Sun, 31 Jan 2021 18:50:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2709A64E4F; Sun, 31 Jan 2021 18:50:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FC8664E4B;
	Sun, 31 Jan 2021 18:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612119042;
	bh=CJ9EnBtr9oB0JIupcCdgyRtUBE1/GU+c/LlfH/9rU58=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=ilPzho9WxrvampHiscmc6jD2O3SiT2R3jeY/2HtwKxEGa0XmlADeEUB77bvhvQs3h
	 /40GcXLMTh+oxYQKqUgX/i8aasjzRt8txtutxaDR+XmlIg0I91AImKFqzKi13oV9WU
	 E9blCXQSPeAej40vU1bV86lsqW4SHE20lc421Q/LvUd4kuBltFVdLDNkREQivamOKy
	 pstMDDZoHZvF4P6Z5+2f9FEPTssgpkrjYPStj1Y0Dj9KpxJGaivlyzYmj0GLXl31sY
	 DCMDk9lYTcPBsqsC8/pbyNWfKD6SbYnWdJuJR5wtl7oOOg7HsjvifYjFn1ZFoYnTQu
	 iAH+d9Ds+js4w==
Date: Sun, 31 Jan 2021 19:50:39 +0100
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Device Tree Changes for 5.12
Message-ID: <48511540-fdd6-4fbe-8037-ec9fa8436147.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd, Olof,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-dt-for-5.12

for you to fetch changes up to 2977fcb7a974e64bdfe43d1114869afaec59d431:

  ARM: dts: sunxi: Rename nmi_intc to r_intc (2021-01-31 19:49:20 +0100)

----------------------------------------------------------------
Our usual bunch of patches to support the Allwinner SoCs, this time
adding:
  - DT fixes spotted through the schemas
  - Mali Support for the A10s/A13/GR8/R8
  - MMC improvements for the A64 and H6
  - New board: SL631 Action Camera, PineTab Early Adopter

----------------------------------------------------------------
Andre Przywara (8):
      arm64: dts: allwinner: A64: properly connect USB PHY to port 0
      arm64: dts: allwinner: H6: properly connect USB PHY to port 0
      arm64: dts: allwinner: Pine64-LTS: Add status LED
      arm64: dts: allwinner: Drop non-removable from SoPine/LTS SD card
      arm64: dts: allwinner: H6: Allow up to 150 MHz MMC bus frequency
      arm64: dts: allwinner: A64: Limit MMC2 bus frequency to 150 MHz
      arm64: dts: allwinner: Pine64-LTS/SoPine: Enable HS200 eMMC mode
      arm64: dts: allwinner: Pine H64: Enable HS200 eMMC mode

Dylan Van Assche (1):
      arm64: allwinner: dts: pinephone: add 'pine64, pinephone' to the compatible list

Icenowy Zheng (3):
      dt-bindings: arm: sunxi: add PineTab Early Adopter edition
      arm64: allwinner: dts: a64: add DT for Early Adopter's PineTab
      dt-bindings: arm: sunxi: document orig PineTab DT as sample

Jernej Skrabec (6):
      dt-bindings: media: Add Allwinner R40 deinterlace compatible
      ARM: dts: sun8i: r40: Add deinterlace node
      arm64: dts: allwinner: h5: Add deinterlace node
      arm64: dts: allwinner: h6: PineH64 model B: Add bluetooth
      ARM: dts: sunxi: bananapi-m2-plus: Increase BT UART speed
      ARM: dts: sun8i: h2-plus: bananapi-m2-zero: Increase BT UART speed

Maxime Ripard (16):
      dt-bindings: sunxi: Fix the pinecube compatible
      dt-bindings: iio: adc: Add AXP803 compatible
      dt-bindings: rtc: sun6i-a31-rtc: Loosen the requirements on the clocks
      ARM: dts: sunxi: Fix the LED node names
      ARM: dts: sunxi: Add missing backlight supply
      ARM: dts: sunxi: Fix CPU thermal zone node name
      ARM: dts: sun6i: primo81: Remove useless io-channel-cells
      ARM: dts: sun8i: nanopi-r1: Fix GPIO regulator state array
      ARM: dts: sun8i-s3: impetus: Fix the USB PHY ID detect GPIO properties
      ARM: dts: sun8i-s3: pinecube: Fix CSI DTC warnings
      ARM: dts: sun8i-a83t: Remove empty CSI port
      ARM: dts: sun8i-a33: sina33: Add missing panel power supply
      arm64: dts: allwinner: h6: Use - instead of @ for DT OPP entries
      arm64: dts: allwinner: pinephone: Remove useless light sensor supplies
      arm64: dts: allwinner: pinetab: Fix the panel compatible
      arm64: dts: allwinner: pine-h64: Fix typos in BT GPIOs

Michael Klein (3):
      ARM: dts: sun8i-h2-plus-bananapi-m2-zero: add regulator nodes vcc-dram and vcc1v2
      ARM: dts: sun6i-a31s-sinovoip-bpi-m2: add gpio-line-names
      ARM: dts: sun8i-h2-plus-bananapi-m2-zero: add poweroff node

Paul Kocialkowski (6):
      dt-bindings: irq: sun7i-nmi: Add binding documentation for the V3s NMI
      ARM: dts: sun8i-v3s: Add the V3s NMI IRQ controller
      ARM: dts: sun8i: Cleanup the Pinecube AXP209 node
      dt-bindings: arm: sunxi: Add SL631 with IMX179 bindings
      ARM: dts: sun8i-v3: Add support for the SL631 Action Camera with IMX179
      ARM: dts: sun8i-v3s: Add CSI0 MCLK pin definition

Samuel Holland (3):
      arm64: dts: allwinner: pinephone: Support volume key wakeup
      arm64: dts: allwinner: h6: Add RSB controller node
      ARM: dts: sunxi: Rename nmi_intc to r_intc

Sergio Sota (1):
      ARM: dts: sun5i: add A10s/A13 mali gpu support fallback


 Documentation/devicetree/bindings/arm/sunxi.yaml                                       |  19 +++++++++--
 Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml                     |  12 ++++---
 Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml |   3 ++-
 Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml            |   3 ++-
 Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml                     |   1 +-
 arch/arm/boot/dts/Makefile                                                             |   1 +-
 arch/arm/boot/dts/sun4i-a10-a1000.dts                                                  |   4 +-
 arch/arm/boot/dts/sun4i-a10-cubieboard.dts                                             |   4 +-
 arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts                                       |   1 +-
 arch/arm/boot/dts/sun4i-a10-inet1.dts                                                  |   1 +-
 arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts                                             |   2 +-
 arch/arm/boot/dts/sun4i-a10-marsboard.dts                                              |   8 ++---
 arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts                                         |   2 +-
 arch/arm/boot/dts/sun4i-a10-pcduino.dts                                                |   4 +-
 arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts                                       |   1 +-
 arch/arm/boot/dts/sun5i-a10s-auxtek-t003.dts                                           |   2 +-
 arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts                                           |   2 +-
 arch/arm/boot/dts/sun5i-a10s-mk802.dts                                                 |   2 +-
 arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts                                       |   2 +-
 arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts                                          |   2 +-
 arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts                                               |   2 +-
 arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts                                 |   1 +-
 arch/arm/boot/dts/sun5i-a13-licheepi-one.dts                                           |   6 +--
 arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts                                        |   2 +-
 arch/arm/boot/dts/sun5i-a13-olinuxino.dts                                              |   2 +-
 arch/arm/boot/dts/sun5i-a13-pocketbook-touch-lux-3.dts                                 |   3 +-
 arch/arm/boot/dts/sun5i-a13.dtsi                                                       |   2 +-
 arch/arm/boot/dts/sun5i-gr8-evb.dts                                                    |   2 +-
 arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi                                   |   1 +-
 arch/arm/boot/dts/sun5i.dtsi                                                           |  12 +++++++-
 arch/arm/boot/dts/sun6i-a31-hummingbird.dts                                            |   2 +-
 arch/arm/boot/dts/sun6i-a31-i7.dts                                                     |   2 +-
 arch/arm/boot/dts/sun6i-a31-m9.dts                                                     |   4 +-
 arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts                                       |   4 +-
 arch/arm/boot/dts/sun6i-a31.dtsi                                                       |   4 +-
 arch/arm/boot/dts/sun6i-a31s-primo81.dts                                               |   3 +--
 arch/arm/boot/dts/sun6i-a31s-sina31s-core.dtsi                                         |   2 +-
 arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts                                       |  79 +++++++++++++++++++++++++++++++++++++++++++---
 arch/arm/boot/dts/sun6i-a31s-yones-toptech-bs1078-v2.dts                               |   2 +-
 arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi                                   |   2 +-
 arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts                                       |   4 +-
 arch/arm/boot/dts/sun7i-a20-bananapi.dts                                               |   2 +-
 arch/arm/boot/dts/sun7i-a20-bananapro.dts                                              |   4 +-
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts                                            |   4 +-
 arch/arm/boot/dts/sun7i-a20-cubietruck.dts                                             |   8 ++---
 arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts                                              |   4 +-
 arch/arm/boot/dts/sun7i-a20-itead-ibox.dts                                             |   4 +-
 arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts                                              |   2 +-
 arch/arm/boot/dts/sun7i-a20-m3.dts                                                     |   2 +-
 arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts                                         |   2 +-
 arch/arm/boot/dts/sun7i-a20-olimex-som204-evb.dts                                      |   6 +--
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts                                         |   2 +-
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts                                        |   2 +-
 arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts                                        |   2 +-
 arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts                                          |   4 +-
 arch/arm/boot/dts/sun7i-a20-orangepi.dts                                               |   2 +-
 arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts                                          |   6 +--
 arch/arm/boot/dts/sun7i-a20-pcduino3.dts                                               |   4 +-
 arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts                                         |   1 +-
 arch/arm/boot/dts/sun7i-a20.dtsi                                                       |   2 +-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi                                                   |   2 +-
 arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts                                         |   2 +-
 arch/arm/boot/dts/sun8i-a33-olinuxino.dts                                              |   4 +-
 arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts                                         |   3 +-
 arch/arm/boot/dts/sun8i-a33.dtsi                                                       |   2 +-
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts                                           |   4 +-
 arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts                                       |   8 ++---
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts                                              |   2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                                                      |   3 +--
 arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts                                   |  30 +++++++++++++++++-
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts                                              |   4 +-
 arch/arm/boot/dts/sun8i-h3-nanopi-duo2.dts                                             |   4 +-
 arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts                                          |   4 +-
 arch/arm/boot/dts/sun8i-h3-nanopi-r1.dts                                               |   4 +-
 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi                                                 |   4 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-zero-plus2.dts                                     |   4 +-
 arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts                                           |   8 ++---
 arch/arm/boot/dts/sun8i-r16-parrot.dts                                                 |  10 +++---
 arch/arm/boot/dts/sun8i-r40.dtsi                                                       |  19 +++++++++++-
 arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi                                   |   3 +-
 arch/arm/boot/dts/sun8i-s3-elimo-impetus.dtsi                                          |   2 +-
 arch/arm/boot/dts/sun8i-s3-pinecube.dts                                                |  11 +-----
 arch/arm/boot/dts/sun8i-v3-sl631-imx179.dts                                            |  12 +++++++-
 arch/arm/boot/dts/sun8i-v3-sl631.dtsi                                                  | 138 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/sun8i-v3s.dtsi                                                       |  17 +++++++++-
 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts                                            |   4 +-
 arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi                                          |   1 +-
 arch/arm64/boot/dts/allwinner/Makefile                                                 |   1 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts                              |   6 +--
 arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts                                |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dts                                |  11 ++++++-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts                                  |   5 +---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dts                             |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts                             |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.2.dts                             |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi                                |  18 +++++++---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab-early-adopter.dts                     |  26 +++++++++++++++-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts                                   |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts                          |   1 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi                                   |   1 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts                                   |   4 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi                                          |   6 ++-
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts                           |   4 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts                                |   4 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts                               |   4 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts                             |   4 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts                         |   4 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts                        |   4 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi                                           |  13 ++++++++-
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts                                |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-cpu-opp.dtsi                                   |  20 ++++++------
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts                                 |   4 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi                                  |   4 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dts                           |  15 +++++++++-
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts                                   |   7 ++--
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi                                           |  26 +++++++++++++++-
 116 files changed, 607 insertions(+), 186 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun8i-v3-sl631-imx179.dts
 create mode 100644 arch/arm/boot/dts/sun8i-v3-sl631.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab-early-adopter.dts



--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYBb7/wAKCRDj7w1vZxhR
xdGSAQD4lDzKpbXxZUz4nCF61Bv79zOSvqZkNSwhLVOsQV9a0wD/dVFipg58T3GZ
AqzQ80pLovw/SXQBctzSzmt1IynmrAk=
=sOAH
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
