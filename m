Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EF8208AD
	for <soc@lists.linux.dev>; Tue,  8 Oct 2024 22:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728425094; cv=none; b=gbNOF1e5agRpz9a66p9W5SAQr9MhN4aVfyOIvTlIWsEpzuUFfdfB233CZ3m3OR28Q50m2qj0RiIOKI4lPU6tpPeg6QjD9uPPOP+Uq4RajACluf/4mpPDy+L+xwW1vIRZrDZFH8Zd8JK4cOhe8IlC2XTEFa6b4BaCdpXqn0wPSLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728425094; c=relaxed/simple;
	bh=qUA0tscRg85Z/uu1YEBxuAN6QlWs6cTfPkDpCzDR4EE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gjVRQgwnRRgsSFgDha+COac683/wHelDfsDiUJV5BmvgjLpVrdkfqIOUGb3NjgXHN4YvjOsP9XFYf6jPt1m/LsEvD/qQd1YtX5kT1nTStnCaWSuiB0BKDvJXYkGi6urfYRxJV62dVvrChv5Id7of0H4WglxSJUJmz6b+NLxEVi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=vn+U0NTY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="vn+U0NTY"
Received: by smtp.kernel.org (Postfix)
	id CCEDFC4CECC; Tue,  8 Oct 2024 22:04:53 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CF2F1C4CEC7;
	Tue,  8 Oct 2024 22:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CF2F1C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 55C01C0000E3;
	Tue,  8 Oct 2024 15:04:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 55C01C0000E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1728425085;
	bh=qUA0tscRg85Z/uu1YEBxuAN6QlWs6cTfPkDpCzDR4EE=;
	h=From:To:Cc:Subject:Date:From;
	b=vn+U0NTYR3KTKZ05/VTampLi5zmeT2EY52ICsOSzEgnxmKOZlP3EM9mrYNnCBh1SC
	 By23u+HqixtBSYJeRVvyDgYDNFCN4QtzliAhLH2TlSmPhNFQi1v7+tfMJUXeXY5KZy
	 RDayFJVl9+P05JNEsqYe05tmjFEzeLUqH6MJbBLU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id EC7F718041CAC6;
	Tue,  8 Oct 2024 15:04:44 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Florian Klink <flokli@flokli.de>,
	Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom devicetree fixes for 6.12
Date: Tue,  8 Oct 2024 15:04:40 -0700
Message-ID: <20241008220440.23182-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
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

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.12/devicetree-fixes

for you to fetch changes up to dc7785e4723510616d776862ddb4c08857a1bdb2:

  ARM: dts: bcm2837-rpi-cm3-io3: Fix HDMI hpd-gpio pin (2024-10-08 15:01:51 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
6.12, please pull the following:

- Florian fixed the HDMI gpio pin which is connected to GPIO pin 0, not
  1

----------------------------------------------------------------
Florian Klink (1):
      ARM: dts: bcm2837-rpi-cm3-io3: Fix HDMI hpd-gpio pin

 arch/arm/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
