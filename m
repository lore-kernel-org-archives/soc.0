Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9AEC77B7F
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 20:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5E06BC433EF; Tue, 16 May 2023 20:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26894C433D2;
	Tue, 16 May 2023 20:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684267965;
	bh=uDoxf4j57uTIWh7dDHvDavID5kz+BSfrqY1OSQfPaoc=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=ax2CHu24CXSLzv2nNIoEOchbjl8miggdXazvAJ6tZRFGss70pYtR3p7T1d2o8LqOW
	 q72QzBP6ojBoPnuZFle/TRou9ZtkHSWLFoGHV8/Y9HZvgkM0SLMeC51+7vmCT0nbPU
	 YcF1mFnw/iTKMFVSp44A5XqcBa8hQuSjbmf473AY1Eroxc3qhUbpKDsP8dpUDIwGnH
	 Dg0vW0qhjxBNhyFzstcUxggaHg5di98pM/rq2TrBH9eGXOEk4Js4J4DhRvJgeW1fqv
	 Bufx4vqMHvPs5Uz4OyxuInICflYzJwwuRwxRgmmqXD1qvRmejrcd0r7WCho0aaEXTN
	 kbBV5M+QMr1bw==
From: Arnd Bergmann <arnd@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm-cci: add cci_enable_port_for_self prototype
Date: Tue, 16 May 2023 22:12:12 +0200
Message-Id: <20230516201218.556437-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The cci_enable_port_for_self() is called from assembler, so
add the prototype only to shut up the W=1 warning:

drivers/bus/arm-cci.c:298:25: error: no previous prototype for 'cci_enable_port_for_self' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/arm-cci.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/arm-cci.h b/include/linux/arm-cci.h
index d0e44201d855..7f7a576267bc 100644
--- a/include/linux/arm-cci.h
+++ b/include/linux/arm-cci.h
@@ -43,6 +43,8 @@ static inline int __cci_control_port_by_index(u32 port, bool enable)
 }
 #endif
 
+void cci_enable_port_for_self(void);
+
 #define cci_disable_port_by_device(dev) \
 	__cci_control_port_by_device(dev, false)
 #define cci_enable_port_by_device(dev) \
-- 
2.39.2

