Return-Path: <SRS0=ZEVb=GY=v3.sk=lkundrak@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9548C433E0
	for <soc@archiver.kernel.org>; Thu, 21 Jan 2021 03:41:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 76132238A1; Thu, 21 Jan 2021 03:41:42 +0000 (UTC)
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ED7023437;
	Thu, 21 Jan 2021 03:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ED7023437
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lkundrak@v3.sk
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra.v3.sk (Postfix) with ESMTP id C5A18E0AAB;
	Thu, 21 Jan 2021 03:37:44 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
	by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id JQ8ncpXoGQjv; Thu, 21 Jan 2021 03:37:44 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra.v3.sk (Postfix) with ESMTP id 81207E0AA6;
	Thu, 21 Jan 2021 03:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
	by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wNyiNZfv35AC; Thu, 21 Jan 2021 03:37:44 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
	by zimbra.v3.sk (Postfix) with ESMTPSA id 4ED8EE0AA9;
	Thu, 21 Jan 2021 03:37:44 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	SoC Team <soc@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 09/12] ARM: dts: mmp3-dell-ariel: Add the embedded controller
Date: Thu, 21 Jan 2021 04:41:27 +0100
Message-Id: <20210121034130.1381872-10-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121034130.1381872-1-lkundrak@v3.sk>
References: <20210121034130.1381872-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add the device node for the computer's embedded controller, responsible
for controlling the LEDs and system power.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/mmp3-dell-ariel.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/mmp3-dell-ariel.dts b/arch/arm/boot/dts/mm=
p3-dell-ariel.dts
index 53714cb0d171e..565cd0fadf3d3 100644
--- a/arch/arm/boot/dts/mmp3-dell-ariel.dts
+++ b/arch/arm/boot/dts/mmp3-dell-ariel.dts
@@ -95,6 +95,15 @@ &twsi3 {
=20
 &twsi4 {
 	status =3D "okay";
+
+	embedded-controller@58 {
+		compatible =3D "dell,wyse-ariel-ec", "ene,kb3930";
+		reg =3D <0x58>;
+		system-power-controller;
+
+		off-gpios =3D <&gpio 126 GPIO_ACTIVE_HIGH>,
+			    <&gpio 127 GPIO_ACTIVE_HIGH>;
+	};
 };
=20
 &ssp1 {
--=20
2.29.2

