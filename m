Return-Path: <SRS0=W0sq=LJ=toshiba.co.jp=nobuhiro1.iwamatsu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A229AC48BDF
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 23:12:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 78A3361245; Tue, 15 Jun 2021 23:12:41 +0000 (UTC)
Received: from mo-csw.securemx.jp (mo-csw1516.securemx.jp [210.130.202.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6521D6128C
	for <soc@kernel.org>; Tue, 15 Jun 2021 23:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6521D6128C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=nobuhiro1.iwamatsu@toshiba.co.jp
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 15FNCYvG028674; Wed, 16 Jun 2021 08:12:34 +0900
X-Iguazu-Qid: 34tKC7reYH2pvMRY9Z
X-Iguazu-QSIG: v=2; s=0; t=1623798754; q=34tKC7reYH2pvMRY9Z; m=7Et6MiZCTcIR0klhswAQMnZP3xCuMublo+Td5JTu9PQ=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1510) id 15FNCXvi020335
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 16 Jun 2021 08:12:33 +0900
Received: from enc01.toshiba.co.jp (enc01.toshiba.co.jp [106.186.93.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by imx2-a.toshiba.co.jp (Postfix) with ESMTPS id 451761000D5;
	Wed, 16 Jun 2021 08:12:33 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
	by enc01.toshiba.co.jp  with ESMTP id 15FNCWe7024733;
	Wed, 16 Jun 2021 08:12:33 +0900
Date: Wed, 16 Jun 2021 08:12:32 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, olof@lixom.net, arnd@arndb.de
Cc: yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: Visconti: defconfig changes for 5.14
X-TSB-HOP: ON
Message-ID: <20210615231232.pllzlqoamkmnsqq6@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi SoC team,

This request includes patches that enables PWM and GPIO for Visconti
SoC in defconfig.
Please pull for v5.14 kernel cycle.

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git tags/visconti-arm-defconfig-for-v5.14

for you to fetch changes up to d1588b22dcbb662d94740489713b8fcfe3c13023:

  arm64: defconfig: Visconti: Enable GPIO (2021-06-15 09:03:32 +0900)

----------------------------------------------------------------
Visconti defconfig updates for v5.14

- Enable Visconti's PWM in the ARM64 defconfig as a module.
- Enable Visconti's GPIO in the ARM64 defconfig.

----------------------------------------------------------------
Nobuhiro Iwamatsu (2):
      arm64: defconfig: Visconti: Enable PWM
      arm64: defconfig: Visconti: Enable GPIO

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
