Return-Path: <SRS0=Y2Br=GB=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C64CDB465
	for <soc@archiver.kernel.org>; Thu, 19 Oct 2023 15:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1B2E0C433C9; Thu, 19 Oct 2023 15:33:41 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9BA27C433C7;
	Thu, 19 Oct 2023 15:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9BA27C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9FD51BF208;
	Thu, 19 Oct 2023 15:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697729616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=OhOVzRXSe2HLt9WKt8+4CTrBXkgg5rXE1jl9izk9bYs=;
	b=eWM5zk9S5rRHHQe7pIPZ2rfWuHtprTi98CLeKe8TSHFBOLSyYYwgxqlQ6GDBKG2uTfvLrX
	R1FrsBcYQfcH7wYgNttfoWHQ3O+8Y0zsZtYmZwOSM+VjoGFz75DW3aWUHtmFwXM3+JPBi/
	eKoj1oIjfINWQwltq9Ar3PFx4hQv1kkoVL3m1w88L+0dXM6vVItHRBhDQqjUGxbBGltZ6X
	SLIyOr1KCSRqdbYURf1yF53eRSADUWB5uLyhlqfgt7FpaWYO7PG/amdG00aLRGzKMeKjGd
	Ly3g2dAUXjqHIfOE1ahQ3e+HXgQl46wLqaRgHw1aWELuxrKmqgVIkzbXcpJsbA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: arm for v6.7 (#1)
Date: Thu, 19 Oct 2023 17:33:36 +0200
Message-ID: <87zg0e8w4v.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for arm for mvebu for v6.7.

Gregory

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-arm-6.7-1

for you to fetch changes up to cc3b17cabe9fd2881eace5b7b1581914569d62e9:

  soc: dove: add missing of_node_put (2023-09-20 11:28:02 +0200)

----------------------------------------------------------------
mvebu arm for 6.7 (part 1)

Fix missing of_node_put in dove code base

----------------------------------------------------------------
Julia Lawall (1):
      soc: dove: add missing of_node_put

 drivers/soc/dove/pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
