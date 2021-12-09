Return-Path: <SRS0=JYHf=Q2=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2EAC433F5
	for <soc@archiver.kernel.org>; Thu,  9 Dec 2021 12:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89809C341CE; Thu,  9 Dec 2021 12:05:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id AB781C341C3;
	Thu,  9 Dec 2021 12:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB781C341C3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDC872B;
	Thu,  9 Dec 2021 04:05:05 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9AB583F5A1;
	Thu,  9 Dec 2021 04:05:04 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: linux-kernel@vger.kernel.org,
	soc@kernel.org,
	arm@kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	Pedro Batista <pedbap.g@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2] firmware: arm_scpi: Fix string overflow in SCPI genpd driver
Date: Thu,  9 Dec 2021 12:04:56 +0000
Message-Id: <20211209120456.696879-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without the bound checks for scpi_pd->name, it could result in the buffer
overflow when copying the SCPI device name from the corresponding device
tree node as the name string is set at maximum size of 30.

Let us fix it by using devm_kasprintf so that the string buffer is
allocated dynamically.

Cc: stable@vger.kernel.org
Fixes: 8bec4337ad40 ("firmware: scpi: add device power domain support using genpd")
Reported-by: Pedro Batista <pedbap.g@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/scpi_pm_domain.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

Hi ARM SoC team,

Can you apply this directly as I don't have any other fix at the moment.

Regards,
Sudeep

v1->v2:
	- Fixed accidentally dropped '.' in the name
	- Used devm_kasprintf instead of combination of kasprintf and
	  devm_kstrdup

v1: https://lore.kernel.org/r/20211206153150.565685-1-sudeep.holla@arm.com/

diff --git a/drivers/firmware/scpi_pm_domain.c b/drivers/firmware/scpi_pm_domain.c
index 51201600d789..800673910b51 100644
--- a/drivers/firmware/scpi_pm_domain.c
+++ b/drivers/firmware/scpi_pm_domain.c
@@ -16,7 +16,6 @@ struct scpi_pm_domain {
 	struct generic_pm_domain genpd;
 	struct scpi_ops *ops;
 	u32 domain;
-	char name[30];
 };

 /*
@@ -110,8 +109,13 @@ static int scpi_pm_domain_probe(struct platform_device *pdev)

 		scpi_pd->domain = i;
 		scpi_pd->ops = scpi_ops;
-		sprintf(scpi_pd->name, "%pOFn.%d", np, i);
-		scpi_pd->genpd.name = scpi_pd->name;
+		scpi_pd->genpd.name = devm_kasprintf(dev, GFP_KERNEL,
+						     "%pOFn.%d", np, i);
+		if (!scpi_pd->genpd.name) {
+			dev_err(dev, "Failed to allocate genpd name:%pOFn.%d\n",
+				np, i);
+			continue;
+		}
 		scpi_pd->genpd.power_off = scpi_pd_power_off;
 		scpi_pd->genpd.power_on = scpi_pd_power_on;

--
2.25.1

