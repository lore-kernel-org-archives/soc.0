Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6487276025
	for <soc@lists.linux.dev>; Fri,  3 Apr 2026 07:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775199764; cv=none; b=TVY8JIm8FyGEiKVVwkxPlhu9hKfRYMMgCwjVfdcpiqkB9Qmcndkt4+2R/2AvuTSAterC7//MUmbudJzcCk5n2H2/11je1qK1m6d0lTDI7+mWSvOWZa2Y5G64fGQf4vFdZ9I0idSaCHsqvauLKuitqQxN14f+Ss1ZbetwOR575DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775199764; c=relaxed/simple;
	bh=vhiz2UwcoRpe0MlvqtbQK8MaLvf6KaR4aN6FcfrD7GI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=si2cQUN0PPjToC+Jq+sc80w1Y/3CYceoxa5vPVAUDUfzsY8RxhbYY9yohsl9AtNFTTNN1cp8peCtmoTtNEzEBVDgqXPtz82z64kL6oSpCwD4niTAG8LcPCEjy3fD4rOErD5pTWumMPUQNVg3EHxcEm4p2StSnlxl8JI+jlSLhHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=g1nEfsJ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="g1nEfsJ9"
Received: by smtp.kernel.org (Postfix)
	id 1F7FBC2BCAF; Fri,  3 Apr 2026 07:02:44 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E210BC4CEF7
	for <soc@kernel.org>; Fri,  3 Apr 2026 07:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E210BC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d03db7f87so882237f8f.3
        for <soc@kernel.org>; Fri, 03 Apr 2026 00:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775199761; x=1775804561; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQTw2Hn7kVK5lRmBqgqs/8lbK71TYOhM3LaYF1mMaUk=;
        b=g1nEfsJ9mcfFX6iflpmSkOpiXQxjX/k8KHTrQG6NzqLsEYMgq4reh4lGc9fhUx7uR6
         pciUfDNYiJO3tlyi4sSlM6IzcEDthgmIexEb8GZdYfSCTj0qcCKgRJX4X4WhG5Kh5CNf
         CHL/7t/QbPcDQpRjHuGtf5mB8ay27Jn0ZyJQ9sKqo1tsygpvijgZebbqRbngt1EJSASX
         H7VmN0uGuODLStO/7WeDFtM+qSn7q5wk5R6IcJFRGc8eqel7Jd6Xmdj15aEiB4pLerUu
         uujgstZ7EYSEdlswOw3S9kZrxUZ6KHSecuQZCZwIeK1CZr4EInFAcHYSWuJYAQUT3740
         haTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775199761; x=1775804561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQTw2Hn7kVK5lRmBqgqs/8lbK71TYOhM3LaYF1mMaUk=;
        b=DomCEyW/D5A6Nyg3C5Mm5sL0SEgnufT7rfg3dg+RpxwX+5ZzwOJn9Tp6cKq1gssj4O
         653owL1+hXAp6Zc0OOmtD0FsFLiNS1w56ZE3/VS93nmRtUouC5M0l1CrbLm0tr+qXR1h
         2yM8FeRvqq0MaD0xlYXspMhDwsvQANeNlm8bJkyEvvBnVjEUbyGMsCgbyvGYstkKFe6w
         QFQtzyhlHNHzOQy1z14yvm0v7gACLaQJDiU9rQGI/xfs3zsMMD49M87qeAm0Vyg0VAdy
         Fc3zGVuyuT19XwKLAaZpTPvfoRomWqA9CbcOL94J7Or9LPLbfflzoxy5X+Y2sB2XmBlt
         stjA==
X-Gm-Message-State: AOJu0Yw2KFb1CHU1rZKJ8uwtkHe3nyt9j7Y4/6cJ1i46uc5SMtjIcEmj
	yli+144pNSaTAqsNFoVj33UbwnnQCy2XuXEzZMebwZ3tJFEKEVvGxy388LM0oRyMNHLuJeWlHK5
	kNh4a
X-Gm-Gg: ATEYQzxnRbkjesXJX/6rqy7aC/BReRxODePjdB1NGzdR8zISY6mVLuqrg2Z74Kz8fns
	A+t8Elp1CmKJrEQlrDJPqYiRFG2pB1v4QQcctxRxDOHvLmFRTunYYwLPlfOZtMzUA0VgYloBB5n
	J4RTSk6fXeGW8MpIyBcL3ILdwLAflZGYBjv0YwAUCUMfddfzvSiqC3ZdJUgTMLDrY94swyKjm26
	Iz87OXKULSM/GZhgE0/UrAfyKPvrWWNLBL+I0p9JZAnytSfp7ZEi0t3/adkf8/iTuqr6u1/uPxq
	zynO8SHE+35hZ9q6qGq1gleTBmVZlDCXogM8Pm/64/xh/0EslXPTcPdnEf3RS3+gCip5zYpQSIt
	5w+u1K2n0r6poqkXNYti/PmdHeIuk98VCdDZsDYN/6uEqbEwtguLbvLJqnWzfwSTvBJbzS3ozdA
	djBRdwbXOvsD+4sZoxed4Mzhb+Wuibzq+KzHyMBlrENA==
X-Received: by 2002:a05:600c:5292:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-488996e0891mr29430855e9.5.1775199760936;
        Fri, 03 Apr 2026 00:02:40 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm409275845e9.2.2026.04.03.00.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 00:02:40 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 fixes for v7.0
Date: Fri,  3 Apr 2026 10:02:39 +0300
Message-ID: <20260403070239.2552455-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-7.0

for you to fetch changes up to 907150bbe566e23714a25d7bcb910f236c3c44c0:

  ARM: dts: microchip: sam9x7: fix gpio-lines count for pioB (2026-03-23 12:54:24 +0200)

----------------------------------------------------------------
Microchip AT91 fixes for v7.0

This update includes:
- fix gpio-lines for SAM9X7 PIOB GPIO controller

----------------------------------------------------------------
Mihai Sain (1):
      ARM: dts: microchip: sam9x7: fix gpio-lines count for pioB

 arch/arm/boot/dts/microchip/sam9x7.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
