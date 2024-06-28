Return-Path: <SRS0=iiGd=N6=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BAFC2BBCA
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 09:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC3ACC116B1; Fri, 28 Jun 2024 09:50:51 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF767C32781;
	Fri, 28 Jun 2024 09:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF767C32781
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719568249;
	bh=qTzcwmP1nuaEPFNJ2NL4qi+LEvKag+OkYl7iKtyfQck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ag+6Grtwa9KaHBfOLlE3drmAudUuo8VOXBkvAtCF7TZNWm2AZX0Kf1tgLrX2Qb481
	 8upbSWHg5bdgGLa7IwFPS8gw73CXbsLTBR6IOP6tmEMTGwip9u1fBG0yW9aC9kBXJ0
	 BPfi9e8R9wyL4JMT0iR3B403ZO2nUJ43FcTM0zTL812MN4/jwZ0YD3zdgqDClX+TzI
	 MYtsSAoz+t3RL9YKXRoIyXwk9Kp221H36YqqjqRT7PeuhlcSZt9lUmzFmbONcNDigy
	 v168dDuMYJ8EF1W1YqYdqI4RO9WeeAex2BWH+Xu+QMp0O0VZEYO0B8x97d86tYSHPD
	 wCQX0ceHPcUHA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7426937821A8;
	Fri, 28 Jun 2024 09:50:48 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/1] MAINTAINERS: ARM: airoha: add entry to cover Airoha SoC
Date: Fri, 28 Jun 2024 11:50:43 +0200
Message-ID: <20240628095044.132276-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628095044.132276-1-angelogioacchino.delregno@collabora.com>
References: <20240628095044.132276-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Airoha SoC is not covered by any maintainer entry so relevant patches
can be missed.  It seems Mediatek SoC maintainers were covering some
parts of Airoha and Airoha itself is subsidiary of Mediatek, so assign
the Airoha maintenance to Matthias and AngeloGioacchino.

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d6c90161c7bf..1ef2a3fc5d53 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1909,6 +1909,15 @@ F:	include/dt-bindings/reset/actions,*
 F:	include/linux/soc/actions/
 N:	owl
 
+ARM/AIROHA SOC SUPPORT
+M:	Matthias Brugger <matthias.bgg@gmail.com>
+M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Odd Fixes
+F:	arch/arm/boot/dts/airoha/
+F:	arch/arm64/boot/dts/airoha/
+
 ARM/Allwinner SoC Clock Support
 M:	Emilio López <emilio@elopez.com.ar>
 S:	Maintained
-- 
2.45.2

