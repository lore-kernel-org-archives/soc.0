Return-Path: <SRS0=+HJT=L7=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EDCC19F4F
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 18:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 20430C2BD10; Fri, 26 Apr 2024 18:05:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 566B6C113CD;
	Fri, 26 Apr 2024 18:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 566B6C113CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41b79450f78so8587095e9.2;
        Fri, 26 Apr 2024 11:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714154725; x=1714759525; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iw7hiFCqSH+f5xf1n12qathK8lx+2pq5HrS4lci0i5I=;
        b=DXPeLWxE/At/0ttyvuFIHXdyCRxGTFutd7NdGLOpuWLoLL0v4L8XF2BdhQokLsiaEK
         P9qk3hMAFjGq2v4JWK9Wx57xTbtDOtRhWBiPeGGve1/FKl6XYp610YN3LZ3SLr7uyLPj
         eFblPqjBRIFM+ekiB2a4JfG7Kdc8i5WlD9vWfLIu60WQp/k4sEMA6mCvkQRrPWqfVQQR
         cRsOGhHM4YXkF1Lsb2v3GsbBwMZmfw3NvTiCsrC3wBtVphrovFTS8m/Ob8TMPTVIy1sv
         BSG1OnpVcza9IIhAO5bPNlETgN00Xurdle67XkIQaKTdIKMb8US1OYyRFt3Kl08UE4sE
         xA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714154725; x=1714759525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iw7hiFCqSH+f5xf1n12qathK8lx+2pq5HrS4lci0i5I=;
        b=PrHOq4OaRUjHWkt5hzuka9Qixko/TgMJ/Yr5UhYGgPol4Agli3KNp6oOrTldAF3qat
         NVYd8pYIpUH//uOUG87QYBqpFlA5uCq5xh+R6OROk60qfQosHKrXZ+MDlIHphNiL8ABR
         +zfvywUFQ6JPlRlxBwaQ63FJ3WLqngfH8dP4SDUNFADmtPGssfTE0mP5o6dgonp3oiBF
         LYJ0PCfGOLlzMWsgAl1YkKSuOdr4r+Xy1yuZfcVVMr18pZPyIkhEdbf1yuAZK9GNspuN
         hKQGSjN1/CGfRofZrYkefpiCtNeoXO3fyFyQy86kxF7BB7NWscr48QXkHtvnFcM1FoEi
         l1dg==
X-Forwarded-Encrypted: i=1; AJvYcCUIZUkk1F++juKN3fT/KJoHLQz3PxOLeCkosjwtUD7qM/dAYxYozakrMCniYdHTiO7Mb3vI2CO5FNHCdcj8sw==
X-Gm-Message-State: AOJu0YxyOMmXek6xhZGiO4/9DpJv+xVRlLbNdkzP82sodAi4dTF8ZPTO
	/Urp9fxW0AP5PI3u2KVGdWLP9aBhR8eDVskqKGorgeb6LqLDmE/Kh2bKEA==
X-Google-Smtp-Source: AGHT+IEXVfEdI/LdVu3nIcAo4bA5JHuJ0y9b3SCGJOBTQKa91Po8YAJyBkLuTWSOcUvg5AnOLp3bZA==
X-Received: by 2002:a05:600c:3b9b:b0:41a:c82c:1999 with SMTP id n27-20020a05600c3b9b00b0041ac82c1999mr3148617wms.9.1714154724924;
        Fri, 26 Apr 2024 11:05:24 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id h19-20020a05600c351300b00414659ba8c2sm31770464wmq.37.2024.04.26.11.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 11:05:23 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] dt-bindings: Changes for v6.10-rc1
Date: Fri, 26 Apr 2024 20:05:15 +0200
Message-ID: <20240426180519.3972626-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426180519.3972626-1-thierry.reding@gmail.com>
References: <20240426180519.3972626-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.10-dt-bindings

for you to fetch changes up to 22b92b28fcf4f7748279c4071c63e53fecfacc2d:

  dt-bindings: display: tegra: Allow dma-coherent on Tegra194 and later (2024-04-26 17:40:18 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.10-rc1

Included is one change that adds the dma-coherent flag to the device
tree json-schema for host1x on Tegra194 and Tegra234.

----------------------------------------------------------------
Thierry Reding (1):
      dt-bindings: display: tegra: Allow dma-coherent on Tegra194 and later

 .../bindings/display/tegra/nvidia,tegra20-host1x.yaml         | 11 +++++++++++
 1 file changed, 11 insertions(+)
