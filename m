Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BE22836B5
	for <soc@lists.linux.dev>; Wed, 23 Jul 2025 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753261508; cv=none; b=md0oE6vyPXk8O8alH+i+xGLDcHBll2dYVVzz/tURHSXnsA21mpuiB739LrolWOBM5i/UgB9la2KY7i0wMa8ZwDShN+aMqx4e3TOgjwhtStoEBKZJeGbfyLlZZTmbDNwsAsYjG+uV+FMGOqRhanjo/SJf/9kBgHcQdypEE86ms9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753261508; c=relaxed/simple;
	bh=k3GjnkVYrP1B4aQik37L6qakXOv0eTA+cuGhbBu9yp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VzOiy5VNCcE9LCOdLAFmCksQ1TBSzJYXkR4J6/ha2hNsEEpXhkxknjYdkAcH2sRaV5vR8TSAnwSGNOOuJxrHoljIDWI3yU5tu2YQmAKIHjsuJyo66FJcPEtkhUZJYzmdHIx1T8+yWaRc92ac1BFxAi0bIkKTnrrew29OUx5/MP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wpLwwq3J; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wpLwwq3J"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae35eb87810so127705866b.1
        for <soc@lists.linux.dev>; Wed, 23 Jul 2025 02:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753261504; x=1753866304; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCgbja/gOTY6PAB9qzS6fOz3VhDsGQwTh8VHxpGStNo=;
        b=wpLwwq3JLhOEfCd9zft+ZFcML1iu0XckaEfpP/Q8YiHscY7LjUcdptTePfGv8tu1Md
         yOoUZUPDu9kqQXS1E+uV+8NCncGNoBFRxHC2GSh1ObVsBcJLszCaXh8T/7ThD4VVepW0
         yfdAirDNKIBB0UzTGtAi7k8eMYfIW6jHKkdsDpmemHBDY1tF305VCTIaMVSwyoh3h3IE
         BaHr+g+gey7rJP2yu19RMhe0XW7OgAbztduo96weHoLH8dMWnQoozwzbOGKROzjMqAAU
         TD61qirsIPVwJ8QGkTfevXe2GnqdfUond7bkIE+9LNYGEPa9lirAXFdWP4JIV6ERSrmp
         Iosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753261504; x=1753866304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCgbja/gOTY6PAB9qzS6fOz3VhDsGQwTh8VHxpGStNo=;
        b=FzDvf450DttjcCWKzs6WI1SoYygf0s8zui3LqkZqs7t4X6hnIGcYjZRni//C3Kc4qx
         7ZGoWFWJpXJZXxzw9iXxGQnBM0wAfEroVzIKLz6IksxswdFUPdz4NZSK6fogeqw2EkyU
         Zh/8YyaOhtfZwKZAbvrbVkPEMjI4bPV+8hi1uBTyKtt+jAK5IF++R7lQyes5s2I0cGBs
         kXrlVc2AHofj9c8J8mH23YICb7lTYAsL5nCbopIzyhVc6CiQRQwwOH75aDV3VrE2vOSY
         XB0PYGR/lXnHZwBVOjwzm4VOpBmTjG9Q8eUQi0pxmvUYLE3pSXw76rd4XNlntDvSahMj
         9nkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsu1HWWlye4Ppyez/zGb6JyPnrmKDpwKS/OQGvls/N8C3UX6tcpEflpgm7rQPpB1xxfg4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2W2RM3n/fPxRvcboaU1bkrIL30z5rlBFkBnvRct34mrNRQ45i
	I1k/wcegBZNUeMJbyx5B3+2F0a2wIEx4O8ze7ycC26wJx8ardh+eKr99BU95Gov1oVg=
X-Gm-Gg: ASbGncuxKC96u3veODpG5H4mkPKxa0A6M+0rUSq3xDydN2mmKM6xaPkA9Cx4aDHGzMT
	+bermuTJTcnKy1iQR+a4Yv5M3KmeBciTPVgQc8+Gj2aWUOHh3QUysa1IGKP2s+2uYpBXZT0Ks++
	btTfqHvlTaEc6G0+cqO0jvAg4mjCOqiSsvDsHYB1MJdU8QUOwsgykGVpysAZYUrccAvEIXkYHca
	Op2jZgR4WjmPciKH/cAY+O5ZGSpcKvD3Sk6uvjz1TgftJUWhlWY9DDR1A+vRgaQvdRVsd1uCN5G
	1mOBu29mPlZrmmXa3gaQMKErw/Zmbq41RJpvZK+vSpXOC+adWIY1fz4o4tWbIvfkLqIaDVZzW35
	tGrYlZd00mDbZX4mxkEoCk++bFIURVdEm
