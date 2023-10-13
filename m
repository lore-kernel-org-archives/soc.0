Return-Path: <SRS0=NGH2=F3=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A314CDB483
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 15:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3CBF8C433CD; Fri, 13 Oct 2023 15:37:33 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B11EC433CA;
	Fri, 13 Oct 2023 15:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5B11EC433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso363755966b.1;
        Fri, 13 Oct 2023 08:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697211450; x=1697816250; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+ZY1Eo+hGBgOwzkZ57/CG02BALJwavzrznNDKUJoBg=;
        b=TqGYjaIpGnTI/z7RWice6LQo8PW1uX+SNxd4wyAzcSN4lhXorxitit1smDfPEVFpkV
         qce+W1uyZf4miknaj+oExB7oIc+UrEimFPiaEjOUBILqi3fVesunqqwjEg/rSW4xJZ/S
         1sQAP3igHTPVzG5wT8WlnEGpC6ltXL7z0NPeB9lrsXQHYzmfEkED8f32K9tTFEhJC+tC
         8RF6diU97/5lHuUARsTJJZGknD8/jnjS75qAGKijv+ly2qYsnZSW+rddbwIrUe6WU2ak
         uWNHiTGLyAZukYGqm1mTMVyPbUQu7IAzsZ42wqBWoNSpaTOpI4OKQnZk68Hr2PM8MSD9
         v5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211450; x=1697816250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+ZY1Eo+hGBgOwzkZ57/CG02BALJwavzrznNDKUJoBg=;
        b=nQsLoduk8P0C7GKqZd9XtYIANyHu5BAvebnFnnP4Rc4FUviQSA3yjTEbCBYW72Cdcr
         L+kmFpncHyiS+dDdsVgKIyL6dlwxbTLPrnnysXanVp6qWczxSHtPoln5XyVDh4gMg9XY
         QJ6gZAPk9TRbPFC94NUclPUpW9sZ5s+1L2XHxykzENaRrWY1nkg5BBQmN5P/h1KxtJ3f
         pI/snxgu2Z9lOz3ZXQ3xavxhkHD3j/f7Sib/LBrGfTNFuDLNwfnr8aEPe39zUMQOasOW
         zeAquzqNoIVvAZZOGubOxwCbgbNKqjDGOg+x/3Re9vJAiUmUcGxnK9TuAyjaXbW9c9/V
         ovrg==
X-Gm-Message-State: AOJu0YywTaggQP7hrzpq8RNJdZAWPJuHsv5kfMPWMwfyBJ1xRe28RnMc
	NPmFkkIC88cvpE6MoeNfnLtRkO9b+Qc=
X-Google-Smtp-Source: AGHT+IHF39k1Gkjh3CL21FI3J5A3m1jhzhd1cVfiEnS0AlXW/MWrlPSiofKiUmdWkr5p+9m5gZAEIw==
X-Received: by 2002:a17:906:7389:b0:9a5:b878:7336 with SMTP id f9-20020a170906738900b009a5b8787336mr28447343ejl.7.1697211450300;
        Fri, 13 Oct 2023 08:37:30 -0700 (PDT)
Received: from localhost (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id h17-20020a1709063c1100b009b94a8150d8sm12605318ejg.199.2023.10.13.08.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:37:30 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] ARM: tegra: Device tree changes for v6.7-rc1
Date: Fri, 13 Oct 2023 17:37:21 +0200
Message-ID: <20231013153723.1729109-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013153723.1729109-1-thierry.reding@gmail.com>
References: <20231013153723.1729109-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.7-arm-dt

for you to fetch changes up to 3c2508d3ce5764d1daea0a580cf11f35bd4f2801:

  ARM: tegra: Drop unit-address from parallel RGB output port (2023-10-10 17:43:48 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.7-rc1

Contains a small fix that drops an unnecessary unit-address.

----------------------------------------------------------------
Maxim Schwalm (1):
      ARM: tegra: Drop unit-address from parallel RGB output port

 arch/arm/boot/dts/nvidia/tegra20-acer-a500-picasso.dts  | 2 +-
 arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts         | 2 +-
 arch/arm/boot/dts/nvidia/tegra30-asus-lvds-display.dtsi | 2 +-
 arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dts        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
