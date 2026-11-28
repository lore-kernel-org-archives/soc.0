Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863757;
	b=EZCy1RgNSv9GFvnwFiELDR2Duj+Y1JlpQP+ZSMMeUfSrSFOIw1uZBGXAUAPzZeB9wVXR
	 cjH2EV372KjHQtFHc+AdNvU3yddt7JKzQG13dGW2EMBNdcYdChe1vyhDQk1/W9rYlyJ2T
	 fMHPU9ZpMS5rrOs+SEMn6tEsApTBfKgfGpERSaVCtzLLXqrxjcVvIe/uBL+a3bxeyatGf
	 5liITQIj6yCIDZc1WQ53bnnkGsgL9M6Ng719RyDsIAfhu77rrvwEtTdKOtPE/Ak1vsGFy
	 fGta8igm4cboW10fIFWb/m15RinvsS4YuClGOVsj/3avIPCVPowzIdAE7WWcY4wIq3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863757;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=HZJ8HDe/Tt74RwLwlmWCp8vNubY28nvyro8T5zfrfHQ=;
	b=ymcBp/nfozUI6S1N4Tb7EmgJaZpjKuKkEzUaPw2JzrTIcB7QG6LMNfybd97QhA46yzTj
	 xY7yNciutOIiz8Hnk8Wu6Qh/tVyEZYIoHpazRhCTxXa7cHZ87iWQ5Sf13ZBKjs3CZZAkR
	 BJn6PgJ93dipesfGHSF+jvUjWWQvgqZ0rXTwUq2rhMmRBp2HBmnETciHaXFDxR/LH4hh+
	 3HUDx6gOIC4X4HK8U5GiYdHx1eU6paWmZ9sMP8y61hgmfvkqa1vDGJJB37aXHZaAmRswD
	 dYEx8GJe4qarDqppLrcbsrYeKrAs0UvujL5Lohlxo4waPAdjVYExkW58YFS8oQbOROQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=N3CgIE+s;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E966606A329
	for <soc@lists.linux.dev>; Sat, 28 Nov 2026 11:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E966606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=N3CgIE+s
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5656652b2;
	Sat, 28 Nov 2026 19:02:33 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vireshk@kernel.org,
	linusw@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH] pinctrl: spear: plgpio: Unregister the GPIO chip on removal
Date: Sat, 28 Nov 2026 19:02:32 +0800
Message-Id: <20261128110232.875407-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa221d232f503a2kunmd47070a13cbc8c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGExIVk5OTR4YHR9PQxgYT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=N3CgIE+sSOu5JRIuR0qN2ssftzeuc3/WnBUm/V3zWv4tWiDOyG7QQQCVmBfJwZaWOE1FHks/ki1SSop2nnjscdkMtt1AD/9fJEtC6Z+pDBN8+C+Fd9ykdsii3LveXuQv6MLDq6nrSvEk2+J/Wa9mz88yHnNysbDjQKD9h3fhccs=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=HZJ8HDe/Tt74RwLwlmWCp8vNubY28nvyro8T5zfrfHQ=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

Device removal frees the PLGPIO state while its embedded GPIO chip
remains registered. Use managed registration so gpiolib drops the
chip first.

This issue was found by our static analysis tool under development.

Fixes: 604bb7da7780 ("pinctrl: SPEAr: Add plgpio driver")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/pinctrl/spear/pinctrl-plgpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index b5fc76e114be..b17df26c82b1 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -612,7 +612,7 @@ static int plgpio_probe(struct platform_device *pdev)
 		dev_info(&pdev->dev, "PLGPIO registering without IRQs\n");
 	}
 
-	ret = gpiochip_add_data(&plgpio->chip, plgpio);
+	ret = devm_gpiochip_add_data(&pdev->dev, &plgpio->chip, plgpio);
 	if (ret) {
 		dev_err(&pdev->dev, "unable to add gpio chip\n");
 		goto unprepare_clk;

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0

