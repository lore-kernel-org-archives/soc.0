Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C391E156C62
	for <soc@lists.linux.dev>; Wed, 12 Mar 2025 17:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741801082; cv=none; b=CESNuj9nuiyZk2b+Ua5bbzkDjuDIAF5GVwIomMMMBqnySYN1BT+rmojr85WgD/NwKs3rB1Tzj3DqVmdNyFWOKIY5ChW1Gu+0AfLM+WoFolMb1R00nNn5Sl2pu/tYIdz2/YAUxotTVjIuvb9+t8iy+tCi5A7gZ+/u4WlsruujwKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741801082; c=relaxed/simple;
	bh=z/1VHU6B9RzRasXmPf8rdOIF8mBgfoZGvsm1jolubPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVkgZNGheYIv/SOiYFLCNWLQKIZ9fCEemG1NjyiGG6VenXIBy5MzFJf72KUjqwUJAumHShwobvT8ktwekXIbe0ZyES1q4tqak2NwkiatvW3rZaVampvKtiylpmNrccaZxpX1L0k9tJCbH73ziEHXvxPLe91PMk2ptxjFjpEhd9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=T3x+YBBi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="T3x+YBBi"
Received: by smtp.kernel.org (Postfix)
	id 3C815C4CEEB; Wed, 12 Mar 2025 17:38:02 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2679CC4CEEC
	for <soc@kernel.org>; Wed, 12 Mar 2025 17:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2679CC4CEEC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac297cbe017so230822166b.0
        for <soc@kernel.org>; Wed, 12 Mar 2025 10:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1741801079; x=1742405879; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEeNr4UQM6nD82XRHCzIRIjoe3xsp0k0uwMlhMJ0AyI=;
        b=T3x+YBBi2976xFWOOJYWxMnQjdyr3PFLkDemusdIdNiIavev1C+VXLiCdPnthutPfF
         wXykDOzoCasZBtN5vLjXZtKRHFKPdGcyuoYsq00SboP9HW0bL+Ddo2LheNZlmsl2KtuF
         p7OmU2A3kPqKRMH2RG24unSmQPDpupdxOwZ6VN1bj6IKU9oMkyhjDtll5wLU+CzT77/z
         ebFkvsFkxP7VTp7hPQs7GLrQcK5oteQNSU67GnvyOs8Ygp1n4SXDnDeBft/Q1Y5VttiF
         I7aBu6dK75XMR+vzkTQTzpQnTWJPqFjfRLZ2k3Dp93UccdJDT2EtuAU07CRc0BYlMSYH
         0E2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741801079; x=1742405879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEeNr4UQM6nD82XRHCzIRIjoe3xsp0k0uwMlhMJ0AyI=;
        b=lsrWdnJXK+WaV+U/g16h3NdtoCj/2uubA9XKflzttPbv4YTFFDDDxNnJxrTnUh6t4O
         zUTu3pUUfe0ERAVxdWWYyHJ3tUqLYAGx411ZbNI2z4NgBbut5tn56gcL3Z/6qoQOgrgq
         lhmdDSOAyVZarEiB9zS5yVQSF1KSlpiLNAA0Oo0n+nYpXZ7U2WDrIrqQaR+px/wi47Kr
         vXGf7ZAzS7GMrk2X/Hu6cdOqTa7d3woQLvM4oi5KzaqUr2Fvi/RJN1RJAdPE0sUgS2oE
         tCSe0i2LHsMl1j3sCimTbQ4MLcbTDm10uLWgEKCAUU15N9QwgxejAk+WAwHoXT37QREM
         5o4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8fibGsSLr7t3c1v6jfaCyqxWk5xZWAAKIB5IgCMvtvRgFRxSLN8jE7DOisMvAU04XQ/U=@kernel.org
X-Gm-Message-State: AOJu0YwxHuK7Z2CdWrqYpVlcyxlqeI/4loAYAOIv/U1cymgL+ZjDU8xO
	gdY35Pvk9+NgKYUDMtkPgpAWkiXoCBPHCGC+enqMrPSmjp2LqcuipKvCAPbvvbA=
X-Gm-Gg: ASbGncsMfR+f1ZxWNO1PP5Y06IbmZve90DVcjv5sD4+ZlUHbYpuPlfN+oAkwA/Vtdt0
	xOou8XX1F+Xh5lm+CUsPBu/c+BkVOrVNkqJ862p57/GoLYO9dK5zMYy86dD4FQjs6PRtroqYXCA
	3p02/ARxeXFChkQYD2Pc4ICA5F29LlJ0Q9JdLH5sbm5vCvSCcDP4zbnJlmEKNcMw7lcymOCiz1m
	tJofjY4kHyl7WeZENKjMyFQ7xzpntmsQP3AUfoZrGmuH/CsAOJ2m/OO9+Gru+Yl73zYrRawqRYG
	RjA4Tkr7C5ERQXcV9sM1mTC2pECS0vMt8TBMwCaO0yVHEjkYzzn6hxjAK2GJhjm3
X-Google-Smtp-Source: AGHT+IHZoXNnur5KGPxNzS/oI/LwDAfE9kg28FhzviV/7gJH1+NFPrf4Dlc1wmzmq8s5iuOYW2aG8w==
X-Received: by 2002:a17:907:c80c:b0:ac2:6fc6:b93d with SMTP id a640c23a62f3a-ac30aa6cda2mr64636566b.1.1741801079118;
        Wed, 12 Mar 2025 10:37:59 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.160])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2ede516d6sm92760866b.49.2025.03.12.10.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 10:37:58 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip AT91 SoC updates for v6.15
Date: Wed, 12 Mar 2025 19:37:55 +0200
Message-ID: <20250312173755.975074-2-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312173755.975074-1-claudiu.beznea@tuxon.dev>
References: <20250312173755.975074-1-claudiu.beznea@tuxon.dev>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.15

for you to fetch changes up to 8bd10f002411c9ea947edc0af18ad81f789e28d5:

  ARM: at91: pm: Enable ULP0/ULP1 for SAMA7D65 (2025-03-02 17:38:54 +0200)

----------------------------------------------------------------
Microchip AT91 SoC updates for v6.15

This update includes:
- SoC driver support for Microchip SAMA7D65
- power management support for Microchip SAMA7D65
- power management fixes
- documentation fixes

----------------------------------------------------------------
Li Bin (1):
      ARM: at91: pm: fix at91_suspend_finish for ZQ calibration

Ryan Wanner (5):
      dt-bindings: atmel-sysreg: Add SAMA7D65 Chip ID
      ARM: at91: Add Support in SoC driver for SAMA7D65
      ARM: at91: pm: add DT compatible support for sama7d65
      ARM: at91: pm: Add Backup mode for SAMA7D65
      ARM: at91: pm: Enable ULP0/ULP1 for SAMA7D65

Wolfram Sang (2):
      dt-bindings: ARM: at91: make separate entry for Olimex board
      dt-bindings: ARM: at91: add Calao USB boards

 .../devicetree/bindings/arm/atmel-at91.yaml        |  33 ++++++-
 .../devicetree/bindings/arm/atmel-sysregs.txt      |   1 +
 arch/arm/mach-at91/pm.c                            |  47 +++++++---
 arch/arm/mach-at91/pm.h                            |   1 +
 arch/arm/mach-at91/pm_data-offsets.c               |   2 +
 arch/arm/mach-at91/pm_suspend.S                    | 101 +++++++++++++++++++--
 drivers/soc/atmel/soc.c                            |   5 +
 drivers/soc/atmel/soc.h                            |   3 +
 8 files changed, 168 insertions(+), 25 deletions(-)
