Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365114C6E
	for <soc@lists.linux.dev>; Tue, 29 Oct 2024 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730189409; cv=none; b=aRoNQ8G35kCksyIkFzHHLhc8EBx5kQze1MS/gy7D8GVjbS0O6QBLsuE+Y4kxH2Pk5wBFJBrjE1mjsYrcKxNKyfWCfsdNq4JKx9CXVhOForDqixrrfH15XMTIWcoUFg2YnMy/j66fyscKhyrPdY6INpmAXsi3pILzuEEgzq6zp7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730189409; c=relaxed/simple;
	bh=BiKzbp1jPxmy2zZUEQHW41SCWuFugkSatqygtUEc7hc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YAxB2H534w37UsT/03j6iEyskM7hYhlf+0JMR25EAOIAzUCd8vW3+Az5Rt9R4p+YxvvXyN7SgcfWgiFQWaKaCjnqsRdJ7T/9PfaVRDKLWlymenkmhoQUWehsRkbxUWXggLc0LsZWTMhH01IV7NKegQvYm8guuEr7Ek/P6q974Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sXNm0Ofz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sXNm0Ofz"
Received: by smtp.kernel.org (Postfix)
	id D1BEBC4CEE6; Tue, 29 Oct 2024 08:10:08 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CFF13C4CECD
	for <soc@kernel.org>; Tue, 29 Oct 2024 08:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CFF13C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4314ff68358so6433045e9.1
        for <soc@kernel.org>; Tue, 29 Oct 2024 01:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730189406; x=1730794206; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UJk4K1NEYom8w+Pd7ggik8xB+/zfQw0G3X6wkeyzU9U=;
        b=sXNm0OfzrsqQy+78YGtW3l9WdUjeYsc7X3mjPKJnvYZX/LJvwi1jutRvdGpT2CUuu3
         5u2K48kYC8yCCdRgr20Arp2R/EBK7R1L1IZhT9OThsjDGH6YgMvxD3IuJgTo4/VMzayW
         gEl7vHaNdlGF3j3kVLRx++TXlFsYHKJ3Kwp0eRN1MPvLxJ1++2ZUGrN6hS27JP2O4kgb
         /x8SuHNd1orAAhS1rOOwfu2NWP8E3+TG1jmM6HaKo0N03LmmbGkQM82DtgZUkAY+IEtH
         HTQ3vuIODvw0xGrgk9LB0/b+TqRjG8zrWV/MfAcArd4T2LqqOkWqRbsp+gDyx1OJZQGE
         Bvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730189406; x=1730794206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJk4K1NEYom8w+Pd7ggik8xB+/zfQw0G3X6wkeyzU9U=;
        b=jZ4NM00tInLFUXtFXEkm9i8svZ4YYRbjAsDqLTUJSrV/BIMVYHWr6zj5u2lYoBANYl
         pItAvwntdWw4IQrjAC/ahQLHs8tsUaJLOkzEP906dEBiumq6Unji+A6s9iC73NyIbO3J
         il3RjNIh6jJ/gFqPmcnT5TfN1ymqitPP98e7/vRMP9N5YybU8rK7CKUb55hcsU3ChaUQ
         joaPnn0Z7WlX4/JUV8ZkcPXr1rxEFO3G7FZr6gtTPKmLM6bJmIpNBEJ/WFXb4qc61V8r
         gg12lDNmQoG/ghdLJzB96N9RIQNnK3SAiQ2z4LbzUDghz/wP09zfoD8ERJ2rwfomlkjK
         jUKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf53CHfWhuIXEi/p7iDUJrgSzM7q46wSeJWSyomEuqXX9i+hjolHjD6FnBJODMujpO+7w=@kernel.org
X-Gm-Message-State: AOJu0YxcJEAuoigAOucV4e243+CcjDrk1DnVotglZ+wKuVjUV0+Voruw
	7HjWB+EqxCF/1w/3rEWfrgP44IDx9BOuA8sAotfjEsscjC+z20pWo7aWM7pjC50=
X-Google-Smtp-Source: AGHT+IHnLTXH3vKK9bio7SjMSZy36YKvL0zVstM38RToyHUADBXCTaWksKX2nxZaf0pDqrVA4QHoMg==
X-Received: by 2002:a05:600c:5494:b0:431:4a7e:a121 with SMTP id 5b1f17b1804b1-4319ad4ee8emr37678985e9.9.1730189406260;
        Tue, 29 Oct 2024 01:10:06 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f784sm165467485e9.19.2024.10.29.01.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 01:10:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Subject: [GIT PULL 1/3] samsung: drivers for v6.13
Date: Tue, 29 Oct 2024 09:09:59 +0100
Message-ID: <20241029081002.21106-1-krzysztof.kozlowski@linaro.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.13

for you to fetch changes up to fd0b3581666860610ac770d4b582df42e0065c58:

  soc: samsung: exynos-chipid: Add support for Exynos9810 SoC (2024-10-27 20:53:54 +0100)

----------------------------------------------------------------
Samsung SoC drivers for v6.13

Add Samsung ChipID driver support for new SoCs: Exynos8895, Exynos990
and Exynos9810.

----------------------------------------------------------------
Igor Belwon (2):
      dt-bindings: hwinfo: exynos-chipid: Add compatible for Exynos 990 chipid
      soc: samsung: exynos-chipid: Add support for Exynos 990 chipid

Ivaylo Ivanov (2):
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8895 compatible
      soc: samsung: exynos-chipid: add exynos8895 SoC support

Markuss Broks (2):
      dt-bindings: hwinfo: samsung,exynos-chipid: Add Samsung exynos9810 compatible
      soc: samsung: exynos-chipid: Add support for Exynos9810 SoC

 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 3 +++
 drivers/soc/samsung/exynos-chipid.c                                 | 3 +++
 2 files changed, 6 insertions(+)
