Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57929C4332F
	for <soc@archiver.kernel.org>; Wed,  9 Nov 2022 21:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E6CEC433D7; Wed,  9 Nov 2022 21:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCB0C433C1;
	Wed,  9 Nov 2022 21:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668029004;
	bh=djqMJJN5Z2uJit2sAoUpAX5+9Xk7foJHsNds+vuT428=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=KeQ4QV3rNq5pdQC1ZSrmgGCD0dHlyfQq7PLyBUn4aYujhn12BuAXT3+GCL2hGWRli
	 ND2KHgg8p0FWuYGexzowrL+btq0x+UFceQKWJDCjteKG2KH0TdCao4ZVDg27dCH5El
	 fQNVE200yKn9ja0IhJpdDHPOTAe5hzs8IQvJIftIWcUg6CoQnHbxNqD5otngUzYJtJ
	 Hus1lDSnFBlPczqNfrP7erFDXYZdVjSTI6azKbPzai91gxlSrf1oWTF/ipLiG+lHo3
	 YrBZkJI5p16EYV4klN2tNHyb5q89+Amw3Mm5uYLPEueGFnxvVO7ax5AKtMBj68N59r
	 +oEGR9eGMXVfQ==
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	Palmer Dabbelt <palmer@dabbelt.com>
List-Id: <soc.lore.kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	soc@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 3/4] MAINTAINERS: add an entry for StarFive devicetrees
Date: Wed,  9 Nov 2022 21:22:19 +0000
Message-Id: <20221109212219.1598355-4-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221109212219.1598355-1-conor@kernel.org>
References: <20221109212219.1598355-1-conor@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Emil looks after the downstream StarFive stuff, and agreed to look after
the upstream ones too.

CC: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a57c90be001f..040d49af9bdb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19622,6 +19622,11 @@ M:	Ion Badulescu <ionut@badula.org>
 S:	Odd Fixes
 F:	drivers/net/ethernet/adaptec/starfire*
 
+STARFIVE DEVICETREES
+M:	Emil Renner Berthing <kernel@esmil.dk>
+S:	Maintained
+F:	arch/riscv/boot/dts/starfive/
+
 STARFIVE JH7100 CLOCK DRIVERS
 M:	Emil Renner Berthing <kernel@esmil.dk>
 S:	Maintained
-- 
2.37.2

