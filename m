Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE6718C00E
	for <soc@lists.linux.dev>; Wed,  6 Nov 2024 11:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730891256; cv=none; b=VnvpMK7KyiVsp/jkTzvvGHk+ag7AT6EIXLIuc3gfqCEihfDoX/6jpZNKeQ9eiaHaLp5QDkKhr8oop7JT4UdXx1QEMmO8Qy6VtZldrn2GacIoP6OJMy9KNPZEWfzPl17UbO5yEmN9LKyJ/Aep3RDBSBenYWCtyiuxvUJFvAh/Fog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730891256; c=relaxed/simple;
	bh=vK1xVMIZlvbW+4JVIa3lQbkLtS9Q8F8oR8T6F4m9ayk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kYB4bodY4VwqH0Z19UEBDtCBl4DpS5Emise3L3fH7h5pjvzHGAVZaQznuBI2oNfmPa35ZnTHKmAbuXMzbfQA6CJ6OtV3HP1KDAOiOYrD6Tx1Cs7nfFiXJ9CdUeK8nfFNu6dZcuzhFGJlsG54YE026ivliioRunObpGXLto5ZuD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id EEFBEC4CED2; Wed,  6 Nov 2024 11:07:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id B9CE3C4CECD;
	Wed,  6 Nov 2024 11:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B9CE3C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB52A1063;
	Wed,  6 Nov 2024 03:08:01 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B282B3F6A8;
	Wed,  6 Nov 2024 03:07:30 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.13
Date: Wed,  6 Nov 2024 11:07:27 +0000
Message-Id: <20241106110727.4007489-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull ! Sorry for the late PR but most of the changes are in -next
for a while now.

Regards,
Sudeep

-->8

The following changes since commit 54962707f8b8b53812d3d7fca279a68c6e18faae:

  firmware: arm_scmi: Use vendor string in max-rx-timeout-ms (2024-10-28 14:49:27 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.13

for you to fetch changes up to 109aa654f85c5141e813b2cd1bd36d90be678407:

  firmware: arm_scpi: Check the DVFS OPP count returned by the firmware (2024-11-06 10:48:13 +0000)

----------------------------------------------------------------
Arm SCMI updates for v6.13

Just couple of main additions:
1. Support for variable I/O width within ARM SCMI shared memory area.

   Some shared memory areas might only support a certain access width,
   such as 32-bit, which memcpy_{from,to}_io() does not adhere to at least
   on ARM64 by making both 8-bit and 64-bit accesses to such memory.

    This support updates the shmem layer to support reading from and
    writing to such shared memory area using the specified I/O width
    in the Device Tree. The various transport layers making use of the
    shmem.c code are updated accordingly to pass the I/O accessors that
    they store. The device tree bindings are also updated for the same.

2. Extension of SCMI transport bindings to add more properties

   SCMI transports are characterized by a number of properties. The
   values assumed by some of them tightly depend on the choices taken at
   design time and on the overall archiecture of the specific platform:
   things like timeouts, maximum message size and number of in-flight
   messages are closely tied to the architecture of the platform like
   number of SCMI agents on the system, physical memory available to the
   SCMI platform and so on. Such details are not discoverable as they are
   outside the scope of the SCMI protocol specification.

   Currently such properties are simple default values defined at build
   time, but the increasing number and variety of platforms using SCMI
   with a wide range of designs has increased the need to have a way to
   describe such properties across all these platforms.

Apart from the above two, there is one NULL pointer dereference fix for
very age old SCPI protocol driver which seems to be still in use on few
platforms.

----------------------------------------------------------------
Cristian Marussi (5):
      firmware: arm_scmi: Account for SHMEM memory overhead
      firmware: arm_scmi: Calculate virtio PDU max size dynamically
      dt-bindings: firmware: arm,scmi: Introduce more transport properties
      firmware: arm_scmi: Use max_msg and max_msg_size devicetree properties
      firmware: arm_scmi: Relocate atomic_threshold to scmi_desc

Florian Fainelli (2):
      dt-bindings: sram: Document reg-io-width property
      firmware: arm_scmi: Support 'reg-io-width' property for shared memory

Luo Qiu (1):
      firmware: arm_scpi: Check the DVFS OPP count returned by the firmware

 .../devicetree/bindings/firmware/arm,scmi.yaml     | 15 ++++
 Documentation/devicetree/bindings/sram/sram.yaml   |  6 ++
 drivers/firmware/arm_scmi/common.h                 | 45 ++++++++++--
 drivers/firmware/arm_scmi/driver.c                 | 42 ++++++-----
 drivers/firmware/arm_scmi/shmem.c                  | 85 ++++++++++++++++++++--
 drivers/firmware/arm_scmi/transports/mailbox.c     | 15 ++--
 drivers/firmware/arm_scmi/transports/optee.c       | 19 +++--
 drivers/firmware/arm_scmi/transports/smc.c         | 13 +++-
 drivers/firmware/arm_scmi/transports/virtio.c      | 15 ++--
 drivers/firmware/arm_scpi.c                        |  3 +
 10 files changed, 204 insertions(+), 54 deletions(-)
