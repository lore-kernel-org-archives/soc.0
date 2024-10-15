Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEDE2036F1
	for <soc@lists.linux.dev>; Tue, 15 Oct 2024 18:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729018297; cv=none; b=tUmUb3IPZrRPgl3dA1MPiTlsPkmDoDbzwLTPIczgEpy+t0hZqjyYj4FRqTITG06rda0COSIGBT3Iz8wCnOs1RYv6u8O95gREgAioI6/ohk8vY5J91dCZlsl1AQAO8XfZeMHkn/jWEeSUQfgjDsxxjyHjWKXZIco8P042vdf1aSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729018297; c=relaxed/simple;
	bh=tsj9/RFtsF995FJs41QULnz/TK59oaegfyuCrXhToFo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NxYh71xkV3XB64+bYnaztcE4lesSIG2cJH9+fafNFwfb65azs8aexfn7IKHDV+kH4/FsILvH/MqMLyoPEfOnCWlaZPRup5YTeYSfVYmJSuX7Q7LTTYFZ3aTBnN5u9HDZ4UjFCA/DcobP6HDJ8YohVMoxHXpcE0xey2yKTK6tVC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 4CA5DC4CED2; Tue, 15 Oct 2024 18:51:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 837D9C4CED1;
	Tue, 15 Oct 2024 18:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 837D9C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58019DA7;
	Tue, 15 Oct 2024 11:52:04 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DA9DC3F58B;
	Tue, 15 Oct 2024 11:51:33 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v6.12
Date: Tue, 15 Oct 2024 19:51:28 +0100
Message-Id: <20241015185128.1000604-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-6.12

for you to fetch changes up to da1642bc97c4ef67f347edcd493bd0a52f88777b:

  firmware: arm_scmi: Queue in scmi layer for mailbox implementation (2024-10-14 21:36:46 +0100)

----------------------------------------------------------------
Arm SCMI fixes for v6.12

Couple of fixes to address the issues found and reported on Broadcom
STB platforms following the recent refactor of all the SCMI transports
as standalone drivers.

One of the issue is that the effective timeout value is much less than
the intended value due to the way mailbox messages are queues in the
mailbox framework. Since we block or serialise the shmem access anyway,
there is no point in utilizing mailbox queues. The issue is fixed with
exclusive lock on the channel when sending the message.

The other issues is actually non-issue for upstream, but the workaround
is just changing the link order of the transport drivers which enables
Broadcom STB platforms to run both upstream and custom downstream kernel
without any device tree changes. So pushing this to help them test upstream
seamlessly as it has no practical or theoretical impact for others.

There is also a fix to address possible double freeing of the name string
in scmi_debugfs_common_cleanup() when devm_add_action_or_reset() fails.

----------------------------------------------------------------
Florian Fainelli (1):
      firmware: arm_scmi: Give SMC transport precedence over mailbox

Justin Chen (1):
      firmware: arm_scmi: Queue in scmi layer for mailbox implementation

Su Hui (1):
      firmware: arm_scmi: Fix the double free in scmi_debugfs_common_setup()

 drivers/firmware/arm_scmi/driver.c             |  4 +---
 drivers/firmware/arm_scmi/transports/Makefile  |  6 +++--
 drivers/firmware/arm_scmi/transports/mailbox.c | 32 +++++++++++++++++---------
 3 files changed, 26 insertions(+), 16 deletions(-)
