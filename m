Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB784C77B7A
	for <soc@archiver.kernel.org>; Wed, 17 May 2023 15:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 967DAC433EF; Wed, 17 May 2023 15:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E77C433D2;
	Wed, 17 May 2023 15:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684339033;
	bh=tXVcAscUb4tXz7ScNIORrrsAi0I2+/pcheQOrWflPts=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=m71z90WEDuQz7FFfWVm507pUC8ak33k6PMlwVPL+PglcB9Y8SXxYPgkwg/M43+t5R
	 onlqyr3NlgKrWD9OwUO4wTfhWXgrmr6lEhQSO/lg1YworgutS0tfyY9co/N0VWKxBM
	 6mZT3Hm2OtXD2wYzU+R5gVrzQyEUmuzaDhX6gFeHMHf8eh0FDBn0IKuo0qDK19IGO7
	 P+Wmpb+EpblsJ5u/zpHWCmFqzEV/NEumkFFmSNFwJ5B72iFpA72Ock+xCspVD8koGd
	 mhGPpE1n13RLOVArEGosLsJ7D+tDSiRX4CFtetqEQvUhEArcZXPQWuMVQ0tGH3D0gD
	 OSWCgb4WTU+MA==
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH v1] MAINTAINERS: update arm64 Microchip entries
Date: Wed, 17 May 2023 16:55:46 +0100
Message-Id: <20230517-shimmer-retry-34596c637882@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2064; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=fnehXNi7Ib/oLAjPOmMqqjM5Bg4BO76es+kDz40x4SI=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkpP96YutUlv5x+oc6vc/3KV5EPNa/JlmVJnrXy72BVO drD0WTfUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIl8XM/wh+vjXQOvvPv6aptT lNdzW25ruZh47lNo+M6NZ+9teZYi1MTwz+p6vPhZ969J91obnszdUPperfXTSv1zWpVyWV9//f1 /nR0A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Krzysztof noticed that patches for arch/arm64/boot/dts/microchip were
getting lost & the listed tree was inactive.

Nicolas and I are willing to shepherd patches to Arnd, using the
existing at91 tree, so add a new entry covering
arch/arm64/boot/dts/microchip, listing us as maintainers.

Drop the tree from the existing sparx5 entry & narrow the devicetree
pattern to just sparx devices, leaving Lars, Steen and Daniel looking
after support for their SoCs.

CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>
CC: soc@kernel.org
CC: Lars Povlsen <lars.povlsen@microchip.com>
CC: Steen Hegelund <Steen.Hegelund@microchip.com>
CC: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e0b87d5aa2e..b5c10fb8ae49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2434,6 +2434,14 @@ X:	drivers/net/wireless/atmel/
 N:	at91
 N:	atmel
 
+ARM/MICROCHIP (ARM64) SoC support
+M:	Conor Dooley <conor@kernel.org>
+M:	Nicolas Ferre <nicolas.ferre@microchip.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Supported
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git
+F:	arch/arm64/boot/dts/microchip/
+
 ARM/Microchip Sparx5 SoC support
 M:	Lars Povlsen <lars.povlsen@microchip.com>
 M:	Steen Hegelund <Steen.Hegelund@microchip.com>
@@ -2441,8 +2449,7 @@ M:	Daniel Machon <daniel.machon@microchip.com>
 M:	UNGLinuxDriver@microchip.com
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
-T:	git git://github.com/microchip-ung/linux-upstream.git
-F:	arch/arm64/boot/dts/microchip/
+F:	arch/arm64/boot/dts/microchip/sparx*
 F:	drivers/net/ethernet/microchip/vcap/
 F:	drivers/pinctrl/pinctrl-microchip-sgpio.c
 N:	sparx5
-- 
2.39.2

