Return-Path: <SRS0=sDuw=36=arinc9.com=arinc.unal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C05C46467
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 00:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D0D3C433C1; Wed, 30 Nov 2022 00:34:36 +0000 (UTC)
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA608C433D7;
	Wed, 30 Nov 2022 00:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA608C433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arinc9.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arinc9.com
ARC-Seal: i=1; a=rsa-sha256; t=1669768470; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K089Svxt07c1JoOHDRXkt6d79Wo8EPwGKuOomWQq9pSGSfWQ+gDo2MQ/Ae2MOCnKbZilmcZa+rl+EZbDxsh233b+199sinoYjSyOTvDGAe+6n1p7grnA1ud6D8t1Ed8qU838XkKa6kMSH4mNUj7etDabAz55ba1/Fm8F4pvnEBM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669768470; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=rw2F9BBmZz7hCr2YZL7OfKiCcti+Y/szmYlgYlkB1sE=; 
	b=hQF33EV+VSHjd9tdRXYA3OdESv0a6Ifnol9FxwMfscB0LWKP2Eya46OBgCDTGzWmnkpWrBZ6bsBcJ7F2El24YufP42QloWuD948XQFG/ZMgk+L4BdY2tq+Egkn/luI6s4uDfFNmoxU2ALgWs7wYdpsau/bZFoNHX4WM7UjKxmZU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669768470;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=rw2F9BBmZz7hCr2YZL7OfKiCcti+Y/szmYlgYlkB1sE=;
	b=j0RINKYSJL+lQKPjf55mHpAme2g9N1RrOzoaZoPJOsKa+h0ASywU/Ai/NwTkHsn5
	M4/lFj/RcmOc+626PfhrvkqK/yN4VIPLAO6ohRRs/vvUnxH6Iy3KVWp3zaGM59yNswH
	BDM7egsPToZ0fcVqUFdpvMQZZfTQ0xFQvcExzPfg=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1669768469503889.6619444147411; Tue, 29 Nov 2022 16:34:29 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
List-Id: <soc.lore.kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH 4/5] mips: dts: remove label = "cpu" from DSA dt-binding
Date: Wed, 30 Nov 2022 03:34:09 +0300
Message-Id: <20221130003410.191837-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130003410.191837-1-arinc.unal@arinc9.com>
References: <20221130003410.191837-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This is not used by the DSA dt-binding, so remove it from all devicetrees.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/mips/boot/dts/qca/ar9331.dtsi    | 1 -
 arch/mips/boot/dts/ralink/mt7621.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/mips/boot/dts/qca/ar9331.dtsi b/arch/mips/boot/dts/qca/ar9331.dtsi
index c4102b280b47..768ac0f869b1 100644
--- a/arch/mips/boot/dts/qca/ar9331.dtsi
+++ b/arch/mips/boot/dts/qca/ar9331.dtsi
@@ -176,7 +176,6 @@ ports {
 
 						switch_port0: port@0 {
 							reg = <0x0>;
-							label = "cpu";
 							ethernet = <&eth1>;
 
 							phy-mode = "gmii";
diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index f3f4c1f26e01..445817cbf376 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -386,7 +386,6 @@ port@4 {
 
 					port@6 {
 						reg = <6>;
-						label = "cpu";
 						ethernet = <&gmac0>;
 						phy-mode = "trgmii";
 
-- 
2.34.1

