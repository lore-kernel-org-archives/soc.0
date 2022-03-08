Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D79CC433EF
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C0B4C340F5; Tue,  8 Mar 2022 16:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499FEC340F7;
	Tue,  8 Mar 2022 16:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646758488;
	bh=K19vK6nxKS/hDQqLtDMhTlpl+t9TWom4w9EL0lGm1lc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gd9Ur+AGARhDbfnuEqchXCL38pF2SgSphuxbNwbxfrHwtrGU4iyoyDjzyaZtOF3rZ
	 lb7fn5ZPuRXDB/DRTb32WA7U6mvLO3Lbfx9yqPF/Sjypl1bWzHTQQWRvJI+QBA3ARL
	 46HUdFzKqPevqn23ucMGeF0/pxO5UMb4TUZHeFwSD/L5jHK3avnx3jlkC/Q1w6X+3Z
	 xgNWm++hCYQodcCy3UW32StYgC73GaJsnuGoACsVKZ2qmscGuJ3cgErpV6GiGPMN0e
	 kwaZprXpVDwiKv7RmhYFcQONcbnXD/yck42qJaYqMqrVVJjN+OXo5gQP9b1+nNZzdO
	 3ovEW9K0khUbA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>,
	"arm@kernel.org" <arm@kernel.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	linux-amlogic@lists.infradead.org
Subject: Re: [GIT PULL] soc: amlogic: driver updates for v5.18
Date: Tue,  8 Mar 2022 17:54:02 +0100
Message-Id: <164675831463.4164581.7406288447524287868.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <c7471989-d929-c744-c0c3-c8e86eaaa225@baylibre.com>
References: <c7471989-d929-c744-c0c3-c8e86eaaa225@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 7 Mar 2022 09:45:36 +0100, Neil Armstrong wrote:
> Please find for v5.18 support for Amlogic S4 SoC in secure power domain driver.
> 
> Neil
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>    Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: c76edea0e52d5522835534de90c893ca50b04402

       Arnd
