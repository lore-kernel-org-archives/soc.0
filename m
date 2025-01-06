Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF951DFD9B
	for <soc@lists.linux.dev>; Mon,  6 Jan 2025 16:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736181730; cv=none; b=T/WtpSHcI5vmiazWUoDyD+Wmd1yCwnEJUfFsGvmwIYKRBJPYOyCZikJYPaFV9cTO1z+3EEwFwM3fJkDBcFOchqR4+tTTzSQo5tWnW8vxGBd372VL1tWlL5rs42wtT0jcmENxnKpu8hzRWEkArfDO23STzjO2SrHXiaF3R0H5LLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736181730; c=relaxed/simple;
	bh=Sb9bnWNlRYAXxzo56P48HJw0zLmj+ov1VyzsNp3iw5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fmlRuOzbgMApTr0zBVpPCyvYi3dBTyqBVjg6zWUUFFDSwX1Wr/OLbchDnkVFhPaG9pb23yYEhntIsWV89mMeqkx85O0kSlbq5R/FJL1DSYXKeYTvJ4uFHcmSa3uzltNT7g/WNB9ZxTlNqBfvoY/iYna2eOY5jVb+czOYq/Ya1/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 14913C4CED6; Mon,  6 Jan 2025 16:42:10 +0000 (UTC)
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ADA11C4CED2
	for <soc@kernel.org>; Mon,  6 Jan 2025 16:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ADA11C4CED2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4YRg253lZ5z4x2Xr
	for <soc@kernel.org>; Mon, 06 Jan 2025 17:42:05 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:39d4:dc4e:b4ce:1377])
	by laurent.telenet-ops.be with cmsmtp
	id xshx2D00L3AZZFy01shxk2; Mon, 06 Jan 2025 17:41:57 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tUqAs-00000008NTv-3A5o;
	Mon, 06 Jan 2025 17:41:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tUqAv-00000004YZR-0Irs;
	Mon, 06 Jan 2025 17:41:57 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas DTS updates for v6.14 (take two)
Date: Mon,  6 Jan 2025 17:41:53 +0100
Message-ID: <cover.1736180859.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.14.

The following changes since commit acb247afab5bc2b4462f4dfc17a9d930e1153e52:

  arm64: dts: renesas: r9a09g047: Add I2C nodes (2024-12-17 09:42:52 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.14-tag2

for you to fetch changes up to c357e2295b7880b1d9d365c3389f06ef2eb464d0:

  arm64: dts: renesas: white-hawk-csi-dsi: Define CSI-2 data line orders (2025-01-06 16:26:29 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.14 (take two)

  - Add pin control support for the RZ/G3E SoC and the RZ/G3E SMARC
    Carrier-II EVK development board,
  - Add Image Signal Processor helper block (FCPVX and VSPX) support for
    the R-Car V4H SoC,
  - Describe odd C-PHY wiring on the White Hawk CSI/DSI sub-board,
  - Miscellaneous fixes and improvements.

Note that this includes Pin Control DT binding and bindings definitions
for the RZ/G3E and RZ/V2H SoCs, which are shared by DT source files and
the pin control driver.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (5):
      dt-bindings: pinctrl: renesas: Add alpha-numerical port support for RZ/V2H
      dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Replace RZG2L macros
      arm64: dts: renesas: r9a09g047: Add pincontrol node
      arm64: dts: renesas: r9a09g047e57-smarc: Add SCIF pincontrol

Geert Uytterhoeven (2):
      Merge tag 'renesas-r9a09g057-dt-binding-defs-tag2' into renesas-dts-for-v6.14
      Merge tag 'renesas-r9a09g047-dt-binding-defs-tag2' into renesas-dts-for-v6.14

Jacopo Mondi (2):
      arm64: dts: renesas: r8a779g0: Add FCPVX instances
      arm64: dts: renesas: r8a779g0: Add VSPX instances

Niklas Söderlund (1):
      arm64: dts: renesas: white-hawk-csi-dsi: Define CSI-2 data line orders

 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |  7 ++--
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 40 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 13 +++++++
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 13 +++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 36 +++++++++----------
 .../arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi |  2 ++
 .../pinctrl/renesas,r9a09g047-pinctrl.h            | 41 ++++++++++++++++++++++
 .../pinctrl/renesas,r9a09g057-pinctrl.h            | 31 ++++++++++++++++
 8 files changed, 163 insertions(+), 20 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
