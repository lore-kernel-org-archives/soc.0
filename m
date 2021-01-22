Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC04C433E6
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 22:43:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 51A9E23B09; Fri, 22 Jan 2021 22:43:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1921723AC0;
	Fri, 22 Jan 2021 22:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611355419;
	bh=s91XCBpC8P8/y4FCZn2nGVMSYA7tTMQBH5hBvwq0wW0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fzHzCzFzYRraXKa0Nm2G8eXIKLPNxSjhEpbJpy04mnfQNRWTYdV9ESyGrloDu3fL8
	 TcG7XXkfblmjqmJpWm5I96hQ60+SW25Y3t/8ydg2zBYry4w+b96+cQBkFuRsVmHSLu
	 Mwt5s2yR4x6MNSfENFFwXCPcEWzjoSkFvCaDGvWb0vunKpkHcM1hfL+3Y1DvEBzg0t
	 iw1aADlyjbr6ePkCouThUND8RzzPjWEEM5NVmVdQ6e1fJkbRfq1gH+6PcJ/WTaB/D2
	 XA50821wkMAsah0G1KxvRytF7SiB/RJIFMiW34QZItesiH4VqddfgWOMaSx7Dk9avf
	 J+t0wNdb/zNpA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] SoCFPGA DTS updates for v5.12
Date: Fri, 22 Jan 2021 23:43:29 +0100
Message-Id: <161135518023.1310202.693022920264235745.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120012334.25730-1-dinguyen@kernel.org>
References: <20210120012334.25730-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 19 Jan 2021 19:23:34 -0600, Dinh Nguyen wrote:
> Please pull in this SoCFPGA DTS fix for v5.122.
> 
> Thanks,
> Dinh
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 7c348d8de831a7934ad0ea47ce4c7fe9dd7a7203

       Arnd
