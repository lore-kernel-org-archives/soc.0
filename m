Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0427A31A068
	for <soc@lists.linux.dev>; Fri, 31 Oct 2025 13:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761918557; cv=none; b=rNCvqV+ZiN/3RCxa/1yh+H/JGLpCDTXRN3mEeYNbbmKqi80iccGZs2GmbPduxKeFGK92seePHMACKPEU8Jo9GpBJ9ksUez2bfwEfxrPqQBpmcr6o981smO/37qJurnDoKYw5wtac+tTB/RMbKIaS/WgPPPARX1Rsw2OlWMXoR8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761918557; c=relaxed/simple;
	bh=QUnsDuWKLCpT6qFwsNJkL5H60TzXRS9KLIMiUwqkVK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sh/EarH/SgQ1zli7BbebMpVExw7/LoUjqLJkoqaaFZPUWBWUGnrKv/Efnyg78alPlDUOZwicR2+nnkge08YvRmItYjCdLtXVTL0tadY0inpTe2l61k/XIwVC1lV8KZxz+ujmlPxDMkznKC+/uDtQvkYB9U3HCNFVnHCZEtF+lwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R2JmqxC3; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R2JmqxC3"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b6d4e877915so31489666b.0
        for <soc@lists.linux.dev>; Fri, 31 Oct 2025 06:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761918554; x=1762523354; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o3u8UJxL7hbAI0py1rq0T8SxfElVkW8XQp+cNXon94o=;
        b=R2JmqxC32uIPJ7acqvZddxUmwbPQvdo7OP3iN22iRW+4NXsK9stjVMXM+kVYk9taV8
         Uc4y3SVj6r7PQsmUIaq/YT3Cqr4xzOIS9Xy9Eflf92w1+tzZP7w1sAQ4vQaDNFSzmplQ
         BK4YfDhw/30AxOtFV01Z9yv3RId11vzyo6qFy7aBSLmzH8C0ULrJwR3Li8+c87XT7COO
         3Hg9IEpLglXSEi0fuEKX5LWxZG+gJ6p6PkNGip3WTKzzRYOajaYpPcCk4DVIRjuYbdQ2
         wI46vIYJ8831Z5MQbfZTbMsa8EZcTaDt95aGOlmR2RBwh9yaOVYAQwuARMjCuoPDoITs
         V+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761918554; x=1762523354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3u8UJxL7hbAI0py1rq0T8SxfElVkW8XQp+cNXon94o=;
        b=Q0rG2wljcTnVHVu/58p1Ap5C+EBFAnRmkjLJTA5BIBjoRmuKwgZjJ8my1Z+EODlF4J
         Nc6/PQxcwGjBSdAQtzauTCElkU4tgh9dKPL11E5w2gnh8WmI21O/cWPObkRmEwdYyNLN
         MoF4jzKIRY4kf8sfmAJgxjWJq+/TCIBJSuLrbGKS4XPFHXgn4+sn2CHjcdZgvlKeCoRk
         /iiTJCe1poF08t+M5JBRqEIDx8w+4PR1fKNqhqNrxqkV385tmH/BB59bSaXVGy3VW21/
         6oY/jGYFhlRTlpzcpOkV4iiaIKg+vtzDi580VmD5Su8rhCLF16Tsxf6IjWopVpTsc6DR
         B6sw==
X-Forwarded-Encrypted: i=1; AJvYcCUD7MSNJbrPQDhdjyEm+XLrxJlxCI1eKJs3YDr+mjv/ZFAluaVX22li5OhdxciSSywbVYY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdfGBwkwi3XBPouYj3JleJfiiMR5pxaJ+O3evAGsds4aOa69iF
	EhRwb44xC0XQ0s+rNn3lb+xO1p9DVWI/vUyd1S3rD8vOqxAcMVli/pUE5y4y6lWK57s=
