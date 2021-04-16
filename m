Return-Path: <matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587AEC433ED
	for <soc@archiver.kernel.org>; Fri, 16 Apr 2021 14:39:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 372A161222; Fri, 16 Apr 2021 14:39:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21F6861166;
	Fri, 16 Apr 2021 14:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618583976;
	bh=58vezcahFy6vxtKIO3Bsb/7Nc5SiDgR7ddh2WchddHQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r96BDK+csmTKWg7xLLHTvz8NkDa2MqhsFwkYxT6JycAUoNqzSkavXd4P21Dvv0y1Q
	 7N9IS27BqGw2P/r+M7kPsCAHDvkycmkART2gkvwJNQhbfiz7zB0CqeONqj6QEjXf9+
	 xeawciVo6Gx17O/w4VKue0+mlSGwyHodMW1tFDmjkuS8w/eUVp9aMDZOgcYHsn1vrr
	 k/hIisWV6YnqDn8aiLro2xdM/9xp+Dd/PSKbv2sGDVecM+BlgTwWxm//Pze9EuWdgy
	 ZNhcfHLAIuHjQ5ky6vRJNy9yIvJT77jytrRSrMjXoSGmlLuqjatsH1Akb4TztKQEW4
	 n1W8TSyAX4yww==
From: matthias.bgg@kernel.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: mt8183-pumpkin: fix dtbs_check warning
Date: Fri, 16 Apr 2021 16:39:22 +0200
Message-Id: <20210416143923.23406-2-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210416143923.23406-1-matthias.bgg@kernel.org>
References: <20210416143923.23406-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matthias Brugger <matthias.bgg@gmail.com>

Fix unit names to make dtbs_check happy.

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Link: https://lore.kernel.org/r/20210414144643.17435-1-matthias.bgg@kernel.org
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---

 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index eb6e595c2975..0aff5eb52e88 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -32,7 +32,7 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		scp_mem_reserved: scp_mem_region {
+		scp_mem_reserved: scp_mem_region@50000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x50000000 0 0x2900000>;
 			no-map;
@@ -55,7 +55,7 @@ led-green {
 		};
 	};
 
-	ntc@0 {
+	ntc {
 		compatible = "murata,ncp03wf104";
 		pullup-uv = <1800000>;
 		pullup-ohm = <390000>;
-- 
2.30.2

