Return-Path: <SRS0=L3gG=QY=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF5CC433F5
	for <soc@archiver.kernel.org>; Tue,  7 Dec 2021 06:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 22761C341C1; Tue,  7 Dec 2021 06:08:11 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1653C341C5
	for <soc@kernel.org>; Tue,  7 Dec 2021 06:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B1653C341C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=marcan.st
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id A79DF41E96;
	Tue,  7 Dec 2021 06:08:06 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] Apple SoC PMGR driver for 5.17
Message-ID: <049f4de9-51be-7be4-1f9a-a59756af88d7@marcan.st>
Date: Tue, 7 Dec 2021 15:08:04 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit

Hi SoC folks,

Please merge the new PMGR driver for 5.17.

This should not have any hard deps with the previous pulls. The 
MAINTAINERS change already rode along the DT pull, for simplicity.

-Hector

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

   https://github.com/AsahiLinux/linux.git tags/asahi-soc-pmgr-5.17

for you to fetch changes up to 6df9d38f9146e83b473f0c9e57fb5fdf3fcc93e2:

   soc: apple: Add driver for Apple PMGR power state controls 
(2021-12-07 13:13:13 +0900)

----------------------------------------------------------------
Apple SoC PMGR driver for 5.17

Adds the new PMGR driver. This includes the driver only; DT and
MAINTAINERS changes are part of the DT pull.

Minor change from v3: added `depends on PM` to the Kconfig to
fix COMPILE_TEST randconfig failures.

----------------------------------------------------------------
Hector Martin (1):
       soc: apple: Add driver for Apple PMGR power state controls

  drivers/soc/Kconfig                     |   1 +
  drivers/soc/Makefile                    |   1 +
  drivers/soc/apple/Kconfig               |  22 +++
  drivers/soc/apple/Makefile              |   2 +
  drivers/soc/apple/apple-pmgr-pwrstate.c | 317 
++++++++++++++++++++++++++++++++
  5 files changed, 343 insertions(+)
  create mode 100644 drivers/soc/apple/Kconfig
  create mode 100644 drivers/soc/apple/Makefile
  create mode 100644 drivers/soc/apple/apple-pmgr-pwrstate.c

