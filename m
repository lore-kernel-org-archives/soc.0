Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F4A15C140
	for <soc@lists.linux.dev>; Mon, 28 Oct 2024 03:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730087703; cv=none; b=HASkO1+sEFJy5b9RmVU3dUT4/8aJKK5uDJRDtUz7a9Ej8PN0+walSfX6zh+zDDq58Tm8lRprGLeDC3FapIBgMr/iQHcbxpGyDCpnNb/zLehPTtGI7TIgFNEq6TWoI5rPt/K/OL51SM+AnFcpB6QYlCQz7kwqlq+TicDhmriayJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730087703; c=relaxed/simple;
	bh=Xea9EH2FO5ceZOT+mYEFNS4GnXIX0lfAVOtRDGmyxKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sNUetCzmPdqfztrznIKUN0W1HrJV92FV9sUdzHUZwtgfzuQxwACaZCfdM8+KCqEA0jhoRY56N026EfO6LugqoxqzoeZZaSW2OHoIwxAQlHcBGEW3P/CAzOoc/I6FROYyiitnRm+U5q9BEp0cyW3wG2dwyC7Bqut0OJWIhMWW/Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fxAMZu2V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fxAMZu2V"
Received: by smtp.kernel.org (Postfix)
	id 97B36C4CECD; Mon, 28 Oct 2024 03:55:03 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (saphodev.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 74706C4CEE3;
	Mon, 28 Oct 2024 03:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 74706C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 5A4CCC0005C0;
	Sun, 27 Oct 2024 20:54:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 5A4CCC0005C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1730087695;
	bh=Xea9EH2FO5ceZOT+mYEFNS4GnXIX0lfAVOtRDGmyxKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fxAMZu2ViwiWCYgQhHp2DJRjAZOx6zHaHmp7NMiskbckOe5XHjcWiNlVQX/uT5vAD
	 GV3hnsZTHjFFbfKIsMx+3Bz93mTT8vL+/umzKzGyq6hY2aSgBBRowdJESDPIvN0TGY
	 viNKqaCERbDUEE1plKttUGUH5IxoXl7GaFr/VAW4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 0587018041CACA;
	Sun, 27 Oct 2024 20:54:55 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	William Zhang <william.zhang@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom soc changes for 6.13
Date: Sun, 27 Oct 2024 20:54:49 -0700
Message-ID: <20241028035449.734504-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028035449.734504-1-florian.fainelli@broadcom.com>
References: <20241028035449.734504-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.13/soc

for you to fetch changes up to 4ee0bd85dd0a505ea3a1117bf4fad429c1f013ab:

  ARM: bcm: brcmstb: Drop custom init_irq callback (2024-10-08 15:02:31 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoC changes for 6.13,
please pull the following:

- Linus adds support for the debug UART on BCM6846 (BCMBCA) platform

- Florian dros the custom init_irq() callback which does the same thing
  as the standard irqchip_init()

----------------------------------------------------------------
Florian Fainelli (1):
      ARM: bcm: brcmstb: Drop custom init_irq callback

Linus Walleij (1):
      ARM: bcm: Support BCMBCA debug UART

 arch/arm/Kconfig.debug           | 12 +++++++++---
 arch/arm/mach-bcm/Makefile       |  1 +
 arch/arm/mach-bcm/board_bcmbca.c | 31 +++++++++++++++++++++++++++++++
 arch/arm/mach-bcm/brcmstb.c      |  6 ------
 4 files changed, 41 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/mach-bcm/board_bcmbca.c
