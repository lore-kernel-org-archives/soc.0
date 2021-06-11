Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE20C48BD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 14:58:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 707EC60200
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 14:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 707EC60200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=PtjzovHbQrW65JVs8nTdaMfhiQHiIUgP8GlPCGTfwps=; b=KyK
	wRkXpyVgvWngW4RzFqQnrdctm23gB9uW3kAoUtkjHoWdcjTJ5UyZ5gwon5PXkQQM+G3ckUVP6unW1
	sfW0u2hj+smVUVSOl35OSYfQC/QBWdp/1ObqaCaZCNwIsiShriB664V1IiuKsteYP7+CKqcWPNJJ5
	ydGvjAb3kqgqfUcpg+K9aw7ZXYZRP1g0JxNOwH/IPqh2g0KubRNNMYlUR+4rUv2QSnznwt3+xzx3F
	n4ctoN6fW7XZsEiy1kPaziUXsFFbUzUpVu/zTPUqEUbUOiZbLdZb2p8eLuh8Y5WZpmB6vufSnzSEj
	jtgPcKm+yFBV9Jc8che/yJDqM036Y9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lriaI-005jRH-OY; Fri, 11 Jun 2021 14:56:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lriaF-005jQc-4e
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 14:56:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F64B60200;
 Fri, 11 Jun 2021 14:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623423390;
 bh=v49eswYzfxOiuLNJPex6gAUkVcyyd2R58vfPRyLPLgw=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=SXiX4EzoEu2tnFdWUn6dU6wz/FndQ9NUUxRYRfBtp+mcM3tsWmTHeqDfhScpoZszc
 iIY5PwQ6qvIMKKn8ZjNIHY6VliwsOki1toOs0nZeYiZO5RtH/qYOMuHgMbeZPjuT2C
 pghRxc9XquYWoyIvby8NMdjr1v1XdBqzjFGtU9+EzTOWTz9azqoHgBs4PIvLWo6W/M
 jJLXKNEqePXUQLcmNAXpQhaTFPsWKBtkYtrFVAJzFKwN88D3gFdBsOA1thuUA0hWjq
 cwQWzjzuR/Ta/gka2CgIsmtyQk38qs4ZnDkpnQw4dNJJhY/NVvWSNM/UFn6WofagFa
 pxk3wfz0qs3ng==
Date: Fri, 11 Jun 2021 16:56:28 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Device Tree Changes for 5.14
Message-ID: <96cc77ec-139d-4685-8a66-a60964cf39fd.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_075631_241226_61DF328C 
X-CRM114-Status: GOOD (  16.46  )
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
Content-Type: multipart/mixed; boundary="===============6917294972393980159=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210611145628.IkYXAgLd3oPtWgRYk3uy-AWfVsKQzjF902srg4MYUZ0@z>


--===============6917294972393980159==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nLrvI0CrUDil1gM+"
Content-Disposition: inline


--nLrvI0CrUDil1gM+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-dt-for-5.14-1

for you to fetch changes up to d42b3e045a34ec7c88c818ee057f7c2ecc8f9fdd:

  ARM: dts: sun8i: v3s: enable emac for zero Dock (2021-05-31 11:43:03 +0200)

----------------------------------------------------------------
Our usual bunch of patches to improve the Allwinner SoCs support,
mainly:
  - I2S Support for the V3
  - Audio Codec Support for the V3s
  - DMA support for the V3s
  - PWM support for the V3s
  - Support for Bluetooth Audio on the pinephone
  - Add A10-like timers to the A64 and R40
  - New boards: Forlinx OKA40i-C, Forlinx OKA40i-C, NanoPi R1S H5

----------------------------------------------------------------
Andreas Rehn (1):
      ARM: dts: sun8i: v3s: enable emac for zero Dock

Arnaud Ferraris (1):
      arm64: dts: allwinner: pinephone: Set audio card name

Chukun Pan (2):
      dt-bindings: arm: Add NanoPi R1S H5
      arm64: dts: allwinner: h5: Add NanoPi R1S H5 support

