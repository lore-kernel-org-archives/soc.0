Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B453BED2E;
	Wed, 18 Mar 2026 11:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773834229; cv=none; b=LZw4pHDjREteDDZ3byqPrPVbdtardDp08xUvL7MnPBp1sM6n95REgTpTTC2ZZyGil/tK5KiFg3Ki/zUsHDmSNMi7wMjjROQUsfkXzd2KqrWGlE+i8lSyRVrn35vakL+wByFMA2jkgKbintRstkJK6haWtb8yjcb+sQBWCORqP8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773834229; c=relaxed/simple;
	bh=mMZrkwBZ+mAI8c6St39IQjGfV1f8ErjjT85U8lpdgaA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Dz6AJrTmuTA7tlCr+8rUvKwDkdc39885ufdQXNpCTJuTSz1m1tnnRVBU/h1gbmeJnN3gvjNlikdFtq8/MoOT5OAvMkH3O5AprsAXx2L2FCxkOwvITNWdQK/BnbDUt2RyT4JZIqpXOUmKqvi95ivdZLeWsmNhuPZ1tMLQDiy6d7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=jpHCgHVt; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="jpHCgHVt"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62IBem7dB1609497, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773834048; bh=I0XE4egujiloS4JwN3oMEE3RFFNH/YbmfcDSzX4Ew+E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=jpHCgHVtbyJC681rg2oCVBGXh2EZYNkTQueHQaU6SJtASr01Pq+CxPat4SgaiW8Pf
	 EvnJOURTQ4lt3Re1v6LFNwYNLR1/0mii8a2qQjZJwe0pcIQWHJnmbBvKGW+v3XK6O5
	 gtXOV9TxLooRwH4hESgb5dk50qOL4ywuJrewna9W/XffqyZpdIQtVRQ0js4JhW4SZF
	 dVYurjMRWrf0HrvZRr5gTzx3HvYqedeZZgMhyIN8Dfdw7qkLPqx62EkDix7L9KA9nJ
	 nkKbH1uice7P92tnNig8fYuNg4hQvQbjVC+kQuKlQ4IKyIM2yzL461un8olKNiUolr
	 1swmLzCYR16BQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62IBem7dB1609497
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Mar 2026 19:40:48 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 18 Mar 2026 19:40:48 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 18 Mar 2026 19:40:47 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 18 Mar 2026 19:40:47 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linux-kernel@vger.kernel.org>, <linux-realtek-soc@lists.infradead.org>,
        <afaerber@suse.com>, <arnd@arndb.de>, <alexandre.belloni@bootlin.com>,
        <linusw@kernel.org>
CC: <fustini@kernel.org>, <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <james.tai@realtek.com>, <krzk@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>
Subject: [PATCH] arm64: dts: realtek: Fix memory node unit-address mismatch
Date: Wed, 18 Mar 2026 19:40:41 +0800
Message-ID: <20260318114047.2804171-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The memory node unit-address should match the first address in the reg
property. Correct the unit-address from @40000 to @50000 to align with the
actual base address (0x50000) defined in the reg property.

Fixes: b095c27fc874 ("arm64: dts: realtek: Add Kent SoC and EVB device trees")
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
This patch series is sent to both Realtek and ARM SoC maintainers.
While Andreas Färber is listed as the Realtek maintainer, there has been
limited activity recently.
---
 arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts    | 2 +-
 arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts    | 2 +-
 arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts b/arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
index 09e544acfd34..e487622424f1 100644
--- a/arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
+++ b/arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
@@ -13,7 +13,7 @@ / {
 	compatible = "realtek,phantom", "realtek,rtd1501s";
 	model = "Realtek Phantom EVB Chromium (8GB)";
 
-	memory@40000 {
+	memory@50000 {
 		device_type = "memory";
 		reg = <0x0 0x50000 0x0 0x7ffb0000>,
 		      <0x0 0x8a100000 0x0 0xdef0000>,
diff --git a/arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts b/arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts
index 9c23d901c49c..f0f810ab8aa8 100644
--- a/arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts
+++ b/arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts
@@ -13,7 +13,7 @@ / {
 	compatible = "realtek,krypton", "realtek,rtd1861b";
 	model = "Realtek Krypton EVB (8GB)";
 
-	memory@40000 {
+	memory@50000 {
 		device_type = "memory";
 		reg = <0x0 0x50000 0x0 0x7ffb0000>,
 		      <0x0 0x8a100000 0x0 0xdef0000>,
diff --git a/arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts b/arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts
index 9fd6976e0d9b..375c18322c3b 100644
--- a/arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts
+++ b/arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts
@@ -13,7 +13,7 @@ / {
 	compatible = "realtek,smallville", "realtek,rtd1920s";
 	model = "Realtek Smallville EVB (4GB)";
 
-	memory@40000 {
+	memory@50000 {
 		device_type = "memory";
 		reg = <0x0 0x50000 0x0 0x7ffb0000>,
 		      <0x0 0x8a100000 0x0 0xdef0000>,
-- 
2.34.1

