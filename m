Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3064720C00E
	for <soc@lists.linux.dev>; Thu,  5 Dec 2024 11:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733399002; cv=none; b=Q7tHFgWvM6LFOIkmUvZxVfbbwzejgeYipSwSmiygfy2Y/ESmSyAPdKzi6bAiXHw9NRRlesMYLdYinXp7kFYIOpuh69Bdgp/+fwFgxONLrSPqEdzRcO+19Tnn5TB2CuXV0hhpG7mh77NA0B973svRsfCfG0wE9pZL8SDH+Z9VKbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733399002; c=relaxed/simple;
	bh=SIsck4iYVwktMd9irnc1d0A0ptQJpYSH5DyZu8iLaz0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qbQpgUn7Aj/o+Q6VkAGhjQnp9/vhuWbP72ZU4yRwtt+KQQswwNk8OWcThczffo/ihvlbPuWDLQ0lYNaJWmV7Y7BTxeRK4lUqoqMZ9rwtNyedFEK0QLdZbk4prln7J/meQoC4YljWdGPW4bebM1/5nwIT8SGWw1xO3VJUICh/f44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id CB043C4CEDF; Thu,  5 Dec 2024 11:43:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id BA69CC4CED1;
	Thu,  5 Dec 2024 11:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BA69CC4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB9A4FEC;
	Thu,  5 Dec 2024 03:43:42 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 54C673F71E;
	Thu,  5 Dec 2024 03:43:13 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] arm64: dts: juno: Fixes for v6.13
Date: Thu,  5 Dec 2024 11:43:02 +0000
Message-Id: <20241205114302.708433-1-sudeep.holla@arm.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-fix-6.13

for you to fetch changes up to 4f776d81bf927a4f25d5e32a4d0df08ee509dd6c:

  arm64: dts: fvp: Update PCIe bus-range property (2024-12-05 10:28:26 +0000)

----------------------------------------------------------------
Armv8 Juno fix for v6.13

Just a single fix updating the PCIe bus address range to accommodate
the full ECAM window of 256MB available on most of the recent versions
of RevC FVP models.

----------------------------------------------------------------
Aneesh Kumar K.V (Arm) (1):
      arm64: dts: fvp: Update PCIe bus-range property

 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
