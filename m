Return-Path: <SRS0=/q7z=T3=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B6AC433EF
	for <soc@archiver.kernel.org>; Wed, 16 Mar 2022 15:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C90BC340E9; Wed, 16 Mar 2022 15:43:36 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBE8AC340F0
	for <soc@kernel.org>; Wed, 16 Mar 2022 15:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BBE8AC340F0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 941873F338
	for <soc@kernel.org>; Wed, 16 Mar 2022 15:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1647445413;
	bh=XuRPjb+L9Lv30fCs29S3sfbbciGexy5s6gIsD7rnkDc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=twAFJO9C6GYO3DFzKSttKy3YJZmUTgI4G/YaMiUr1FFA+efWROHV/togxlq8h5Fxw
	 bu8EoFwrnQ0kZ5oGX4qVnsTHF9/NXp7HltnZ5+BkXnL5czpYDgP62uLbvUcKMxCQgQ
	 sFoKwZ1D7i3lKC+9ckmil6cZQ+LqidoPL0N+FdEThLgTCIr2QEmp6/D2TQchQZll7P
	 f3TCmf5pLWsggnbZW2llV23eQVkrJpaudTsps3e2cKp0Ye8+k9Zdgmm3aSbbMBWZHb
	 i6FXn9Ns/xux2mEoe/d+vysM23/zrVCND+N5W9oIwx3YM3onhCQxsVX/Q/p3kr2cbr
	 p92yS+W+iTC9g==
Received: by mail-wr1-f71.google.com with SMTP id t15-20020a5d534f000000b001f1e5759cebso701805wrv.7
        for <soc@kernel.org>; Wed, 16 Mar 2022 08:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XuRPjb+L9Lv30fCs29S3sfbbciGexy5s6gIsD7rnkDc=;
        b=rPDKvHxL4dpjN2dqDyRi/D5KAWE5NMql9RM9ZjvSPeGQNpcUpvHFffpjj1enC1gHVW
         4ZFv9dVNnPUm+fGkpxOG8JcmDvNfICxpwmtW7lzHPXszkOEtMol07BUklF8T6ru34Xt0
         mRAVb3pom/jOwtHjIP+/g2rmfLQBQNqaCCsNpvQyqHvh1LflCoKm/yyeoUjbL9RX3/gp
         mp0fc/S33FfQp0NlBGbQhb/z7MSPIEw6zT6j+KR9yR3Yd8r6tNf9o6XGBlTp8l4l+E8w
         G5Z7jWZNHuseeqmMqvPBWqkpWOcZwmyK/pNm0bBAYp68lOXp9GnoeWNj6YK2hRqQQjHS
         gkRA==
X-Gm-Message-State: AOAM532fmauG83svKxYWT9l4PC0HdllF9llq2yAeI/ZwsVjKfz0c0czk
	R5bLcLqWjeGxVA7uJQ24wCfHMdz85C/wuzbNSEp48R4i23yS8tvjnG6Gt+55vHvH0FT26btla/K
	7S6rIssy9fvF87/ySepIKwwM=
X-Received: by 2002:a05:600c:1f05:b0:38b:842e:9a19 with SMTP id bd5-20020a05600c1f0500b0038b842e9a19mr224677wmb.71.1647445412970;
        Wed, 16 Mar 2022 08:43:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJWB/QmBT0sFKxk6uBzZE6I5fWazwBfnQLJi8R4rhbJgCpUF3/R+xOC2qPTjJW4nZl1ZEa3A==
X-Received: by 2002:a05:600c:1f05:b0:38b:842e:9a19 with SMTP id bd5-20020a05600c1f0500b0038b842e9a19mr224664wmb.71.1647445412737;
        Wed, 16 Mar 2022 08:43:32 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4f07000000b00203db8f13c6sm1918907wru.75.2022.03.16.08.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 08:43:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: krzk@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 2/2] ARM: defconfig: add SMB347 charger driver for p4note
Date: Wed, 16 Mar 2022 16:43:09 +0100
Message-Id: <20220316154309.436028-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220316154309.436028-1-krzysztof.kozlowski@canonical.com>
References: <20220316154309.436028-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Jücker <martin.juecker@gmail.com>

The Summit SMB347 charger is part of the P4Note family of devices (e.g.
Samsung Galaxy Note 10.1 (GT-N8010/N8013), enable the driver in exynos
and multi_v7 defconfigs.

Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
Link: https://lore.kernel.org/r/4f1f6a4f8200855d07f3faed80ec5cc320e40941.1643919230.git.martin.juecker@gmail.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/configs/exynos_defconfig   | 1 +
 arch/arm/configs/multi_v7_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index cae09010a799..aa061074db78 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -158,6 +158,7 @@ CONFIG_CHARGER_MAX14577=y
 CONFIG_CHARGER_MAX77693=y
 CONFIG_CHARGER_MAX8997=y
 CONFIG_CHARGER_MAX8998=y
+CONFIG_CHARGER_SMB347=y
 CONFIG_CHARGER_TPS65090=y
 CONFIG_SENSORS_LM90=y
 CONFIG_SENSORS_NTC_THERMISTOR=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 8863fa969ede..3062dc93eb15 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -493,6 +493,7 @@ CONFIG_CHARGER_MAX14577=m
 CONFIG_CHARGER_MAX77693=m
 CONFIG_CHARGER_MAX8997=m
 CONFIG_CHARGER_MAX8998=m
+CONFIG_CHARGER_SMB347=m
 CONFIG_CHARGER_TPS65090=y
 CONFIG_SENSORS_ARM_SCMI=y
 CONFIG_SENSORS_ASPEED=m
-- 
2.32.0

