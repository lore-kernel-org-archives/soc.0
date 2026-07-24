Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B958345EAA
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 21:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784928710; cv=none; b=nFje8rGlIZC+YcnYgl6ZRI17ABtrELKt7EoLUh9jwDxxOxZ0HJkbLeZ0E6qvu0t/eRhUHZeJGauZcCo0zp04ywko1MXTc4DJTx75MTCEjMSRYwKFEO+NIWImoBEmolxcjzfxhwmm9jHRXWneBr4WXwA0D0P4gRZN0SFGS6XJ9LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784928710; c=relaxed/simple;
	bh=DZWGC6QIL8eLuoB5lCnVl42W74flK/sDT7akFfjhw84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IWxPKbBJJTihSUfYjY75dlGGnurGLeCUqOa9/8+IlM2Dg7P7rY9i462Tx+KvFDsRdf72fVNgJTAGlRPmQxXPrmcyy/mS/NQ1fB1shWpyrjqjFi1F7YFI4cN/OQ8muh9fXcYcTBJ2PP7qJx+B0oysJGErp3S/emsTxz8cnKub7Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=LZ02Trna; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=LZ02Trna; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="LZ02Trna";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="LZ02Trna"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1784928285; bh=DZWGC6QIL8eLuoB5lCnVl42W74flK/sDT7akFfjhw84=;
	h=From:To:Cc:Subject:Date:From;
	b=LZ02TrnaJOrOyhlaYxKp+BkV+EPH4jmIWGspfo3rJedVoc2CaDqzCmH/Z1ttL9WMi
	 jPKAapK2fd561QGtWUwXBGlcWkWtWm6PAAXJGo8IhSYiSRwP8mwmpFt7v2HAo5ss+1
	 Ibb06JAoBRiVn3A+AIpVSSdWfskdXMrD5GhNsxIpzFUYza/Ak7rXVVqLc0kdErRdMM
	 /a8AJ3O8bvPTnkF915OuKVRw19P7qhL9h1W9qe0BiK4q57FdDYmpEWoOfB1rW69qww
	 UgDvyIeLfoXX53+eXufLRdfOY9GHRyHOVxPRQWj/aQuqV9iChl4IdWyUDRgvcAasnQ
	 iXleoEcdgwqeA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 753803FAC9F;
	Fri, 24 Jul 2026 21:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1784928285; bh=DZWGC6QIL8eLuoB5lCnVl42W74flK/sDT7akFfjhw84=;
	h=From:To:Cc:Subject:Date:From;
	b=LZ02TrnaJOrOyhlaYxKp+BkV+EPH4jmIWGspfo3rJedVoc2CaDqzCmH/Z1ttL9WMi
	 jPKAapK2fd561QGtWUwXBGlcWkWtWm6PAAXJGo8IhSYiSRwP8mwmpFt7v2HAo5ss+1
	 Ibb06JAoBRiVn3A+AIpVSSdWfskdXMrD5GhNsxIpzFUYza/Ak7rXVVqLc0kdErRdMM
	 /a8AJ3O8bvPTnkF915OuKVRw19P7qhL9h1W9qe0BiK4q57FdDYmpEWoOfB1rW69qww
	 UgDvyIeLfoXX53+eXufLRdfOY9GHRyHOVxPRQWj/aQuqV9iChl4IdWyUDRgvcAasnQ
	 iXleoEcdgwqeA==
From: Vladimir Zapolskiy <vz@mleia.com>
To: soc@lists.linux.dev
Cc: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] NXP LPC32xx ARM changes for v7.3
Date: Sat, 25 Jul 2026 00:24:26 +0300
Message-ID: <20260724212426.414433-1-vz@mleia.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260724_212445_497333_E53D7C22 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message. 

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://github.com/vzapolskiy/linux-lpc32xx tags/lpc32xx-arm-for-7.3

for you to fetch changes up to d6ef4391897d8957f26397f381e78677c1277260:

  ARM: lpc32xx: remove a few manually populated OF devices (2026-07-24 23:29:08 +0300)

----------------------------------------------------------------
ARM: nxp: lpc32xx: ARM changes for v7.3

NXP LPC32xx ARM changes for v7.3 contain:

- Karl Mehltretter fixes a multiplatform kernel runtime execution by
  limiting LPC32xx SoC specific init functions to be run on this
  platform only,
- a stale method of populating DMA, SLC and MLC NAND controllers is
  removed from platform code, this change was announced to happen by
  the end of this year, all touched by the change controllers are
  properly described in the platform device tree for years, and very
  old board dtbs are recommended to be updated.

----------------------------------------------------------------
Karl Mehltretter (1):
      ARM: lpc32xx: only run SoC init on LPC32xx hardware

Vladimir Zapolskiy (1):
      ARM: lpc32xx: remove a few manually populated OF devices

 arch/arm/mach-lpc32xx/common.c  |  5 +---
 arch/arm/mach-lpc32xx/common.h  |  2 ++
 arch/arm/mach-lpc32xx/phy3250.c | 62 ++---------------------------------------
 arch/arm/mach-lpc32xx/pm.c      |  5 +---
 4 files changed, 6 insertions(+), 68 deletions(-)
