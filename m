Return-Path: <SRS0=8hSq=WI=gmail.com=linmq006@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACB7C433F5
	for <soc@archiver.kernel.org>; Wed,  1 Jun 2022 09:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4637FC385B8; Wed,  1 Jun 2022 09:06:10 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A69F2C385A5
	for <soc@kernel.org>; Wed,  1 Jun 2022 09:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A69F2C385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id x12so1324558pgj.7
        for <soc@kernel.org>; Wed, 01 Jun 2022 02:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XxvinVL37x5OBNHU1puUWzKVrQRVT4YDtJkGk21fPJk=;
        b=iFOhi6sjj43Zt9ubZLO9QtM6GrYpN0vYKVEXEEw3ardCGHHqC9hVVfyiuz2gJS1vSA
         4O5ws+IQeEHZAEe1pjMKuzzpWktDbTQMS8TSuP1YlruGlnlD0lQtgy5fbWx2b6s1W2m+
         4IrPocX7HOZoX/4Q2eMLY0psXbl0VSfXgqT/a5y3z84K16k2MYcqlkg9T/BIlbcDNXN1
         SkLsbo16unleEjsk18iFi0V9oOplKIuFezlFcq9kw6wnYOTI2UtM/5GoVPQmSVLXpK9u
         Ss62T0LJOxc1T3hY7kf0pX0cN1cEuyJ9WTMdHS1iqhPr48CJsXpgXR26vPOuiyyjbBa0
         AXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XxvinVL37x5OBNHU1puUWzKVrQRVT4YDtJkGk21fPJk=;
        b=QkL1PDeUNdqqCCZWEpE9dbB624f0Q+P8B4p28Y2o0LLI1rmX2QCkvkZjh25RHD8obM
         fFaEVbTTxDr4tUY3HCMfaKTjcGHkZAkQWS27LEUGANtET9yWSIrIkCR352sk/ceNieON
         xTzQ/dnFUDwdNcTkelWj54NBRzWLlQK/xxzerNMxsbMU85WgmMMUAo+yExMA+UAjUqyj
         T+wEk4tdSHdbEzY2r9GZQfAsyiSlFfmbZY3MrC/IP+nFmJRAGasQgxcsrGKfLyejoMGB
         Zg3hDbtpiqda99WCgDF7PODh68BXreFB9tt6sgUE/Hah1hUMz0I80sR7QESaCkpWmKjH
         cnAg==
X-Gm-Message-State: AOAM530L9KJwyhRyL0PDaZgQT50VwUz3i3av9VEkFTk8HeccuepBifDA
	Rk22EZuigLfjaMYBm3Nx2DAZVJAieX7jCIDS
X-Google-Smtp-Source: ABdhPJzhZCzim8lOKnf+fD0NxrwB2bvr0fSP4uTQFuun5jaJH7gARDDQIP/25IO6RRowgMSUCdJTOg==
X-Received: by 2002:a05:6a00:ad2:b0:4f1:2734:a3d9 with SMTP id c18-20020a056a000ad200b004f12734a3d9mr65496551pfl.61.1654074368658;
        Wed, 01 Jun 2022 02:06:08 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id z17-20020a170903409100b001618644d8b5sm1001516plc.154.2022.06.01.02.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 02:06:07 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linmq006@gmail.com
Subject: [RESEND PATCH] ARM: Fix refcount leak in axxia_boot_secondary
Date: Wed,  1 Jun 2022 13:05:48 +0400
Message-Id: <20220601090548.47616-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_find_compatible_node() returns a node pointer with refcount
incremented, we should use of_node_put() on it when done.
Add missing of_node_put() to avoid refcount leak.

Fixes: 1d22924e1c4e ("ARM: Add platform support for LSI AXM55xx SoC")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
I follow the instruction to resend this patch to soc@kernel.org.

v1 link:
https://lore.kernel.org/all/20220512020641.45156-1-linmq006@gmail.com/
---
 arch/arm/mach-axxia/platsmp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-axxia/platsmp.c b/arch/arm/mach-axxia/platsmp.c
index 512943eae30a..2e203626eda5 100644
--- a/arch/arm/mach-axxia/platsmp.c
+++ b/arch/arm/mach-axxia/platsmp.c
@@ -39,6 +39,7 @@ static int axxia_boot_secondary(unsigned int cpu, struct task_struct *idle)
 		return -ENOENT;
 
 	syscon = of_iomap(syscon_np, 0);
+	of_node_put(syscon_np);
 	if (!syscon)
 		return -ENOMEM;
 
-- 
2.25.1

