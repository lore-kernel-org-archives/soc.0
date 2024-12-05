Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABC920CCDC
	for <soc@lists.linux.dev>; Thu,  5 Dec 2024 11:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733399054; cv=none; b=pINEoJxlXF4+1xwKh52k+JPMrB/Cy8AGzTIF9DmoivgJxXVFJLtgHfLHZK8WoIQ3ztyX7L5h64VRQ/bVLetcDztVz2B0TE5sMfHc04o5MxsQVWPCbMZxO+IG8uVAHa9D+Po20lr7LkYSIufBHfyaRGJRegVNdXcOpNW+5eq964s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733399054; c=relaxed/simple;
	bh=k0kaY9ruCjaULJIoEFC1cYTZqSZlL6+LiwSPICmDfv4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bs5rWWoDgVMJYRBcD+1VjnLpS2UM67hIbY2fhEtXZmZ6+RKQyJ+wc8YoTsE1rUyTPgpClz7xEM7bQqVjY/FQi7FqmEPutdycd7l+YS5LEAkp/0/LjI2wz9gFZVtLiDIh4kH2Qg3Qm1Y8skDARIc2cwe7ClDZ5FpxR7j1nk4NeU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 3F11AC4CED6; Thu,  5 Dec 2024 11:44:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 05142C4CED1;
	Thu,  5 Dec 2024 11:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 05142C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6047DFEC;
	Thu,  5 Dec 2024 03:44:37 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B8C13F71E;
	Thu,  5 Dec 2024 03:44:08 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Fixes for v6.13
Date: Thu,  5 Dec 2024 11:44:06 +0000
Message-Id: <20241205114406.708710-1-sudeep.holla@arm.com>
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fixes-6.13

for you to fetch changes up to 81c8b1c2ef7a75fa5f7f805fdb7f681bbbed07e5:

  firmware: arm_ffa: Drop le64_to_cpu() on UUID in ffa_msg_send_direct_req2() (2024-12-04 09:59:54 +0000)

----------------------------------------------------------------
Arm FF-A fixes for v6.13

Couple of fixes to address:

1. A possible race around setting ffa_dev->properties in ffa_device_register()
   by updating ffa_device_register() to take all the partition information
   received from the firmware and updating the struct ffa_device accordingly
   before registering the device to the bus/driver model in the kernel.

2. Incorrect endian conversion or byte swapping of the UUID by dropping
   le64_to_cpu() for uuid in ffa_msg_send_direct_req2(). This was added
   to fix the compiler warning but missed to get proper end-to-end testing
   as it was relatively new API.

----------------------------------------------------------------
Levi Yun (2):
      firmware: arm_ffa: Fix the race around setting ffa_dev->properties
      firmware: arm_ffa: Drop le64_to_cpu() on UUID in ffa_msg_send_direct_req2()

 drivers/firmware/arm_ffa/bus.c    | 15 +++++++++++----
 drivers/firmware/arm_ffa/driver.c | 13 ++++---------
 include/linux/arm_ffa.h           | 13 ++++++++-----
 3 files changed, 23 insertions(+), 18 deletions(-)
