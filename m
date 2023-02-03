Return-Path: <SRS0=2Vwl=57=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844B5C61DA4
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 14:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B11AC433D2; Fri,  3 Feb 2023 14:04:12 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C6EEC433EF
	for <soc@kernel.org>; Fri,  3 Feb 2023 14:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1C6EEC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id bk15so15570230ejb.9
        for <soc@kernel.org>; Fri, 03 Feb 2023 06:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wkh/ik+741Un3ANrHSq93txzbFllh2KdlJjlZ7JphtA=;
        b=aSDvbYELkoRi+22LamsNYccsaoxKuU4kgN/xoI77MyRW1ULn36PnQsWPiV7M9USx4z
         N+0JJSIyEsTGqJJwX/wzcxVopJge+nV1JH2Zh34yCBEg4h9ZK6PMCLNxMKbHdOgVgN8x
         oB5LbS5H6/JxOzTnrMq8q2b7lf1g39xzop7yaPzTJ1dCIURN86UISra3v2+P4P7t9aBU
         A6SPM5uLl85UoYOo3pDj3LnPm+uef9ngshgpxZLHbrG+hJ0hYIGyJ1Xl4+EbxKJa0Cqj
         gfvXfguCwcklf1D8CS7VM3PXk3aCXKkA63wu+Xpa7+g6zG7/PLGiX6OSa93TxHp/5UuH
         Zitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wkh/ik+741Un3ANrHSq93txzbFllh2KdlJjlZ7JphtA=;
        b=bX/dhBxQQYoBD6v6/jj9iq1BiCI216mPqm/tQFcoDjHJGRDeW5VV28RfLb0zGk7f8u
         84ZAGLQk16yiI61dNjXIomrV8iqRLoeM/L7laNMMbHXDtO5d9NYtCbTPil+LzcJzwWzZ
         +wBa3gondn50+8vlgP3rHuVFzYpK/6ODDN2VFtlwU6isi3ISKuAZEfsLERzl9s9BKqeX
         kiNegzw3At1wRDHA9yz0qSpANDjUaXyPNt8v3428UUiWF7jSWv6qNl2P/USErIRLTvf1
         /0O4ImYfEw5UGCT3mlXD5sajKOQVRIXmQ60khUGARqcqWAnPWLXQ3D5MA9S/02c6HkB4
         HVfw==
X-Gm-Message-State: AO0yUKVXrmy8Z/+peZMuryLmn8Vhs+Sr4ItOpG8C83t/N3g8V+hBdSbG
	p8zmegllz4RAjIlOvLjp7qa/wA==
X-Google-Smtp-Source: AK7set+T9dsVNp6Z4zr1OHqXcu2PeATPrwEkE/2pGj/nbYNMwT8MDPnzA5Uew1Q/qViHB1h1PSPIQA==
X-Received: by 2002:a17:906:5181:b0:88b:f8e5:3318 with SMTP id y1-20020a170906518100b0088bf8e53318mr11891465ejk.38.1675433049287;
        Fri, 03 Feb 2023 06:04:09 -0800 (PST)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id j9-20020a170906534900b0088478517830sm1412324ejo.83.2023.02.03.06.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 06:04:08 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Paolo Valente <paolo.valente@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2] ARM: defconfig: Add IOSCHED_BFQ to the default configs
Date: Fri,  3 Feb 2023 15:04:04 +0100
Message-Id: <20230203140404.1125850-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARM systems are often memory constrained and more often than not
use slow single-channel storage such as flash memory or MMC/SD-cards.
For any interactive systems (such as mobile phones, tablets,
chromebooks...) the BFQ I/O scheduler will be desireable.

Make sure the BFQ I/O scheduler is available on these systems.

Loongarch, MIPS, m68k, UM and S390 has also enabled BFQ in their
defconfigs, cf commit b495dfed706c4c5873c0dab8930ad6eb1d276a6c
"um: Cleanup CONFIG_IOSCHED_CFQ" where the motivation is that
it replaces the former CFQ scheduler.

Cc: Paolo Valente <paolo.valente@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Collect ACKS
- SoC folks: please apply directly to the relevant ARM defconfig
  branch!
---
 arch/arm/configs/multi_v5_defconfig | 1 +
 arch/arm/configs/multi_v7_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index 60fc52b95690..4cf455c3bdee 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -49,6 +49,7 @@ CONFIG_ARM_KIRKWOOD_CPUIDLE=y
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
+CONFIG_IOSCHED_BFQ=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ee184eb37adc..7a0279a078fc 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -146,6 +146,7 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_CMDLINE_PARTITION=y
+CONFIG_IOSCHED_BFQ=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
-- 
2.34.1