Ivan Uvarov (5):
      ARM: dts: sun8i: r40: add /omit-if-no-ref/ to pinmux nodes for UARTs 0&3
      ARM: dts: sun8i: r40: add pinmux settings for MMC3 and UARTs 2, 4, 5&7
      dt-bindings: add compatible vendor prefix for Forlinx
      dt-bindings: arm: add compatible for Forlinx OKA40i-C and FETA40i-C
      ARM: dts: sun8i: r40: add devicetree for Forlinx FETA40i-C & OKA40i-C

Jernej Skrabec (1):
      ARM: dts: sun8i: r40: Add timer node

Samuel Holland (10):
      dt-bindings: timer: Simplify conditional expressions
      dt-bindings: timer: Add compatibles for sun50i timers
      arm64: dts: allwinner: a64: Sort watchdog node
      arm64: dts: allwinner: Add sun4i MMIO timer nodes
      ASoC: dt-bindings: sun8i-codec: Increase #sound-dai-cells
      ARM: dts: sun8i-a33: Allow using multiple codec DAIs
      arm64: dts: allwinner: a64: Allow using multiple codec DAIs
      arm64: dts: allwinner: a64: Add pinmux nodes for AIF2/AIF3
      arm64: dts: allwinner: a64: Allow multiple DAI links
      arm64: dts: allwinner: pinephone: Add support for Bluetooth audio

Tobias Schramm (9):
      dt-bindings: pwm: allwinner: add v3s pwm compatible
      ARM: dts: sun8i: v3s: add pwm controller to v3s dts
      ARM: dts: sun8i: v3s: add DMA controller to v3s dts
      ARM: dts: sun8i: v3s: add DMA properties to peripherals supporting DMA
      ARM: dts: sun8i: v3s: add analog codec and frontend to v3s dts
      ASoC: dt-bindings: sun8i-a23-codec-analog: add compatible for Allwinner V3
      ARM: dts: sun8i: V3: add codec analog frontend to V3 dts
      dt-bindings: sound: sun4i-i2s: add Allwinner V3 I2S compatible
      ARM: dts: sun8i: V3: add I2S interface to V3 dts


 Documentation/devicetree/bindings/arm/sunxi.yaml                              |  11 ++++-
 Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml            |   3 +-
 Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml          |   3 +-
 Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml |   9 ++--
 Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml        |   8 ++-
 Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml        |  42 +++++++----------
 Documentation/devicetree/bindings/vendor-prefixes.yaml                        |   2 +-
 arch/arm/boot/dts/Makefile                                                    |   1 +-
 arch/arm/boot/dts/sun8i-a33.dtsi                                              |   4 +-
 arch/arm/boot/dts/sun8i-r40-feta40i.dtsi                                      | 106 ++++++++++++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/sun8i-r40-oka40i-c.dts                                      | 203 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/sun8i-r40.dtsi                                              |  56 ++++++++++++++++++++++-
 arch/arm/boot/dts/sun8i-v3.dtsi                                               |  31 ++++++++++++-
 arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts                            |  17 +++++--
 arch/arm/boot/dts/sun8i-v3s.dtsi                                              |  48 +++++++++++++++++++-
 arch/arm64/boot/dts/allwinner/Makefile                                        |   1 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi                       |  25 ++++++++++-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi                                 |  62 +++++++++++++++++-------
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts                     | 195 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi                                  |   9 ++++-
 20 files changed, 784 insertions(+), 52 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun8i-r40-feta40i.dtsi
 create mode 100644 arch/arm/boot/dts/sun8i-r40-oka40i-c.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts



--nLrvI0CrUDil1gM+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYMN5nAAKCRDj7w1vZxhR
xaNeAP4uB8ewTq3aQaH1eQKgE74woJec7ZNJerdJBjlpWkA/3wD9EItGOeOXILoi
3YpNZCjKXr2vIPbkvfq+OcY1EFXahQM=
=YXlM
-----END PGP SIGNATURE-----

--nLrvI0CrUDil1gM+--


--===============6917294972393980159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6917294972393980159==--

