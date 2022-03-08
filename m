Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347B2C433F5
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E16CC340EB; Tue,  8 Mar 2022 16:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37BBC340F4;
	Tue,  8 Mar 2022 16:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646757917;
	bh=DOQhMQmFkkcvLbvVwBICTpNNRH7P1yy6H3NH8sQED8Y=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VMhsPYi0k5FP8flI3sD13Lmyu+6hRz0XbYwHlBXsfrEeVDg7rSN9McW9Jh08/6NvL
	 CXyCV14xuz9pLVeKhpVKPZDhUqPjHhHqPpOC/VQot1wfWKEqw3UK+ZSZ8P4WfdvzGr
	 Ha+VeMWlYM5E6p9u0eoSzReDRMQqafMm1V5lTte/juifSH2mYMBtQ00bXiCVjvhb3L
	 J1zosbgaIQrcMxf89K3gnhYB3pOlHyGX3dp2guMS/JVgR528fHhFyl0dHZvAi5oJqP
	 JfToyHpTqHuUa8bKSIaH+ImKtOKFSSISS8Fxs6pLcL6Rs4JV94tR/3+NZM+62qA1UP
	 QJ9M0g6u8tYuw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Frank Wunderlich <frank-w@public-files.de>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Kuldeep Singh <singh.kuldeep87k@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com,
	khilman@kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	olof@lixom.net,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/4] Broadcom devicetree-arm64 changes for 5.18
Date: Tue,  8 Mar 2022 17:44:39 +0100
Message-Id: <164675781094.4163171.1437824351448414405.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220307194817.3754107-3-f.fainelli@gmail.com>
References: <20220307194817.3754107-1-f.fainelli@gmail.com> <20220307194817.3754107-3-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 7 Mar 2022 11:48:16 -0800, Florian Fainelli wrote:
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.18/devicetree-arm64
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 7b4fc7c6f9a3d89ce6cdb616a0fe9c18f536fcbf

       Arnd
