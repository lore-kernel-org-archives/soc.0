Return-Path: <SRS0=Fsd+=HG=nvidia.com=spujar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE86C433DB
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 04:21:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DF07864E06; Thu,  4 Feb 2021 04:21:30 +0000 (UTC)
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com [216.228.121.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6876564DA1;
	Thu,  4 Feb 2021 04:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6876564DA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=spujar@nvidia.com
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B601b76490000>; Wed, 03 Feb 2021 20:21:29 -0800
Received: from HQMAIL105.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 03 Feb 2021 20:21:29 -0800
X-PGP-Universal: processed;
	by hqpgpgate102.nvidia.com on Wed, 03 Feb 2021 20:21:29 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb
 2021 04:21:29 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb
 2021 04:21:24 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 4 Feb 2021 04:21:19 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
CC: <broonie@kernel.org>, <jonathanh@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<--cc=linux-arm-kernel@lists.infradead.org>, <arm@kernel.org>,
	<soc@kernel.org>, <sharadg@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
	Oder Chiou <oder_chiou@realtek.com>, Bard Liao <bardliao@realtek.com>
Subject: [PATCH v3] arm64: defconfig: Enable RT5659
Date: Thu, 4 Feb 2021 09:51:16 +0530
Message-ID: <1612412476-24768-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1612412489; bh=RNhRnyFlb2nPp8zHaebXuAihysUSSrPgXpjl2Q5IAZk=;
	h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type;
	b=Sx4pCWjaxWHnaTOvRAff1Gty5641ZSS+gw8DE1b3PlyFjST8O0Wce5BMGH38NEOYL
	 AUbAgEEnvU2ER0gZHUp0F81J74L2gANrU7fS+p9kE/PIFsdDLczmQY63tX+bOX+31o
	 6e1/Bw/7jpfF6VNc9qEhLCikaAIDR9N1ic/omqd77s0yRh32EsiNvIl+Wb3WP1oUbq
	 UQeXoDr4V4rtFeiPmrLgHguwQIl/p1Ue3429C9BF4EnxHkVaVNtZX5af1VBs+Bv3Wc
	 /cyxiHkj/elO+cbfDTXI6v1UuNKOcvXbCi2rAscGtL0PTEzifZYQ82aRbDLsKVxdmj
	 8SLvn2ALM2l+A==

Enable the RT5659 audio codec driver. Jetson AGX Xavier has RT5658 codec
which is compatible with this driver. This enables user to test external
audio.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Oder Chiou <oder_chiou@realtek.com>
Cc: Bard Liao <bardliao@realtek.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
 This was part of original series,
 https://lore.kernel.org/alsa-devel/1611944866-29373-1-git-send-email-spujar@nvidia.com/

 Since other patches from above series are already applied, sending this
 separately now.

 Also merging emails/groups from the resend version,
 https://lore.kernel.org/linux-arm-kernel/1612260252-31582-1-git-send-email-spujar@nvidia.com/

 Changelog
 =========
 v2 -> v3:
   - Updated commit message to reflect usage of Jetson AGX Xavier
   - Added 'Acked-by' tag from Jon

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d628125..496fcee 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -767,6 +767,7 @@ CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
 CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_PCM3168A_I2C=m
+CONFIG_SND_SOC_RT5659=m
 CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
 CONFIG_SND_SOC_TAS571X=m
 CONFIG_SND_SOC_WCD934X=m
-- 
2.7.4

