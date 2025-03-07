Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7412A23BCE7
	for <soc@lists.linux.dev>; Fri,  7 Mar 2025 16:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364623; cv=none; b=pvEnJNyjX3xO6QBm6pdkwAJmNYGQd62iNt4a3h1yqEg849cBWIGHTkPlDn4TTwuAn73EHKD7ImGi1DGswZZkldPWDwYkMplQSJx128m+3PS9TSYHdXzYZARglw5V8EDbUPrOJau6+ciRbZ7gwV/VgVH+P1hyITpWtRilM85MVCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364623; c=relaxed/simple;
	bh=JllnNiKS8zG3HJ2XF6CCeGT2FpX04hKkXy+JOLQltvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q2TdBwNebHoBSY9H9D0wIFRzTwtxF9UXKYl79APx/m62inYFli/upyVClD3zkbqArpKeVlcyZCi1vYEejUla75rLsEVWkbIFeU2yMFJt6xrvogV2giITSdUumOvKGRX64kODZii+QO3m5hTeQ/eW9R+3I9qB59tNJpqJnl19o20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lo0F3o6b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lo0F3o6b"
Received: by smtp.kernel.org (Postfix)
	id 021CEC4CEE2; Fri,  7 Mar 2025 16:23:43 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07F0FC4CEE7;
	Fri,  7 Mar 2025 16:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07F0FC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3911748893aso1487634f8f.3;
        Fri, 07 Mar 2025 08:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364619; x=1741969419; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1fJ6z5PudcapFlOuFM3afjcyHz5zpohcRH8pXTkbGA=;
        b=Lo0F3o6bmaUDtQWoqZ791Vg3f8lVuJ81oZZsm4K5dWmqk7+RULm78LZW9VHztiFZXG
         xVwLY+GtMM4qfjQtdYI/jkbiWGTPkemM4JAHl5to+W5uc/VqDesfZqrbRcJeItwcXPh7
         GhGr/X+JoAcIbw9dqq0TmzFrvWKT8jRUSqVKiFeq6nS+2Zt21v+Nu6OwGhCctSK+FIgw
         N8xOn2TqYNh+KJ8BL77Mhhq5A1cyS1BUlKxrmhNA36tdzou+0RYYLA2LBgGjvbjmXDKn
         1tN610ujIkvH73xkWT6XHBluvC7nNOFxhDsR5VsSJIRgMajzvrxrk2zeaBbbyY89VGEW
         3J3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364619; x=1741969419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1fJ6z5PudcapFlOuFM3afjcyHz5zpohcRH8pXTkbGA=;
        b=bhmNU8xYQ/6hKersq1X0hxzW65NrUatCLAAiSNPD9B+Gy1QuKrzebKTR+oMVRoNXHd
         Ii8POgmwIYaiT/MU4kQrwgQmvPEJX6fdTu0FAyzLPYivLCkhMSzAYv/yQrsCfEdzGN+q
         +kuEBtevxDCe7lFSYKDeMa5S+s1xmMBPr2VQjaUMDsFUkanc4BSCuUYw3i2c3jp/mzwn
         FQ9GgvzA3e0BSqhUQ2TeEkXVGqhRZUQIn6vvFwyL0GR6DUWfqeDwsqpBiSSDIhdVibC0
         g12aLomySR9HE7YiBDd5Ju83z5y57IPV2sNQtz0Myf7D4hPNUhB8eml4C4hMDr9A3040
         4X1w==
X-Forwarded-Encrypted: i=1; AJvYcCUKwhjS3hsKX1g0ys7YKbtdr7fUY3V81rBjJLfi+rkZiapqVCc0yKEsHEoa0PVuy3m4tv4=@kernel.org
X-Gm-Message-State: AOJu0YyfpyxmVOJ/sZ4DoTPrVF6B42JO5pn2YME+/UbgDzWlEwyIGlvU
	q6aPQia87RnMBpCAsKW74BHlR2I8eG7yOZ8lrMrbocufIZKo12GI9lVaKg==
X-Gm-Gg: ASbGncvyysff/178PAeYNUKAi1VdIwRAAU6L/XhZAJ9rg8+xuWz9+pK1Zc0fgv3PUI9
	geF3utyWhsYPPsUKeNkB+kacrBx7yX60YCtvUOKTQaJ3LG73Y7025o6tx7VMNp7SbN2GKSdBwZd
	mp5tGS5c0eM4jGHhH/5WLvyVa1F2d/hKKV6RbosU6SZ47hH9qAECvYN1nao2L2EvChNmyyvIzhf
	aH9mVW4epSZ3Kwyd8bYUrpEBZw2G8q9mgKKLjRmLlCn/ojrnij3nxpKRZh0RL0DiiFtQfCGNNmY
	75wPHys+LeP3BtVPyUBqcnLok7MPXGS+IWAesygplPHHuPojGlkiJlXrYcX15Uu1Radah+2C9Mr
	P/Kw06s8TrVqR0tdLTV5V5F/gkDIWYyBy8H9U
X-Google-Smtp-Source: AGHT+IFkOj93xZE0jxlv4S0NKKZsz5OtPsjG2/EENZKtgykPA6URLC2WRnbzH6v95t7aU3xJAnq7PQ==
X-Received: by 2002:a05:6000:2184:b0:390:f971:4ecd with SMTP id ffacd0b85a97d-39132d957f9mr2154541f8f.26.1741364617951;
        Fri, 07 Mar 2025 08:23:37 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bdd8dbb4csm55995825e9.23.2025.03.07.08.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:23:36 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] dt-bindings: Changes for v6.15-rc1
Date: Fri,  7 Mar 2025 17:23:29 +0100
Message-ID: <20250307162332.3451523-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307162332.3451523-1-thierry.reding@gmail.com>
References: <20250307162332.3451523-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.15-dt-bindings

for you to fetch changes up to 294630d81ad65333e5d4ad3efcb82dcad6177e6b:

  dt-bindings: Document Tegra114 HDA support (2025-03-07 17:08:33 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.15-rc1

This adds compatible strings for Tegra114 HDA and Tegra124 MIPI.

----------------------------------------------------------------
Thierry Reding (2):
      dt-bindings: display: tegra: Document Tegra124 MIPI
      dt-bindings: Document Tegra114 HDA support

 .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml          | 1 +
 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml          | 1 +
 2 files changed, 2 insertions(+)
