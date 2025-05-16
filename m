Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B97722CBF7
	for <soc@lists.linux.dev>; Fri, 16 May 2025 08:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383648; cv=none; b=ZyDs8qayHaEzbMvHPanEW6pffAEgKsPJNrVpMDt9wnhcdJfMYZkIKYVKslkFP6pWkshFgZ6S3Valr7a38VSnWBjXwrKcJQRdbpYDpiOcQGGeks2An2Lwfbwn+G/OC0tGFHboyDUQTRiLzeog3Xc3013BoXPhAMwMASxZ30PH/24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383648; c=relaxed/simple;
	bh=q7KcxdCf754Fm0Sh6Fg6Al5BAVBp19Dlxv08kjo2YD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=chvlQZCaZ5+GPNjhJO4F3Qa3Jd8r5C6vTkApaJAVmbAQaCUbtMmbg++GwRqilfNrkmxZYt7SYckyRzoFggdovc60IX8bow7fg5QDxoiLzP6nIz0LTzptNztkHTrqzEKXzeYXhkDxQG8pj36Jb3wRwBaGgKQkls+H2KgtiH7TUEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ghMB+A7g; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ghMB+A7g"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-440668acbf3so985655e9.0
        for <soc@lists.linux.dev>; Fri, 16 May 2025 01:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747383643; x=1747988443; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AWiHCyffjsTF/4oBfvkCIkeTDad5rgPB/sxiLylVPuY=;
        b=ghMB+A7guppJ3rH+UVxvHV1myOacDtOTBBNM4r6NXdunxpEoJVRs+hBFNolh9N06IL
         WMcaj0UDRtoTMZMBWqAs27VMLLB3Ga0zLJIOBloCHRg2eHGsnqi6iUd+TDRNNnqwVH/k
         f3Uadkd3Fr7HzXJ8hRZfxqzK68+fsx/bQl2wJcQX47ttTi06XUv3Or5ZBiO3+yKD9e2p
         FbazfuJ4/Oxmy3cDNadAp5Q8g8JMv+8xS0BYvk+W6nnA9+vEoAdpXkwuHvhFiHhP9/OM
         M0+xGq0atxEWMrrK9C6y1aurkM0Yh68H4Z6OiU33HeuIAwWqJGJ8zAoSmaofLVqeIzk8
         VhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747383643; x=1747988443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWiHCyffjsTF/4oBfvkCIkeTDad5rgPB/sxiLylVPuY=;
        b=iw91+/juNY8TE1GrUYTqylLCIg8kaIIzSdsCVrhEX5Erjs5vOT96N6n1UOa1SHR2+m
         XWQMPUdBYP/uo6ihbnSGdFoU/juS0YRme1dtVqy2rJyvGfm49xBX4qx31Znw951cFZsY
         qUvQmliPRzZsJM3TBTPABEsVFK4hBRWcDp93ffnjg9INebHXElt/QE23ptNz6TuhFAfX
         JwyJvCeN22IEUN7G+S+c/uXR3MTgrnlgXwBkW7cOxKJKcJR9iP0kYTsA69AWeT/OY0ZK
         MJra2EgUvcPpF0vYKESQ7nMbFcazg5ELzeTYwDv/n2N8vRFkf33ZLwnlbRRx2Zy/uKD4
         3BAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyhFO51ptIn3LLmRKByUTGcdSYbY+wU40nCuSdjw3fpTHMshrnzLPUEKPheqrkloY0WwQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5mTxPoADdMdzIS3S5aARHaGT/EpJ6J9QnL0vC+A7B00vuJGRh
	4QqJQlqdi9qfmPXnZ1SG/jpu2/PI6moxA4ItR6gC2zPN2crNgWi441rH62BstjquOgE=
X-Gm-Gg: ASbGnctaVBEaQ6vAvoanhHl3XOQa2LVbPs5u084GZ8GaANww/jCKS44IVcMvYGHxXB2
	YDl3E5CihU6V4Q10O3fxO1fgbhpuetFEhzB6rpuv5sxTenELN2h3+M8R4T7x47+J3z6+jcJWDyO
	wqMa74pZayZKRKfcCCsje7GaxAutxiP7i3ZP4GXChOkcYDQ+z7rcAX53sWJmMZRMuTYQEwSVKAF
	FM430t7VzbPUG7zKl9N1LTCo5Pv43WpIDgKwRds3x5MIKgw+G1R/nU9Axp2nbanC36GLKoEgjx4
	e6UD+Lt4GjwLa10FFRrqPMA6Amqeb8jfCTtGWdgKd+3ABtk/7ngSczW6hK6am4Cfnj3ehGyxVn9
	ELz2MFhtI5IZtPHzj6HNrENZ8YxgdtlGffA8HyMQ=
