Return-Path: <SRS0=7jOf=OA=gmail.com=romain.perier@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901D5C433EF
	for <soc@archiver.kernel.org>; Fri, 10 Sep 2021 19:03:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6ECCC611CE; Fri, 10 Sep 2021 19:03:45 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47C5E611C3;
	Fri, 10 Sep 2021 19:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47C5E611C3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id v10so4013896wrd.4;
        Fri, 10 Sep 2021 12:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SSna1bEaXtn8m7SSEUg3SHS/YUvgM9x34Z5EWR+22QI=;
        b=qdMQkcOMFEYeenP2UwasQiTiy8VmD3c1HUKLM7J/cUCaTaFWDnvpt4zhxpntp5S2q7
         0sbagO37+h8fm9IeszfwDuMPGFYP/f7YRhVZIS2zsOjMikNBQd39+BSuuZFc62FsI0Dn
         wO8Pcx+LP+rxvioAT1jQtJq4btd9DAn4qplze1MFOxwUf8uDgvHPO5UlvGjZhWsM725w
         ZLktSyr++t066WlY7KH3O6xY27k36rJd7WYn7VOhSRkwbVt44lgv0utKk2wDnMu1LSrm
         AEe4A/sixVEl97WNl6K2fXVfSwa/mcAlhEm5EaA24K5Ec8K6ARViHgt8NXjAdkvxof4A
         DRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SSna1bEaXtn8m7SSEUg3SHS/YUvgM9x34Z5EWR+22QI=;
        b=ZSmmB7eq5LJ4xAm4mubVue7zJY49M9nW1yrIAygumF17GhwCCp1t7V72HtKld51C9T
         271KVtz/4fGX0qZu0UtrDPnu2BPk1LQeZ9xMbt8TFAHV5Ty4CW/09SBmr+v8jiLAB1Su
         EDu5kuK6r0bE4NkyKd3VB97RG8BEtT5PnJJJm/sT+IDkv0DqPTBEUTrgfgGaC6v6irUC
         9cfJTZ5aG2uF1XEszRDFoADwO+kyOS8FDah54mBx51NBpavf6Lbnw5R4ezg0P2eav0P9
         qhBovtVbFMWdYw57VlBlNjxdWHdjQtp1uEfOO9ittxREVt+p584XOQdwW8vk4XZTlc6W
         LOyA==
X-Gm-Message-State: AOAM530Y2rz6MX8+jwB5HDEPqb2c5dLmzUVOYrVqAe7vJ7hYzp+hLRW+
	2+MU+MLVJCLtUcy+HwKiY0MjjjNKqPI=
X-Google-Smtp-Source: ABdhPJz5rIXeHcTGNtG6rhjzryeNOoNfS/iDrkj3d5W/OlUnPzP2McfiAHb+seXjC26tv5NXeJ67Uw==
X-Received: by 2002:a5d:534c:: with SMTP id t12mr11508236wrv.219.1631300623991;
        Fri, 10 Sep 2021 12:03:43 -0700 (PDT)
Received: from debby ([2a01:e0a:a6d:a8d0:7ff4:8f61:5574:9f95])
        by smtp.gmail.com with ESMTPSA id h18sm5547228wrb.33.2021.09.10.12.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 12:03:43 -0700 (PDT)
From: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Daniel Palmer <daniel@0x0f.com>,
	Romain Perier <romain.perier@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ARM: mstar: Mark timer with arm,cpu-registers-not-fw-configured
Date: Fri, 10 Sep 2021 21:03:19 +0200
Message-Id: <20210910190322.27058-2-romain.perier@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210910190322.27058-1-romain.perier@gmail.com>
References: <20210910190322.27058-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vendor u-boot does not configure the arch timer correctly on
MStar, let Linux do it.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index 2273295e140f..982dba9d28eb 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -39,6 +39,7 @@ arch_timer {
 		 * u-boot is broken
 		 */
 		clock-frequency = <6000000>;
+		arm,cpu-registers-not-fw-configured;
 	};
 
 	pmu: pmu {
-- 
2.33.0

