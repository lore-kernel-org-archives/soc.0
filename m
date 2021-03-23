Return-Path: <SRS0=aJU7=IV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB24BC433C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Mar 2021 08:36:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AC3C619B1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Mar 2021 08:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AC3C619B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CcfnM3S2nB5qduHX2DlZnv//aRySPgNWHSZUaFb+tRA=; b=bCN6i9fNj5jAKVBKoQbqNhhuCd
	EJVcwIcfoBK+y8/xIsy9lM9hZsq3/Fuj9ZSgpR8tC11LtNoA7XmZb9yWxslLd3Z0mGldx3benDD5q
	2xW50x4QLYoMxmdgnNnMk1AhdCKTEoTmFDG6qfvALPs+i8n8tAlpQ2LqpnsgnajiqtUaMQQk75CYA
	Iu/anTYb2X7jlCfcyy0EKGL1mwkxLxlA/O81vlMjJeslLOQUT20pfISNxLn3/vbSmh7qP+z/qvOs9
	8AnI8uGRKu2extxIoKxM9WnrtZfHfP/0Ie37EzB1ILjV6hcXR8OQbtEt1ipcqJmiCMAFHDk3uyD38
	xI0UU8xA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOcUT-00EKNV-7H; Tue, 23 Mar 2021 08:34:17 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOcUO-00EKMc-Ba
 for linux-arm-kernel@lists.infradead.org; Tue, 23 Mar 2021 08:34:14 +0000
Received: by mail-lf1-x134.google.com with SMTP id w37so25371885lfu.13
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 23 Mar 2021 01:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LTCHs9NzisZTm+iK2m5HxkWlZe42alRl6zgULFPo5I0=;
 b=l6FvNmzGN05KeNQF7pKhVoX8mqWVPlNtL8mfmgFMLYUD3VdpWgUKDgQbBqDhocji6L
 BpIfXCt3qnw1ocY//PGDHO8UhsbDVAtwCSzbivDdvnBCsAyqxKS5jKRbox3g9mpTFGNX
 m/0zkhXXAxmkOQDkY/S7yuHHPOB8uMP9sHrJnoox2+g72D2btePqmYjOgbrkrSpSjjvR
 lShcYB3K20tjX7/f88gmgdnHF1c/tU0j4POSonkXnLSFDcqrvZYileJhmLEl4r4WwT6E
 czW/GC5z76Fqm+cBSyNP7SV1rn62Zy05/2kuS/VHkWWcTADyQHmi8ynTT5UE8vu6/UP9
 mMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LTCHs9NzisZTm+iK2m5HxkWlZe42alRl6zgULFPo5I0=;
 b=HhJsdp/N0jxPTRfNDcZ7FoPt7L/CloOoJOuh0rII4Ju4DpUI+AeDgNKu9CdG/v7JSb
 zTRo3/5T2yAbe9iMXuihebqx/9HbDUfAMDNiL48yLgbsjp1OoD4i0KlqGzzrs2KxrK6z
 pxbwTfGQiC6xwo9aFEW49Y1kK9cBfGWmjNcCr5uKdkOrwjHtBdoN8gfvvDuuLzIaSIDZ
 Sx1cwH18DFPGGXp/v8KIvCm/c95ppb5A4atW0mDepK6MCEAOLDy6g1mqxzFegCqYlpjb
 FpuEPuCd84PHsffcaf4CLhDPtMDSxXdU+Ki30BZ7yCLi1tU1I/UhOlWZ7BLhGxD9j1XX
 NrdA==
X-Gm-Message-State: AOAM5319HV3Jq8JNecfB9Rk75FcdQOjRf2b/z4NYfrG+Z6CGQ7lp2r8k
 eu2Ta5oRopMvJX+Wl7FqSwFisw==
X-Google-Smtp-Source: ABdhPJyIRaQqWO+4qSVhK6vKcmYb6fyFak0I5VwgVrcHtVCzS/1FG5Ugs6h/tN5YObY+sQ/hGiS7fg==
X-Received: by 2002:a19:7fc3:: with SMTP id a186mr1920074lfd.626.1616488451353; 
 Tue, 23 Mar 2021 01:34:11 -0700 (PDT)
Received: from localhost.localdomain
 (c-d7cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.215])
 by smtp.gmail.com with ESMTPSA id p11sm1786329lfr.235.2021.03.23.01.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 01:34:10 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: ux500: make ux500_cpu_die static
Date: Tue, 23 Mar 2021 09:32:03 +0100
Message-ID: <20210323083203.1646842-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_083412_980261_4F9D5304 
X-CRM114-Status: GOOD (  13.44  )
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
Message-ID: <20210323083203.Vef0R0t2v7S_691C-UZwW0JlaKKvtiG1PFFhy97fV9A@z>

From: Ben Dooks <ben.dooks@codethink.co.uk>

The ux500_cpu_die function is not exported so make it static
to avoid the following warning:

arch/arm/mach-ux500/platsmp.c:89:6: warning: symbol 'ux500_cpu_die' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC folks: please apply this patch directly. No
other Ux500 patches are queued.
---
 arch/arm/mach-ux500/platsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-ux500/platsmp.c b/arch/arm/mach-ux500/platsmp.c
index 0810f3abd810..415d8ad2a3c1 100644
--- a/arch/arm/mach-ux500/platsmp.c
+++ b/arch/arm/mach-ux500/platsmp.c
@@ -86,7 +86,7 @@ static int ux500_boot_secondary(unsigned int cpu, struct task_struct *idle)
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
-void ux500_cpu_die(unsigned int cpu)
+static void ux500_cpu_die(unsigned int cpu)
 {
 	wfi();
 }
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
