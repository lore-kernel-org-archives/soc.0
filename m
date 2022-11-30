Return-Path: <SRS0=sDuw=36=arinc9.com=arinc.unal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B15C433FE
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 00:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97361C433D7; Wed, 30 Nov 2022 00:34:38 +0000 (UTC)
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9CF37C433C1;
	Wed, 30 Nov 2022 00:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9CF37C433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arinc9.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arinc9.com
ARC-Seal: i=1; a=rsa-sha256; t=1669768472; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Dl0RA8U0kO1UjckbtQ1yJdxFLb/KaNHJF+O2gUomul3+5TSJaXM4ZTtSnVY4oyp91S0H5HYqprPZzr2fn1xxPnV64l//ondaELKdO/ZcTBy2dDaO4MUKKK/fwAa78wRdP8P+tt5jNY47ONHbzFKbZU1yrLgO4zCjqbfAjh57j0M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669768472; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=tcD2tFxEru39PLp3xQkd+dJ8fltdBcdkPCdXOUfgLMQ=; 
	b=kPpxyUql58FlF5jL0ZC/bd3ViJz3jyIoScXt54RZ2WBNjJY3EfV+nnJTgr1kUWj3P+ukUu41P09Z//pmcTIZTrIQjZD0iGzWsyd8LWqhIBNU6hcHhEqCrHbyI9UFaXM0Ii1TcZv3SvE6MnDYM9rrP0jRgnHBeNPaCZhsb+w5VjU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669768472;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=tcD2tFxEru39PLp3xQkd+dJ8fltdBcdkPCdXOUfgLMQ=;
	b=C0wWEVAU/QWMzQlbb5k8yCh3iVhvV+JnrokYFs4BlK2qcBAIWrnGoqkYLzM6BDZP
	8xTAjjVlOPH6ViL8TBxEOmextmeyNI7gGhs+oZmjeDaDlgtBNyK32/EZ8PWt9VkS0wQ
	mTsqGhrmju1TNOsv5Hv1uMahfDfv+rqjxqIltINg=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1669768471440663.6805885842189; Tue, 29 Nov 2022 16:34:31 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
List-Id: <soc.lore.kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH 5/5] powerpc: dts: remove label = "cpu" from DSA dt-binding
Date: Wed, 30 Nov 2022 03:34:10 +0300
Message-Id: <20221130003410.191837-6-arinc.unal@arinc9.com>
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
 arch/powerpc/boot/dts/turris1x.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/turris1x.dts b/arch/powerpc/boot/dts/turris1x.dts
index 045af668e928..3841c8d96d00 100644
--- a/arch/powerpc/boot/dts/turris1x.dts
+++ b/arch/powerpc/boot/dts/turris1x.dts
@@ -147,7 +147,6 @@ ports {
 
 					port@0 {
 						reg = <0>;
-						label = "cpu";
 						ethernet = <&enet1>;
 						phy-mode = "rgmii-id";
 
@@ -184,7 +183,6 @@ port@5 {
 
 					port@6 {
 						reg = <6>;
-						label = "cpu";
 						ethernet = <&enet0>;
 						phy-mode = "rgmii-id";
 
-- 
2.34.1

