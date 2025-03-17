Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6EC1C84C5
	for <soc@lists.linux.dev>; Mon, 17 Mar 2025 18:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742235919; cv=none; b=rG2t5bPg+p5kg5E7TUCLaPomQU6akcqQMogulNMKB0vg/SEz8rSOudy6XU23MUBglNKrIRELhb/K8/ryHBzWPciz/SUiRsn7jnHoG3yOcBA8WPy3SRzlUodU7G8WH7NFOg3mXi2lqMus7cHkfE4Hj98pyCFN6tv0GleAMYyioeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742235919; c=relaxed/simple;
	bh=F0kSk1oaVReSsBSXx9pB3+kykUsoZNLk1JX4ooTBvp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hF8PR37IYl2I6Zt8V7CimMMNNbpM7tq/a5qh1RxUM/nWdu51tC5YsBWtv6gT9dHsY2P23Qqw7PRg3A6As4hArR8QHaNKwTpQnVuuCWyQhaufOgp2/lJPYO23TZOh78uw0I50JmMTvsMpC/ijF7JhBnxtkMKBex1d4FQuRqWVXR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pnTUH4e2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pnTUH4e2"
Received: by smtp.kernel.org (Postfix)
	id 8ED2AC4CEED; Mon, 17 Mar 2025 18:25:18 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CFB7C4CEE3
	for <soc@kernel.org>; Mon, 17 Mar 2025 18:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2CFB7C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2243803b776so48213075ad.0
        for <soc@kernel.org>; Mon, 17 Mar 2025 11:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742235915; x=1742840715; darn=kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=POAt9Pl6v+5VOwi53a8XwCwJ6f8Q2+wA88xSDSYqCd0=;
        b=pnTUH4e2cb7sOxY+86XEf8ETX9dUQhWBsvv3RTeevbGOaJb+aVVm/RyZlhNlDZVnYk
         0u4wQqiAN8eoCV+I4f9110S2mBZiG/NvUhv4K2pRWQB6/seXlPFGA3Ed74OEiHSq6yUv
         J5Z9UI7rT6FN5JHaVoRE/RInEjHvqb1aqpJMpkUd9WSyhReaeuheUoAuVQPSebq2YG/D
         0DfBHWgwIL+6DA/qRWa2E57m15VpL+7UVBKKmo1w2Bs/ft5/wN5C64uB00ta0c5yoDUV
         nj3mNc8/2uUh80c1JIMVK8xO1v8CuoZRcIyqD6dpaCgieumH1bGlztVXf8zj8ihoJOUY
         TIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742235915; x=1742840715;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=POAt9Pl6v+5VOwi53a8XwCwJ6f8Q2+wA88xSDSYqCd0=;
        b=gndbyQ4En819mj/7Pj0gwFCUJzGv49xaSHCD7E5Qvp60AuUmFAkSvDk+mqK6V50V0K
         BIjNWHZdAzIgdv6uOyWfKzGn5NBZsiVsrJDefrki+vmlUXt9SyvbdemKNYQYCHrJIO8+
         ck7aKcUpLQsqEjXyJ0+PJiaqzIT3wAz6OXlHafwGjDvP0L51rKSTby5VTi9Kce2QwC14
         9aecouO31MPWOP0/7U+2/1yzzkG6GSjcd2LJ4+CeDE9xgRN8/fs5DdYF6rWHnBkE7q7M
         mtfgVqYt2nA3svT0ZdEIJAF7eC+hSI9MBkofEVHtq4VLRBQHnrRsOT6Ca0O7me9kLFPL
         8CRw==
X-Gm-Message-State: AOJu0YwhkiEN2JhLNPNnfes36AJgyIGWlpA5JysKWQEevqOpm33kaCqO
	o4vU7WhFn7BlVuHpG5FOLMVQLh2KBmAI17p2SWzLnycuuFxu1pBuWph57LySeaF607OCvfTBIeL
	+cFG3Mw==
X-Gm-Gg: ASbGncvXjl6IfGL0CqVZsk+XitATKY7iwlH+vbSoBAvc0SltiLjmDWEhND/Yj2Ph+bu
	Kw5QEjhgu8dZIqANnOWEwBRmG8QR4skySpTfQvjBZoobAMw0viYvW5LHvHFVJTGpXfeh4eQmdkc
	2psJPB+Dj1Y+0k3nM+v8ecmbU8ZlY0b/xB0qDEC1wAca2imq8pnNuOO2zV78e7dnKIZU3qmPRsH
	1auQPr2jimxBu9i9NaF71ybrehQXSYligzxSZ6VaWlifYZWQlsSLIst70alJKBtSMsI/HQ9ja7h
	ngBpGs+VBuz0lwHpSabxnB1db6ELwsbEkdD0j0/kf8Y=
X-Google-Smtp-Source: AGHT+IE+WFZbIbKZVR1Ierd5Hw06H1qgwrQdddFAnectjHJowyBTGk1xMScRIVqNGcKVFoQUH+RMIQ==
X-Received: by 2002:a17:902:c952:b0:223:6744:bfb9 with SMTP id d9443c01a7336-2262c5ee786mr6788795ad.41.1742235914800;
        Mon, 17 Mar 2025 11:25:14 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a407asm78970415ad.62.2025.03.17.11.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 11:25:14 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: misc. OMAP updates for v6.15
Date: Mon, 17 Mar 2025 11:25:14 -0700
Message-ID: <7hiko7qzud.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.15/dt-signed

for you to fetch changes up to ea07a4775df03852c353514b5b7646a17bd425be:

  ARM: dts: omap4-panda-a4: Add missing model and compatible properties (2025-02-05 16:26:34 -0800)

----------------------------------------------------------------
ARM: dts: misc. OMAP updates for v6.15

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: dts: ti/omap: omap4-serial: fix interrupts syntax

Krzysztof Kozlowski (1):
      ARM: dts: ti: omap: Align GPIO hog name with bindings

Tom Rini (2):
      dt-bindings: omap: Add TI Pandaboard A4 variant
      ARM: dts: omap4-panda-a4: Add missing model and compatible properties

 Documentation/devicetree/bindings/arm/ti/omap.yaml        | 7 +++++++
 arch/arm/boot/dts/ti/omap/omap3-evm-processor-common.dtsi | 2 +-
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi                   | 8 ++++----
 arch/arm/boot/dts/ti/omap/omap4-panda-a4.dts              | 5 +++++
 4 files changed, 17 insertions(+), 5 deletions(-)
