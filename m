Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0F4C433DB
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 17:18:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2078A64E99; Wed, 10 Feb 2021 17:18:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D1AA64E7E;
	Wed, 10 Feb 2021 17:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612977536;
	bh=HOJJQK2Wbw/T/wpENVoHq52Xn3TLKJjmr4NIAslcCMc=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=bdOkZ9pYngNNSmKqdALiPnB+H3QT3fZ/IvrTBdSkxCQOc+7azsWiTr34gif7zY16O
	 bvcbyiyzpec0G3Cv4ayWXOf6e6FkcRFkXg5Y/J6FuBp45ABxZ219aWF15+a9CLyz/M
	 /GC9QUQp/8sZ3Ro83hntnKNEzSP+Xcm4bxT8fmM8ue3gd4cpq1wfDc+XAX7GKZ+pxn
	 BkcxrWYZUzg/ClSQBdux48onPAUEBZWznkfO9CNqInMq73ulLc4rcwLuZzQOfG6BnN
	 8Xsk8gq5rH59k8owYYOvu4e46QTtczMO1ATOMB7umzrzT+9E5QBPqGtBGu9QkrUMg1
	 YMomVVBXOEfgw==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 01/11] arm64: defconfig: enable Intel's eASIC N5X SoCFPGA and Keem Bay SoC
Date: Wed, 10 Feb 2021 18:18:13 +0100
Message-Id: <20210210171823.333802-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable in defconfig two Intel ARM64 architectures: the eASIC N5X SoCFPGA
and Keem Bay SoC.  This allows compile coverage when building default
config.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5348c0be2fcf..008314d8d1af 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -29,6 +29,7 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_ACTIONS=y
 CONFIG_ARCH_AGILEX=y
+CONFIG_ARCH_N5X=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_BCM2835=y
@@ -41,6 +42,7 @@ CONFIG_ARCH_K3=y
 CONFIG_ARCH_LAYERSCAPE=y
 CONFIG_ARCH_LG1K=y
 CONFIG_ARCH_HISI=y
+CONFIG_ARCH_KEEMBAY=y
 CONFIG_ARCH_MEDIATEK=y
 CONFIG_ARCH_MESON=y
 CONFIG_ARCH_MVEBU=y
-- 
2.25.1

