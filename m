Return-Path: <SRS0=JApN=J6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B84BC48BEB
	for <soc@archiver.kernel.org>; Wed, 21 Feb 2024 15:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F23EC433F1; Wed, 21 Feb 2024 15:53:39 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5FC30C43394
	for <soc@kernel.org>; Wed, 21 Feb 2024 15:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5FC30C43394
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-564fc495d83so1027807a12.0
        for <soc@kernel.org>; Wed, 21 Feb 2024 07:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708530815; x=1709135615; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s6LiTvJMvbPXcFOFTULZCUqQBYVsGw/MmQXT/bOYE7M=;
        b=qtJ+JauEtLC5tExG+8KRR4Xy05D1/iviAh0Q6P0AIKfxfnHpKzGIUJhB8SXhdbOh4x
         0cVS/2N4wV/ClimgBPHACfPzCyeWd89drrqudk735cS3j5nG4illzlB66MfSf4cj1qGP
         /x2eCW9KOVuVM2HidnQ/ZpRDrf0AoAB/hcUit+Yc25rzwuJRK8wvhAnWLuVKjACvcp3h
         M9GaAfrzeIaQ/TCP91jvfG3RqqsH29Iu0MqST+lQSdkUKHMk9fSfeQQ9/1rkjYog+h/k
         wvr9zmh0UtnTFLVX1sWQ4neHW+sPnXWQt+IC2KEC9M1BDXIYXJShpOC9I+TbmeTqD/LL
         YIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708530815; x=1709135615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s6LiTvJMvbPXcFOFTULZCUqQBYVsGw/MmQXT/bOYE7M=;
        b=eKwQsTx3XxEEaGKxnZbDNC76aYUxW8uQABOOTEKPVnwIZF7Rsx1z81ub+1RskQcIqm
         pdYDNQ88goAosxtRKFFbnlSpW6gcizi13NKv04UgpHYefdP+QuirrV3y51Lr3qPmHk/o
         FVsDVDJ27U6Ak8pooU45dPYiXuGsvsLKYhdVJWrZznRvgXtPQIGiGXXJbhKDTsOFMhuZ
         gXECgGRPMpZc9/dzohYrrDB84HBUYCpk73pBM7tKRrMyIVjQ/uDLC9HRlze8TAGHu+zf
         XiWD9KJIUNX8Npu23uXhNIZTqy8XiIFBa6swJdxVh4s5cDBc8T/cO1SHacpcX7cHALYY
         prXw==
X-Forwarded-Encrypted: i=1; AJvYcCXehXsv5c/VYcQdiU/KlDDfzbsLfeEfinPXOApmO/jzkDEECXScyPUIUf79zap7ErQaIi5SgbhgNMsemNoMHw==
X-Gm-Message-State: AOJu0YwX22AuR3Q7J0JL0gHGyIiIAvvZxpnSz34PkvOzynY5X9Sm1a+q
	PWhyBc4b5utZ+s0MwWPtZelYGCeTqv/QeDsl22Zh/25cbjMiLxim1UlchT68YXs=
X-Google-Smtp-Source: AGHT+IFE4zwxFjCJHrZAERl3DSemXFsfva9O1/7EkX0FhQTwRi1fB5VCpX71HZcX6YL+bcfO1EQk+w==
X-Received: by 2002:a17:906:c794:b0:a3e:9885:954a with SMTP id cw20-20020a170906c79400b00a3e9885954amr6409023ejb.65.1708530815542;
        Wed, 21 Feb 2024 07:53:35 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id ll5-20020a170907190500b00a3f2a25d84csm927556ejc.41.2024.02.21.07.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 07:53:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: defconfig: drop ext2 filesystem and redundant ext3
Date: Wed, 21 Feb 2024 16:50:33 +0100
Message-Id: <20240221155033.44160-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ext4 filesystem can mount ext2, so drop CONFIG_EXT2_FS to make builds a
bit faster.  Drop also redundant CONFIG_EXT3_FS, because it just
selectes EXT4_FS.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e6cf3e5d63c3..08a4a3102f08 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1571,8 +1571,7 @@ CONFIG_RZ_MTU3_CNT=m
 CONFIG_HTE=y
 CONFIG_HTE_TEGRA194=y
 CONFIG_HTE_TEGRA194_TEST=m
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
+CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_BTRFS_FS=m
 CONFIG_BTRFS_FS_POSIX_ACL=y
-- 
2.34.1

