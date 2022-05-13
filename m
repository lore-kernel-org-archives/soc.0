Return-Path: <SRS0=7SGH=VV=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FCEC4332F
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 13:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2196AC3411D; Fri, 13 May 2022 13:17:11 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EB6A4C34100;
	Fri, 13 May 2022 13:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EB6A4C34100
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F2397240019;
	Fri, 13 May 2022 13:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1652447821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zdE6NIEWWTN1W6xivckej58m6fuCQkRUiHDTDq7i+84=;
	b=W1kSnyBEJKJ+6OTUva9x29uKcWWTfK/NlO2kCNxCegAaDyTioLfTe79FSAKglgS11o0NY4
	Ef1MdWCHTfnT3hXvUAm+7cpc+M5YRTggVeC4IGZpJc/gkuqqyicbvN/tdZWh8eFnJZacl8
	rE5EH441lDGV5348gT3bS77ZHDE/SlR2uDOvKGiRqAb1g8CJ4RJ0ujpoYFKEL7S4hnczCG
	4P0vJ0bnnTF1cTdVWHwOet+w9Oo16C8DJwMfuqDYar9kRkN85jctbULuuTsOlJMEylVAG2
	CMM3v9WHwIRADXKDx8c0A3lvt0GfSqxtdkxywgz7PNCClNJwspX1MMufoilnvQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v5.19 (#1)
Date: Fri, 13 May 2022 15:16:51 +0200
Message-ID: <87lev5r2rg.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for dt for mvebu for v5.19.

Gregory

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-5.19-1

for you to fetch changes up to f60e2de515095d04a05c6fc169ab6457bc70f3da:

  ARM: dts: turris-omnia: Add atsha204a node (2022-05-13 14:33:03 +0200)

----------------------------------------------------------------
mvebu dt for 5.19 (part 1)

Add the crypto module atsha204a node for the turis omnia (Armada 385 bases)

----------------------------------------------------------------
Pali Roh=C3=A1r (1):
      ARM: dts: turris-omnia: Add atsha204a node

 arch/arm/boot/dts/armada-385-turris-omnia.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
