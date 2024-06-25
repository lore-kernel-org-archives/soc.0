Return-Path: <SRS0=L3CL=N3=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD18C3064D
	for <soc@archiver.kernel.org>; Tue, 25 Jun 2024 13:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9CDDDC32781; Tue, 25 Jun 2024 13:33:56 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 859E1C4AF09
	for <soc@kernel.org>; Tue, 25 Jun 2024 13:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 859E1C4AF09
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dfef5980a69so5397723276.3
        for <soc@kernel.org>; Tue, 25 Jun 2024 06:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1719322432; x=1719927232; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2Q7HXkiWIZ27R41hwXhNudn4S+1iU0iF37ik1sbpuvQ=;
        b=LuDMHYUv9IdK+yMJllU3h7EtuVAudIdCE7uqs6u2QHh9/YAQ3JIrctgzFTYlT7yTR2
         dbnNmqcuaDxRqgPtWGGZQ9QZIy92Y59LlMbBZN+urHgs8A7jOPTI5xJOMym2SwqQARu7
         rLYySwWvei5t/Ssk3TEJgLeXRGFUptZGAGSyN4qH8R8vSnLlUw7sAUN5zXdEFjp4BXPj
         UJ2GNOalLj9RMCnlIkUAPhar/Ej6IXkbB+U488Cev/mmx9NGRm9rDZCvd6NwBcVNiFl1
         XyNuVh0BXk7GIyrkCHaAfu55vTADYlDAple3+tlrEUJ98yThStv6YZy28OsVzyk0pimA
         l3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719322432; x=1719927232;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Q7HXkiWIZ27R41hwXhNudn4S+1iU0iF37ik1sbpuvQ=;
        b=MYq+CQoo5LpS4vcvqRBAYBQbpaoCjiE3C+ZfVjOSnJ1jwgZiKB0GRMa2dGM4GmPMEm
         iYSgrfOorAmv5+nMnqr+C+l1PQzVxgX6m3Hc0ZuddT3V667MT6FkQAgnkz2h0/EZeI42
         PxFFCvnC1kLTuP0N8hc0GkuG9t7M9kyJnJtwAQryy5qN5lY+L3q/LgU3ztvo6TIMIuSq
         KI9AdsrAnWs9JEdHShKhEJAJyVH+pYV0BSpxMPz5lBf2Hgt6ONPLzz4BrFnGHWp3M/TP
         aulGLljEIj3+0ATla0Z0n1/SSL1G2d6SYxau0XvvNpTtyoMJYm1yScotyy9aesV/CueJ
         JOEQ==
X-Gm-Message-State: AOJu0YzrpLQrKuzvXRWNg6zP9AdmKRUWZbZYokj6hyQi9Tb6YTrosv+4
	2lGCIHih4b8urEhIbYBPJN7DviDCL5h4RvpZYcaFLfvDFdMH+tLMWCCdHe1rstz27woFoFLiZMB
	iURBsjUmZYHlgsb4fB0WD5av440+mTs63e5o6wbN1AKj2B1bIZOzJ
X-Google-Smtp-Source: AGHT+IGwBJ3/cEuD/pHO9eusFdETmDWfaiU8L8J+AMIVAI3T1dCGx01BotDGfddx4BMQS8aex0fT11RqDPAA3MQPXdM=
X-Received: by 2002:a05:6902:c9:b0:dfd:cc57:e043 with SMTP id
 3f1490d57ef6-e0300eef70bmr7018279276.6.1719322432055; Tue, 25 Jun 2024
 06:33:52 -0700 (PDT)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Tue, 25 Jun 2024 15:33:41 +0200
Message-ID: <CAHTX3dKMtqgNpkEvrw0p2w+SPN83Ai1_kzhefUGOO5rMkPaH_w@mail.gmail.com>
Subject: [GIT PULL] arm64: dts: ZynqMP SOC changes for 6.11
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull the following patches to your tree. Nothing significant
there just small alignments.

Thanks,
Michal

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc2-for-6.11

for you to fetch changes up to 9b003e14801cf85a8cebeddc87bc9fc77100fdce:

  drivers: soc: xilinx: check return status of get_api_version()
(2024-06-03 13:07:57 +0200)

----------------------------------------------------------------
arm64: Xilinx SoC changes for 6.11

Timer
- Fix u32 overflow issue in 32-bit width PWM mode.

Event manager:
- rename cpu_number1 to dummy_cpu_number

Power:
- Add cb event for subsystem restart
- check return status of get_api_version()

Firmware:
- Move FIRMWARE_VERSION_MASK to xlnx-zynqmp.h

----------------------------------------------------------------
Jay Buddhabhatti (3):
      soc: xilinx: rename cpu_number1 to dummy_cpu_number
      soc: xilinx: Add cb event for subsystem restart
      drivers: soc: xilinx: check return status of get_api_version()

Ken Sloat (1):
      pwm: xilinx: Fix u32 overflow issue in 32-bit width PWM mode.

Ronak Jain (1):
      firmware: xilinx: Move FIRMWARE_VERSION_MASK to xlnx-zynqmp.h

 drivers/firmware/xilinx/zynqmp.c            |   3 -
 drivers/soc/xilinx/xlnx_event_manager.c     |  16 +-
 drivers/soc/xilinx/zynqmp_power.c           | 155 +++++++++++++++++---
 include/clocksource/timer-xilinx.h          |   2 +-
 include/linux/firmware/xlnx-event-manager.h |  10 ++
 include/linux/firmware/xlnx-zynqmp.h        |   3 +
 6 files changed, 152 insertions(+), 37 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
