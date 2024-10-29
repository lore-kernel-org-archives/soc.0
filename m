Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A9C202F99
	for <soc@lists.linux.dev>; Tue, 29 Oct 2024 07:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730188436; cv=none; b=VpwNMvfvjgHV2zLItw0gqw5IOZfn/5G8FvChsO3QkAABQdlI72llsFC4Lt1/BlhmGh0DgPXwEQ41fuapIYZvRkkcek8wbSIZKa0BJ9tozEf7JP9PURG4WH+SEBpSlBmxFHLEfPs/t4hGS/NZE/Bg+UczcKvchmuYKl6G8TKrWbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730188436; c=relaxed/simple;
	bh=KsjPCtV8NQo2f8cWR9Xgy22vudGexF0FRJzmq90JWtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bm5UQBN/qSLb6mQtsWqmIMclkPtfSIuklotuT3UzYlCTbvsRAn22IK5f5A3DrgD5nPM9tR8oqBMGOuG0GVyT3wH0Bp2XmhgPMQi7+Z6xxy8KNe550Wk1sbD1kWFgsiMNbLk69fiZsLN2ChSrEQNkysbdGqWx14HLHMT75cSxmzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d50/bIAN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d50/bIAN"
Received: by smtp.kernel.org (Postfix)
	id CA82AC4CECD; Tue, 29 Oct 2024 07:53:55 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9DE22C4CEE7
	for <soc@kernel.org>; Tue, 29 Oct 2024 07:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9DE22C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43160c5bad8so5639365e9.3
        for <soc@kernel.org>; Tue, 29 Oct 2024 00:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730188432; x=1730793232; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1PWSKsonNDrTWkbxkIHIq6fERLhyZhv2JFfOwChp3PQ=;
        b=d50/bIANqSszFsc0kNLcLfzPg0KSEX2tOb0f7C6tCg3BCsMRaR7s7jBHrU7RlBT/7r
         5lOLiJ9XH25nTpWVhIsnruEYQkF6dsAQRommk0QOew5tBbkeaAwXD/Bw7bJXwD5KXBAY
         6fJ1m6aWoEUwlUCFW5muAPxjDwPKQZFCfDUHIRTs44bOZLHxtG66GNlfH07qQ4tr9tvr
         /1/80giQD2hCgcD3ujx0PLATEFLKOvjx6Y7sRsBPJpY1ZVDIkJpOvHmblumHH24OE0k0
         9wS3nH7fKNRJ+8MoA4lkH9fhP7X70KFQP7ESIFe4BZozx0nrUSFwNS/O/F7tmUvmiFwu
         PKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730188432; x=1730793232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PWSKsonNDrTWkbxkIHIq6fERLhyZhv2JFfOwChp3PQ=;
        b=tKsLomQ5WXlsRRokV4o8qGbKF7Dsm8INaimvIV264JsZ9PzgAGPsnivi2GBlfHHmeU
         s9oqJP8lrP+veqZDrK6CsXoIt5+7SzQtKghP+2fSiXSNkn4ov2KM6NKXHiBU0YwV/Ppd
         +5e5owH4UNcLMeCsN2rm2FOHzZCNy8GRNlDthf2FUevk+F3W9uoF+aNFkKAG6CUjt1uC
         B2eoON+8zKUDRGdRSjvOnjTSW39RgVnwcl4/sX8dBfooJVDVhcYyLJtNwtz6lvPQU3a7
         SqC59TiOvZVZO5bhGjAfRE6GIyHbCDepE1Tvv281Qr7s5ecbPqUYFBTvnAttgZIOOAN0
         68RA==
X-Forwarded-Encrypted: i=1; AJvYcCUYgmueTA7wV9rIxOz8ymmkCMs11u7zz8Dt7u3sLR3AVeztpm8P0UAUCL0AXKdlnBImQA8=@kernel.org
X-Gm-Message-State: AOJu0YzQxur8wD3N18n0O334ajUPXuw9gw2RqJ7x3iGxfZAFfUdvoHUN
	Jz/CycnoH04z1h9N5KIE824AtUkURJGkoNkHLQrsX0epauDCXX1ZY71kDNWU/XM=
X-Google-Smtp-Source: AGHT+IEo2H0HuNGG3T1G8gRQ4j09F1Tx7ARRpFQfrGtgBnln1DVpGWZgDlCNPMYtiYTwQ6xUjK8ajQ==
X-Received: by 2002:a05:600c:3b13:b0:431:55f3:d34b with SMTP id 5b1f17b1804b1-4319aca248dmr40337185e9.3.1730188431861;
        Tue, 29 Oct 2024 00:53:51 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4319359527asm134564545e9.16.2024.10.29.00.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 00:53:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.13
Date: Tue, 29 Oct 2024 08:53:47 +0100
Message-ID: <20241029075348.19580-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.13

for you to fetch changes up to 1f1d847a657523e182df87f88158b607afe7d559:

  arm64: defconfig: Update defconfig with now user-visible CONFIG_FSL_IFC (2024-10-14 20:10:47 +0200)

----------------------------------------------------------------
Memory controller drivers for v6.13

1. Freescale IFC: Split handling of child nodes in the bindings to
   fix dtbs_check warning.
2. ARM64 defconfig: Nothing selects CONFIG_FSL_IFC anymore since
   commit 9ba0cae3cac0 ("memory: fsl_ifc: Make FSL_IFC config visible
   and selectable") and actually CONFIG_MTD_NAND_FSL_IFC depends on it
   now.  Enable CONFIG_FSL_IFC in ARM64 defconfig, so users of it won't
   lose these two drivers.

----------------------------------------------------------------
Esben Haabendal (1):
      arm64: defconfig: Update defconfig with now user-visible CONFIG_FSL_IFC

Frank Li (1):
      dt-bindings: memory-controllers: fsl,ifc: split child node differences

 .../bindings/memory-controllers/fsl/fsl,ifc.yaml   | 32 ++++++++++++++++++----
 arch/arm64/configs/defconfig                       |  1 +
 2 files changed, 28 insertions(+), 5 deletions(-)
