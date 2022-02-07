Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EC6C433EF
	for <soc@archiver.kernel.org>; Mon,  7 Feb 2022 10:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5E59CC340EB; Mon,  7 Feb 2022 10:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC379C004E1;
	Mon,  7 Feb 2022 10:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644228604;
	bh=c75XK3jaWK5eepDxSUG0l1zyA3UHCaarkaKExolyKk0=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=u6DfiXGQMGS9X7DHEd44sI+b+Fuz5+VlsS2OzLZNMQfuHbRYcPawi8Rh33vhd4ngn
	 QDc2ciCkfvRlHE9AgmTkDeFAQzapdJphAQn2+Br1HcO1HIS14bc6IOglnOW7a0Qe8Z
	 fsmET/Mpiebrax4JOMTrDQ28Ce0S/b8H0X2v7Yteei/LymlBnhYfPQlHxyjBRB6tU6
	 073gScAUb5I9zpkGkN24rDn9plDcYaztPfQeKRMyvopLfqWOVqUdH/ol7tyrL+gvth
	 n/+HQXTkYke2oNnEiVpXhGDy27QU+rj7W+5tlPHSa1rnsCgi5jGaaVT9FKGB8/7jOv
	 lKMQSucUNNr7A==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] ARM: socfpga: fix for v5.17
Date: Mon,  7 Feb 2022 04:10:02 -0600
Message-Id: <20220207101002.7566-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd/Olof,

please pull in this fix for v5.17.

Thanks,
Dinh


The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_fix_for_v5.17

for you to fetch changes up to 3037b174b1876aae6b2d1a27a878c681c78ccadc:

  ARM: socfpga: fix missing RESET_CONTROLLER (2022-02-07 03:54:42 -0600)

----------------------------------------------------------------
SoCFPGA fix for v5.17, part 1
- Fix a build error for socfpga_defconfig

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: socfpga: fix missing RESET_CONTROLLER

 arch/arm/mach-socfpga/Kconfig | 2 ++
 1 file changed, 2 insertions(+)
