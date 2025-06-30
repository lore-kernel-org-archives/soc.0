Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DC143151
	for <soc@lists.linux.dev>; Mon, 30 Jun 2025 19:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751310150; cv=none; b=kZ/aOXWXWq5jsZ+HBQ+ZLCP/NgB6xVXvq84ICWY+0MYGm8bcz6UTW8pbb8LfOj2DK7uxz1YydgUF8OB+/WiEzCH4/U1FWumPHL0/akV+/inKheqCyOYtLURYacWYilwqTs/W6LfJBVGu1G/K8mUGiLEHgRYnzlWf5ATLwpDyGR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751310150; c=relaxed/simple;
	bh=ib+xSp9Za30RRjuf0ovBP4tnd/mODhlGjBXuhmv7Z5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y9MoQUqydj9u3HC4lBzMObCQNxHr3O5dXRxTsIPCaB6ops+5j8NqUFi/CTVIWtJ7GzK2/QGT43TxkYG7KoL49iikHW9QlCqtIiTqQqkB1jg3LJJBP3UZ2xuexAMvGfIRuHw6Kup3lNUrbbVarkDUZb9GazsvEYM7Ob73oHgh7gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=BQsU8zrj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="BQsU8zrj"
Received: by smtp.kernel.org (Postfix)
	id 39E0FC4CEEF; Mon, 30 Jun 2025 19:02:30 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9D0CFC4CEF3;
	Mon, 30 Jun 2025 19:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9D0CFC4CEF3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 9AEA1C00210F;
	Mon, 30 Jun 2025 12:02:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 9AEA1C00210F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1751310142;
	bh=ib+xSp9Za30RRjuf0ovBP4tnd/mODhlGjBXuhmv7Z5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BQsU8zrj+iDvpwdVGARWpUNzWcH3Fo4jmTXPsERaH4ulxafiluN4eJdrsrzk8TWOF
	 Rgh/lBU2RWacp/+Q60URaQxDxEjawgVul4FOYPJwsAfVOHrbiVNP4xGO2vu+MmXMnc
	 1/0cEasRFLSb7brHS1ogs6rgddfnuI067AqsxziU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 41226180008FB;
	Mon, 30 Jun 2025 12:02:22 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	"Bjorn Helgaas # quirks . c" <bhelgaas@google.com>,
	pci_ids.h@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Randy Dunlap # build-tested <rdunlap@infradead.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 4/5] Broadcom drivers changes for 6.17
Date: Mon, 30 Jun 2025 12:02:15 -0700
Message-ID: <20250630190216.1518354-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
References: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/drivers

for you to fetch changes up to e3ce7b897388339b407d57969acaa26063e38209:

  pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support (2025-06-25 12:08:56 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoCs drivers updates for 6.17,
please pull the following:

- Andrea adds the RP1 clock, pinctrl/pinconf/gpio and misc driver to
  bind them all

----------------------------------------------------------------
Andrea della Porta (5):
      dt-bindings: clock: Add RaspberryPi RP1 clock bindings
      clk: rp1: Add support for clocks provided by RP1
      pinctrl: rp1: Implement RaspberryPi RP1 gpio support
      misc: rp1: RaspberryPi RP1 misc driver
      pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support

 .../bindings/clock/raspberrypi,rp1-clocks.yaml     |   58 +
 drivers/clk/Kconfig                                |    9 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-rp1.c                              | 1494 ++++++++++++++++
 drivers/misc/Kconfig                               |    1 +
 drivers/misc/Makefile                              |    1 +
 drivers/misc/rp1/Kconfig                           |   20 +
 drivers/misc/rp1/Makefile                          |    3 +
 drivers/misc/rp1/rp1-pci.dtso                      |   25 +
 drivers/misc/rp1/rp1_pci.c                         |  333 ++++
 drivers/pci/quirks.c                               |    1 +
 drivers/pinctrl/Kconfig                            |   11 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-rp1.c                      | 1829 ++++++++++++++++++++
 include/dt-bindings/clock/raspberrypi,rp1-clocks.h |   61 +
 include/linux/pci_ids.h                            |    3 +
 16 files changed, 3851 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 create mode 100644 drivers/clk/clk-rp1.c
 create mode 100644 drivers/misc/rp1/Kconfig
 create mode 100644 drivers/misc/rp1/Makefile
 create mode 100644 drivers/misc/rp1/rp1-pci.dtso
 create mode 100644 drivers/misc/rp1/rp1_pci.c
 create mode 100644 drivers/pinctrl/pinctrl-rp1.c
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h
