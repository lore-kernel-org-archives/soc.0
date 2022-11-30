Return-Path: <SRS0=sDuw=36=arinc9.com=arinc.unal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1105C4167B
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 00:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B1E9C433C1; Wed, 30 Nov 2022 00:34:30 +0000 (UTC)
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81FBBC433D6;
	Wed, 30 Nov 2022 00:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 81FBBC433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arinc9.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arinc9.com
ARC-Seal: i=1; a=rsa-sha256; t=1669768464; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BI8B7NJh/MwkIlozkA4iC8Zv1Z71qcjv7PB16oQOp16wktbcXro1OrDVcWyyNtqWX+cFupiF567r8Huf0WuEaxFgTAELM0BGTrIh0nGB3bDWhmAvuiZonvHGMZ5kwXJfHlAXVTapM/h2ygeJujWmvgpCGsLYhXFeJ7CVbzZiouE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669768464; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=uPoI5XfZ23UUuypvg5x1t4pcYyKf1wgCFVtGI5ZTQ+s=; 
	b=CK+ljQjTZtRXW2m3d/WFqpiWofql/VgbO206FH9M+RKdk4HCHmTmQRkZ3qCmiG0SqCW7vP22rvRu3ymxX87HE4+ADW9cjdRwPi9Fq4eCs1upKtNSXNGsfcH7PEjcLf7DbxIER4VRo9Daq0Q6PcatBZ7s0qHfbD9LHp8I+gVb4XM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669768464;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=uPoI5XfZ23UUuypvg5x1t4pcYyKf1wgCFVtGI5ZTQ+s=;
	b=WW6FkiLOxwFsWntfZKlDT9C7pl4472yDFD6VC/RRyLg/FlC5F0E3iPwACcPHGXf8
	sDM6cmjXETW92/6Pt9M+uQMye1+XmalJzd/kDll20iULshIgrNKf7VZ0XgTJRXcWV6I
	NI2okEnT90aIKaXcdCcivBAf+l8IURDqWWmCUxng=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 16697684630521018.772695410231; Tue, 29 Nov 2022 16:34:23 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
List-Id: <soc.lore.kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH 1/5] dt-bindings: net: qca,ar71xx: remove label = "cpu" from examples
Date: Wed, 30 Nov 2022 03:34:06 +0300
Message-Id: <20221130003410.191837-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130003410.191837-1-arinc.unal@arinc9.com>
References: <20221130003410.191837-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This is not used by the DSA dt-binding, so remove it from the examples.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 Documentation/devicetree/bindings/net/qca,ar71xx.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qca,ar71xx.yaml b/Documentation/devicetree/bindings/net/qca,ar71xx.yaml
index 1ebf9e8c8a1d..89f94b31b546 100644
--- a/Documentation/devicetree/bindings/net/qca,ar71xx.yaml
+++ b/Documentation/devicetree/bindings/net/qca,ar71xx.yaml
@@ -123,7 +123,6 @@ examples:
 
                     switch_port0: port@0 {
                         reg = <0x0>;
-                        label = "cpu";
                         ethernet = <&eth1>;
 
                         phy-mode = "gmii";
-- 
2.34.1

