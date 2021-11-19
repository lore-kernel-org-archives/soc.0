Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309C5C433EF
	for <soc@archiver.kernel.org>; Fri, 19 Nov 2021 15:32:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D666661B39; Fri, 19 Nov 2021 15:32:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 623DD61AFB;
	Fri, 19 Nov 2021 15:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637335946;
	bh=5giqT5PyEr5B7E1W+ou8yDzfWBKwt9ET5pNjYVj6dek=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=cSl0xrd15jbjdTM2+DOqyDjKMY2hhXA53Fi5tFmONAWWxKQtS8CBgG3oQ2PdjJd93
	 a+dtngI59rrrRokigdkLrOtvkTp4Hc1frtyGx6m3MuP1NGT9nINEJAPPw30TLpZNXR
	 KtQP3jdmFEIWqYkZSNdyA1hGgiamaSg7m5zoJ/Awu6T2jkoyR71v/RH5g+PPnsCY6u
	 s6zQoV7Dv4wEwdJsFFl5r2I2MEPW+5HppmlhGy4FNH1iMAXjy25CdYUY3dEYgeAf/d
	 24u97McgpSL+bzz5dvn22MBzGhFjxLCJeOBljdSfjH5MdD1N4FIZFFGvcO5cFnJOvX
	 Rgo2/aGsH3/tQ==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] ARM: socfpga: fix for v5.16
Date: Fri, 19 Nov 2021 09:32:24 -0600
Message-Id: <20211119153224.2761257-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd/Olof,

please pull in this fix for v5.16.

Thanks,
Dinh

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_fix_for_v5.16

for you to fetch changes up to 187bea472600dcc8d2eb714335053264dd437172:

  ARM: socfpga: Fix crash with CONFIG_FORTIRY_SOURCE (2021-11-18 16:19:40 -0600)

----------------------------------------------------------------
SoCFPGA fix for v5.16
- Fix crash when CONFIG_FORTIRY_SOURCE is enabled

----------------------------------------------------------------
Takashi Iwai (1):
      ARM: socfpga: Fix crash with CONFIG_FORTIRY_SOURCE

 arch/arm/mach-socfpga/core.h    | 2 +-
 arch/arm/mach-socfpga/platsmp.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)
