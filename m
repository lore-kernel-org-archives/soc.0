Return-Path: <SRS0=6DOZ=56=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A789C61DA4
	for <soc@archiver.kernel.org>; Thu,  2 Feb 2023 15:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F6A0C4339C; Thu,  2 Feb 2023 15:32:22 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F01BEC433EF;
	Thu,  2 Feb 2023 15:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F01BEC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 680AC20013;
	Thu,  2 Feb 2023 15:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675351937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MPjtI0qPsuA2UjQwTuIxQmv+mWVyMdFTbfq5aZnyuo0=;
	b=prjnmkSqFZxN0jZ4tYwqxUxqjPT/ASNo3wdxu8NOTQTldRIfNmV6EYKqxvkg+dFCjeCM+J
	3lgS3yEdETRuROXqsEtLl04gOebt1YefzAF2wpxi0U1rypRRXQwBCI9aPms+gZWWGLs20v
	EllIwrSRt0dmiWCX+hQCP0rUU+r/Uu3vQo+Z/jwjLrHrkOcfotFEPaT0IbvG+fQ4yHKZ6a
	kHUQdJen/SPByKh6VIKDmFB28wquvDJPl6nkXQ8Qxnv3joJTwn+Ocssjr7soywqte+rod6
	wLzsBbVkhqzBMXm0l35asqYfd9WhvyIsnsiUMg+cLiCHvuPtuwLbOjctkOCE8Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v6.3 (#1)
Date: Thu, 02 Feb 2023 16:32:15 +0100
Message-ID: <87357oaxs0.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for dt for mvebu for v6.3.

Gregory

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-6.3-1

for you to fetch changes up to 12cb7a3349a53efa8698a01fe0efdc61d887e541:

  ARM: dts: dove.dtsi: Move ethphy to fix schema error (2023-01-31 15:38:43=
 +0100)

----------------------------------------------------------------
mvebu dt for 6.3 (part 1)

Fix errors reported by dtbs_check on dove boards

----------------------------------------------------------------
Micha=C5=82 Grzelak (1):
      ARM: dts: dove.dtsi: Move ethphy to fix schema error

 arch/arm/boot/dts/dove-cm-a510.dtsi | 14 +++++++++++---
 arch/arm/boot/dts/dove-cubox.dts    | 15 +++++++++++----
 arch/arm/boot/dts/dove.dtsi         |  5 -----
 3 files changed, 22 insertions(+), 12 deletions(-)
