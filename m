Return-Path: <SRS0=ZEVb=GY=v3.sk=lkundrak@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1F7C43381
	for <soc@archiver.kernel.org>; Thu, 21 Jan 2021 03:41:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4C5C1238A0; Thu, 21 Jan 2021 03:41:40 +0000 (UTC)
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F98A23899;
	Thu, 21 Jan 2021 03:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F98A23899
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lkundrak@v3.sk
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra.v3.sk (Postfix) with ESMTP id CADF7E0A82;
	Thu, 21 Jan 2021 03:37:41 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
	by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 4n9HQ1RkZOpe; Thu, 21 Jan 2021 03:37:41 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra.v3.sk (Postfix) with ESMTP id 91785E0AA5;
	Thu, 21 Jan 2021 03:37:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
	by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id imcHLL4-8G53; Thu, 21 Jan 2021 03:37:41 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
	by zimbra.v3.sk (Postfix) with ESMTPSA id 5C01CE0A82;
	Thu, 21 Jan 2021 03:37:41 +0000 (UTC)
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
Subject: [PATCH 05/12] ARM: dts: mmp3-dell-ariel: Drop linux,usable-memory from /memory
Date: Thu, 21 Jan 2021 04:41:23 +0100
Message-Id: <20210121034130.1381872-6-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121034130.1381872-1-lkundrak@v3.sk>
References: <20210121034130.1381872-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Drop the linux,usable-memory properties; the schema is unhappy about
them.

They've been cargo-culted from Open Firmware and I don't know what
purpose they serve. Perhaps they are meant to provide the OFW runtime.
In that case it's still okay to drop them from here; OFW is welcome to ad=
d
it upon boot.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/mmp3-dell-ariel.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/mmp3-dell-ariel.dts b/arch/arm/boot/dts/mm=
p3-dell-ariel.dts
index fe3b1cd695eeb..53714cb0d171e 100644
--- a/arch/arm/boot/dts/mmp3-dell-ariel.dts
+++ b/arch/arm/boot/dts/mmp3-dell-ariel.dts
@@ -26,7 +26,6 @@ chosen {
 	};
=20
 	memory@0 {
-		linux,usable-memory =3D <0x0 0x7f600000>;
 		available =3D <0x7f700000 0x7ff00000 0x00000000 0x7f600000>;
 		reg =3D <0x0 0x80000000>;
 		device_type =3D "memory";
--=20
2.29.2

