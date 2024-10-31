Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C791386C9
	for <soc@lists.linux.dev>; Thu, 31 Oct 2024 17:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730395662; cv=none; b=K7G9yd6PeARm1xGeIA+iI5pftDsD8+zRvGenO2h8H1bn2JYrlfSFrdorpYKmdaw1IeDLsZPtz5f4UFrDU5tTmhlolisn8bXAf6fGCNcCUiFhe2w1lrhU12NCwuRb6oEjbeI8LaFwDy1rQr9aCkRlwJ/7KhF8aeZgyCDfGK5VZX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730395662; c=relaxed/simple;
	bh=VmTRd6vbd5JE8kutjmGMEDatH/+Hr/uEeRi/O43jtRE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jruiRbcaz0P839Lp0XCg8256Zg7S6W0JRAtEqaMHWVThKW7dBgWDvLe4edOeQrLvYNjS+kkLRhjgVBtLxYscrQ3WQfOEff5rltA3/W4kluaPk78elwid83cdL6Mnctiy8CcB4ax1DTCeYAzUzXbg+BJffn7apBxPFCd7o49Doyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id B583FC4CED0; Thu, 31 Oct 2024 17:27:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 75F2EC4CEC3;
	Thu, 31 Oct 2024 17:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 75F2EC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39CD41063;
	Thu, 31 Oct 2024 10:28:08 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 521D83F73B;
	Thu, 31 Oct 2024 10:27:37 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v6.12(Round 2)
Date: Thu, 31 Oct 2024 17:27:34 +0000
Message-Id: <20241031172734.3109140-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull ! Sorry for the late pull request. The ones that need to go
for v6.12 stable carry fixes tags, so it is ok if you pull it for v6.13
if its too late.

Regards,
Sudeep

-->8

The following changes since commit da1642bc97c4ef67f347edcd493bd0a52f88777b:

  firmware: arm_scmi: Queue in scmi layer for mailbox implementation (2024-10-14 21:36:46 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-6.12-2

for you to fetch changes up to 54962707f8b8b53812d3d7fca279a68c6e18faae:

  firmware: arm_scmi: Use vendor string in max-rx-timeout-ms (2024-10-28 14:49:27 +0000)

----------------------------------------------------------------
Arm SCMI fixes for v6.12(part 2)

Couple of fixes to address slab-use-after-free in scmi_bus_notifier()
via scmi_dev->name and possible incorrect clear channel transport
operation on A2P channel if some sort of P2A only messages are initiated
on A2P channel(occurs when stress tested passing /dev/random to the
channel).

Apart from this, there are fixes to address missing "arm" prefix in the
recently added property max-rx-timeout-ms which was missed in the review
but was identified when further additions to the same binding were
getting reviewed.

----------------------------------------------------------------
Cristian Marussi (3):
      firmware: arm_scmi: Reject clear channel request on A2P
      dt-bindings: firmware: arm,scmi: Add missing vendor string
      firmware: arm_scmi: Use vendor string in max-rx-timeout-ms

Xinqi Zhang (1):
      firmware: arm_scmi: Fix slab-use-after-free in scmi_bus_notifier()

 Documentation/devicetree/bindings/firmware/arm,scmi.yaml |  2 +-
 drivers/firmware/arm_scmi/bus.c                          |  7 ++++---
 drivers/firmware/arm_scmi/common.h                       |  2 ++
 drivers/firmware/arm_scmi/driver.c                       | 10 ++++++++--
 4 files changed, 15 insertions(+), 6 deletions(-)
