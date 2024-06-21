Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF77EC2BA1A
	for <soc@archiver.kernel.org>; Fri, 21 Jun 2024 09:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F9CFC32781; Fri, 21 Jun 2024 09:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CACF1C2BBFC;
	Fri, 21 Jun 2024 09:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718962718;
	bh=wRSHcpRrRgCFXba0u0E5uA0rvJrV4lK6gLoqFsRiHCo=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=t636SIbDSNdrLDu8f4bvB7ftWLSf+aLvapkI/F0vyhng/MrXwh44dWjczQPqY18iw
	 VqG/KJKRR53iPP6trdCXsqZjQ+tcIaFGVvRFeXTCEklpIieLUv6N/vqk6B3HTSmI08
	 wpNGoTJj0xVfeYWa3QjLZr5nooky1P8BC72kdGujAWPAX98Hm3HsWWR0v5r8HXxUmy
	 F05+sH3BzoWYnRt6a1k1pg7ZsXe1UQo7DQAUZinsixXlMXqu1M4A+v305ivcyYlya+
	 m9pBJevte0ZEF18W1M+bycn5U519khpVEv2eSlq1tsiyxhTzUOp4RZtymgiTglKSoF
	 vQxSskLwifq/A==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v3 0/5] armada-370-xp irqchip updates
Date: Fri, 21 Jun 2024 11:38:27 +0200
Message-ID: <20240621093832.23319-1-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Arnd, Andrew, et al.

this is v3 of updates for armada-370-xp irqchip. There is one small fix,
and another patch added which was previosly sent separately.

Also I realized that I did not send to the SoC mailing list, nor to
Arnd.

As written in previous cover letter: this driver is in need of a major
refactor in order to bring it to modern standards, but that is
unfortunately currently infeasible with my time constraints.

v1 and v2 at:
  https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=863473
  https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=863707

Changes since v2:
- dropped redundant assignment during declaration in patch 4
  (bool src0 = false, src1 = false)
- added patch 5 to this series, previously sent separately

Marek Behún (1):
  irqchip/armada-370-xp: Use atomic_io_modify() instead of another
    spinlock

Pali Rohár (4):
  irqchip/armada-370-xp: Do not allow mapping IRQ 0 and 1
  irqchip/armada-370-xp: Only call ipi_resume() if IPI is available
  irqchip/armada-370-xp: Do not touch IPI registers on platforms without
    IPI
  irqchip/armada-370-xp: Add support for 32 MSI interrupts on non-IPI
    platforms

 drivers/irqchip/irq-armada-370-xp.c | 121 ++++++++++++++++++++++------
 1 file changed, 95 insertions(+), 26 deletions(-)

-- 
2.44.2

