Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DBEC433F5
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 00E16C36AE2; Tue,  8 Mar 2022 16:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1927CC340F4;
	Tue,  8 Mar 2022 16:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646758475;
	bh=XGQPC3q3OHzhMxayXGXa6PleyJQv7D3u4iHB3ea/HXY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i97jNuSFyCm271BPAafDxWTMWM0GT8UsVKzfGQWykE+8EkZ+UYQ/Rnu6oKcntMt+O
	 fNK3T0f+yhM/6fpAoIKz5b7leqm+qUkLB5OmA4XrkL93N5fmEt4x0sR9KWZQ1Rq7qG
	 wJBu+QOZ3h6F/gZRZDtLUorD9FntRiZmqfNcRVf8IFnLQKVOAu8K/4zWtRKuVJTfEa
	 s46oY9eEV9M0n2U52ag258Yu5mudUsFZBkH9qhbmyYuyRUlQb4Qr7FrB/oyhsUrLs2
	 yIpn1mL+yoanu+xatZbKppcWv+ibn13ffHW7ecwKN1dsv9KeiAx0q3qytsfFZqAfHu
	 IFJNp7jrqVH6w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	soc@kernel.org,
	arm@kernel.org,
	Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 2/3] memory: mediatek drivers for v5.18
Date: Tue,  8 Mar 2022 17:53:57 +0100
Message-Id: <164675831388.4164581.2510983160037342746.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220228164313.52931-2-krzysztof.kozlowski@canonical.com>
References: <20220228164313.52931-1-krzysztof.kozlowski@canonical.com> <20220228164313.52931-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 28 Feb 2022 17:43:12 +0100, Krzysztof Kozlowski wrote:
> Mediatek specific branch.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 88c7385290ed9e08fb051997a26113e412396611

       Arnd