X-Gm-Gg: ASbGncu/FTDznoz1YHSUJXNuvqz6IZoFIxhqC0T/nkaUWCnmDPb9jELRRjlvnFktgyl
	xWjtVDpobNp8mwIYU6fCf9e27tpSIvU4y5uliNKCpnmfxjPrs9ta0ZlfC0qBU0BCOYXUQ3AlS1p
	v7R7wzvTfR6B4aYUoCm/ID1RTIlJM8bITMoHHOtTyAc5ymTfV7azxFXh2ftONLP8A/jxhYVyoo9
	3Ux6vDxVhfPFcOSkc2PNBSu/7oRxTiOYsCZzShTBkPDoUg8uVuWJYz/WX1FvnWuRAh1zLfiWeQ9
	veOo+exluOV6aIg5cjSZE7ljdHET913/fUS6jzBHim1IfAiwVcaFPl6ti0Bhxi7VUmB6qoM7WtG
	HXQjUEn3diRPol7HKxBCOL92Qt4sIW54bkQkwet1SGGVyFKcnbI4gKPID2evxjQlbkA5UyQxpDD
	9wyTsiw7CibL8=
X-Google-Smtp-Source: AGHT+IG0OL8ArPHlD3301rEU8kKZy5QIsDov88Yb4tzvBo6k8wxPmeV+jV10ivubyNsVrg8xH97iKQ==
X-Received: by 2002:a17:907:3e0c:b0:b6d:6d44:d255 with SMTP id a640c23a62f3a-b70700af393mr198476266b.1.1761918554309;
        Fri, 31 Oct 2025 06:49:14 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077cda5e5sm183600266b.61.2025.10.31.06.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 06:49:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: fixes: dirvers for v6.18
Date: Fri, 31 Oct 2025 14:49:10 +0100
Message-ID: <20251031134910.78436-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=910; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=QUnsDuWKLCpT6qFwsNJkL5H60TzXRS9KLIMiUwqkVK8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpBL5WMNsVRWrNbqHB4hSwVTILtueIUeqAdFGBa
 4uOS5ZBmDSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQS+VgAKCRDBN2bmhouD
 13atD/9SFFi/FAgy2mkN5UhtQV2EmHcGQEGzGWg5mTrKf3xXH4WzZPlvqQVq+05pBtQCx53LQs6
 bLk0TIkVaNs1WX5hIqXbqdWK/yMmJavEUeVSLxeXHjf1KTj6SEqFLyNFa7Dw0b2ELQzG97DzyoD
 CUHvKG8iXy7qMPDFhT0jE7+cFitrWCKIiVtV1Y3UrqeVt5SuhmqSmGuCEFP+NjlThU4jv0eY7cr
 S0u4a3KVZEcPaKxuChogazVBHJLPy1Vy94wzL0tho4gIa+zJe62TeDWDslCBy0EfV/skUb9qFum
 vrMO8QIAc1yYnBKMOrucQJLdTSjZR0T0hxHXjRiJYHkB/8YWEzvLFw/ZV4BhKY7PkH+CUl6RlPt
 gFcrwWtBkBXb2v6PkttSDbPnZlkrRDbMi1vX+wn1qZJBS129CJyyZvGrELMpOEIr2abPHqEfZ1w
 xdcx+7HqHrGvjHAYjj+M59UmXy3qQZOtKZCU0WPBFdyI6wpXoxKQfwntqmxfDLQjFQ32ebCqvPv
 Zyxp08YG1yuImb1IL27zla0eOvJhh3ovQ6nM/vxxl18bRGvk7t8yZOeua2Dt1nC7C9TQpK3ZipE
 WawEzzBfc6OrJOjuJA+gDL/oz7X+ECR3OJSk26plSph6c9nPwTlg6MUH4pextDz9+5rmw8LFnUK KzXujlZs+tVSiWQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-fixes-6.18

for you to fetch changes up to 6f37469a933030692741710db809722076f71973:

  memory: tegra210: Fix incorrect client ids (2025-10-23 15:32:21 +0200)

----------------------------------------------------------------
Memory controller drivers - fixes for v6.18

Correct incorrect ID used for the memory controller client IDs in
Tegra210 Memory Controller driver, introduced in v6.18-rc1.

----------------------------------------------------------------
Aaron Kling (1):
      memory: tegra210: Fix incorrect client ids

 drivers/memory/tegra/tegra210.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