X-Google-Smtp-Source: AGHT+IGDvi6weUHt1zBLFFABHti+LtpFg4sB/fcxjNLis7RjEwnRTt3JzWNz/nbQdoKPmX82/bVYRA==
X-Received: by 2002:a17:907:a07:b0:ade:9b52:4d84 with SMTP id a640c23a62f3a-af2f9171be3mr83211566b.15.1753261503791;
        Wed, 23 Jul 2025 02:05:03 -0700 (PDT)
Received: from kuoka.. ([178.197.203.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af22f6fa6afsm208165466b.120.2025.07.23.02.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 02:05:03 -0700 (PDT)
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
Subject: [GIT PULL 2/2] arm64: dts: samsung: dts late for v6.17, part two
Date: Wed, 23 Jul 2025 11:04:56 +0200
Message-ID: <20250723090455.25295-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250723090455.25295-3-krzysztof.kozlowski@linaro.org>
References: <20250723090455.25295-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=k3GjnkVYrP1B4aQik37L6qakXOv0eTA+cuGhbBu9yp4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBogKW4P0UvirWoR64QHVT8sGAC5b3VZtif/zjju
 Tcgt15OsOCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaICluAAKCRDBN2bmhouD
 1/8/D/9g5Op+GBYMMSso3IjQEbVlUOXL50H08DRw5IhgOD8/JEC2MB9HI9A27GE+SOvvAuMn95N
 yAiQz2hEVZVBMhZRjSMvA/GgGL68YsFXodGDzrrohbVaQBX1Tt8O8pNZQg0un1MdSGlQk+xmEEz
 VAydxdgmYXNjp7x0DPiOKXgmUTtCBF2SI7l2gDJxZXbHeqx4J88M4eKos3AsLn/UPhiqOSbtOf/
 Vf/1i3bnQvPYiUYb/j+RJsA8O0Z1VsrZn+S81zDu+YmShmJ5K3hXRBPyhhFNvFiDSkEfAcfzh16
 ZhNgr+hH3eLnEBurn/mVIK3C86dvHdYHRRabzt907PbYvYewMqEHyciTIikc77zvJFcemeaKIn7
 NdTymOl0yn1JpbBmqQp3sz77KNHp872fGEBnPjNSW2GcrSERXkEYCjMi4MFD4QqTw/91G7z9AAv
 7jnvOxIoBDk3osWnb2TMCZgTgCm9pKnCyWsBfnm2KrgNVzAknGozS9iMV454DIR2b5Q+QiCltVb
 6/ZrFsnOuREufeR9O9esdGUlIh4T0uEawlYXyPN7/El2KsAWBhWLa3CxYFlBR6KF7p9Lmp9UQzi
 4YSy9Fs/jY70dFp+NG1E5y9nbX1sxvpyRYn0aCzBg+v3p2TqaMgjD/i43Z53S1X86c9er7h6DJg 1IkmyPCm1CfKkZw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull request. Late pull with minor things.

Best regards,
Krzysztof


The following changes since commit 49a27c6c392dec46c826ee586f7ec8973acaeed7:

  arm64: dts: exynos7870-j6lte: reduce memory ranges to base amount (2025-07-05 10:23:36 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.17-2

for you to fetch changes up to 8e5bf103b3ada972ea890ae6aa2118ff9b8c321c:

  arm64: samsung: MAINTAINERS: Add Tesla FSD DTS to Exynos entry (2025-07-15 11:03:41 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.17, part two

Tesla FSD and Google GS101 DTS are handled via Samsung SoC tree, so the
clean dtbs_check rule applies there as well - mention this in their
maintainer entries.

Also, include Tesla FSD DTS patterns in Samsung SoC tree to document how
the patches actually travel.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: tesla/google: MAINTAINERS: Reference "SoC clean" maintainer profile
      arm64: samsung: MAINTAINERS: Add Tesla FSD DTS to Exynos entry

 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)
