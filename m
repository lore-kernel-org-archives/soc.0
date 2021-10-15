Return-Path: <SRS0=RFZX=PD=toshiba.co.jp=nobuhiro1.iwamatsu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95143C433EF
	for <soc@archiver.kernel.org>; Fri, 15 Oct 2021 23:06:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 78CF5611C2; Fri, 15 Oct 2021 23:06:49 +0000 (UTC)
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1516.securemx.jp [210.130.202.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65250610E5
	for <soc@kernel.org>; Fri, 15 Oct 2021 23:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65250610E5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1516) id 19FMxrEj026810; Sat, 16 Oct 2021 07:59:53 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 19FMxjRV005947; Sat, 16 Oct 2021 07:59:45 +0900
X-Iguazu-Qid: 34tMdwO14ei5xGVltA
X-Iguazu-QSIG: v=2; s=0; t=1634338785; q=34tMdwO14ei5xGVltA; m=2j2560C2Jw86r6crSB0xEUS9On2eM4UzFpdzItxzekc=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1512) id 19FMxh5r002877
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 16 Oct 2021 07:59:44 +0900
Received: from enc01.toshiba.co.jp (enc01.toshiba.co.jp [106.186.93.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by imx2-a.toshiba.co.jp (Postfix) with ESMTPS id 2F0B71000F9;
	Sat, 16 Oct 2021 07:59:43 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
	by enc01.toshiba.co.jp  with ESMTP id 19FMxg4e009487;
	Sat, 16 Oct 2021 07:59:42 +0900
Date: Sat, 16 Oct 2021 07:59:42 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, olof@lixom.net, arnd@arndb.de
Cc: yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: Visconti: device tree changes for 5.16
X-TSB-HOP: ON
Message-ID: <YWoH3g7vU1ZEAp+P@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20211015225942.r5EVvWZAT5bi-aVWgm6wU5PbBRX1ALxwT4aZi9mLK3c@z>

Hi SoC team,

This request includes the PCIe and VisROBO VRB board DT patch for the
Visconti SoC.
Please pull for v5.16 kernel cycle.

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git tags/visconti-arm-dt-for-v5.16

for you to fetch changes up to 518d432fd52913c8cb2fe20b140b182f07e0357d:

  arm64: dts: visconti: Add DTS for the VisROBO board (2021-10-16 07:09:42 +0900)

----------------------------------------------------------------
Visconti device tree updates for 5.16

 - Add DT support for Toshiba Visconti5 PCIe driver
 - Add 150MHz fixed clock to TMPV7708 SoC
 - Add DT support for VisROBO VRB boardi

----------------------------------------------------------------
Nobuhiro Iwamatsu (1):
      arm64: dts: visconti: Add PCIe host controller support for TMPV7708 SoC

Yuji Ishikawa (3):
      arm64: dts: visconti: Add 150MHz fixed clock to TMPV7708 SoC
      dt-bindings: arm: toshiba: Add the TMPV7708 VisROBO VRB board
      arm64: dts: visconti: Add DTS for the VisROBO board

 Documentation/devicetree/bindings/arm/toshiba.yaml    |  1 +
 arch/arm64/boot/dts/toshiba/Makefile                  |  1 +
 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts      |  6 ++++++
 arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dts  | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi | 44 ++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi             | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 172 insertions(+)
 create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dts
 create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi


