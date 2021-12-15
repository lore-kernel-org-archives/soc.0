Return-Path: <SRS0=jKEZ=RA=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8ABC433EF
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 14:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32822C34607; Wed, 15 Dec 2021 14:49:27 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 36A36C34604
	for <soc@kernel.org>; Wed, 15 Dec 2021 14:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 36A36C34604
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=marcan.st
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 88DE1419BC;
	Wed, 15 Dec 2021 14:49:21 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
Subject: [GIT PULL] Apple SoC PMGR driver updates for 5.17 (v2)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Message-ID: <660f6f7f-0857-b54c-c415-79bcb93f0e02@marcan.st>
Date: Wed, 15 Dec 2021 23:49:19 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: es-ES
Content-Transfer-Encoding: 7bit


Hi SoC folks,

Please merge these additional fixes for the PMGR driver for 5.17.

This just adds a new feature needed for DCP devices, and disables module
builds which were broken anyway (and didn't make much sense; thanks to
the kernel test robot for catching that one!)

-Hector

The following changes since commit 6df9d38f9146e83b473f0c9e57fb5fdf3fcc93e2:

  soc: apple: Add driver for Apple PMGR power state controls (2021-12-07 13:13:13 +0900)

are available in the Git repository at:

  https://github.com/AsahiLinux/linux.git tags/asahi-soc-pmgr-5.17-v2

for you to fetch changes up to 8e136c5ea43ae08c5d672deb1c3f494782a4392a:

  soc: apple: apple-pmgr-pwrstate: Do not build as a module (2021-12-15 20:36:05 +0900)

----------------------------------------------------------------
Apple SoC PMGR driver updates for 5.17

* Adds an auto-PM feature that is necessary for a single device
* Disables module builds, which were broken anyway

----------------------------------------------------------------
Hector Martin (2):
      soc: apple: apple-pmgr-pwrstate: Add auto-PM min level support
      soc: apple: apple-pmgr-pwrstate: Do not build as a module

 drivers/soc/apple/Kconfig               | 2 +-
 drivers/soc/apple/apple-pmgr-pwrstate.c | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

