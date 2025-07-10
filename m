Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCC12236F4
	for <soc@lists.linux.dev>; Thu, 10 Jul 2025 03:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752117007; cv=none; b=LPI8MWEoQ4WJl+pEdcMmiSlsHzsrNOs+SAOFzZbQWU4X868nyTCRFyLWYPekYYKrH5e2ps9P5sFc+UgfEriUrG7wkEub4ZSsMZ2T1KEFalc/eaXduCAVdiVVAKCpNM+8j5pQmRBWNSyJne8jwXZMtsh1r6Y+CpboMG1SR4OnhMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752117007; c=relaxed/simple;
	bh=9roJPBu5NgwEkFWftC/g+gkxvfrnvaVVzZ8XyuQb4EI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WNkyyEEAzPi4sG/fOo72CDu5zr/EpcvJZuw5qdWllJn9V2KU81RW3bqAcylWBfpcZcgNPmIs6Oexp48v9NYYTrnGqs9yiyXssODG7E3yQ49PEmcs+dfAewcuQB9l/3GgDOcky8XewNPYjDTeMShyxMg00EuL6F/PdCSVSiK55Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=m4nwFfwi; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="m4nwFfwi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1752117004;
	bh=NNTEHVI/EtXITM6uGwBQFJUdeyIR3mX2TfdlMLKu8Uo=;
	h=From:Date:Subject:To:Cc;
	b=m4nwFfwiYFz4NjS4yEViZLzwFxj6e/TpHJyfz/aoJmdIDXdYkLS1fb6lWt8m/zOaj
	 9pTdN19BD1fCHNiRiDVexw0CO2DHxPqCr/D6zVl2lyOalhcFgL3p9bzyORUEMlFl2R
	 EbJaJP4YiDGUNI9Qgvzz56Q/KGAQdHCHSUBSQgA8KSXUbjI51JaaHyw8FcPRxDhaJv
	 0uitVtNXVVUgc2CnV98RSEqylTNnvKbEQhfbhuaU2S6N0WW8Ng087HZGoVjVmE9c3w
	 vOR9uQwMx1bqZji92rZH+/ZfRPxx6yN9DAhiUyVgC4oeX4Hei0eUPRdQZH+dP3mj7f
	 ilIvIgJ5TnZmA==
Received: from [127.0.1.1] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id ABD056508A;
	Thu, 10 Jul 2025 11:10:03 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 10 Jul 2025 12:39:38 +0930
Subject: [PATCH] arm64: dts: nuvoton: npcm8xx: Drop the GIC
 "ppi-partitions" node
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-nuvoton-arm64-dt-v1-1-ec7db96ea507@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIAPEub2gC/x3MTQqAIBBA4avIrBtQsd+rRAvJqWaRhpYE0d2Tl
 t/ivQcSRaYEg3ggUubEwReoSsC8Wb8SsisGLXUtWyXRXzmcwaONe2PQnWit60wvtdGmhZIdkRa
 +/+U4ve8HdMLBf2IAAAA=
X-Change-ID: 20250710-nuvoton-arm64-dt-aad849024247
To: soc@lists.linux.dev
Cc: joel@jms.id.au, "Rob Herring (Arm)" <robh@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1481;
 i=andrew@codeconstruct.com.au; h=from:subject:message-id;
 bh=Zl68KHFjZADCyy1oIT4jduHf3mRmCqe1uMb7yHWiiRQ=;
 b=owGbwMvMwCG22PjiTL8dD5cxnlZLYsjI12e/sWnThy1XpjfI7f/1MvLT1ddu7Yb6d9lun0yX5
 8r4f1o/qaOUhUGMg0FWTJFlRaBt4d3Nk+J/Hsg+BjOHlQlkCAMXpwBMhO0ZI8O2DyuMEozqV7/9
 lfRZ+OJG4a58gY5I5aaUZT9fPs/aHdjByLAu7lCiypqHC/MFf5XcnP5Q5kyZWM2KuOKgBToBIcy
 WRhwA
X-Developer-Key: i=andrew@codeconstruct.com.au; a=openpgp;
 fpr=C0F5E25A7D30ECBBF3BE3CEC3B837651FC0D8CF4

From: "Rob Herring (Arm)" <robh@kernel.org>

The Arm GIC "ppi-partitions" node is only relevant to GICv3 and makes no
sense for GICv2 implementations which the GIC-400 is. PPIs in GICv2 have
no CPU affinity.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Link: https://patch.msgid.link/20250609203721.2852879-1-robh@kernel.org
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Hello SoC maintainers,

We have a single devicetree patch for v6.17 for the Nuvoton ARM64 BMC
SoCs. Perhaps it could be picked up as a fix, but I don't consider it
urgent.

Cheers,

Andrew
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index fead4dde590dfff3f7d28a47c2b883462a6e51eb..acd3137d2464aef4224df62fe840ff6fe4db37ca 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -32,11 +32,6 @@ gic: interrupt-controller@dfff9000 {
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			#address-cells = <0>;
-			ppi-partitions {
-				ppi_cluster0: interrupt-partition-0 {
-					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
-				};
-			};
 		};
 	};
 

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250710-nuvoton-arm64-dt-aad849024247

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

