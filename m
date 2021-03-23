Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A76C433DB
	for <soc@archiver.kernel.org>; Tue, 23 Mar 2021 13:19:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 180C0619BF; Tue, 23 Mar 2021 13:19:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9652761878;
	Tue, 23 Mar 2021 13:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616505597;
	bh=dW3xy43Msw7WMhtRkTRD2i1zHDV7+FX88dULyq9VjiU=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=iueD3kIyPkarOf7CXfVyU9P6WoyxWicNYqiXN0i2XleAe1mn5s6xfl06Rss7AJPLJ
	 PvsH16NmOTgDR6mKnWBPjk/kqkAFlnmtjnMtDQHK4xOv5+MFZ3T201Wzt71DZ2P8MW
	 VI8GmjbP2d5r2P7nygI6eUAhuBr2WdQVxArDFtJ+Kz+yA01QYijbK9ODaDCZ9QIXQ8
	 IGoGbnrKFWgux5lXIi0GVgFc4VTyafBH/ZhfON/fM6OyH+wSUAjsujT9GE849mrZLE
	 0zaXEtq7vg2RNbi27tGo1J9qQdWKFVnaJTMApefLLaWGrmUsg8mw6fJU33YR/EEpSV
	 2ivDvWvgK4+9g==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: [PATCH] ARM: mvebu: avoid clang -Wtautological-constant warning
Date: Tue, 23 Mar 2021 14:19:42 +0100
Message-Id: <20210323131952.2835509-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Clang warns about the comparison when using a 32-bit phys_addr_t:

drivers/bus/mvebu-mbus.c:621:17: error: result of comparison of constant 4294967296 with expression of type 'phys_addr_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
                if (reg_start >= 0x100000000ULL)

Add a cast to shut up the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/bus/mvebu-mbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index dd9e7343a5e3..ea0424922de7 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -618,7 +618,7 @@ mvebu_mbus_find_bridge_hole(uint64_t *start, uint64_t *end)
 		 * This part of the memory is above 4 GB, so we don't
 		 * care for the MBus bridge hole.
 		 */
-		if (reg_start >= 0x100000000ULL)
+		if ((u64)reg_start >= 0x100000000ULL)
 			continue;
 
 		/*
-- 
2.29.2

