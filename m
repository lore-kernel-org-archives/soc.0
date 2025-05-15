Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EB225A2B2
	for <soc@lists.linux.dev>; Thu, 15 May 2025 06:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747290697; cv=none; b=c0FGI0gJDICkKYi+6s1Xf8luw4u0Xv2ULt1d29aw+5UZLLDs9/zpptHNZZlz7kcl2fFu1dEkntmunW2XvY46y0/iPSl9Pwvy16lmxUuI9pINjvUn4+k074Sw7HupdPn/JsuM7tfnBt76xZDmRy+jYYTib6MBZ9Sj9iLlFF0eUsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747290697; c=relaxed/simple;
	bh=I5zKaNDLRwwQ4DF+wHOwmtlXlkM551ysIMk18dd036M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OTyjnRQNFrodb/XX4OeVB/sdI2X/vF4d6dJnSCRxvk9rlMHG9Tusi4rdABHhlzyf0do45XJnhxgh9BVflYn/HXkqI316pPYpk88Na7gyPYvba6Qjm49Xu5zVsYR3g7vPEYnQHa5hpFZRnZS8+D0s3bG93MK5hTP32YWR3r8cg4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=f4BJPVnc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="f4BJPVnc"
Received: by smtp.kernel.org (Postfix)
	id CAD8CC4CEEF; Thu, 15 May 2025 06:31:36 +0000 (UTC)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78069C4CEE9
	for <soc@kernel.org>; Thu, 15 May 2025 06:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 78069C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1747290687;
	bh=rftwn7g9KpNQhWsi8Mn1AaHnyr0eqNmvEf+ty0Rq698=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=f4BJPVncP/2XRWNfvvlM2zVKZMBVdVMAc9KNoSIbMludhiv2bKubey3NSFj5Yo6qm
	 QgUdIuT4TbQHzKawL7tj9R4CS8mrKLKw7mk+ulmJRX4wq+qPNY5HtFbKDHGiqaQ1Ke
	 8NTqUa2NzBZkJw4q8RFoux0d/kULLRN7LSnpP3Qw4i1I3ks4Yw58eElGYfW/N79HlN
	 TbPwRe5LsTYZmcS6VKEzMTpGyTSLEfqr2lFIwPgMY23maTCVIMTMz3u7g+KDczDRoI
	 5+n6/VlRtvpCeEPk5Isr2NnBpAfjYrKDpyfg7N8+MKwnCn/UaLom7zx7L4Js/UbXjl
	 obH8kqPaWcdpA==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 24ADB82024;
	Thu, 15 May 2025 14:31:27 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 15 May 2025 16:00:43 +0930
Subject: [PATCH 2/3] soc: aspeed: lpc: Fix impossible judgment condition
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250515-aspeed-drivers-6-16-v1-2-eb467f6b7a7c@codeconstruct.com.au>
References: <20250515-aspeed-drivers-6-16-v1-0-eb467f6b7a7c@codeconstruct.com.au>
In-Reply-To: <20250515-aspeed-drivers-6-16-v1-0-eb467f6b7a7c@codeconstruct.com.au>
To: soc@kernel.org
Cc: joel@jms.id.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1252;
 i=andrew@codeconstruct.com.au; h=from:subject:message-id;
 bh=YUjqInYshUNNHMANN7+TNi5G+REFfpgRencFfb+rDlk=;
 b=owGbwMvMwCG22PjiTL8dD5cxnlZLYshQ7TJ9cP3K301r1aO9dr/a5mv2+OC6mbJX3JcoC0/Y+
 3insaTpxo5SFgYxDgZZMUWWFYG2hXc3T4r/eSD7GMwcViaQIQxcnAIwEf1Whv9pn59oKgblfGdn
 9DBteLPq6afUb8X2XxXi5K0YlJI0kmIYGTYdnPt5ZtPDKRLPZJQXJVmlHZsVLtw10cC472LThLT
 JHWwA
X-Developer-Key: i=andrew@codeconstruct.com.au; a=openpgp;
 fpr=C0F5E25A7D30ECBBF3BE3CEC3B837651FC0D8CF4

From: Su Hui <suhui@nfschina.com>

smatch error：
drivers/soc/aspeed/aspeed-lpc-snoop.c:169
aspeed_lpc_snoop_config_irq() warn: platform_get_irq() does not return zero

platform_get_irq() return non-zero IRQ number or negative error code,
change '!lpc_snoop->irq' to 'lpc_snoop->irq < 0' to fix this.

Fixes: 9f4f9ae81d0a ("drivers/misc: add Aspeed LPC snoop driver")
Signed-off-by: Su Hui <suhui@nfschina.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
Link: https://lore.kernel.org/r/20231027020703.1231875-1-suhui@nfschina.com
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 9ab5ba9cf1d61cd5e81f20320a9bfa8f6a08c272..57ba855f375d98007acdb6f7ef57a91c641cd3e5 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -166,7 +166,7 @@ static int aspeed_lpc_snoop_config_irq(struct aspeed_lpc_snoop *lpc_snoop,
 	int rc;
 
 	lpc_snoop->irq = platform_get_irq(pdev, 0);
-	if (!lpc_snoop->irq)
+	if (lpc_snoop->irq < 0)
 		return -ENODEV;
 
 	rc = devm_request_irq(dev, lpc_snoop->irq,

-- 
2.39.5

