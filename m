Return-Path: <SRS0=KdQ2=6U=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58C9C61DA3
	for <soc@archiver.kernel.org>; Fri, 24 Feb 2023 13:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7A156C4339E; Fri, 24 Feb 2023 13:52:39 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3EA56C433D2
	for <soc@kernel.org>; Fri, 24 Feb 2023 13:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3EA56C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id k14so17007498lfj.7
        for <soc@kernel.org>; Fri, 24 Feb 2023 05:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i+Xr3O6i29lV69WsLD6VpYUOFLcXVgAlt2IzXJInFCk=;
        b=jNO1KwDSJqCEc/W2WlzuT/2azTYizSZstwDGtGNjXHL2sL0gqoSfBnJaQxzpe2GRCK
         opQZGOy6hESQz0zJZXjQC4UHckKbP3xqhQ/hz30BN3Amd/jtzi/ra+LKYjwYkHwFiDHc
         OszG46Oi7ov4zusmvtiU/pGderCoABwf75kKgklfhJyA6cG4YJ242B8I8YkM9rHpfpJk
         QR5fUQ5ynZM0Yqx6kWjAqAetzQgieL/2U2IiSbFEMe7tJK5P7ZoLiAUzz/WDch6TyrZe
         s9mgbNQGWpA2FiZww955UbH0VzBL7BJN19aTU9S83IhKvSa0jpuL4uvVU6Bey6pldFno
         zpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+Xr3O6i29lV69WsLD6VpYUOFLcXVgAlt2IzXJInFCk=;
        b=q1/LC+a5ExMzMS+gKp86gh3kHW59+TO+yVdAXLziaf0/OogY3JtI6W5l3kq+ev1HXc
         RmtE3GfyPXd/2azRQsIbXzcZ2+r3bCh0LFzgkLQ/VGbYykXDG3vXxU3av71LdqQXpclV
         MaE7iOBAQjW8MHw7BVU1LSTlUKF+rOYGuQNfNXWOtnquxn2TD9ne2oR0UIqajjBSulmx
         mZewJUgxQLuYQqOQZV5em/YdyvLp6um2ZNR2euSJzqjtTJ8zY2208jThDW5lP1XQ304u
         J5VjKdjOcug2S/nX2oLlQIhy7S/pd6h15F9e32L3OFBNqEVRxiWVFQa+U9FZ5nTP4mYC
         ULcw==
X-Gm-Message-State: AO0yUKVOqB63YuTihmmM3g31d1YwrRmy8UcpA8shOvF8/NoqFENUf5T5
	5xrlhXW8HnbwbsoCeSz3J+OiYg==
X-Google-Smtp-Source: AK7set8xXxdI+06ekAcUWHypyTwQ+4pUPS0xGGlEegPqF4Oq/adbE60aVGrb9W8V5cGLHpf3djLkYA==
X-Received: by 2002:ac2:5333:0:b0:4d8:68f5:747b with SMTP id f19-20020ac25333000000b004d868f5747bmr5346274lfh.37.1677246756278;
        Fri, 24 Feb 2023 05:52:36 -0800 (PST)
Received: from fedora.. ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id d5-20020ac244c5000000b004d2199ea23dsm1185811lfm.0.2023.02.24.05.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 05:52:35 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Valente <paolo.valente@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] arm64: defconfig: Add IOSCHED_BFQ to the default configs
Date: Fri, 24 Feb 2023 14:52:30 +0100
Message-Id: <20230224135230.2295826-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARM64 systems are often memory constrained and more often than not
use slow single-channel storage such as flash memory or MMC/SD-cards.
For any interactive systems (such as mobile phones, tablets,
chromebooks...) the BFQ I/O scheduler will be desireable.

Make sure the BFQ I/O scheduler is available on these systems.

ARM (32), Loongarch, MIPS, m68k, UM and S390 has also enabled BFQ in
their defconfigs, cf commit b495dfed706c4c5873c0dab8930ad6eb1d276a6c
"um: Cleanup CONFIG_IOSCHED_CFQ" where the motivation is that
it replaces the former CFQ scheduler.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Paolo Valente <paolo.valente@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC maintainers: please apply this directly to the ARM64
defconfig branch if we have consensus.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 851e8f9be06d..503cc08cf112 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -126,6 +126,7 @@ CONFIG_CRYPTO_AES_ARM64_BS=m
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
+CONFIG_IOSCHED_BFQ=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_MEMORY_HOTPLUG=y
-- 
2.34.1

