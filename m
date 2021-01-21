Return-Path: <SRS0=ZEVb=GY=v3.sk=lkundrak@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF55AC433E6
	for <soc@archiver.kernel.org>; Thu, 21 Jan 2021 03:41:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9267E23899; Thu, 21 Jan 2021 03:41:40 +0000 (UTC)
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3F5023437;
	Thu, 21 Jan 2021 03:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3F5023437
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lkundrak@v3.sk
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra.v3.sk (Postfix) with ESMTP id 8C4EDE0AA8;
	Thu, 21 Jan 2021 03:37:42 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
	by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 2JNnj_TqY2T5; Thu, 21 Jan 2021 03:37:42 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra.v3.sk (Postfix) with ESMTP id 4D5E4E0AA6;
	Thu, 21 Jan 2021 03:37:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
	by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Bcor7PXMo3ki; Thu, 21 Jan 2021 03:37:42 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
	by zimbra.v3.sk (Postfix) with ESMTPSA id 0B45CE0AA5;
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
Subject: [PATCH 06/12] ARM: dts: mmp3: Extend the MPMU reg range
Date: Thu, 21 Jan 2021 04:41:24 +0100
Message-Id: <20210121034130.1381872-7-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121034130.1381872-1-lkundrak@v3.sk>
References: <20210121034130.1381872-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The ACGR register is at the offset of 0x1024, beyond the 4k originally
assigned to the MPMU range.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/mmp3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mmp3.dtsi b/arch/arm/boot/dts/mmp3.dtsi
index 4ae630d37d094..9f2b059f0900b 100644
--- a/arch/arm/boot/dts/mmp3.dtsi
+++ b/arch/arm/boot/dts/mmp3.dtsi
@@ -567,7 +567,7 @@ l2: cache-controller@d0020000 {
=20
 		soc_clocks: clocks@d4050000 {
 			compatible =3D "marvell,mmp3-clock";
-			reg =3D <0xd4050000 0x1000>,
+			reg =3D <0xd4050000 0x2000>,
 			      <0xd4282800 0x400>,
 			      <0xd4015000 0x1000>;
 			reg-names =3D "mpmu", "apmu", "apbc";
--=20
2.29.2

