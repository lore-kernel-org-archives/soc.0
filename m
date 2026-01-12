Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69173563EE
	for <soc@lists.linux.dev>; Mon, 12 Jan 2026 11:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768218635; cv=none; b=MBgJQQQcUrP0PknLh2lnn//noFxEwfu5ddLTOMOtRWyKm5093HQec41/DipuiSopcWkEMBIJIpJSsBWsamJRjy1xSh01/QAOpEWzAtQwd+6srbsJu8HlL7WiqVnNrPP5G/Rwvg7fH+B/5I/W0gbPs3uXZPUfVS/MVh6U86uyZm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768218635; c=relaxed/simple;
	bh=b/7TVhJxuUyWO1lOQV0+xKxrLAyjVeyFG8lfo74hF/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N4rj+UJy3YyY58rkozZwdGNm9rtdLoeLEyLbdygrI0lHbXGiUtDG+Dwe3qtkzGRKdiz4lScudbCrablTUmEDJptB+vrlpt6LaH7rBsMXXpSjEr76X+oQV6x1vPW4m/4pA0Hp0FKHuMzlHJ9OM7AE3sPxDhx5D3Bt1IipPD2ezw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 5AC32C19425; Mon, 12 Jan 2026 11:50:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id EDF8AC19421;
	Mon, 12 Jan 2026 11:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EDF8AC19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88C5B497;
	Mon, 12 Jan 2026 03:50:26 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8FD573F694;
	Mon, 12 Jan 2026 03:50:32 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [GIT PULL] firmware: arm_ffa: Updates for v6.20/v7.0
Date: Mon, 12 Jan 2026 11:50:16 +0000
Message-ID: <20260112115021.2551442-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.43.0
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-updates-7.0

for you to fetch changes up to be4d4543f78074fbebd530ba5109d39a2a34e668:

  firmware: arm_ffa: Correct 32-bit response handling in NOTIFICATION_INFO_GET (2025-12-18 14:22:07 +0000)

----------------------------------------------------------------
Arm FF-A updates for v7.0

A small set of updates to the Arm FF-A driver:

1. Fix a correctness issue in NOTIFICATION_INFO_GET handling of 32-bit
   firmware responses, avoiding reads from undefined register bits.

2. Improve clarity and robustness of FF-A feature checks by tying them
   to explicit version requirements.

3. Ensure Rx/Tx buffers are unmapped on FF-A initialization failure to
   prevent resource leaks.

----------------------------------------------------------------
Haoxiang Li (1):
      firmware: arm_ffa: Unmap Rx/Tx buffers on init failure

Sudeep Holla (2):
      firmware: arm_ffa: Tie FF-A version checks to specific features
      firmware: arm_ffa: Correct 32-bit response handling in NOTIFICATION_INFO_GET

 drivers/firmware/arm_ffa/driver.c | 48 +++++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 9 deletions(-)
