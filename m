Return-Path: <SRS0=O1yF=P2=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00885C54735
	for <soc@archiver.kernel.org>; Tue, 27 Aug 2024 12:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE21BC61049; Tue, 27 Aug 2024 12:16:46 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6256FC61042
	for <soc@kernel.org>; Tue, 27 Aug 2024 12:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6256FC61042
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4281ddd3ae8so3586515e9.2
        for <soc@kernel.org>; Tue, 27 Aug 2024 05:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724761003; x=1725365803; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oEwWKAl5wGRDwroJblbu7pL64awe1nGTFISfN3cbkak=;
        b=NXluuDpzVJZy14gSrDym28XN5ZPDIrNbMXawXEoT9vD8lFCjn5Ql5KaqHANu20H0o+
         K/lVqfLVB5u3gRY6drAcYfJTAH3HpDiX3ggS6wsbyaCzrMY9y47sJLtEuXg5d7gYREYL
         kUeY8BnxFK78hwjlT2YgLeS67rHHmZZ0gN99lER2qVt7axN163uk9ZlO/H6lBx52pl3Y
         mYyCd1jCzHOQ/83wAseOo0NbIewaRYNGQppo0thlMQG4g8KaCF9C6bAu5P6CM8N4r1LW
         P1G/1ZrpmKXuPFjhac1GkbKTp1hjIFLOnRaqVvVOq31yXKeJRfRmj5WMajtSSt23dGfm
         QJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724761003; x=1725365803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEwWKAl5wGRDwroJblbu7pL64awe1nGTFISfN3cbkak=;
        b=ayjdNu1qV0aTuek3GaXClI4flM7n75mYfXpX6bVOikNMB/BoUJIusFvMDYn88x2cjn
         iAaG/TNji9TiCX1CPR7SkGsr4s4lxUsv52Bpd4j1qC7RbW+4jasyXCJ7Am8j1PwitPLg
         BkdVIaXsJqQYUSaqZkoHqugnUe7kXgPw/FJxR8gnU8edfGQCHgHKqcNnZhsimdBRWnEz
         95HHT5MIvv/FsRu5hyem8Qf8pxlmut+bWjFt+M4IR0BM9K7d8YXK4x2TyuwNxiAG+vPy
         G4PY6mhjUIAGf9dc5srVQ09AVmOICGFY1truT9MFvIwIZx6ZCNUzTX6KJD8a31EWvEdR
         fwvg==
X-Forwarded-Encrypted: i=1; AJvYcCXAh+1Drf7UotOlcQc5G6SYC48pbITh0uGK0rlSZnpbS7AnRx3kA9nvLGsDQQvhYFg58oY=@kernel.org
X-Gm-Message-State: AOJu0YxvBMixWyVXBs5QogDhbg086p74GSU/9Y95xkWOs4mv2ARhnmY4
	jvvYFga9hHwHtDc0ihFWZYK2y4s8t24mDZdmtI3qsg0ibLx7u5+061lg+lR5pvc=
X-Google-Smtp-Source: AGHT+IGI2jkuW2aZw6VxP7IpTsq60+7tPJdvBVRUUpM0SYoTCjpfgtxRq+29vHOWeEMfK0msqpZx+Q==
X-Received: by 2002:a05:6000:154f:b0:368:4c5:12ec with SMTP id ffacd0b85a97d-3731191d5c5mr5082598f8f.8.1724761002343;
        Tue, 27 Aug 2024 05:16:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730815b7e3sm12998658f8f.53.2024.08.27.05.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 05:16:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/3] samsung: drivers for v6.12
Date: Tue, 27 Aug 2024 14:16:33 +0200
Message-ID: <20240827121638.29707-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.12

for you to fetch changes up to 259f5082721f1d17b4e5b9dc2bb430821afd95aa:

  dt-bindings: media: s5p-mfc: Remove s5p-mfc.txt binding (2024-08-26 14:34:51 +0200)

----------------------------------------------------------------
Samsung SoC drivers for v6.12

1. Improve Samsung USI (Universal Serial Interface) DT binding,
2. Cleanup old Samsung MFC TXT binding.

----------------------------------------------------------------
Aakarsh Jain (1):
      dt-bindings: media: s5p-mfc: Remove s5p-mfc.txt binding

Krzysztof Kozlowski (1):
      dt-bindings: samsung: exynos-usi: add missing constraints

 Documentation/devicetree/bindings/media/s5p-mfc.txt       |  0
 .../devicetree/bindings/soc/samsung/exynos-usi.yaml       | 15 +++++++++------
 2 files changed, 9 insertions(+), 6 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/s5p-mfc.txt
