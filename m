Return-Path: <SRS0=RFZX=PD=toshiba.co.jp=nobuhiro1.iwamatsu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA83C433F5
	for <soc@archiver.kernel.org>; Fri, 15 Oct 2021 23:02:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8769F60FF2; Fri, 15 Oct 2021 23:02:32 +0000 (UTC)
X-Greylist: delayed 159 seconds by postgrey-1.37 at mail.kernel.org; Fri, 15 Oct 2021 23:02:31 UTC
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E94560FC3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: from mo-csw.securemx.jp (mo-csw1516.securemx.jp [210.130.202.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E94560FC3
	for <soc@kernel.org>; Fri, 15 Oct 2021 23:02:31 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 19FN2Pm0010544; Sat, 16 Oct 2021 08:02:25 +0900
X-Iguazu-Qid: 34tKJZBnPXPWPPOKld
X-Iguazu-QSIG: v=2; s=0; t=1634338945; q=34tKJZBnPXPWPPOKld; m=/Yg51QL/k/1sJ4KtYbENYEC+LrsHeFPPeyjECOGHvNU=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1512) id 19FN2Oo5006990
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 16 Oct 2021 08:02:24 +0900
Received: from enc01.toshiba.co.jp (enc01.toshiba.co.jp [106.186.93.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by imx2-a.toshiba.co.jp (Postfix) with ESMTPS id 1A8C710009C;
	Sat, 16 Oct 2021 08:02:24 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
	by enc01.toshiba.co.jp  with ESMTP id 19FN2NcQ010074;
	Sat, 16 Oct 2021 08:02:23 +0900
Date: Sat, 16 Oct 2021 08:02:23 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, olof@lixom.net, arnd@arndb.de
Cc: yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: Visconti: defconfig changes for 5.16
X-TSB-HOP: ON
Message-ID: <YWoIf4xPoQtLhC3x@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi SoC team,

This request includes patches that enables PCIe for Visconti SoC in defconfig.
Please pull for v5.16 kernel cycle.

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git tags/visconti-arm-defconfig-for-v5.16

for you to fetch changes up to 9606ebc100ef3df5c859397ceddb57426db0ecc6:

  arm64: defconfig: Visconti: Enable PCIe host controller (2021-10-16 07:34:01 +0900)

----------------------------------------------------------------
Visconti defconfig updates for v5.16

- Enable Visconti's PCIe host controller in the ARM64 defconfig

----------------------------------------------------------------
Nobuhiro Iwamatsu (1):
      arm64: defconfig: Visconti: Enable PCIe host controller

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)


