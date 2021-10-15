Return-Path: <SRS0=kCD1=PD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F60BC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 23:01:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9543610E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 23:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9543610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L5byy4Ch8W5tYudhK0X3OCySH00Pr3YM/Flr2JpbW4E=; b=30YS2En0h0NXzN
	xKE/0tXA21SVrDybo5xdBTI5INlEWNxp0YMyomB4O89ykBq2GqkJXe6CauFosybAfUXyAi0SPVQVE
	ArE0waYNTRHJOtcbqTB8vIvem2Kc8kk1OVf2CTkp806mHtSo9Vn0aYD68DaWmDRD6yD1XlKAnpPCh
	eSLx15SdA5V5HbytE+17PcJUbhqteSa/QZjbNtaLkEgXJZK4vNADSEYAcolkqafkERjtnlf5L87ou
	l3IR/LhQA1eUWtbeAWsvnTOdVdOqOuLR+TvkqamDQp6EICfaCR+wzJY7/MOLqW47v3jSdYmTpQ7Sr
	hncboJzwlpdqbTzyWXDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbWBC-0092P1-Tw; Fri, 15 Oct 2021 22:59:59 +0000
Received: from mo-csw1516.securemx.jp ([210.130.202.155]
 helo=mo-csw.securemx.jp)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbWB8-0092Ob-L9
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Oct 2021 22:59:56 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 19FMxjRV005947;
 Sat, 16 Oct 2021 07:59:45 +0900
X-Iguazu-Qid: 34tMdwO14ei5xGVltA
X-Iguazu-QSIG: v=2; s=0; t=1634338785; q=34tMdwO14ei5xGVltA;
 m=2j2560C2Jw86r6crSB0xEUS9On2eM4UzFpdzItxzekc=
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
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_155954_929602_51791C3D 
X-CRM114-Status: GOOD (  11.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

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



_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
