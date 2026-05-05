Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076AE382396
	for <soc@lists.linux.dev>; Tue,  5 May 2026 10:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978722; cv=none; b=tauWtdwPb38OF7jr6il6kxHqbKIzENq9LddVakR+2g2sCTCXqEmVQzhxJvvjl5GWuIFLtIzg+VPxwlCuQfl2Xbje9D72F34EfuTOaTN2Urru7NAyZ7o0TmRLB+Dy9zGjwul5v2zNDzSgmU/UA1+aq1aJExIQz/BGAvGuoI5Zn8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978722; c=relaxed/simple;
	bh=+TI5vsVQxIRaX64nbDgruf049V5My5Wp2bprF8ZD6ZM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KLKhUct6qQnZjA6z0RCyuWHgj6sZhjpbcz1L+odyrKXmtryb54W1Sm/YH8FErXCxo39p+hK4nsw+316H/eO31B8u8fYmceVCmuJ5em+mqRCmxZJMe9uH/lXkB/cYDU3gxze5Np3uRdEy6Nq4iNDtqSJImtz7cDuMZYkbYWT4ntQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=BSAwxvNn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="BSAwxvNn"
Received: by smtp.kernel.org (Postfix)
	id A6D79C4AF0B; Tue,  5 May 2026 10:58:41 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD7BCC2BCB4;
	Tue,  5 May 2026 10:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BD7BCC2BCB4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 645AwcMuB1171994, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1777978718; bh=+weT3KNEWHRZNkAbVSTMGJxpE357XP50uaxJaJN6zaQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=BSAwxvNnxeKq53eNbASK9q+fR0UVjwn053a9HQEJnofJaGi6PsbHM7JBGwxw0MnRA
	 4YeEd7dIj3+ECjtk09LkoBgdAxv1fxnsOcw/UlW0XZ/UHh0LaQ4U79HkqSUrBN1o0V
	 mqfh6z2j3SqYnpD2PHb19kZN9EdaKRCNyw8ktE/TCFZouPqWfejeVYYHxyLcV/uDl4
	 b3ooxEghLByozK0BBQOGA9xp07UKGwCHTt5G6Fw5CiV334esHKWHuGrL/bOglwzzKr
	 hltxjeYshh1MctPBPk4qRks+i3ySyCCA9OnS7Tyv3nkMlSn3OMGOkG+SB/Hu6D655I
	 cYqWn3m1UE5kA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 645AwcMuB1171994
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
        Linus Walleij
	<linusw@kernel.org>
Subject: [PATCH 2/3] arm64: dts: realtek: Add pinctrl support for RTD1625
Date: Tue, 5 May 2026 18:58:36 +0800
Message-ID: <20260505105838.1014771-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260505103955.1010130-1-eleanor.lin@realtek.com>
References: <20260505103955.1010130-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add the pinctrl nodes for the Realtek RTD1625 SoC.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 arch/arm64/boot/dts/realtek/kent.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index ae006ce24420..8d4293cd4c03 100644
--- a/arch/arm64/boot/dts/realtek/kent.dtsi
+++ b/arch/arm64/boot/dts/realtek/kent.dtsi
@@ -150,6 +150,26 @@ uart0: serial@7800 {
 				reg-shift = <2>;
 				status = "disabled";
 			};
+
+			iso_pinctrl: pinctrl@4e000 {
+				compatible = "realtek,rtd1625-iso-pinctrl";
+				reg = <0x4e000 0x1a4>;
+			};
+
+			main2_pinctrl: pinctrl@4f200 {
+				compatible = "realtek,rtd1625-main2-pinctrl";
+				reg = <0x4f200 0x50>;
+			};
+
+			isom_pinctrl: pinctrl@146200 {
+				compatible = "realtek,rtd1625-isom-pinctrl";
+				reg = <0x146200 0x34>;
+			};
+
+			ve4_pinctrl: pinctrl@14e000 {
+				compatible = "realtek,rtd1625-ve4-pinctrl";
+				reg = <0x14e000 0x84>;
+			};
 		};
 
 		gic: interrupt-controller@ff100000 {
-- 
2.34.1

