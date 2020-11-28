Return-Path: <SRS0=l92L=FC=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB50BC63697
	for <soc@archiver.kernel.org>; Sat, 28 Nov 2020 16:34:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B4227246CD; Sat, 28 Nov 2020 16:34:17 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70961246CA;
	Sat, 28 Nov 2020 16:34:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5zmvNWv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70961246CA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pg1-f180.google.com with SMTP id s63so6759511pgc.8;
        Sat, 28 Nov 2020 08:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZCLiFWd4J+vKotqakdIB8Vu54cAoqpPX+f9TGuaSpEo=;
        b=K5zmvNWvp4Cin9wOqEKm7Y0y8JbB+WMgD0DzqHxT9NInQCA9b4w1uHvyCjJBzJdsZZ
         7rzTvVddDcuP9zli2c7/XuIapVE5QbyDqIdD0fQfQ0lN4oVjj5ydONJIgWgor0J0bd7V
         klvS8hWTO8uxtmLEHSAk0JKEmVCu7OI2F0RM7hg93tqpZASCaaxFXw0shlEH2fqCI5IP
         aEbssfEa8AyjBbajIIywjM1xz6fI1FIdGaXccS1b+OomaCSkCdw6fe1UUr+zM1UNHPM+
         v6m5Yy3+O7ye+4OEp1NyYTOqPRkXW+1S4+ViXSGFGwqsECDBbns++lvn41MOz0aLiXvi
         tgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZCLiFWd4J+vKotqakdIB8Vu54cAoqpPX+f9TGuaSpEo=;
        b=dPGFeJSMWL8NW/tS9eYA4ScTvC+QniEVDZygCHxivkoMdbATCrnpidSSvkx2XRD/1b
         y7SbVkhIgfHysa4y+ha+0PAIiIlHdeTqnU3Bmpx6J3exzfvizvHR3TmieEv9bLzpz11L
         v3mBt8T5by6dPVRmoIuBP5SgChKDCffsp4fE7UKA1Aka89xPdzwY4kgNX1PRa6fOeSwD
         75mPyxrozzRDx/95dw48WYm5TGMjnf12ZS4gsbGtnB6v4WQi3w3GzInZn/LUq3jhgcuF
         S9ShLa5xIyQiL1B/8JVUaq60YN6uCHx37VKEqLzKGrYhjvhl4JzO/l4o7UfO/HwfvqkS
         G7fw==
X-Gm-Message-State: AOAM533y8IcdWN+1aTkep0sa/IK8rVba5QX8i9Y2p23bdLAoDBV9+DSu
	Z1FAbWXh6pGcMLGe7HIc/ZlvxP3EysE=
X-Google-Smtp-Source: ABdhPJxms06FPMOt1vaSjCpNqcaqLgcapG7a51F4VJ9js0nmohXWUQ6oUFH6rxhDzz+j5MKVjz362A==
X-Received: by 2002:a17:90b:1918:: with SMTP id mp24mr16193503pjb.45.1606581256498;
        Sat, 28 Nov 2020 08:34:16 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id c3sm10909209pfn.67.2020.11.28.08.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 08:34:15 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/5] Broadcom defconfig changes for 5.11
Date: Sat, 28 Nov 2020 08:34:06 -0800
Message-Id: <20201128163410.1691529-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.11/defconfig

for you to fetch changes up to 950be99fccffa920e148fd46e33db4d509e8af63:

  ARM: multi_v7_defconfig: Enable ARM SCMI protocol and drivers (2020-11-27 20:51:34 -0800)

----------------------------------------------------------------
This pull request contains ARM multi_v7_defconfig changes for 5.11,
please pull the following:

- Florian enables the ARM SCMI protocol, and the common clock, HWMON and
  CPU frequency scaling drivers since those are used by ARCH_BRCMSTB
  platforms

----------------------------------------------------------------
Florian Fainelli (1):
      ARM: multi_v7_defconfig: Enable ARM SCMI protocol and drivers

 arch/arm/configs/multi_v7_defconfig | 4 ++++
 1 file changed, 4 insertions(+)
