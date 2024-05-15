Return-Path: <SRS0=/d5S=MS=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85072C25B75
	for <soc@archiver.kernel.org>; Wed, 15 May 2024 09:55:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44299C32782; Wed, 15 May 2024 09:55:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id D78CDC116B1;
	Wed, 15 May 2024 09:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D78CDC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C16A1007;
	Wed, 15 May 2024 02:55:56 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1EA363F762;
	Wed, 15 May 2024 02:55:31 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [RESEND][PATCH] firmware: psci: Fix return value from psci_system_suspend()
Date: Wed, 15 May 2024 10:55:28 +0100
Message-ID: <20240515095528.1949992-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently we return the value from invoke_psci_fn() directly as return
value from psci_system_suspend(). It is wrong to send the PSCI interface
return value directly. psci_to_linux_errno() provide the mapping from
PSCI return value to the one that can be returned to the callers within
the kernel.

Use psci_to_linux_errno() to convert and return the correct value from
psci_system_suspend().

Fixes: faf7ec4a92c0 ("drivers: firmware: psci: add system suspend support")
Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/psci/psci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Hi {arm-}soc team,

Please pick this up directly. This has slipped through the cracks as I
didn't follow up or cc-ed arm-soc team. Previously posted @[1].

Regards,
Sudeep

[1] https://lore.kernel.org/r/20231113153446.82684-1-sudeep.holla@arm.com

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index d9629ff87861..2328ca58bba6 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -497,10 +497,12 @@ int psci_cpu_suspend_enter(u32 state)

 static int psci_system_suspend(unsigned long unused)
 {
+	int err;
 	phys_addr_t pa_cpu_resume = __pa_symbol(cpu_resume);

-	return invoke_psci_fn(PSCI_FN_NATIVE(1_0, SYSTEM_SUSPEND),
+	err = invoke_psci_fn(PSCI_FN_NATIVE(1_0, SYSTEM_SUSPEND),
 			      pa_cpu_resume, 0, 0);
+	return psci_to_linux_errno(err);
 }

 static int psci_system_suspend_enter(suspend_state_t state)
--
2.43.2

