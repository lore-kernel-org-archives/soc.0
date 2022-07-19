Return-Path: <SRS0=UQO0=XY=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BCACCA481
	for <soc@archiver.kernel.org>; Tue, 19 Jul 2022 12:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99807C341D0; Tue, 19 Jul 2022 12:55:37 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4F36C341C6;
	Tue, 19 Jul 2022 12:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B4F36C341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7957324000D;
	Tue, 19 Jul 2022 12:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658235328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=glNsks0O4B4pMwjoIQ1McMHKapt05EJSATb+zAoOHC8=;
	b=cKZB6JjoulklJExEuwWgDRngGS7+HM6zlfjkfXfYCjAUe4xSOjioq7NXrlDlTl/xmyMsmD
	9LcrV4uE2x5WXCjEZcFgNNfK2u1j2YTIYTsDWAaZ25laLtYtv+j7Q1XjEWCx0EbRTly1iJ
	Vy8oBK8fHIGKvqJa1ZVTcRf+vOQBb2x+p/ARi4qdwouK608Q8+4Kvb6pm5+ES+JeJfd1W2
	yN700vN7Rs8wfKdpHv1OP7BmtOjOsKXYbEyIRDaeyvx73Z2gFpSjc439s8rJcw5Fk9nIR5
	lNi6GZq4tQptBxFzSTdZgUhft9FCS2nN0r9wcrtL0UY+GEin2twK7aKdwAkuOQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v5.20 (#1)
Date: Tue, 19 Jul 2022 14:55:27 +0200
Message-ID: <87lespqn28.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for dt for mvebu for v5.20.

Sorry to be late, actually I've just realized this week we were already
at -rc7.

Gregory

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-5.20-1

for you to fetch changes up to 40624346b7ae0c2b1209fc9993ea30699e512c50:

  ARM: dts: turris-omnia: enable LED controller node (2022-07-18 12:42:18 +=
0200)

----------------------------------------------------------------
mvebu dt for 5.20 (part 1)

Enable LED to link/activity on turris-omnia (Armada 385 based)

----------------------------------------------------------------
Marek Beh=C3=BAn (2):
      ARM: dts: turris-omnia: configure LED[0] pin function to link/activity
      ARM: dts: turris-omnia: enable LED controller node

 arch/arm/boot/dts/armada-385-turris-omnia.dts | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
