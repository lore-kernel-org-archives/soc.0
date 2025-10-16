Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B11326D4A
	for <soc@lists.linux.dev>; Thu, 16 Oct 2025 09:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760607232; cv=none; b=j1rKiRorO9Tk6KawWrqrn08AWj114tScTkdnxHg6WqvwYLBfDCkOR29E1RlI0YIiiOF/Am9NSjawpRUi+Rmn/1EjdBGKMgblUNZm5i+DpSinGubpdtPYviF/oDWJxtKLUIwqiRsVkzqt9Fr6TSd/qhuTChTuWAWKxVUkqdKGEJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760607232; c=relaxed/simple;
	bh=1fuDD82MkjEvS2d2bVDxM7bDGznkd5FB2ueXTwkwnY0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R+4yWiac0v4FBuuxdZkK0Uma7vJmm+ziiXLzURivNY8lGAFFLtk9PE/x2qJIZPaqlTt7otcJVqwZZuBswU5IZhV769qMOomG6fxweqm+rgiZcFK5B3t+k/yUIwd4h47F4bZaf96ocPuVn2qG7JD7XU//kbK77lWKBi6Km+etXlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id B3A4AC116C6; Thu, 16 Oct 2025 09:33:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 9E3A1C116B1;
	Thu, 16 Oct 2025 09:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9E3A1C116B1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 055D91688;
	Thu, 16 Oct 2025 02:33:42 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F0B893F6A8;
	Thu, 16 Oct 2025 02:33:48 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [GIT PULL] firmware: arm_ffa: Fix for v6.18
Date: Thu, 16 Oct 2025 10:33:46 +0100
Message-Id: <20251016093346.945036-1-sudeep.holla@arm.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fix-6.18

for you to fetch changes up to 11fb1a82aefa6f7fea6ac82334edb5639b9927df:

  firmware: arm_ffa: Add support for IMPDEF value in the memory access descriptor (2025-10-13 10:34:46 +0100)

----------------------------------------------------------------
Arm FF-A fix for v6.18

The FF-A driver was updated to support specification version 1.2 but omitted
support for the 16-byte implementation-defined (IMPDEF) field introduced in
FF-A v1.2 within the Endpoint Memory Access Descriptor (EMAD). This omission
breaks all memory interfaces.

This change updates the EMAD sizing and offset logic to correctly handle the
FF-A v1.2 layout while preserving backward compatibility with older versions.

----------------------------------------------------------------
Sudeep Holla (1):
      firmware: arm_ffa: Add support for IMPDEF value in the memory access descriptor

 drivers/firmware/arm_ffa/driver.c | 37 +++++++++++++++++++++++++++----------
 include/linux/arm_ffa.h           | 21 +++++++++++++++++++--
 2 files changed, 46 insertions(+), 12 deletions(-)
