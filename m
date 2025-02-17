Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DD1223700
	for <soc@lists.linux.dev>; Mon, 17 Feb 2025 15:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739807576; cv=none; b=kkQsmNMesjfMgCOJC7xJ3A/QKknveXsCzVon2cSaVTpfuzuY+3Y+4EtARrHGdAyvGihW9/T61yQCJ4aUS1BuUF1JCELUioEvBPsnRbNbB+QtN3My5H4Aarg/5cycWMGf7CEdp2bNzk+dcXV2x08lmAWGd9rkR77DDYwYIE5yko8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739807576; c=relaxed/simple;
	bh=pBlYBZKaJrMhl24NOxKd26XIWBHpESzeFeP+woT+ahI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T7eQjYPE+AUJTSKr5g93nAciGtCNyD+5SuLwXA5Ue1XPAQloZ/cH7NUB8t2CGuJU1iU2asxf5OfjFcmFX4GEoEjxnbN5QUfvtoFxgTZlzoCla1NmAiblFKg2l2gDBC3yJHEX4kN5QS2/j6WNMi6CUTIrTE9YHNN0RT3aBN8DPXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id D188CC4CEE4; Mon, 17 Feb 2025 15:52:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 65213C4CED1;
	Mon, 17 Feb 2025 15:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 65213C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB129152B;
	Mon, 17 Feb 2025 07:53:11 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 63D0D3F5A1;
	Mon, 17 Feb 2025 07:52:51 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Fix for v6.14
Date: Mon, 17 Feb 2025 15:52:46 +0000
Message-Id: <20250217155246.1668182-1-sudeep.holla@arm.com>
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fix-6.14

for you to fetch changes up to ab027c488fc4a1fff0a5b712d4bdb2d2d324e8f8:

  firmware: arm_scmi: imx: Correct tx size of scmi_imx_misc_ctrl_set (2025-02-13 14:27:37 +0000)

----------------------------------------------------------------
Arm SCMI fix for v6.14

Just a single fix to address the incorrect size of the Tx buffer in the
function scmi_imx_misc_ctrl_set() which is part of NXP/i.MX SCMI vendor
extensions.

----------------------------------------------------------------
Peng Fan (1):
      firmware: arm_scmi: imx: Correct tx size of scmi_imx_misc_ctrl_set

 drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
