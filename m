Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB65C433F5
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37AEAC340EF; Tue,  8 Mar 2022 16:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17EA3C340EB;
	Tue,  8 Mar 2022 16:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646758699;
	bh=laX4D7M39zT/hwn4Cg/k7KyZJm9tgxYL/w79HzyyZ2E=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JDXK9FOaHHHYwRxglufflhRQvfvbWhxX7YbHXlpkxCzSXicoNz7LmmERvXYl0qCRG
	 vnPmKG3ZhnyKW2Fr/QcddM+LZQAMWsIc+ERnjPGOComoQJkw3S9JutiR2UPiOjdb66
	 tlITU1tBs0Lj8Qqpl5Lzop5hCnHN6SNMS21vbcodxZxqHIFLymzMHtetCmcIKyhafI
	 YL/aSQSvrrC1gv7c4v9Folq2dmJL5ew2DZHjBRJO86xb53RUv6b2UUhMVaIHr9xK4h
	 9NxNJ9lXz4DWp2jqDQo2yiWpvyUKtjMqA7OmwRVUaiyqwv2a0hRi54DfoTDTlJBgRa
	 tdrr45fFQ7zfg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	John Crispin <john@phrozen.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] defconfig: mediatek updates for v5.18
Date: Tue,  8 Mar 2022 17:58:10 +0100
Message-Id: <164675866030.4165470.17163484953895240088.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <9b90b407-025b-ec78-a626-faccdbc7ab39@gmail.com>
References: <9b90b407-025b-ec78-a626-faccdbc7ab39@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Mar 2022 10:54:27 +0100, Matthias Brugger wrote:
> Please have a look on the below defconfig changes for v5.18.
> 
> Regards,
> Matthias

Merged into arm/defconfig, thanks!

merge commit: c687cdc66ffc1452a205d7a36132d620f2fdc677

       Arnd
