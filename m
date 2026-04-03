Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E3876025
	for <soc@lists.linux.dev>; Fri,  3 Apr 2026 07:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775199812; cv=none; b=fHh+YPuIBKyEp8mBtudabWvlAeY3xwjZ2wSK9PcCTmNJTqy8x+SojgGImSpJ0+K0YoPr8gzAtRkm1Bg+NbnXfSsnrKRP13N3pDg4O0EzAqbz96UcURibo4/TginLW2IQDrxjhsbG3XWz0vRdYKMQvn1TrFkKn7i4tE1sndzbtNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775199812; c=relaxed/simple;
	bh=aSbqUpOCLjAU93kzdiVi2WMxRkQbMVQqJmdYfL8E16s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=peVeyxq4bk/cebZrOx8aQ5ikKZI58k1RZNd0Yp8CO1S7yaljp7YopZmFoI6t6yGIpyD6mNfKtEnTZJeQTtHHC9vk9KrQWt5eVFouWewWeIKi+xLYR6huXVZ/q9hop8+omMHKrvvgK3JdIDMwfbtm5SzGFdEMfme/i6HjzC4fw5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oSoBpGtb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oSoBpGtb"
Received: by smtp.kernel.org (Postfix)
	id CD4AFC4CEF7; Fri,  3 Apr 2026 07:03:31 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D76AC2BCAF
	for <soc@kernel.org>; Fri,  3 Apr 2026 07:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1D76AC2BCAF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48896199cbaso8086915e9.1
        for <soc@kernel.org>; Fri, 03 Apr 2026 00:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775199809; x=1775804609; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GWcM9PLpKa8NgMr9TP++edAfqxjdMWwshThC38ZMJoQ=;
        b=oSoBpGtbNBKMHNZriSkhK0hLYguciMu02cQl9ONWDCeXWS9y9k2OwNFePoOQL4W4zH
         LBgZlnWctwodvMNwqFiduJxJhB7DoFKPDPaeF59/ppB/u9GxBoUd+XqAp5hJmcRc3PtS
         yB+w/Cx34Ng4AbD5Hmiw1Kze1JclywQP3r5zhL1lgi9lzD+5JN8R6XJFxm+2SOA7OcsW
         NxbDj+bxT7Jbl0vWM/Bvq7VpR52AGvHRDw2919dbXOv9wvtPu1Qes+0I6bsGao2gD/5l
         x6JzOwKXHVsSdpVk/SFrKWdEtILGODA0B/6xGyhwHAP8trAkpNnOtIlqK9jMSzGRwKgX
         yUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775199809; x=1775804609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWcM9PLpKa8NgMr9TP++edAfqxjdMWwshThC38ZMJoQ=;
        b=cu/o8Y8jhSxESO+onFdhHnS8sLp65HQchgedDL8FpXNkF5ngFVsiOkHqoT8Twah8Ji
         nvRWraTbD5Tz/f5c2xp3U7vc50Up9d6p0O69ihbaL4J/IvUBaqzRgwyzYiU1NyOSlpSU
         sjwH0bOmGc6f9fMSuinFqeHObznsOXGFVgAi5TnSqE/t6Gjm5hcpyoEFmGQj2gG0rpB7
         AbL/adJqJcW4ukmfNVCK5juajdVyL3TY7ezpRCIOOAeYOqGxzUQ/9gSOXap2owPks/Q9
         YuDtGal8QmCzs4aKX8rMJzqZAYgQstPyYow9hfTna8RIhD7t0t3hbJzwdhHfrr+dpCQj
         WXoQ==
X-Gm-Message-State: AOJu0Yx7E4mQIW2l/R1RnDJXwMXeubUOilDcGbXlbb8bbK0Ogy6C/kpa
	SmEySkEz/ZxDEbVKgbGazMigeT8J+PajEBGTqcrDhM8a8Y7kqI38jsYhb6tG7jlkssK1y0j6JOp
	bkRbb
X-Gm-Gg: ATEYQzxZNlkkmag4d1phMLrge3YT1d3ivYveO8jw0btm7WXx4QWzhs5ja0c2C9ZBC1m
	b8f4i9bIbhPDytkHKX7Gz3QSbPyqKn2jzLk0u0gVnsvnbPTLbQ9THOBvTeal/A1bXKLMJ3d9RFR
	tzb5P4Ryjbz+KMCAhZ/s502RK6OqrH0svb4RArzjyb/S2X2jVW2F+Zx5jDHKF7xn+8D4EQnDQf/
	QBR8XiRW9ouDbtjGMwRlvXbiWCMreBfhaJ6aXteJ7DaAJ3UmSUikplQlnZLkPCLOhBEIgPtDFmE
	y4oXkjedJuN5AhnwDc4ql8J7rhOXg2jqoVetBCKfpSzMVyGq7tXTNlg9vBP2jtud0NjcJCEkich
	8pMK/LzvI39AMcNylf1xWFwi8N24JlM7G/oO5fRdjLBhRGn/FpjqkLJduNogeOXjHVPShSjfKtG
	QICjBbEOrA9bUXcqZkp4L++otfEgLFYT0TkpiL8dj58A==
X-Received: by 2002:a05:600c:8b33:b0:485:3fa9:358c with SMTP id 5b1f17b1804b1-488997b2291mr33076195e9.17.1775199808999;
        Fri, 03 Apr 2026 00:03:28 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4889b5427cfsm15676205e9.1.2026.04.03.00.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 00:03:28 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 device tree updates for v7.1
Date: Fri,  3 Apr 2026 10:03:27 +0300
Message-ID: <20260403070327.2552867-1-claudiu.beznea@tuxon.dev>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-7.1

for you to fetch changes up to 7d7a9fc1310a0ade8ea61c5eb4d8b29456f8d604:

  ARM: dts: microchip: sama7d65: add Cortex-A7 PMU node (2026-03-24 15:35:37 +0200)

----------------------------------------------------------------
Microchip AT91 device tree updates for v7.1

This update includes:
- enable LVDS, LCD and PMU for SAMA7D64 SoC
- drop unused #address-cells, #size-cells for SAM9X60 UDC node

----------------------------------------------------------------
Charan Pedumuru (1):
      arm: dts: microchip: remove unused #address-cells/#size-cells from sam9x60 udc node

Mihai Sain (1):
      ARM: dts: microchip: sama7d65: add Cortex-A7 PMU node

Ryan Wanner (2):
      ARM: dts: microchip: sama7d65: add LCD controller
      ARM: dts: microchip: sama7d65: add LVDS controller

 arch/arm/boot/dts/microchip/sam9x60.dtsi  |  2 --
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 40 +++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 2 deletions(-)
