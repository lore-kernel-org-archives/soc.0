Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBBCC433DB
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 17:10:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4115864ECE; Tue,  2 Feb 2021 17:10:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61F1864F90;
	Tue,  2 Feb 2021 17:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612285835;
	bh=lB/MY/hwqaGFkU+ADnUf+L9HD2CW5JsTy/vaikCTH7E=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kSdJZOokFLSjHNkGgMVfmTdaziDOY7jQIqaQkDOM+cqthvhjZOXyUgltj+o8Rivtn
	 HXT3rvU+1Ca3lWlj/KrdWzXtgfmj2akLpeHMmTtTm6wehsQjJTyHmtRXlavdK3OBIB
	 XY55fTf4ezJzrjHwCcTdiv3tiytKEDYm/l4HnfuP5EJ5F1S8AfBxL3y8e9W/cyUux4
	 SbiTIt2nf3kgMk73d4XgipN3KJE5JEr//atYVw7Y0M6XrBfUyAVldQ16hCs7vy8nn0
	 LBR5Ak9EH9f+z+gZKYZxBDgl3VsjTWpu82fev7xFslCiDcv/wBmBmREAhepELatLz0
	 Lz7NriaQWctSg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Fabien Parent <fparent@baylibre.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>,
	Neal Liu <neal.liu@mediatek.com>,
	Argus Lin <argus.lin@mediatek.com>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Bayi Cheng <bayi.cheng@mediatek.com>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	James Liao <jamesjj.liao@mediatek.com>
Subject: Re: [GIT PULL] arm64: dts: mediatek: updates for v5.12
Date: Tue,  2 Feb 2021 18:10:12 +0100
Message-Id: <161228552305.1852435.3470546880273148615.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <565be0cc-460a-7d0b-47da-09bf0401e8fe@gmail.com>
References: <565be0cc-460a-7d0b-47da-09bf0401e8fe@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 1 Feb 2021 11:12:26 +0100, Matthias Brugger wrote:
> Please find below the updates for the MediaTek dts64.
> Lots of work is done in the MT8183 SoC which can be found in some newer
> Chromebooks, especially around grafics support. Not so much is happening on the
> shiny new MT8192, as we still lack some core drivers, which provide a lots of
> dependencies.
> 
> Apart from that we support two new devices for the MT6779 from the mobile chip
> line. One is a SoC specific device called DEVAPC. It provides a kind of bus
> firewall which will pass information on potentially malicious bus accesses from
> TF-A to the SoC. It had been a long journey for the driver and I'm happy that it
> is now supported by the device.
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 542b9f11e5643d165d43e45675993e040cf32e5f

       Arnd