X-Google-Smtp-Source: AGHT+IFaSqFDmfEc/eXrwtep+5lHfw+ciUUyEyM+rhboqdKMEMNhsbsCj3GNPcoF2ibeCQI1/GgRgA==
X-Received: by 2002:a05:600c:468f:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-442fd62fd3amr8485415e9.3.1747383643357;
        Fri, 16 May 2025 01:20:43 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb8c92d9sm66344685e9.2.2025.05.16.01.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 01:20:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] samsung: drivers part two for v6.16
Date: Fri, 16 May 2025 10:20:38 +0200
Message-ID: <20250516082037.7248-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1799; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=q7KcxdCf754Fm0Sh6Fg6Al5BAVBp19Dlxv08kjo2YD8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoJvVWHlLDYQ1S3UC+mjKP1Ml+sn0gSReMD8ON6
 HvYzvkVZhOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCb1VgAKCRDBN2bmhouD
 17CvD/40Jeg7IGxWsQFaoCXBN5u2/NbbOnFY2YILEL4HSDeuNA67zO/9cNH9hKKy6qVERpoxlyg
 lCOAneP3CP+W4sKSxAGsHWP/VLTZ5KmWW8r6/8Hy/4ua3kngRR5OPrJe4xJqgrOM+OqO8w893qp
 qMv3WhQObxIwP4j9aQ16VFe27x8b3b5jmcpv4DWkBMQmHxWPdfqhI6y05+jG2MK5tk9xoEddcqW
 XLyIWAt28tGblvzNuOv3nRfinV9TGiXkP2gycA8TNGqraweESwwzEW/kD+EKDkLdGCgXx/Hv77I
 LD7Rvj3P6cwnHzrtDi1d3XoTAjVhWPqs/7+1wR6fPLPAEMkx7E4n5zWNKnGEvogv6nipmxk+V7p
 rHvfde6HuqllUI8j4fHkPGq7l0t8zlMdQMye/t4bKPTw2gMP1fd6qDuL/I5BtyISWG6LZicNDKj
 Sf2tn0bhWROtuwZwqIkN1dInyn952pHbl9Y0rvZBRr1yEtTjGiyuel4GDyFzSEH9dHx5UgWXzFc
 17qbuQtA9TF0e222zzyNIY9Qn41PyyEEZOw3BTxF85BExbuTQ/pPISHqyZYj7pA2+3j29hziP0q
 fLTVEOp8AHGx+5aOJ2I7czWZCMbyNFe5mqHOM27wYxYQKG4IbvTgxHADgc+CH+7lB+D0DJddlRn 75pwPLFgK0OqP4w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

On top of previous drivers pul request.

Best regards,
Krzysztof


The following changes since commit 2c2e5e908ea2b53aa0d21fbfe4d1dab527a7703e:

  firmware: exynos-acpm: Correct kerneldoc and use typical np argument name (2025-04-25 11:41:03 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.16-2

for you to fetch changes up to 598995027b9181ada81789bf01fb8ef30d93c9dc:

  soc: samsung: exynos-pmu: enable CPU hotplug support for gs101 (2025-05-13 10:02:29 +0200)

----------------------------------------------------------------
Samsung SoC drivers for v6.16, part two

Add CPU hotplug support on Google GS101 by toggling respective bits in
secondary PMU intr block (Power Management Unit (PMU) Interrupt
Generation) from the main PMU driver.

----------------------------------------------------------------
Peter Griffin (4):
      dt-bindings: soc: google: Add gs101-pmu-intr-gen binding documentation
      dt-bindings: soc: samsung: exynos-pmu: gs101: add google,pmu-intr-gen phandle
      MAINTAINERS: Add google,gs101-pmu-intr-gen.yaml binding file
      soc: samsung: exynos-pmu: enable CPU hotplug support for gs101

 .../soc/google/google,gs101-pmu-intr-gen.yaml      | 35 ++++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           | 15 +++++
 MAINTAINERS                                        |  1 +
 drivers/soc/samsung/exynos-pmu.c                   | 78 +++++++++++++++++++++-
 drivers/soc/samsung/exynos-pmu.h                   |  1 +
 include/linux/soc/samsung/exynos-regs-pmu.h        | 11 +++
 6 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
