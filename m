Return-Path: <SRS0=6U1h=AJ=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B26C77B71
	for <soc@archiver.kernel.org>; Tue, 18 Apr 2023 09:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 902A6C43443; Tue, 18 Apr 2023 09:53:57 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F270C4339C;
	Tue, 18 Apr 2023 09:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8F270C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CF20A4000C;
	Tue, 18 Apr 2023 09:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681811628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TGlICksGP4+NwHLlduDlkE8hqEEQtKTOkQsyWpMQRD4=;
	b=QprZ223Gy2gxXUnDPZB7dSxEjGi6N/cI1mHJIU8ajzSvW3+G3Sd3iwm1jrXnWOCAg1drlG
	ggBicylrwUloU2pbTJWxOu416N40LJ3pFgTan+G4OCRLxfi8HzdHCEBZD+05zeoUboyhPa
	5UbOGCVfM48Gc9aUPu+9B2T6ed38mkPsUPSOOowzFZBZ6ZEs5i5tjvP9b3lAE2MXyYBC8l
	rHwXxPLqjhxZr/iFnrb6TRwwNj651ny9oWVssijJnS0XEh2U9N/QygHbDJ4+/GX7e9bij6
	9Vj2xXX4a6gub82Jqh4VtUPOy9B2dV17nCI5nCmUDrLtDS3uOq+7pHuckNlhlw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: arm64 for v6.4 (#1)
Date: Tue, 18 Apr 2023 11:53:46 +0200
Message-ID: <878repzfbp.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for arm64 for mvebu for v6.4.

Gregory

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-arm64-6.4-1

for you to fetch changes up to f326e72a6e0baacea42ecaa9aaa4d7e7a355c972:

  firmware: turris-mox-rwtm: make kobj_type structure constant (2023-04-07 =
17:17:00 +0200)

----------------------------------------------------------------
mvebu arm64 for 6.4 (part 1)

turris-mox-rwtm firmware:
 - prevent modification at runtime of the kobj_type struct

----------------------------------------------------------------
Thomas Wei=C3=9Fschuh (1):
      firmware: turris-mox-rwtm: make kobj_type structure constant

 drivers/firmware/turris-mox-rwtm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
