Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C32D1C695
	for <soc@lists.linux.dev>; Mon,  3 Feb 2025 02:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738551429; cv=none; b=cYT1vDrf8sRtvnv4qBvj6zpxfw94YMg3fzEDZBL4F16mPV6GUyNwpw9BCyEbBlZ068oA+mB1aNM4MvSLe46HGlGHK3i5o5b0zpKaWl/BzEJyvkTq1Dfks5LlNo3MOXFIMQrOuGYEk7yb3h7/lQYKSi+wAPjI6sPZRWijVgfykgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738551429; c=relaxed/simple;
	bh=2PJ+HfT6jxBjaYedQuRdTS1BWxFPh1IRQorcDWQ3NdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kgVepoDMALErAuGBvaE//1WQ8214CEAY4pUC1f8X2D4Jru1HM9+rwYuOwntpbfRdN9ug5abN24fKL2YpNljblUmY9v/dU7zIodWWldBoaDCN46XiBsT6ehpSmD/yFF+OC57UTzzFIXPnZM8+irbhnl4FE66eEeQj4MQKV37f/vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=keaaDwqB; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="keaaDwqB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738551418;
	bh=/M3u/UfzPn7K2j1tUy85ouRPJtHFLSPO1KCwoEDBz08=;
	h=From:Date:Subject:To:Cc;
	b=keaaDwqBcwuRr2sI322cGvM6QhW3T8VZUIxniSpkWNFtHxvEYmOnJqsDXFQTvVwij
	 TV62XwwNM8Lny3y/GlktCxB2By33Y+iKiDyxrqh09BD3xef6UI5VFwY26s3weL4xaJ
	 qrMrMhFX3YY9SHuv9T+JdhQrw/eV/nirx005KyFZBSSF+gTXotW0xcKu4itLfs2vuU
	 8HXubwBXbJvZyBaO+s/GWRpfUvE8RdHjK87epWug2CxO+pQZABSg3tvZxx46F0G6J9
	 64ZkKgFyBgnnAmohCv4wDPnkyP8flCNPAeAng42WH6+STBsZ+Fcgxm3nCgrbnQb5Dg
	 ctkVcjJ6ugq3w==
Received: from [127.0.1.1] (58-7-156-140.dyn.iinet.net.au [58.7.156.140])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C2762703FB;
	Mon,  3 Feb 2025 10:56:55 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Mon, 03 Feb 2025 13:26:31 +1030
Subject: [PATCH] MAINTAINERS: Mark Andrew as M: for ASPEED MACHINE SUPPORT
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-aspeed-maintainer-v1-1-60bc3a5f0a7c@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIAF4woGcC/x2MOwqAMBAFryJbG4jrp/AqYpG4T93CKImIIN7dY
 DHFFDMPJURFor54KOLSpHvIUpUFTasLC4xKdmLLrWVbG5cOQMzmNJwZRCMi3oNZXNNR7o6IWe/
 /OYzv+wGLOVJiYwAAAA==
X-Change-ID: 20250203-aspeed-maintainer-dddbbe22da46
To: joel@jms.id.au, linux-aspeed@lists.ozlabs.org, arnd@arndb.de, 
 soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.2

From discussion in [1] and in-person with Joel, flip my entry from R:
to M:.

Link: https://lore.kernel.org/all/CACPK8Xe8yZLXzEQPp=1D2f0TsKA7hBZG=pHHW6U51FMpp_BiRQ@mail.gmail.com/ [1]
Cc: Joel Stanley <joel@jms.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa06545e2861abe46ea7029f9b4d3628e..305e5530560e53c10f0b610fa7b4456ca78fdfc2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2285,7 +2285,7 @@ F:	drivers/irqchip/irq-aspeed-i2c-ic.c
 
 ARM/ASPEED MACHINE SUPPORT
 M:	Joel Stanley <joel@jms.id.au>
-R:	Andrew Jeffery <andrew@codeconstruct.com.au>
+M:	Andrew Jeffery <andrew@codeconstruct.com.au>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-aspeed-maintainer-dddbbe22da46

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

