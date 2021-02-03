Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAACC433E0
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 12:31:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3EF5164F9D; Wed,  3 Feb 2021 12:31:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4252764F9B;
	Wed,  3 Feb 2021 12:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612355465;
	bh=uorh0SBFuMlwQ0WYWjOXDKZJELy+WtAKcHspj837j58=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jUPDBm2kpHnPFTPcDVHfxsuwL1iMQO/BBim7dz+3hf7EEJu7UOWZ57a+pO77tOJdP
	 clKTHbQWACpX3e+5/vnTf1/2X94fUWCjbRwYtT5gYHCmfN8Zmb5nlYhxS6+3TYZLwL
	 kteP4l/zynnNb1Wdpgt0fMAWk88n8Ume5JuP8QjF1C6iQ2wn5xdXJFJU8W+o+ExLow
	 D22Qe8xd+lvig1USuG2T16UAPZFT67uVfj98ApQtTq3Akk20jEaUGx4MLrpuDPL2FL
	 yB1u8JjjhF9GCyvZ4YAc3SElD75+IEv3XJUX7AmOU03gLnm8Y2wiKDtA5f4HVqoZwE
	 aJ0cga36tVUNg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Tian Tao <tiantao6@hisilicon.com>,
	Elvira Khabirova <e.khabirova@omprussia.ru>
Subject: Re: [GIT PULL] TEE housekeeping for v5.12
Date: Wed,  3 Feb 2021 13:30:57 +0100
Message-Id: <161235543731.2002596.17852042950735173699.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203120742.GA3624453@jade>
References: <20210203120742.GA3624453@jade>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 13:07:42 +0100, Jens Wiklander wrote:
> Please pull these patches fixing some comment typos and also a larger
> patch syncing some internal OP-TEE driver headers with OP-TEE OS.
> 
> Thanks,
> Jens
> 
> The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 719bc64061a6f750ea52e84d580cc53405319aa2

       Arnd
