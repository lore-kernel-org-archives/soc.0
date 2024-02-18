Return-Path: <SRS0=D6Du=J3=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A975C48BF8
	for <soc@archiver.kernel.org>; Sun, 18 Feb 2024 18:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3FE96C43601; Sun, 18 Feb 2024 18:21:54 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58055C43394
	for <soc@kernel.org>; Sun, 18 Feb 2024 18:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 58055C43394
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33d2b354c72so876770f8f.1
        for <soc@kernel.org>; Sun, 18 Feb 2024 10:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708280512; x=1708885312; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KN2+Eq6M3kaqLi0K2pEbsSinjMNz96Hcn5dAVh4QPNs=;
        b=BHBNoSxWgFPuaWpfxv04odyKmFicjbvN+GxFMr5Iv7PPBuViISX+vZWn0QJB8YaT5S
         8v7TK9IAN8V+ZdZpNhcTxn+fk4eEXJRzTD+peON8w/6hQiGeNW/y92wuWoK+G+TvVzVV
         ympTAkCjTZXnK5E90agB5jEYay8aP4hdlMoOHL2SHsOgaZtUTFfWSxX+0tS4AzQzTNOA
         1TA80kAYczIfk9NP3xb2dXTOP9OI3MXws0ig+4vtqCK2CsH3AK6CTTv4zS2hnx67Fakl
         YXv8/QY901SGJ9s2vLaA3mzwqR+pzEGcuwQA4/BM7HypzcH0lupGmCl92GtXWNJ+l1Gy
         EYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708280512; x=1708885312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KN2+Eq6M3kaqLi0K2pEbsSinjMNz96Hcn5dAVh4QPNs=;
        b=W3u9uMS8X3yUHnoLGLZ4XHRz1KXBf/RaB8QHWR/K55Q1LXhxyeW5+KkcfBtdBSmZS6
         v0LX5LPamqLpzQ6hEvtfjx2/85EzR7PVRsLN93QIPLywF6Dxy8CAS2vwGyTrM/E8Hj70
         8eYnrv9pX0yDUIH01LXhNk7625HOMZitqlpvwluqZ2lxIQvmK6EEhQat1dHtRUyAYVLK
         urE2dDJ7YhajsgrtJYkaltPSNUrX7g2RAIw6DBdx9sVnIr4ElLyyXfL/0wNPXZzSgf9R
         mSrEWAuQSqxL6W7/b+LzRORJrKcb/wJVQ62X8b5NzggTILfMqTtWVlg7sORAkPgN16LQ
         QeqA==
X-Forwarded-Encrypted: i=1; AJvYcCWHxKiMlj20zyvK7MiPViIrMy/LRecoDcsF2jRqnXoEW8nma60le2iuuBFR5K7PwG6kBoA4zzZ0LICm9qLD/Q==
X-Gm-Message-State: AOJu0Yy3gILQBJl7gBvV6DfuungbzVjTcKeiK8HFaHBOWSm0cbyVAqSs
	Sw/0Lb6DarzL/YAL3Mg5P2BiqnJHMa2zUOeCRURWJScTfA3gtPlQccpkJnMn01/3McG+Qg1kvWD
	dW/U=
X-Google-Smtp-Source: AGHT+IHuj1yYst44BTBRKd1yoMt+P8wTEeoo+gGgmG1sod8COMU81at5eXmH7/21JETmWBv+qcbvcw==
X-Received: by 2002:a05:6000:1542:b0:33d:28a9:2fd8 with SMTP id 2-20020a056000154200b0033d28a92fd8mr4631677wry.39.1708280511691;
        Sun, 18 Feb 2024 10:21:51 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id s3-20020a5d4ec3000000b0033ce06c303csm7867116wrv.40.2024.02.18.10.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 10:21:51 -0800 (PST)
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
Subject: [GIT PULL 4/4] ARM: samsung: soc for v6.9
Date: Sun, 18 Feb 2024 19:21:41 +0100
Message-Id: <20240218182141.31213-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240218182141.31213-1-krzysztof.kozlowski@linaro.org>
References: <20240218182141.31213-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-6.9

for you to fetch changes up to a3891621d4a0783ae178d6f2845517e3dd571dd4:

  ARM: s3c64xx: make bus_type const (2024-02-12 08:28:44 +0100)

----------------------------------------------------------------
Samsung mach/soc changes for v6.9

Just cleanups: kerneldoc warning and add missing const to bus_type.

----------------------------------------------------------------
Randy Dunlap (1):
      ARM: s5pv210: fix pm.c kernel-doc warning

Ricardo B. Marliere (1):
      ARM: s3c64xx: make bus_type const

 arch/arm/mach-s3c/cpu.h     | 2 +-
 arch/arm/mach-s3c/s3c6410.c | 2 +-
 arch/arm/mach-s3c/s3c64xx.c | 2 +-
 arch/arm/mach-s5pv210/pm.c  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
