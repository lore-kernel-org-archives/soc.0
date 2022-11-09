Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2E4C433FE
	for <soc@archiver.kernel.org>; Wed,  9 Nov 2022 21:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E51C5C433C1; Wed,  9 Nov 2022 21:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933AFC433B5;
	Wed,  9 Nov 2022 21:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668029006;
	bh=Uhz+c0Au4X5R+Me/kqjj5ZsS5Tm4IL+gXDcUV/+yS4E=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=F7+JYa8wW+KGwjrZkH1mPIM3cysiWtFkiahgRNauk9TvmMXUQBj/dtH17Nj40+uly
	 SWc84L8J5a5OF7/QXIRrteMKAkBgjM0jlOiZmzP9c3n1S0dj1m7AaE3r3lDyQfnX+f
	 HiCxtE9hcJO0Dqzvs5P94FpVXaOmV+zHQvOQu6ZwDFbDm13MxcPRxerHhpX8TRVrp/
	 5VBuCiyE1cYEnENY5a82QXR2aZemnf19NuAUI7nPeTv1RyJICJuqbrQsue4D5nknjl
	 i9PNG9yBCvhxKLQAo4WWFrOg0NSXxJNiq8swRvfoNZeMzJBZypf+9S+O1c4x9FmSPo
	 xK1RyP5wfRrZQ==
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
	Conor Dooley <conor.dooley@microchip.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v1 4/4] MAINTAINERS: repair Microchip corei2c driver entry
Date: Wed,  9 Nov 2022 21:22:20 +0000
Message-Id: <20221109212219.1598355-5-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221109212219.1598355-1-conor@kernel.org>
References: <20221109212219.1598355-1-conor@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

The driver was renamed before application but the relevant change did
not propagate to the MAINTAINERS patch that was applied. Repair it.

CC: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I'd swear you reported this at some stage Lukas but I didn't see
anything when I took a quick look on lore.
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 040d49af9bdb..269e284570fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17750,7 +17750,7 @@ F:	Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
 F:	arch/riscv/boot/dts/microchip/
 F:	drivers/char/hw_random/mpfs-rng.c
 F:	drivers/clk/microchip/clk-mpfs.c
-F:	drivers/i2c/busses/i2c-microchip-core.c
+F:	drivers/i2c/busses/i2c-microchip-corei2c.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/pcie-microchip-host.c
 F:	drivers/reset/reset-mpfs.c
-- 
2.37.2

