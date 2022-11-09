Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09995C4332F
	for <soc@archiver.kernel.org>; Wed,  9 Nov 2022 21:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BAEE6C433D6; Wed,  9 Nov 2022 21:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B33C4314F;
	Wed,  9 Nov 2022 21:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668029001;
	bh=VZ4QpluSuGSOGq5v/vlU5gZCX8GrnRCwhXb+eMkQg94=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=dJVGcq7w53YJ+v5ntjpfAFa1NCeWetTd0EAORNVrMBha8ArHDYKOyfi8SZzTA8ZXp
	 GVpYRlRBIa7niG7zHvEch45Dkj5C5pzr9C3QguyqKjBNhtnnVr+lXzADM5OGf7Omvt
	 /o4f0Z10i+j5KE0bOewwMIfVIKJpyr1/HpVFuErkJpVce70reth5M6YqyCxIj/DOsP
	 7jxoL2gCq3P16+mVkbNFTB9cNjr1xLW5qd3XUDXApshJsQEqhMdHDwG+9HJH+IA/NZ
	 07v3T7uu2qe40OfrekAN7kj/5/nPU/LUjTU9gT0DEGQE/td8m07BGPjR0+skf0lzhT
	 uniZa+Q2ABrAg==
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
Subject: [PATCH v1 2/4] MAINTAINERS: generify the Microchip RISC-V entry name
Date: Wed,  9 Nov 2022 21:22:18 +0000
Message-Id: <20221109212219.1598355-3-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221109212219.1598355-1-conor@kernel.org>
References: <20221109212219.1598355-1-conor@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

These drivers work on our other FPGAs, for example the non-SoC PolarFire
connected to an FU-540 via chiplink. Make the entry a wee bit more
generic to match. While at it, remove the / from the heading so that it
matches other, neighbouring RISC-V entries.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b88ced1ff72c..a57c90be001f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17732,7 +17732,7 @@ F:	arch/riscv/
 N:	riscv
 K:	riscv
 
-RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
+RISC-V MICROCHIP FPGA SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>
 L:	linux-riscv@lists.infradead.org
-- 
2.37.2

