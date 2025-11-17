Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5A125782A
	for <soc@lists.linux.dev>; Mon, 17 Nov 2025 16:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763397340; cv=none; b=Bm0d6es0qMWgsG7ElGxwfw2jdOA+cKtUOlL4oKSac53GW72Ay1lquPrOzyY68+WPBZkxgHReWvQ74cQbJSQcsrTooWeK50ZcwysOvEpE+gEq4W9DtwH/bDD5ViHxbiicT5XCE/cvVuVewoj6WAs6+Ox7XM9YqhQZCe6/bRGcUiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763397340; c=relaxed/simple;
	bh=LtO+kJCiOsw9IrX/xkG/YGb4UJuFZkaemU4Ie5TYUGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p7cEaSdbUMomGrQcpNeWVlIWjaSdmjMkbd7Yp1jMwIZp9TOPke241bc1W0hx7sm2uJrYKlddC51Rchr14F19Es++Lm6S5CK65wJ1WWJPqIoWaXTFL8qYvg+lTuGOzVwK/3388BtcjMumho3tHr2UHTIKXYgQA9Z0Zipblv6bSnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LWY0ajPv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LWY0ajPv"
Received: by smtp.kernel.org (Postfix)
	id 78A11C4CEF1; Mon, 17 Nov 2025 16:35:40 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 14F05C19421
	for <soc@kernel.org>; Mon, 17 Nov 2025 16:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 14F05C19421
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b2dc17965so3685168f8f.3
        for <soc@kernel.org>; Mon, 17 Nov 2025 08:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763397337; x=1764002137; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNVxHgEignw0rdNNAyxd1EhtIF5KPoYz+FgIgcJ0ztA=;
        b=LWY0ajPv6s5nQxMNw9SWdYqhqdDfVGIXtLxRxUBb4n62EC981DnGKwmarn3UpzEgt4
         xV8rw6y+MMaxtkLt9x+0jzW5so4M3Jo3ZjVZiJvuFd53vGxNFHDAzDJK8RF9t6kw+V04
         OVDxUMGxF6lhUWmxD8zupg6M1ESFu4nuJktGJSHMuWGmRijrT2nvpSVDODPQ4lOxc2LU
         D49Og+4c26j0rLQfHQyXSGzEvZWSGp+UWlDKVNOmaEYd9j3sTHVIF9stqM3XHllCCBwJ
         GHCCP8MB31j/BoRlnNMbIyru6MEwrOpHSo8fJCZz9FQYUwFIuNO25iR0KsXsrREdTXV1
         sVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763397337; x=1764002137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YNVxHgEignw0rdNNAyxd1EhtIF5KPoYz+FgIgcJ0ztA=;
        b=GOEPyDdw27gdAH/l9EAePRIG5KAtOyo40MnB2dPpwI0f4kdzYotrBfQ9msIx9TTUPf
         AcFDBp+zywpO6rts+N7xZupJiCc3kaIM68Ei3zih3g6m8j4CLNjite74vrMr07xfbJfg
         fgZKXDsgBORRyP5jEi3ZCYOAVnpiKsW0WaamoxIkeTvydc817v5MXOz/Cv5ah6MZkwVb
         NCCaVg2nUdJxgP6GB0GYHaYJ9kikMukONau99+wowd51p5FlZF5A+TIz12WxIkxXSh57
         dm+Lcel7jm4/nB0YWbc6F6jpho2NR9H+O4PLFpbTDXHmmeLulx2xOJQ/COdgd2nZPPSs
         1HBA==
X-Gm-Message-State: AOJu0YxlnDMdpADFEy0fsOq+obNrtQbF/GYNdZGAKmVK0Pcc0GzHYBed
	IIjgy4rKUtA+KjK9DewPQMTfcmONjeMNYskmzvwZqZooumnfnUpS5LPfh7yo/os/C+xFJyWyspL
	e34c6gh4=
X-Gm-Gg: ASbGnctTXPVaz9ILCsLCTCQIqOe/VcFtA0+MsBynM365e148VvtHUvoCd74QGUsxlaC
	3fsgmTOnK841BvRT5DS2OOZY+wlAqdcSo4Y58RtYULp3VTOMpFKa1ifDUsgiJCjE39Z0YoNKuVN
	FLkQtlSHVWhteuYak/xEx7nMbJLbErwFZQbHgSjLNzWgqrZgc4lTw18ShljoUkjVD/ldiYrsDvR
	oHJMZycvqFJzMzMfpS4JmYt2q7LNcnxnl97Pv5OCzl0skVh03VdJwGbSSQjS7kSRuPsLrXAl184
	YYBdm68Et8l04i5sex719LTA/LHilVg3o26N7zovTVVD949bfcOXKjMy0Lc321Dc8+SzuJQoUTM
	f6evzC5E/x4/xX2Vfz46UaCzv0KJ5uXaW3wHpj5jtl38BpfoA1KLa2whl1JIs7ldLjCVp6S85Sa
	v5wLFKhYrtLyAUSSBTDHM=
X-Google-Smtp-Source: AGHT+IF3/goP6VZz6KB9mB4A+moE0SqG2R//vWIM4SpwtPFRE2NyqXDCVpSYWlzEa695N/dGCGaNYQ==
X-Received: by 2002:a05:6000:616:b0:42b:483f:da8b with SMTP id ffacd0b85a97d-42b5934b2c8mr13569533f8f.25.1763397336928;
        Mon, 17 Nov 2025 08:35:36 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f1fd50sm26904384f8f.38.2025.11.17.08.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 08:35:36 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 device tree updates for v6.19
Date: Mon, 17 Nov 2025 18:35:33 +0200
Message-ID: <20251117163533.209608-2-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117163533.209608-1-claudiu.beznea@tuxon.dev>
References: <20251117163533.209608-1-claudiu.beznea@tuxon.dev>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.19

for you to fetch changes up to 7d5864dc5d5ea6a35983dd05295fb17f2f2f44ce:

  ARM: dts: microchip: sama5d2: fix spi flexcom fifo size to 32 (2025-11-15 15:53:56 +0200)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.19

This update includes:
- FIFO size fixes for some Flexcom UARTs and SPIs

----------------------------------------------------------------
Nicolas Ferre (3):
      ARM: dts: microchip: sama7d65: fix uart fifo size to 32
      ARM: dts: microchip: sama7g5: fix uart fifo size to 32
      ARM: dts: microchip: sama5d2: fix spi flexcom fifo size to 32

 arch/arm/boot/dts/microchip/sama5d2.dtsi  | 10 +++++-----
 arch/arm/boot/dts/microchip/sama7d65.dtsi |  6 +++---
 arch/arm/boot/dts/microchip/sama7g5.dtsi  |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)
