Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB5BC433E0
	for <soc@archiver.kernel.org>; Fri, 15 Jan 2021 17:24:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 55A4323731; Fri, 15 Jan 2021 17:24:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2682A2371F;
	Fri, 15 Jan 2021 17:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610731490;
	bh=Gwmi/G1njOf9T/qUcU14aboWHyJnEjiCOG7ILISOnEs=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YPjxJp/1wa9VNt07qadYpL3BijqPeoyBQcALCXYONp4mIes+kCuZoVwblKUQvieps
	 4BnWG7mNUwT8oQVPwto1NnGa16/lYoTXEptFU1kZvd8ahacVfdbFroxAukqBEYl3qv
	 0LwbNEQSdB8FUHnaEDzzA3OrZpr9rClLnmep4cfIgT0sqtQrY+DMZFBAoahgwb/yiE
	 xGgUIWTUJq3vgkdPlEMn2aWDEyWQI+1QT5idA+/nyFAnXhi1NGoiyFL8IEnzFHRnq2
	 ae6wKScv9l2c/NFtfKKNN7AR5EXeuU9zR69v2+Gaykcv4561Eo81LOvB0iHam5dnWe
	 3nKtG3qcVPwFg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] berlin dts32 changes for 5.11
Date: Fri, 15 Jan 2021 18:24:39 +0100
Message-Id: <161073140415.707311.15350876748529801825.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211100521.2e6f4faa@xhacker.debian>
References: <20201211100521.2e6f4faa@xhacker.debian>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 11 Dec 2020 10:05:21 +0800, Jisheng Zhang wrote:
> Here is the dts32 changes for berlin for v5.11. Please kindly pull.
> 
> thanks
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: b9e7773e229dd338ee53e225cb69c983cb74683d

       Arnd
