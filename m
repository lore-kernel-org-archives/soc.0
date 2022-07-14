Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408C3C43334
	for <soc@archiver.kernel.org>; Thu, 14 Jul 2022 15:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0DB62C34114; Thu, 14 Jul 2022 15:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802A3C341C6;
	Thu, 14 Jul 2022 15:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657813001;
	bh=zYJJaUrh0bgAnjioQTzVPzxpmuk8Q9ixEbCMXRZqZms=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DgBTkSM9MsfBd/EsNyNS6hLAEnQR6nToq3QTgoTJ69YYjzNytzkNYYYNho8f1ubLs
	 haeExN8q4RwhtVWg71qrU8jaXiNY/1zjloebiIkyLwRy5TlqTfXbG2af5u5NzLz0uP
	 28C0tx+BlLtSgCfY9lMi0xCZDIyQTrW18m1Tj6sK7FIedAeFGonm9T7shauuOf74hE
	 Plm5YLAD0650MquXaV2A19JNiSFx22MqzCXtFKyiAw47HWFWYs4Uc/J/k402yE5wM1
	 W0BqH1+4q7wFeMM/GKAu0Gnu9+3CrGP+1vsL7eFMQYPstLeZTAtr9WezdwnejCpHR+
	 sF1l/F03tZbEQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	arm-soc <arm@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [GIT PULL] ARM: soc: MediaTek related SoC driver updates for v5.20
Date: Thu, 14 Jul 2022 17:36:15 +0200
Message-Id: <165781284975.3193627.4432387522725212010.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <b733bd82-6d99-23ef-0541-98e98eb8d3bc@gmail.com>
References: <b733bd82-6d99-23ef-0541-98e98eb8d3bc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Jul 2022 19:46:50 +0200, Matthias Brugger wrote:
> Please have a look for the updates of the SoC drivers. The most important update
> is the addition of the Smart Voltage Scaling (SVS) device support, which
> supports right now two devices but more are in the pipeline.
> 
> Regards,
> Matthias

Merged into arm/soc, thanks!

merge commit: ff6c226953b1bd57c6f4d4e7a37f586426b80e0d

       Arnd
