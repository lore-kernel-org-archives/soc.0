Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA50D242936
	for <soc@lists.linux.dev>; Tue, 13 May 2025 10:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131040; cv=none; b=ebZlzBMJvzG2Y6kjGe6KbiNla/zqOA77Q7uHmLn84Eu8J6iSOXFHDm+Fu2ijnhdKnqhJnhy7R0vOfHL2CCi6I05DZQuAsxfCQe/j8hkwVkQ8n/nZJyIOFQGB9+c8hR/mLzFEbreSONJTSOsSTGX7/CZ7WAN5TYdVtlYQ/pdFuMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131040; c=relaxed/simple;
	bh=S2iTrSKyId8Z4Fz+KFg97dcG4QI+SgeyYQ5rhg6W4Fk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mKqNkho+gvh+832YUht8BArgYrkpYU8uvenCcTfbvzQGLjqNK6TvHFgkXqJaQGxO230sTwgAt+iVXkTxsJh++FqJllZbXQZF7bxIdSccwFwUp5myJQJAH76hIRCDxVe6qaOc4ED8aJR2hZtTGSXw0Z+D3XLaxbOP4TGhV3YMRy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uykWL+yV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uykWL+yV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso2724515e9.2
        for <soc@lists.linux.dev>; Tue, 13 May 2025 03:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131036; x=1747735836; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eT4RifiabCn3jNXGZ/1SUNp8XFTerXnwE9dw2ciCKO8=;
        b=uykWL+yVtPQONOcKScObH//vQt2oiF8MGCjuM1xaKek5YIkak0PLrz0CMWxPJa172R
         vvH4YRYIF4ZRdeKp+iWni1XZP8U+gQHUmCJtppvl31BIXNyaTtCdSB7US+XuQNP6X4f9
         tlZIPYqenVG/JLE5e4Y1xZDYw+65imFYlmFUhoS6DmyIv/ZPuWd28OC+W0SXseJvZCeA
         vwPHc8xXAJGg/v0n3bJ8/tz8bHHGtuZFkzLimYM3q/XvyHkh4Mf42hlUePXCp/C2b92i
         w+udMrTJi+TvWVgC7OvC+xyfjFaY/y2OFsIRZmtt4XeFOoAI2y18GOdCfVHWzSB6ke8l
         6+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131036; x=1747735836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eT4RifiabCn3jNXGZ/1SUNp8XFTerXnwE9dw2ciCKO8=;
        b=NlbmQ6qeDwrZqDYSMQgxBNP9JvV0eFh1jCfsmrroTaMW2bBmPRCPrI+fN7jlNBP+Vh
         U+kJ56oj7AmLgB6+yazdvk/YIoFIyIg05sEeX6KTxIXHTnrF61X9CztrT9Un7fQZcpw/
         +3r98/XXUdj7inH0BqiMfoioKuDeKhw2wCTYz1FUS6CNuALaTdcCs2/FHfhAviMVHzwf
         Doi9xaasYzrjOYW8qd5PAQlHYnRbrDVtYXGZWe5EkqtBxTgYRXS/PqwV2Kz99oYOaIOk
         2rt2eyqheDMUWHF5WXfqHBVUh5KKe+PWD4phwZRbpqwBLKlIxR5e4hRFDRe3TkgBdDam
         y8Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWP/6dh8jKRs59H2UvhOShxVwzXL9e6RjiSZxwxunz576w/o2bJ0iUkrrB+CksJ/nPvMQA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNasgeViv3G3MRfENwwEgui4qc3Lqzqc1TuySvemitgP2Vzipl
	r3yGWPR0wvaRk94te+i+Xtwb/nIrzj8RWFmfViS7wEmUCZUdG5qkg8lk3gC2/qM=
X-Gm-Gg: ASbGncveRzjqhMDTIpQ2MM4C2gZoFmJUCJ27KOr927WvsyFLy2otFSY6Lymwb7EHl2u
	1d1y5nfqa50JOffnVdNLnn941vLgctQ7RUE19cJbDK1LUe5cTgRca5PNPBCM0NSXctBkMfD0W8i
	X5djyRwHxl6LItzRG/jkUQC4mwlt+Q+oT/x3p6ANVmbRBWc+W9IFzOBr3kkWtZCfMTIdyV1TYvA
	tItVVlIiKKoWYZCKCz2f8l4iBC8BZcfGxGHGgTc4HSNuMxGa72fowXLT6Z7Qzwf9/MX1xV4Zqtg
	xAgZ24gyL16XLcTuZMp/+6W/G16/EiTSNS+tIikSv7UHuarYEyOdqg0cUSDIAmLx+d/4d7TMixZ
	x3Y8k4r4MIJbC2t34Z9Cb6+q3xv97nrA9iYFdQ5A=
