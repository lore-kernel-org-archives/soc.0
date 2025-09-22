Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363243112B6
	for <soc@lists.linux.dev>; Mon, 22 Sep 2025 17:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758560658; cv=none; b=mNqWgsJeEBF+yfVzTV0YwWXpHQQ9KcU+/Awh7lv7Bk2aTrNICIFkq1TT4/Xqg8zp6oOAa678Wbb9Tf4X10ScJNAcASLRAuh2CShBLUyePMSWt2zTY8Jhpr+Fpt3vVKjTKRJ1bBLlU026TNM9jPvi8SYbt5OjJetw50v/4zFvVGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758560658; c=relaxed/simple;
	bh=mA1m6W7VuxwY07ZYn6w/N7eCuR3fCYoMpUyjqB9ZPjQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DbnbNqClUJCchtohwOLlFGv90JOf8K9B1JaMjLTQfUQGLN26Y+XJ4dJOhEFovqerQc0Fh/FOzzdFUrIVWUpxJHL2WxZmHhwScPULl1dQ2/iW61t51+XYxBW/WzXU/R6it9RWmu0n35VikGUbfg8/YBd5wvfo3zIS2bXZui6rk4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=o/R/WOZK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="o/R/WOZK"
Received: by smtp.kernel.org (Postfix)
	id C673EC113D0; Mon, 22 Sep 2025 17:04:17 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C39A8C4CEF0;
	Mon, 22 Sep 2025 17:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C39A8C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758560656; x=1790096656;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mA1m6W7VuxwY07ZYn6w/N7eCuR3fCYoMpUyjqB9ZPjQ=;
  b=o/R/WOZK6/2XJBWmJ/cJP0zObFj2Rpz5LtHkaHWME8ttriVrqsqRVKOs
   jN1YjJxZMH3n0oxScuobkBRIIYVE8APOe4+6vaPdQl/EVpHIO5PkY3GQ/
   /iMXrIrJTzZaWYhWQEnplIAnyek+TT4zQidGf4tbWR1kXW+RiE44dr4qd
   aNonZV+Jq7gshRu1zho6g8uKOM9Dr0ttl5Kucslq+7n0wt+9aoUayZ+cF
   nbklbCLhmw6meq//6N9kjnU6OVgiVpwT7RZ5qRS7XwwcL2+C1D650STEG
   r0C4QIVp3Nfwjdg9dLfgvD/1R4KmQKPACKMIe6miLLeNqotKgt61ewOCk
   A==;
X-CSE-ConnectionGUID: ARBJErZ/SGCcBWIaab2tJw==
X-CSE-MsgGUID: Dr/xhLz+QTq3bkZGgcAj/g==
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="52732392"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Sep 2025 10:04:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 22 Sep 2025 10:03:55 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 22 Sep 2025 10:03:53 -0700
From: <nicolas.ferre@microchip.com>
To: Arnd Bergmann <arnd@arndb.de>, <arm@kernel.org>, <soc@kernel.org>
CC: Ryan Wanner <ryan.wanner@microchip.com>, Dharma B
	<dharma.b@microchip.com>, Conor Dooley <conor.dooley@microchip.com>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [GIT PULL] ARM: microchip/at91: dt for 6.18 #1
Date: Mon, 22 Sep 2025 19:03:45 +0200
Message-ID: <20250922170346.40876-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Dear arm-soc maintainers,

Here are the first dt changes for 6.18 which contain some little node additions.
The QSPI node has its bindings accepted and going with the SPI tree:
https://lore.kernel.org/lkml/20250908-microchip-qspi-v2-0-8f3d69fdd5c9@microchip.com/

Thanks, best regards,
  Nicolas

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.18

for you to fetch changes up to c656932c3ece3eebe6240bb20e5c1d8aa0d7ecb0:

  ARM: dts: microchip: sam9x7: Add qspi controller (2025-09-22 18:20:34 +0200)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.18

This update includes:
- sama7d65 and curiosity board: addition of gpio, leds and usart3
- sam9x75: qspi node
- one cleanup

----------------------------------------------------------------
Dharma Balasubiramani (1):
      ARM: dts: microchip: sam9x7: Add qspi controller

Krzysztof Kozlowski (1):
      ARM: dts: microchip: Minor whitespace cleanup

Nicolas Ferre (1):
      ARM: dts: microchip: sama7d65: add uart3 definition for flexcom3 peripheral

Ryan Wanner (1):
      ARM: dts: microchip: sama7d65: Add GPIO buttons and LEDs

 .../boot/dts/microchip/at91-sama7d65_curiosity.dts | 53 +++++++++++++++++++++-
 arch/arm/boot/dts/microchip/sam9x7.dtsi            | 21 +++++++++
 arch/arm/boot/dts/microchip/sama7d65.dtsi          | 17 ++++++-
 3 files changed, 89 insertions(+), 2 deletions(-)

-- 
Nicolas Ferre
