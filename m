Return-Path: <SRS0=1men=FT=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26F0E9270D
	for <soc@archiver.kernel.org>; Thu,  5 Oct 2023 15:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8916FC07615; Thu,  5 Oct 2023 15:58:00 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7279EC433BF
	for <soc@kernel.org>; Thu,  5 Oct 2023 15:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7279EC433BF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso1197001f8f.0
        for <soc@kernel.org>; Thu, 05 Oct 2023 08:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521470; x=1697126270; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4JuZ7X35qvWXE20Wsg1MXbq38lz7Ou1Ypqzl+RcadA=;
        b=f+WJgNtmwgNxR5tSKoNqkZhqAycdRb/DFgosuXG/FyuY65ZwNH77erOXGNBUxNDOr+
         YWqvTNjpJhz3dY6bzbgfI2OD3MF4BEw1TEz3tkft46tnNuFveOVXG8vmAb3BosXCDLii
         iRqP86pgPywasgq01YY/j2uFk2Y/MdWp/kDkYbNAEoyLNz/1j/6/FrbbQQHBidDjE4lU
         q+CoF0VHt+5zV0BjSYyVdl2Yh1z5TAO0f1A6ia5hjzuMCPBGJRclWdBhmpsVUYVwmB44
         eDUD4IZaCX0MQpD+aEbqAsgW7vvN0F/G45u360EMzeAY7ETed91W9/NDosZeBRBSMBYH
         zumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521470; x=1697126270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4JuZ7X35qvWXE20Wsg1MXbq38lz7Ou1Ypqzl+RcadA=;
        b=rFQeB+rPRdFVZSAkYk0IZcFSa9BPZyEumXZMzajgOSwxUhH8oT/1m95/Sr36MJnSTR
         dgIfGTCozBJi24llKDoQEvZtXQnD7Ln/nqFSsthbVMrGheRvbuWo3jRrCCeFdUNzAh5Q
         AE9Hcd+SMOdmGwDevPYnC0h8T4Bj4e9COg4bup96pBHrmkOL3ukaqJ4FSCloaGas/nIX
         w5vEm5kMDhDQmJ7p6euJJjAUH5/ZUO+uRn/KhE3hZw5ezpiyDZasZQ8C1Fr+ZIDfq0CG
         wLWxkGmEe5hg1GNGcx12jLbR4RC5Q67LN4GOd3siM1GyRO6sc+e5DtQyb2nHKZh0Z9v7
         k6Bw==
X-Gm-Message-State: AOJu0YzM5z7ANqurskmKhxMpZKT4OXBKvNbztWfDN5GAqXfr907FMzqM
	Q5++5RfV1y8ERAbe8xq0eq1tNw==
X-Google-Smtp-Source: AGHT+IFbZgmrAFgMgn9TqyI9AVF1sigX3yfBCAI0y1Q+AU/F8Aul93TO5hp6QuL8KkpRC2ND2wHS9A==
X-Received: by 2002:a5d:4b4f:0:b0:31d:8fed:c527 with SMTP id w15-20020a5d4b4f000000b0031d8fedc527mr4634488wrs.42.1696521470518;
        Thu, 05 Oct 2023 08:57:50 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:49 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	cw00.choi@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH 20/21] arm64: defconfig: Enable Google Tensor SoC
Date: Thu,  5 Oct 2023 16:56:17 +0100
Message-ID: <20231005155618.700312-21-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Google Tensor SoC to the arm64 defconfig

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5315789f4868..8a34603b1822 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -41,6 +41,7 @@ CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_GOOGLE_TENSOR=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
 CONFIG_ARCH_LG1K=y
-- 
2.42.0.582.g8ccd20d70d-goog

