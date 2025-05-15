Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A8E284662
	for <soc@lists.linux.dev>; Thu, 15 May 2025 06:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747290698; cv=none; b=KlTlc1l+54cznaURGIQQKKALik8blWBxybizpdJk+6IncZdEtQ/4QS2Mk7ic8SeHcXxfROmV/gRzVXHnbxS5SO+no9JaLDmIKh61+EEiY7491npVxYLw8kS/yQvQYZKbyx5kSNqUdzUv3TZOANNmtApweLMudCYkYlVALB+Nxps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747290698; c=relaxed/simple;
	bh=oSFHsMFwCsDw4VQrES21Vfmw18GiqttgRZtE8GEqarQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iBZfspu1KcPkkSDrW/QYprHf9Jrblpw//D4qpJH78+y5wbA5zfk0h8bpHuxuweXjgosvD7IxvgW1uNjgXviwRODsPOzc7vFgxehr68aoPBnZqpYIkVZszWT64oF8uwEcHYwoqZgajg1ftRvWkVgQRKfsuaivi35i0+Ep/UTiYNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=BKiIB13O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="BKiIB13O"
Received: by smtp.kernel.org (Postfix)
	id 99999C4CEED; Thu, 15 May 2025 06:31:37 +0000 (UTC)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78513C4AF09
	for <soc@kernel.org>; Thu, 15 May 2025 06:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 78513C4AF09
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1747290687;
	bh=WzGecFZMluU4P6BXP32g6d2w75l9LUKoMc3R2eYqUOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BKiIB13Os5Tw603wFqxidljqlrSHAyyIjx0efilixwTmgQH1BZc1a0VfNWWkikwFg
	 287CvjHfHBeMr8bm5xsyF3IjNrgwh0MGUwiPNlcv4msjB12ktFQrhQmmOkX6fhUFz3
	 KnPyeRFg7oyQJLPRzEkH/cNnrSwOi75uxWQWPnB8LDmv+GxzstJW+TqOrKO+LeE1j9
	 Ru5pEM9wT6oJX0wMU7YeiC5o/VPOROetZh8lL8y1xDym6rLavq5ZByXTkq2eE4t/ZY
	 b+tWni7P8ncohSPFR6M4u9KERAep/ycdHG6Q9y70CKoknB7sXUhmjrmY+yYRj9yRDK
	 WGVG4QHaRybuA==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E19D57F78E;
	Thu, 15 May 2025 14:31:26 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 15 May 2025 16:00:42 +0930
Subject: [PATCH 1/3] ARM: aspeed: Don't select SRAM
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-aspeed-drivers-6-16-v1-1-eb467f6b7a7c@codeconstruct.com.au>
References: <20250515-aspeed-drivers-6-16-v1-0-eb467f6b7a7c@codeconstruct.com.au>
In-Reply-To: <20250515-aspeed-drivers-6-16-v1-0-eb467f6b7a7c@codeconstruct.com.au>
To: soc@kernel.org
Cc: joel@jms.id.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=935;
 i=andrew@codeconstruct.com.au; h=from:subject:message-id;
 bh=TXouZygCMGORH5KP8r4utTpRQ6fjW4pfwX60dRkoyoo=;
 b=owGbwMvMwCG22PjiTL8dD5cxnlZLYshQ7TJs+VzNqfW7eMn6xMyUhSv6U2LPnn3Vv3DKzcjvW
 UG7XlUbdpSyMIhxMMiKKbKsCLQtvLt5UvzPA9nHYOawMoEMYeDiFICJHKhlZLjmojddhW3egZsf
 +TgfRvOm+3atVl4r++X9j9CqIAcfzhcM/702RYXv3GW3iX9BUXZm0wax9+tjZX8r3Vfmnppqvf/
 PND4A
X-Developer-Key: i=andrew@codeconstruct.com.au; a=openpgp;
 fpr=C0F5E25A7D30ECBBF3BE3CEC3B837651FC0D8CF4

From: Joel Stanley <joel@jms.id.au>

The ASPEED devices have SRAM, but don't require it for basic function
(or any function; there's no known users of the driver).

Fixes: 8c2ed9bcfbeb ("arm: Add Aspeed machine")
Signed-off-by: Joel Stanley <joel@jms.id.au>
Link: https://patch.msgid.link/20250115103942.421429-1-joel@jms.id.au
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/mach-aspeed/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index 080019aa6fcd89ef706f572477d1f72f9f90c8e9..fcf287edd0e5e662693a12035b86dff97fcba31e 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -2,7 +2,6 @@
 menuconfig ARCH_ASPEED
 	bool "Aspeed BMC architectures"
 	depends on (CPU_LITTLE_ENDIAN && ARCH_MULTI_V5) || ARCH_MULTI_V6 || ARCH_MULTI_V7
-	select SRAM
 	select WATCHDOG
 	select ASPEED_WATCHDOG
 	select MFD_SYSCON

-- 
2.39.5

