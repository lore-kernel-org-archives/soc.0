Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF90BC433F5
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C82A6C36AE3; Tue,  8 Mar 2022 16:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEF6C340F6;
	Tue,  8 Mar 2022 16:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646758162;
	bh=QjbxPfHfkHcwJzSVslnbdnqgcuAnAr4VEguexb/zu98=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AdSTc7aJjL5PmnPnK59VS1LgDwwLYF23D7ab6rEh73lEDp8goxdf7FULqziggL1FL
	 NzHnOhkeuftGQgZivEFNejfbLL7Zvz3hHmbvYvg/FDK3MrUVD8i7mJZ0uwAWqRhVXV
	 DphqozrVX2c1cB6ZxqJJpMIfcoD5JqV0udWesTpnygtfEBwJfmTS7xeeyQsfcjyQcC
	 62boKjScT7bDpozIlTDFSzoAGRw4KfwxZFmqR455fdVZrdLR5Y/sIaNFxtRnyIpAK1
	 IZ5CMiXZ46LQ7l4YQi6oEmakGn4+ET4lM48WCD7hkV7KXdAO7yY/XRWwht8Pr/G3nw
	 vlGz3b2GhEgYA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [GIT PULL] arm64: MediaTek fixes for v5.17
Date: Tue,  8 Mar 2022 17:49:02 +0100
Message-Id: <164675812246.4164061.13281744278219084371.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <8eb8510d-c597-4fee-e4b3-924b6d4bb3be@gmail.com>
References: <8eb8510d-c597-4fee-e4b3-924b6d4bb3be@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Mar 2022 10:38:34 +0100, Matthias Brugger wrote:
> Please have a look on the following fixes for v5.17.
> 
> Best regards,
> Matthias

Merged into arm/fixes, thanks!

merge commit: 35e33a24f8fe0bacc55d62eb506d99c122f02012

       Arnd
