Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A69C64E7B
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 20:44:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 21D9B21741; Tue,  1 Dec 2020 20:44:51 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 67A6F2222C;
	Tue,  1 Dec 2020 20:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606855491;
	bh=8cGy04ttJFLiZMeZh4SVSsHJh9klFNPk4fJacT2rFCo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ftu0DqYU4kD8uUZcV1SkuqleKk9q4Qdv6DHU+f7UouI1h0AxLWy0Xk6SAV1n235jy
	 YsKDgR9Bvw8nc/BJf4RLIkOnd7pXK/6sFAlZKNWOpv6JcWSyyLBRUlHCP8QKA4gZwM
	 9ASuja6NBHFVbrPDYfywchUopmr+BhTm5T7uFB5o=
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 4/4] ARM: samsung: Pull for v5.11
Date: Tue,  1 Dec 2020 22:44:04 +0200
Message-Id: <20201201204404.22675-4-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201204404.22675-1-krzk@kernel.org>
References: <20201201204404.22675-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.11

for you to fetch changes up to f9135aaf2767500dee419c03640f7a3784b56559:

  ARM: exynos: extend cpuidle support to P4 Note boards (2020-11-16 17:31:01 +0100)

----------------------------------------------------------------
Samsung mach/soc changes for v5.11

1. Do not use of_machine_is_compatible() in early CPU hotplug core. Full
   device tree walk causes "suspicious RCU usage" warnings.
2. Clear prefetch bits in default l2c_aux_val of L310 L2C - they are not
   needed.
3. Extend cpuidle support to P4 Note boards (Exynos4412).

----------------------------------------------------------------
Guillaume Tucker (1):
      ARM: exynos: clear prefetch bits in default l2c_aux_val

Marek Szyprowski (1):
      ARM: exynos: Simplify code in Exynos3250 CPU core restart path

Martin Jücker (1):
      ARM: exynos: extend cpuidle support to P4 Note boards

 arch/arm/mach-exynos/exynos.c  | 7 ++++---
 arch/arm/mach-exynos/platsmp.c | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)
