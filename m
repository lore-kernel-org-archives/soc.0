Return-Path: <SRS0=7SGH=VV=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F16C433EF
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 13:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C2F8DC34115; Fri, 13 May 2022 13:16:21 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F35C9C34100;
	Fri, 13 May 2022 13:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F35C9C34100
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0636CC0011;
	Fri, 13 May 2022 13:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1652447777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=liyWTIldXrafxgkR+zote2D3MKOrU6ubjwK9QTMretU=;
	b=pHvDzY20ODIZdtvTxKNdobBpGbo0UZLA63WnZnwRHE2MsmtMKSCtgjmInv11SlcpcRyBsu
	1/67VD8B5BbsCS3nOYnkHsnE+wOQvlWNLVYVwXrpCmxY4vXtCoXIjHxzep1XAiMnqetHgK
	0rGHkTnLxSHw8NLF9nxxi5iOIWzbXrVyGiReyZP00EpudyrKpNFFGEQRXmhc9oyOt/Gv9r
	73Eabn+y/spoqwiFWANGLexLQLKI6JE8TqVBEeBAUIHIjeu/UjPrTJvjxZYdDUteSnoIVR
	oUZ0LxUJxiL3uCuUn5uIzy7XOfkR55ExD049pzC2ZUaxUMt7hhOis2gKghiJUA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: arm for v5.19 (#1)
Date: Fri, 13 May 2022 15:16:03 +0200
Message-ID: <87o801r2ss.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Here is the first pull request for arm for mvebu for v5.19.

Gregory

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-arm-5.19-1

for you to fetch changes up to 0431de14ae0868ccc5f36bfdf8e8d664bfd8ab53:

  orion5x: fix typos in comments (2022-05-09 10:35:55 +0200)

----------------------------------------------------------------
mvebu arm for 5.19 (part 1)

Fix typos in comment on orion5x files

----------------------------------------------------------------
Julia Lawall (1):
      orion5x: fix typos in comments

 arch/arm/mach-orion5x/dns323-setup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
