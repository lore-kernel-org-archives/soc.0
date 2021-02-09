Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7C0C433DB
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 23:19:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 57EEC64E5A; Tue,  9 Feb 2021 23:19:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA32E64E4B;
	Tue,  9 Feb 2021 23:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612912779;
	bh=HWOb0JC8NSPPhwf2Tbqmvtnp/qFNYJK/YxoYN5dKffE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WyRbbxZWuEj7uAH5xGRpeJfWD4GXXinfynsNwTVrSoPGM55HkFGm7GcCVR/cJm/lJ
	 wrEWR9ZXKSBmK6pMF6XKg3XZPpL1MlzYYnM3NIdxPwNwLz21RBzTRwOS73UwVmFrBY
	 ihQ15LIBKiQ5LOYCG2n3Sa4zI0hB2QRPL15Nt0p4pfPKOh02QIba5g0zT+IpfSxq3B
	 I/KGVuZEk9enh11TPirc2T92P+dFRmbQrerAGXkA8F8IZbDoV5184w5SYB5DxZ9Z1B
	 QzLSvU/RAWPMEbXZcywJ7BVasH+05rSwlvubPbLWSuPkpwhD3ntB8I9Sz2F1AP95pn
	 mrMTTXsOkUBvA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] OP-TEE I2C simplification for v5.12
Date: Wed, 10 Feb 2021 00:19:09 +0100
Message-Id: <161291272303.978640.1907143944363174588.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208125853.GA288348@jade>
References: <20210208125853.GA288348@jade>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 8 Feb 2021 13:58:53 +0100, Jens Wiklander wrote:
> Please pull this fix eliminating a stack frame size warning and also
> simplifying I2C access in the OP-TEE driver.
> 
> Thanks,
> Jens
> 
> 
> The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: d0236f17c31981b07f21eb824da10fabc7f0d8f8

       Arnd
