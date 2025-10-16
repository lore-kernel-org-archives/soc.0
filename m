Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4674D31A7E5
	for <soc@lists.linux.dev>; Thu, 16 Oct 2025 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760607293; cv=none; b=spYKzhYIUVuVDlRbEwiYQcH8Js6/D40JS563uRd7dfYEFrUq14k9ZzxPRXRJ2PK8WFlUvoF0Hvhk/9ndDDSkTwH5P3lilNSvr9UiTUYqAfXmxL0aBJ/1XKxQRCFPrCvkFWAGXsjPVOGopoGD0KlToCmpUZ5TZAFUqZGbFV/xgsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760607293; c=relaxed/simple;
	bh=uOch7FQy4HVdhxXnEM3N327TmNp5uof4XFtrM10b5yU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V31SPnBbfC6d4IEmX+3j60LnCFfGNLe/DD+Vp3QH/J1MOG9CJz/nMxE2FjA35DTbmk6hTMXVln9aNBiGBwSulGJwF5ZSE5T3LB8UZP+Hi2QaCqz6wHfiMg7uyEd7UsjHsNcvjir2KNfyKYX5THmxVh8496conHqwiqGz6W13LkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 3AB2EC4AF0B; Thu, 16 Oct 2025 09:34:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 33DE1C113D0;
	Thu, 16 Oct 2025 09:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 33DE1C113D0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94B2A1688;
	Thu, 16 Oct 2025 02:34:43 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 47CFF3F6A8;
	Thu, 16 Oct 2025 02:34:50 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v6.18
Date: Thu, 16 Oct 2025 10:34:48 +0100
Message-Id: <20251016093448.945198-1-sudeep.holla@arm.com>
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-6.18

for you to fetch changes up to 20b93a0088a595bceed4a026d527cbbac4e876c5:

  firmware: arm_scmi: Fix premature SCMI_XFER_FLAG_IS_RAW clearing in raw mode (2025-10-15 15:28:49 +0100)

----------------------------------------------------------------
Arm SCMI fixes for v6.18

This series contains a set of small, focused fixes that address
robustness and lifecycle issues in the Arm SCMI core and debug support,
ensuring safer handling of debug initialization failures, correct flag
management in raw mode, and consistent inflight counter tracking.

Brief summary:

 - Fix raw xfer flag clearing
 - Skip RAW debug initialization on failure
 - Make inflight counter helpers null-safe, preventing crashes if debug
   initialization fails
 - Account for failed debug initialization globally

There is no functional change for standard SCMI operation, but these
fixes improve stability in debug and raw modes, particularly in error
paths.

----------------------------------------------------------------
Artem Shimko (1):
      firmware: arm_scmi: Fix premature SCMI_XFER_FLAG_IS_RAW clearing in raw mode

Cristian Marussi (3):
      firmware: arm_scmi: Account for failed debug initialization
      include: trace: Fix inflight count helper on failed initialization
      firmware: arm_scmi: Skip RAW initialization on failure

 drivers/firmware/arm_scmi/common.h | 32 +++++++++++++++++----
 drivers/firmware/arm_scmi/driver.c | 59 ++++++++++++++------------------------
 2 files changed, 47 insertions(+), 44 deletions(-)
