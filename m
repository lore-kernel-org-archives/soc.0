Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26D1C433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 23:11:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A3B9264E53; Tue,  9 Feb 2021 23:11:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F034D64E56;
	Tue,  9 Feb 2021 23:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612912261;
	bh=mhorsUarKGevB8sv8HLH2ocZ18eUuKQcreG6/q16YH0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HbFgeoe8LqGIfujV8k9g6Lt1DyV1lAse0kLdEc7y4Pl0z5ei31bmlvw2ktDpGgITV
	 dPYRVlAilmz3FDP3TwnONi0j/xTNV+ivbvPH3W3I+LNJNYhtsiBcMOrFJYfjvJPMCc
	 I1k1KS/TdLyZ7oG26vPSlM96k+lgv3gp9VALgvnhAVIAScRR1ZkjcYXzhMtsX0lWdL
	 X7gK32NqT6EDxHeViOJUHU9Qdk/SCjjxkSKRmDpeQKvwtDKb8iiTjYaCTR0HVnYzTm
	 1tqNQ2vmtWMnk2dVemr9jyUlPXr80DFk5H8A86xfrM43Fi2WAxdL3VRhMGcY/WlxyW
	 4kYMVCryf5toQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	cristian.ciocaltea@gmail.com,
	thomas.liau@actions-semi.com,
	afaerber@suse.de,
	olof@lixom.net,
	linux-actions@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: Add linux-actions ML for Actions Semi Arch
Date: Wed, 10 Feb 2021 00:10:56 +0100
Message-Id: <161291223655.977272.3523875651755371381.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205050722.8313-1-manivannan.sadhasivam@linaro.org>
References: <20210205050722.8313-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 5 Feb 2021 10:37:22 +0530, Manivannan Sadhasivam wrote:
> Add the linux-actions mailing list for the Actions Semi architecture.

Applied to arm/soc, thanks!

[1/1] MAINTAINERS: Add linux-actions ML for Actions Semi Arch
      commit: 24146a7d67ce0a37d044902e5fafc1aa5a6d98c8

       Arnd
