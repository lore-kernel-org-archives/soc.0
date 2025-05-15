Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D616D2628D
	for <soc@lists.linux.dev>; Thu, 15 May 2025 06:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747290696; cv=none; b=uvtGiuTyJzRfN6bcp8bFtniHXab3PzVA31LFWyF5zrpaI5kNi4LSg1UcUzmR9JphqKmWR9sh5h0+Yqi0cW79eUPhjuvIUlaFR8aKXzJQ4wvJ442IQNUYKg8/DfSXsJ03e5HSwIfRFhK01f5ErtnS8lDpWIO+zntI1YZxGxyoTjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747290696; c=relaxed/simple;
	bh=5kXo+HMahU+TDHwhaInadGCzl0V0HPdDFH52qxHpnPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CU53HeG3096/MPOJBJK9RcXlYmsLNdAv9J7OoJ58NJA+Sp9LcAuL7h8isH6l1ZUp/fSSSlaIUqEVkbmOBwQRVb3vk5VaX9sXGEkM/1iLdBIl0XtucRHwZw2xjzQEeaG89hqImNM45fJiP5cGlApiu6yCBli2S5nOq1/XvL9ceTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=YiDE2VpE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="YiDE2VpE"
Received: by smtp.kernel.org (Postfix)
	id CAD57C4CEED; Thu, 15 May 2025 06:31:36 +0000 (UTC)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 785DFC4AF0C
	for <soc@kernel.org>; Thu, 15 May 2025 06:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 785DFC4AF0C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1747290687;
	bh=eN7QdT+CPymdrVEmoPAi5d9LUSngMQgTJ79S8OOD68g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YiDE2VpEMp4asOv/v1gfwJsukdQr8sDEHKnwpr0NxWR8Rgnvss7aACBeE3rpVkn4R
	 ijaHe3b2ZeYOVWm8B6AkkjepeDYkrfVmskLLDVQawAAArX6YjYjD0HZvZA7a92MVVC
	 /71VpWrN2YqA+9UDILuvhw7Ht95u5bFZ9FCFxn5b/F754Cmx4Pt3fC7rPJmLxIQLz7
	 RntJQ9zzaLflbEmHK+wB5G+Vxa0UPFjX3xhknD4njgY/1SVFvjtjOwmSkgX6jDArp+
	 ZdRW/TsbrfDMchbgF7j95ryIKiEfmlncLQZxUJfXSRZHste3PhukmYMg62UHo8cAgN
	 6ndkcnVsouZbA==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 63ABA81A5A;
	Thu, 15 May 2025 14:31:27 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 15 May 2025 16:00:44 +0930
Subject: [PATCH 3/3] soc: aspeed: Add NULL check in
 aspeed_lpc_enable_snoop()
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-aspeed-drivers-6-16-v1-3-eb467f6b7a7c@codeconstruct.com.au>
References: <20250515-aspeed-drivers-6-16-v1-0-eb467f6b7a7c@codeconstruct.com.au>
In-Reply-To: <20250515-aspeed-drivers-6-16-v1-0-eb467f6b7a7c@codeconstruct.com.au>
To: soc@kernel.org
Cc: joel@jms.id.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2285;
 i=andrew@codeconstruct.com.au; h=from:subject:message-id;
 bh=e0tnpYbfJWMspPjdzCdiszqFmpVru1TPgUL/+xOra8A=;
 b=owGbwMvMwCG22PjiTL8dD5cxnlZLYshQ7bK4+OeTanp9jKnjqXBphrlVzLMONBv4vPj0l1/rU
 drFmfd/dZSyMIhxMMiKKbKsCLQtvLt5UvzPA9nHYOawMoEMYeDiFICJmLAz/Hdb8Vt7asL6+ye8
 k/Vrvq+dUe2/sMxFVbDIS7FNtubbCh6G/5XS8pfXfDWwW2m4TfrYSTN+g+uxsm+WK04LvfN/puB
 yPn4A
X-Developer-Key: i=andrew@codeconstruct.com.au; a=openpgp;
 fpr=C0F5E25A7D30ECBBF3BE3CEC3B837651FC0D8CF4

From: Henry Martin <bsdhenrymartin@gmail.com>

devm_kasprintf() returns NULL when memory allocation fails. Currently,
aspeed_lpc_enable_snoop() does not check for this case, which results in a
NULL pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
Link: https://patch.msgid.link/20250401074647.21300-1-bsdhenrymartin@gmail.com
[arj: Fix Fixes: tag to use subject from 3772e5da4454]
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 57ba855f375d98007acdb6f7ef57a91c641cd3e5..ef8f355589a584d76bfac2b130ba9965c9b06ba5 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -200,11 +200,15 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	lpc_snoop->chan[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
 	lpc_snoop->chan[channel].miscdev.name =
 		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
+	if (!lpc_snoop->chan[channel].miscdev.name) {
+		rc = -ENOMEM;
+		goto err_free_fifo;
+	}
 	lpc_snoop->chan[channel].miscdev.fops = &snoop_fops;
 	lpc_snoop->chan[channel].miscdev.parent = dev;
 	rc = misc_register(&lpc_snoop->chan[channel].miscdev);
 	if (rc)
-		return rc;
+		goto err_free_fifo;
 
 	/* Enable LPC snoop channel at requested port */
 	switch (channel) {
@@ -221,7 +225,8 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		hicrb_en = HICRB_ENSNP1D;
 		break;
 	default:
-		return -EINVAL;
+		rc = -EINVAL;
+		goto err_misc_deregister;
 	}
 
 	regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
@@ -231,6 +236,12 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		regmap_update_bits(lpc_snoop->regmap, HICRB,
 				hicrb_en, hicrb_en);
 
+	return 0;
+
+err_misc_deregister:
+	misc_deregister(&lpc_snoop->chan[channel].miscdev);
+err_free_fifo:
+	kfifo_free(&lpc_snoop->chan[channel].fifo);
 	return rc;
 }
 

-- 
2.39.5

