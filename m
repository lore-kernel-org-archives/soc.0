Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3864EC27C53
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 13:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 264EEC4AF48; Wed, 12 Jun 2024 13:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C647C116B1;
	Wed, 12 Jun 2024 13:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718200496;
	bh=ZR/ZhtvNAnjkQJ27zWhiI+4NFBGnWk7aiuC44C9rRjQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q83sJv7pplM0ZJ4BQtadWFO76tM7noly3ajrIMkfTiA8XyDzNDqxIDy1wD9GtRnpw
	 I16uDiHjNLeRi86iNghX0Z8TvNtONo8Hg+MKZnNDPcKoWs+nLx2NS2ECOFxvgPRtZ1
	 9zTRF7yFnR3sACgMaJYsBi4OBPKAUtE4Vq5eNJ4EUTl6ggpxO1g8TMIg1VRyvWZrLD
	 6DQWNQkXxtToLu0ncoES/Sf2pGY4mptOGqoL0FhJzE5oHDW7U5KoZVgQ0YcsiSGZQb
	 Cg+rg/6zAqLpfWmDimT3FK0BpZwkqZbM9i+ZkU3MkCsQV2t1XNU6mN1Po/5UzcnMRR
	 WROsnLBV0VoKA==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 03/19] firmware: turris-mox-rwtm: Use PAGE_SIZE instead of hardcoded 4096
Date: Wed, 12 Jun 2024 15:54:27 +0200
Message-ID: <20240612135443.30239-4-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612135443.30239-1-kabel@kernel.org>
References: <20240612135443.30239-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The 4096 bytes limit in mox_hwrng_read() is due to the DMA buffer being
allocated to one PAGE_SIZE bytes. The PAGE_SIZE macro is used when
allocating the buffer, use it in mox_hwrng_read() as well.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 3f4758e03c81..5acdde1bb6d9 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -287,8 +287,8 @@ static int mox_hwrng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 	struct armada_37xx_rwtm_tx_msg msg;
 	int ret;
 
-	if (max > 4096)
-		max = 4096;
+	if (max > PAGE_SIZE)
+		max = PAGE_SIZE;
 
 	msg.command = MBOX_CMD_GET_RANDOM;
 	msg.args[0] = 1;
-- 
2.44.2

