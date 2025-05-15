Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567C81C27
	for <soc@lists.linux.dev>; Thu, 15 May 2025 06:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747291569; cv=none; b=qxincMe7JmJlwLExB0ZE9wEWlhDsOKCNYDbj/qr0lr+w91Bx5MEXGnU9WROeFq0BzPBXC3ANhLDbXPpdqc3dHpoxuml/FgbWqT/SO85SzKJCh4L0xYuJxZlwx2F7sGpPvtPG+6tw5uYPkmNRi95c5cgbKsokYtxWvAIEPI9sCww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747291569; c=relaxed/simple;
	bh=VD40nnz2Q3fEqp8Lf4pjdFXKaBfwG5zJtnxvZ1NMZ8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aVJAwscDCOOD18SVP9QXs0SbOU7A6zkn7Ny/RsnS5THeYRJDLYfUBFlW6nCOCroab7BGT45gK65MJy0T2K+Btblac3wt52O7NVHbZrjaK4RHVC3kdgIkmtl0wXNlTt+iDBuNDcI1TkaYWrghNqPKs2ryU7tWCB+EcJsFQX2ZcEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=QQ/PQWjB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="QQ/PQWjB"
Received: by smtp.kernel.org (Postfix)
	id E3CE5C4CEE7; Thu, 15 May 2025 06:46:08 +0000 (UTC)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0EB8CC4CEED
	for <soc@kernel.org>; Thu, 15 May 2025 06:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0EB8CC4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1747291564;
	bh=7nw+HlTIlWD8r897NZrPp+2GXXpiMojWhbPO2BFQqEk=;
	h=From:Date:Subject:To:Cc;
	b=QQ/PQWjB739jjeVEei2V30b5Iags/9SIVIOF3EF3ZhryDpZA77EaraxeaFnJZ/YMg
	 GN/4r40ECPO8azyreGVV8p7Pf/0o2bGfpuSNtZyh86MCkEXkzbBTDtoGCsyg4XSrW7
	 wFgsegBkQjtp7DKaRyZ2LJjq6klwgQCFzZkKG82CzmXsY/06ZLAtgBNDEDWll9Xwz9
	 oCpTOEl+zUTYov3Yjcu03XH+9mDilvAVssA2A0glrFI8pCqg+5VYt7WDJqY98B5kbw
	 nJn6OgUr8v5anTGlZOBabetJc47YjoynVrGo/j7snEjOcq0J3Tyy/qN8NptPmSn9MY
	 s9eZMzqrM7S3Q==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 932297B9DE;
	Thu, 15 May 2025 14:46:04 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 15 May 2025 16:15:54 +0930
Subject: [PATCH] arm64: dts: nuvoton: Add pinctrl
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-nuvoton-arm64-dt-v1-1-25769b8c1509@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIAKGNJWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0NT3bzSsvyS/DzdxKJcMxPdlBJdCxMLiyTjRKPkpDQjJaC2gqLUtMw
 KsJHRsbW1ADcTKkZiAAAA
X-Change-ID: 20250515-nuvoton-arm64-dt-8488b3a2cbf2
To: soc@kernel.org
Cc: joel@jms.id.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3168;
 i=andrew@codeconstruct.com.au; h=from:subject:message-id;
 bh=Y0bfLmNmOx1b7BUYnb6TlVW6atDiFzqVHFmiCXcsWaw=;
 b=owGbwMvMwCG22PjiTL8dD5cxnlZLYshQ7V1hLL4g1k9D8XLjcvs+65M1Ps4cM1ZXPi6dso+VK
 6fMUU+xo5SFQYyDQVZMkWVFoG3h3c2T4n8eyD4GM4eVCWQIAxenAEzkqz/DHx7pNr4p6Y1vLzXw
 XC3JZ7Quuux+xJX9jfTHxokLfsi9fcDwv4Y7uup+nheTQVTP3WA+xmtLIhn2nP608FyPgnBvzKs
 P7AA=
X-Developer-Key: i=andrew@codeconstruct.com.au; a=openpgp;
 fpr=C0F5E25A7D30ECBBF3BE3CEC3B837651FC0D8CF4

From: "William A. Kennington III" <william@wkennington.com>

This is critical to support multifunction pins shared between devices as
well as generic GPIOs.

Signed-off-by: William A. Kennington III <william@wkennington.com>
Link: https://patch.msgid.link/20250416015902.2091251-1-william@wkennington.com
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Hello SoC maintainers,

This is the single accepted change in the BMC tree for the Nuvoton ARM64
devicetrees (NPCM8XX) for v6.16. There were others on the lists but they
were sent as independent series and caused conflicts. We'll leave those
for next cycle when they're in better shape.

Cheers,

Andrew
---
 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index ecd171b2feba488b486cdc72708420fca6fc11c8..fead4dde590dfff3f7d28a47c2b883462a6e51eb 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -176,4 +176,69 @@ watchdog2: watchdog@a01c {
 			};
 		};
 	};
+
+	pinctrl: pinctrl@f0010000 {
+		compatible = "nuvoton,npcm845-pinctrl";
+		ranges = <0x0 0x0 0xf0010000 0x8000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nuvoton,sysgcr = <&gcr>;
+		status = "okay";
+		gpio0: gpio@f0010000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x0 0xB0>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 0 32>;
+		};
+		gpio1: gpio@f0011000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x1000 0xB0>;
+			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 32 32>;
+		};
+		gpio2: gpio@f0012000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x2000 0xB0>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 64 32>;
+		};
+		gpio3: gpio@f0013000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x3000 0xB0>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 96 32>;
+		};
+		gpio4: gpio@f0014000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x4000 0xB0>;
+			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 128 32>;
+		};
+		gpio5: gpio@f0015000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x5000 0xB0>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 160 32>;
+		};
+		gpio6: gpio@f0016000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x6000 0xB0>;
+			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 192 32>;
+		};
+		gpio7: gpio@f0017000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x7000 0xB0>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 224 32>;
+		};
+	};
 };

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250515-nuvoton-arm64-dt-8488b3a2cbf2

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

