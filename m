Return-Path: <SRS0=1HNv=HT=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CDDC10DC1
	for <soc@archiver.kernel.org>; Fri,  8 Dec 2023 12:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8353FC433CA; Fri,  8 Dec 2023 12:19:03 +0000 (UTC)
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B48E0C433C7;
	Fri,  8 Dec 2023 12:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B48E0C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 52C0A60500;
	Fri,  8 Dec 2023 12:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1702037941;
	bh=X1f9u7h9Lfj89wa/zo8Wd+9hqQPSaXfArC7mNIyIqnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FJRhI9DvY8OmjAPzwFoqm/dCeDgIzxozcKihwilTnE89isDRbIEkAQvGi8LLiEo66
	 0R3Z1w9FycF1PeQku0k98Dw5j6AJ/8LhaDhhit0Ig5rsRTFuMdIYv+INLbJ4Nxt8Zo
	 AePBOpBsDoRGyvz/ZGo0vtQRzqhTTYrbXknaXCpr6hq4XdwvY7Ejws02igAMAQ7AW2
	 RJoxebKxjSu2RTSjYFG/cQQOJNA9ae73B1H4G9FDZiN4Wd9roDF9vw4vH45W9i8Mb9
	 +Vn6mlX7fnElRZ1iMyaOEEe8yeM2jB+8IX6/zQz0voCLQlzFxf2+rQLEySIomdeG7B
	 AWqSoKjkuVkbA==
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] Maintainer changes for v6.8
Date: Fri,  8 Dec 2023 14:18:19 +0200
Message-ID: <pull-1702037869-295608@atomide.com-3>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <pull-1702037869-295608@atomide.com>
References: <pull-1702037869-295608@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.8/maintainers-signed

for you to fetch changes up to 6353ed6f311b9daab93df4d968d72ddf2070fe7f:

  MAINTAINERS: add omap bus drivers to OMAP2+ SUPPORT (2023-12-01 08:49:45 +0200)

----------------------------------------------------------------
Maintainer update for drivers/bus/omap* files

Add for drivers/bus/omap* files to the omap section in the
MAINTAINERS file.

----------------------------------------------------------------
Lukas Bulwahn (1):
      MAINTAINERS: add omap bus drivers to OMAP2+ SUPPORT

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)