X-Google-Smtp-Source: AGHT+IEMONG7o+2qqLec3J40u8cxE5Hikn1gleQY4dduRgG1LUtg8CN8da8I9rkzzSsfliL822Q/Vw==
X-Received: by 2002:a05:600c:4f43:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-442d6de79b0mr53581305e9.8.1747131036030;
        Tue, 13 May 2025 03:10:36 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df574sm159683635e9.11.2025.05.13.03.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:10:35 -0700 (PDT)
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
Subject: [GIT PULL 1/4 fixes] samsung: drivers: fixes for v6.15
Date: Tue, 13 May 2025 12:10:22 +0200
Message-ID: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=S2iTrSKyId8Z4Fz+KFg97dcG4QI+SgeyYQ5rhg6W4Fk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIxqPmFvw4YlLZILw8ztH+LBScalD7xKqIX+Ch
 i/m/UIVK92JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMajwAKCRDBN2bmhouD
 1/eqD/9MbCSa5fsTfL4M6Msdl6XVHg9QIaMp8B66liyP+bBooJn55w6uXhxdlwHF9ySGKC641F8
 0Q1O0VRsta3YWmVqQswD9tO22ySzkEyzl0q4aKLWMuasrAHJcQcVIdgOQC0yNNJip17k1LvXj3Z
 UHxJULw7Td0SC9sdIVsYgteRyMVemT8dZK5zpNGPLwTN5oKFrDtiJgyDI24sFknyq745ownKXvX
 WZ2iukaUZ8tQIe2JiOy63Sc4OHe3Aqca4auvoJtF3k3o3+u0kO0wN4DeyNubrYXKjm2zgCTLP6F
 l0CyTXp6qLXSXc8FhOwM0TLdrJvfyYDSGsqI1FnXyGJ+xlZOKkZQ6WOKILmPVA4DqSbvIpPpXFZ
 PDq9RJBQt9ryi5c2neECV2UWcAEhvfuWf/A1M7g6MyKofT8qf9bWbAyCBDV1qlqWRm1HbWQmOF/
 IeEgAn4K3cl0l4xRZ9FuxhRxTk9peYXqenF/s+o4vnGHsewyHM8EAKzRbWejkywbwTHsE2Wj7s5
 qUHiYm79dBT3JNWbYJA3c71y65aW96Uz7nH/T33/sKRbmHDAnaFxvwzcOUl/y1ZDntKGKW+Wl6E
 E1u3eXEFPjrr1v+0gRTvgG1vGf8uFKkN+fZM9uBSQezJZCkwjVxr+Gv3ly/VRKhcIvnUjtLBrBK A/ZSg49r/gysgUA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

Please pull for current cycle. Both commits fix issues introduced in this merge
window.

Best regards,
Krzysztof


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-6.15

for you to fetch changes up to dd303e021996a0e43963d852af8a3277e6f5ed88:

  soc: samsung: usi: prevent wrong bits inversion during unconfiguring (2025-04-14 08:51:18 +0200)

----------------------------------------------------------------
Samsung SoC driver fixes for v6.15

1. Exynos ACPM driver (used on Google GS101): Fix timeout due to missing
   responses from the firmware part.

2. Samsung USI (serial engines) driver: Correct ineffective
   unconfiguring of the interface during probe removal.

----------------------------------------------------------------
Ivaylo Ivanov (1):
      soc: samsung: usi: prevent wrong bits inversion during unconfiguring

Tudor Ambarus (1):
      firmware: exynos-acpm: check saved RX before bailing out on empty RX queue

 drivers/firmware/samsung/exynos-acpm.c | 44 +++++++++++++++++++++++-----------
 drivers/soc/samsung/exynos-usi.c       |  2 +-
 2 files changed, 31 insertions(+), 15 deletions(-)
