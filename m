Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADBFC433EF
	for <soc@archiver.kernel.org>; Mon, 25 Jul 2022 15:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3B4AC341C6; Mon, 25 Jul 2022 15:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E60C341CD;
	Mon, 25 Jul 2022 15:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658763880;
	bh=crjDuuScKQndWp3g6KcUoi46L8WJETTV/FlIky82/fM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qRwzst5XAvmlfAtrc7eR8V76P/GWBxgjc24D3vASdfk49sYjIngXDbogx5MJrQfor
	 URGU7b1cvu45EcnUlA0VYSLDfB3E6jssKBxxtcgVnve54QG6EwvmnNNQUrMhxa2zlJ
	 pU1RNXoPSVgSfc971pcPJ9ny6i0VXeqL/7HbOif+h75iahPbc7rndbt/B2PQ+QbRrg
	 Bp+NVu2H+FtFsJzTGNGXdUbh82GXVzOpGGbsTMGnfoowOkieEyv3ZpYBKFf+rD9QLC
	 tuM8mz0sSXhZymoPxyHWct7mx88VlL1nVAcoZ6kIJSu9vMOk9GzXg6YO8pBaj9TlrD
	 Ftkfz5RBxvR7w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>,
	arm@kernel.org,
	olof@lixom.net,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	nicolas.ferre@microchip.com
Subject: Re: [GIT PULL] AT91 device tree updates for v5.20 #3
Date: Mon, 25 Jul 2022 17:44:16 +0200
Message-Id: <165876383642.2817697.12620859946374513791.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220722152041.1752962-1-claudiu.beznea@microchip.com>
References: <20220722152041.1752962-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 22 Jul 2022 18:20:41 +0300, Claudiu Beznea wrote:
> The following changes since commit be16285265868aa371378132fe37df2bc14ceb78:
> 
>   ARM: dts: kswitch-d10: enable the USB device port (2022-07-12 10:12:30 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-5.20-3
> 
> [...]

Merged into for-next, thanks!

merge commit: 10c4c5279b76ecf46816354b06e0d5cb0e84dfde

       Arnd
