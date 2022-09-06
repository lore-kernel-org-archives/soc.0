Return-Path: <SRS0=bglb=ZJ=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A51ECAAD5
	for <soc@archiver.kernel.org>; Tue,  6 Sep 2022 17:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 57D87C43140; Tue,  6 Sep 2022 17:53:10 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60351C433D6;
	Tue,  6 Sep 2022 17:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60351C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id o2-20020a17090a9f8200b0020025a22208so8534908pjp.2;
        Tue, 06 Sep 2022 10:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=flM6z/aZfaObx6vFxYOPjGjlbxViOKss6sBC4Qc+hjQ=;
        b=eFIZwLRx3uLBvbGaNPmxLmj0jp/S5xhwz/osy9fHPsxPkSMZNlVz8VI4St7EPXzsnJ
         6j2G1qPE1odjUdAb+1lWOC1WtIFUHhPWDzmo/dm5Na6d47C9xnxdeq1vGzlI5LIdWO2y
         z3hOr49qqCF0PRowYLjSMzptiRPHzdVcK1N5xUHNxY1slofijTNjrYi7U5bqAF7kH6Dt
         i5MMFM2Q/OaPVGg4Q5w2ceLvKrHL3oC0QhOcuM0WaSzEnLtMkILC8fVYEf536gQiMtKL
         XI051Ld1yHsk67f/c6HKTa0LvF0j1rHavTHcemF2mZFf1WHpLd/ha7lrVJnbfNTR3EZ1
         U82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=flM6z/aZfaObx6vFxYOPjGjlbxViOKss6sBC4Qc+hjQ=;
        b=ty9VBIe6cWXNYx23EPN+vK/ce8cNnsoi3kx7wkyXmRsI33vnVmGJArn0Wrj/LRcGbb
         jM36/MojqbcIJ37/u5+DiuSap6WBUB30jtYDBYV+FSCmF76akmEIn2e0VYLILvLjotih
         FnPInD1uFL/zKoUrdjnPKZ/QIfZUfbLqyTwLZ5begswKSHd2ZVViXoTA2JACtMsJBdTJ
         EsWMSFsl+84lKkoVz7LPSiYhUqT5t3XSEezKK43c6iEtvSBeCKDBO4tZM/aXdzaH75oh
         7FaNGCqJOw6BPi3Z+EQmrkurthKVH68XepHjJTIujht1ZJ0W7nyNFtmSE/dAlEImte50
         0+Iw==
X-Gm-Message-State: ACgBeo3ZcIdc4xjxA81WoDu8Bu0nFZ8kxWu2RDbZvfJ6vYkTL4JomR4Y
	jxOEcaMiy77bTLXmALn8CBg=
X-Google-Smtp-Source: AA6agR77VJGd9XphIhSwKRClsidOdx1OdfrRael+fgw+iMaS7Xf9mpXfj8X9627uG2+4eJHFqfJe5w==
X-Received: by 2002:a17:90b:1a91:b0:1fd:c26c:a3bf with SMTP id ng17-20020a17090b1a9100b001fdc26ca3bfmr26499106pjb.213.1662486788617;
        Tue, 06 Sep 2022 10:53:08 -0700 (PDT)
Received: from 7YHHR73.igp.broadcom.net (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id v65-20020a622f44000000b00539aa7f0b53sm10404244pfv.104.2022.09.06.10.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 10:53:08 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	michael@walle.cc,
	Florian Fainelli <f.fainelli@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: defconfig: enable ARCH_BCM
Date: Mon,  5 Sep 2022 20:39:56 -0700
Message-Id: <20220906033957.4377-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 96796c914b84 ("arm64: Kconfig.platforms: Re-organized Broadcom
menu") introduced a new symbol ARCH_BCM and made all of the Broadcom
SoCs Kconfig depend on it, but did not enable it in the defconfig.
Thus, now the defconfig doesn't include support for any Broadcom
architectures anymore. Fix it.

Fixes: 96796c914b84 ("arm64: Kconfig.platforms: Re-organized Broadcom menu")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 91e58cf59c99..4c8b09c6b49f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -33,6 +33,7 @@ CONFIG_ARCH_ACTIONS=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_APPLE=y
+CONFIG_ARCH_BCM=y
 CONFIG_ARCH_BCM2835=y
 CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BCM_IPROC=y
-- 
2.25.1

