Return-Path: <SRS0=0R2B=IS=gmx.net=j.neuschaefer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1122BC433C1
	for <soc@archiver.kernel.org>; Sat, 20 Mar 2021 18:24:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D031E6192F; Sat, 20 Mar 2021 18:24:13 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E46661924;
	Sat, 20 Mar 2021 18:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E46661924
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=j.neuschaefer@gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1616264647;
	bh=2AbvT+t6I/5SrOX/KVZ+I53SOpZfpJdS7RCiPvq3x/k=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i9WAWF6oKKIisItVn4d3H+0fkD0Nzg+CJJc7KJ1Ux+BRb7RNarvmGaG+ArdgJlNrU
	 BWT3d8VpgAeBE5G46F/i4aZ954ldz7GRmg+tk2oMkKn1m+vcPI2vOmW5NOaP9H92Ok
	 gbFO5ehVQyjZwoB8IBk5Qrd13Mjrzqwqkl+AMa+g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MryXN-1m0X8V43mf-00nyed; Sat, 20
 Mar 2021 19:24:07 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>
Subject: [PATCH 13/14] ARM: dts: Add devicetree for Supermicro X9SCi-LN4F based on WPCM450
Date: Sat, 20 Mar 2021 19:16:09 +0100
Message-Id: <20210320181610.680870-14-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320181610.680870-1-j.neuschaefer@gmx.net>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PEypSEJy4+y6pwGs/F7tTTw2HYOpWJcAfxDYsBzRXSVr1Grggt8
 hq7+0fo4spR//YQ45+PF07pLN0xUZT1K1jN9VVSo3vp5cjVfzEwrcbXrKd8IgHZZPnJThLI
 ybxzR0py6yH9qhhE0G0kceVWfmG8QOf/XAPTP0SVsPrR4mXrdP6TxkWI4pbHLCX24/n12cP
 iINn2ZPIgjwf4Qt1P7dyw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xgSe58BAH8Y=:eztxVx8Xlsb1vF5bbObaKW
 K3cxyhz6du57rJhOAnQkucjRmlu/gvVsASiyPTOGZeQCytMev9xiFVfZXKR2R5RZPO9aq3WkJ
 IcYaRQ2+vmZCVcYlManoh1KUljHdwEzq7Yw4rrAIl5GHon0rlRZ/GEpo5TUbMTp6NyrgYjGTA
 j0QP6s6SG2E3kMiTNZEzml1SHWN56I1UJ9VlhYSm1qeekl9/oY9nBnV31tPkl20yJQBZKFDvS
 AjxyDuEX35Cusf5r/ZJlDwDbs2gRN1I6Q7ZaEOyura6IhiHiwIpsCSRZ4M573ZikXF9FatPwy
 z6sLQXCg3jIm3+3jYaxYUBbwBhsQTj58a0dUe0Gxibjozcv66ip+8VMbA5vmT9BifZ9KRo1Ok
 y4IJhDNy/e1JERbgkr/9DXg5ihX+I4r1ro8Rbc63vgLmKVHa+VKqewLKSkoSpmzgVOHZsiKfB
 DMbIWmfCO1oo9rHalX3677hjCpEWP00d4wF2zepSctP5/Vqe0tdbxkPawHl8UmNmYscKFPVw+
 LF0kc0lcqi4iAyHGzIuJehYdBYPdJWxO2C2cnFklIf5HN06xlsSKbIeZ03X1SV8xYqbQZ6ZGo
 AendBryVRBGqjvYz4KhOlQ6jC8IZPwuYR+UgZddSYmzz2DQYX6+Oqy7EOx8bwd6CWwZLet0QL
 hCrGAu3AtIHcz9UZtXUyjxqW00VVhoCM9P2PSGW5LaFjGp06csj9RKVBVARHBLG3O+0rsq60q
 Z+uyi+Y8zeVpulljC23DlGtMeoSti5vGClnUwDofCECqT8NiPIUJdAwbAWihouPTz5PlcCxJ8
 KdKmKBaiRiRtUZxMhxZfyrQWJOuof2D/MSqncZ5tpqY9LmDHpnPfQmB/JiBgbREhVlu3PD9Xs
 gFjNdAyOEI1a/10PMxSocCJAY9GuD9Uz5Nf4hCMkhLH6rq25o6EAU+P3rIq2IE5ERXn9/I1EF
 JM6FaH1HdHyEi1uWVUGB8rb4byu+S/DcSEGFh4IXIwL3WRHhDj1qclSsK7pWxAQUfskIYK76P
 MkBxdX6muSjBtZ28VBdfmDjDd1N4+askq39FwUZpJ63AWeyEnJMZqqRX9Z4zvZGqDXj3Ik8ZD
 ZU/bPt1fa05206CiUzymOGAXfwLoQ4ICVIbCWj2/ifJiRLn7MKSygEiJf/fFVS790csQawvM0
 vWJF2yuRd+A1uCTcOcOzjrUrIAjBZuCbjKLznU60Fkl8ox1Vo4s5zZ33GhJZpUSE6mFKHBbZO
 pIZwtKwpCOvTfJChN

The Supermicro X9SCi-LN4F is a server mainboard featuring the WPCM450
BMC. This patch adds a minimal devicetree for Linux running on the BMC.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 arch/arm/boot/dts/Makefile                    |  2 +
 .../nuvoton-wpcm450-supermicro-x9sci-ln4f.dts | 40 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4=
f.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 8e5d4ab4e75e6..cab5b3c906f83 100644
=2D-- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1305,6 +1305,8 @@ dtb-$(CONFIG_ARCH_VT8500) +=3D \
 	wm8650-mid.dtb \
 	wm8750-apc8750.dtb \
 	wm8850-w70v2.dtb
+dtb-$(CONFIG_ARCH_WPCM450) +=3D \
+	nuvoton-wpcm450-supermicro-x9sci-ln4f.dtb
 dtb-$(CONFIG_ARCH_ZYNQ) +=3D \
 	zynq-cc108.dtb \
 	zynq-ebaz4205.dtb \
diff --git a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts b=
/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
new file mode 100644
index 0000000000000..83f27fbf4e939
=2D-- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+// Copyright 2021 Jonathan Neusch=C3=A4fer
+
+/dts-v1/;
+
+/* The last 16 MiB are dedicated to the GPU */
+/memreserve/ 0x07000000 0x01000000;
+
+#include "nuvoton-wpcm450.dtsi"
+
+/ {
+	model =3D "Supermicro X9SCi-LN4F BMC";
+	compatible =3D "supermicro,x9sci-ln4f-bmc", "nuvoton,wpcm450";
+
+	chosen {
+		stdout-path =3D "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0 0x08000000>; /* 128 MiB */
+	};
+};
+
+&serial0 {
+	/*
+	 * Debug serial port. TX is exposed on the right pad of unpopulated
+	 * resistor R1247, RX on the right pad of R1162.
+	 */
+	status =3D "okay";
+};
+
+&serial1 {
+	/* "Serial over LAN" port. Connected to ttyS2 of the host system. */
+	status =3D "okay";
+};
+
+&watchdog0 {
+	status =3D "okay";
+};
=2D-
2.30.2

