Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF76C433DB
	for <soc@archiver.kernel.org>; Thu, 11 Feb 2021 08:22:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6DEB864EC5; Thu, 11 Feb 2021 08:22:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9FD064E16;
	Thu, 11 Feb 2021 08:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613031779;
	bh=BYNKdB641tbIHjMtGzjmd4sQCNJ/fauTzb5OJP1vN48=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=SEVKxx5Me68iMP7bz5EQVmUvQONUfFqPtgAtUyeBNpAZpaJPc+8ekeg24KdkcFhLI
	 D/uPP+xH5vb4BS7jdzRvfKWodpL7HRV7p7YUINIGL4FP+u6nWe1QOXvylU7LnvO+DD
	 5++CHj1rdncMGyqmGcYHMewPl2bm0pIzHHJaBPDcXAr27NvKgpVxJPwXqcPv0CHeXl
	 WEJrecE2dbiKzipPz7PL8IbRuie/nLATEW6CYWmx67ZYiMaCEAOnNVN0RtG1ilhmC9
	 S8cJ2ZQCzatKMf6FHkvYHYml6bwijKYZrTKUf1yDuFD6k0/sQ7/YkOYfBoQLvK0Jhj
	 H3gR810nmoFZg==
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
Subject: [GIT PULL] ARM: mach/soc: samsung: late pull for v5.12
Date: Thu, 11 Feb 2021 09:22:54 +0100
Message-Id: <20210211082254.7934-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Late pull with minor mach/soc fixes for v5.12.

Best regards,
Krzysztof


The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.12

for you to fetch changes up to f503878564f5e68c1aeb1ea01e437060bf905c50:

  ARM: s3c: irq-s3c24xx: staticize local functions (2021-02-08 18:10:21 +0100)

----------------------------------------------------------------
Samsung mach/soc changes for v5.12

Three fixes for S3C24xx: one for building with clang and two for
warnings.

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: s3c: fix fiq for clang IAS

Krzysztof Kozlowski (2):
      ARM: s3c: irq-s3c24xx: include headers for missing declarations
      ARM: s3c: irq-s3c24xx: staticize local functions

 arch/arm/mach-s3c/irq-s3c24xx-fiq.S | 9 +++------
 arch/arm/mach-s3c/irq-s3c24xx.c     | 8 +++++---
 2 files changed, 8 insertions(+), 9 deletions(-)
