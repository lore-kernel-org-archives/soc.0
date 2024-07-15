Return-Path: <SRS0=qz/J=OP=microchip.com=prvs=919ff8978=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C805C3DA59
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 11:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04246C4AF0B; Mon, 15 Jul 2024 11:22:49 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E1EDAC32782;
	Mon, 15 Jul 2024 11:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E1EDAC32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721042567; x=1752578567;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UwvuMo9q+BM5zDJoEmawhhWB8dTM6b6Yc6OQfdkW8g4=;
  b=M91PuPJQkPkWlGvvyvvbkclrRdnEHjuXsK5o9gRm/dIdJpPCe86rLn8J
   tlplwLjf7o7Jlbxbc/5e2L/yfSBosf6bgvMdeVeIX+2c8IPBjDiMikiiI
   C0P19mtHKKI3Zl8cM60+2e7azS9nLzeV7IAZxMsHQGhajJakx2XRb2qjp
   ejv7A0XDKo4fSPvG2MiVnX95zPRPqqiHlZO4EUv0BBwphsEGG8V0ee84x
   n0pmQxNU6ALNY3GIhD4qQpnY/ycwArpsJViynfJoMMcCaYy5MgdUHp+v+
   F4LBrC1v1J5wfHlNZ+Desa/bOwr9e7KiTwjdcXpXgjF1hN5LPyQaFExt4
   A==;
X-CSE-ConnectionGUID: 59ssF+iFTAuETctFWYV9gw==
X-CSE-MsgGUID: mJN010RHSSC0HHi61+wzdg==
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="196643730"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Jul 2024 04:22:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jul 2024 04:22:22 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 15 Jul 2024 04:22:21 -0700
From: Conor Dooley <conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: drop riscv list from cache controllers
Date: Mon, 15 Jul 2024 12:21:48 +0100
Message-ID: <20240715-pesticide-strike-6217a07b72ef@wendy>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=899; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=UwvuMo9q+BM5zDJoEmawhhWB8dTM6b6Yc6OQfdkW8g4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGlT2fyuXpbWD2k2Kwx8f8lnz7G5RYZLZMtzrQ0+RQa7CNmF /O7tKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwEQWajD8M3VwDT+zNTRom0J17vY1X6 3Kpr5IvPL59YUui01WHh1xVxj+lylMr3t37bSCCL/43aBrEnqnVj3rX7d67uOiTfualtmu4gAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When adding the bindings for cache controllers to the MAINTAINERS entry,
I forgot to drop the riscv mailing list - and so completely unrelated to
riscv stuff is now being sent there. Drop it.

Fixes: 4ca47d8bcca0 ("MAINTAINERS: add cache binding directory to cache driver entry")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Arnd,

Can you grab this directly please?

Cheers,
Conor.
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bb2addcf836a..3e701e5ff93d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21284,7 +21284,6 @@ F:	drivers/staging/
 
 STANDALONE CACHE CONTROLLER DRIVERS
 M:	Conor Dooley <conor@kernel.org>
-L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
 F:	Documentation/devicetree/bindings/cache/
-- 
2.43.2

