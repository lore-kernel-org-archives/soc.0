Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50982C030E
	for <soc@lists.linux.dev>; Tue,  5 May 2026 10:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978722; cv=none; b=crThKsrbLz2junS1BVjg89vhFlmPFlHZ8bJxqiHktNb9fgcrWoAxBklKCEhzqTmXnKibD48k05OCy65tCn0DDfagxy4D9+OIdLMAZwC8wqniDcrKoMklyb1XBXiB9bwtrfBAPi1vg/7rfyMDICV3pIt5hhw4BWcJyHz120At/K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978722; c=relaxed/simple;
	bh=s2ZgeklFxlgyOz1Wnu5KDvbApKc575qGLfg7+7E0+K8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MYVmi6548lnp4+Icox5F1i622/vp385u/ZlFyecjtsJJRvvHNnnuXS4YMWSVSx0ur5s2YBU6ONeTFW4cQWkBIH2IauCtgdp6OBAmm6TEInQ6YCkNzV8EZewVGXdOIOSGnzL1w7Ak+KgeX+Z/VcwCOrXbTdhT9B6DOWwh0m4Xhj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=XQ67Wtdx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="XQ67Wtdx"
Received: by smtp.kernel.org (Postfix)
	id 778DCC2BCB9; Tue,  5 May 2026 10:58:42 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F741C2BCC7;
	Tue,  5 May 2026 10:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5F741C2BCC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 645AwcN431171996, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1777978718; bh=tAJhk27tpW5Xpntp31c3+nM/LaggP06QbC7a84S+snc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=XQ67WtdxH3ZXsJEykG4/BOM036OW3bkwxxETnEiDCe6u5CUK3LTuzsK9tZwvgk16O
	 /uQ3w/cieB89hZ8HiKdf02fj0G4j0I6Wr5tledW8f2v8k9DfHXP6Cfp+qP++fEzX16
	 JY/sWg7jYmrdVdThsOq2BZ9CqF5lQJFjxu3IBlvxsd+bCZZMbYBce0JHj03XOs4mb3
	 jSY6Y89y0g0Z3gYpCokTQW0075l/mKe3BDmqR4nLITtIMjKzkKNnp27uekZncLPNxh
	 A0+s7VAXy2fLPDoi3ILhb7FnyUzGfxIYdHhEtWqw4ribyAqjWbMY3f3qDNxUcY+tV4
	 xxEa/7owRU2sw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 645AwcN431171996
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 May 2026 18:58:38 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 5 May 2026 18:58:38 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 5 May 2026 18:58:38 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <soc@kernel.org>
CC: <james.tai@realtek.com>, <eleanor.lin@realtek.com>, <afaerber@suse.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] ARM: realtek: MAINTAINERS: Include pin controller drivers
Date: Tue, 5 May 2026 18:58:37 +0800
Message-ID: <20260505105838.1014771-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260505105838.1014771-1-eleanor.lin@realtek.com>
References: <20260505103955.1010130-1-eleanor.lin@realtek.com>
 <20260505105838.1014771-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

No dedicated maintainers are shown for Realtek SoC pin controllers,
except pinctrl subsystem maintainer, which means reduced review and
impression of abandoned drivers.  Pin controller drivers are essential
part of an SoC, so in case of lack of dedicated entry at least cover it
by the SoC platform maintainers.

Acked-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b66b739ae2ca..0f8b8264e6e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3356,6 +3356,7 @@ F:	Documentation/devicetree/bindings/arm/realtek.yaml
 F:	arch/arm/boot/dts/realtek/
 F:	arch/arm/mach-realtek/
 F:	arch/arm64/boot/dts/realtek/
+F:	drivers/pinctrl/realtek/
 
 ARM/RISC-V/RENESAS ARCHITECTURE
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
-- 
2.34.1

