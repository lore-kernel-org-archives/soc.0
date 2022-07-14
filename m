Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F854C433EF
	for <soc@archiver.kernel.org>; Thu, 14 Jul 2022 15:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2861EC34115; Thu, 14 Jul 2022 15:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FFDC3411C;
	Thu, 14 Jul 2022 15:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657812999;
	bh=0P8p+5zydmB7wmVW3Z4svWKwXJ/ZHm7yB/YrlzdcDAg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=irDazLx1izP+8sOe2XnvCFfjuQC5+3L6PJhRqRTQorgvUkTl0vQTVh0z8rkZxmZXg
	 MPb1FWcVSd+2ENqWbJxSn7bFghy5jCIFgE56eO1/DFIoxKwN0JzaGFZAgUgLVQ7y4y
	 OvwzBFHSp8NUI8kMwOI6PmSZrd/kyqz+6kAHs2X1fBvcQJWfpUgCqBADOfN7Z/pWBb
	 WNw4eu1xpYDN1iRo1SUyIDafWFlrQvgbBxtB+fqSChRhgCoUwPxUyYdrJ42sN0wiJF
	 5d1Dlux64LVdEBO7JjS18OmokQlbynjS/U7zaVQhlLpDWq+yJ/wDITJC1tyU7WNFsO
	 6/V9omxyYLNqw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	arm-soc <arm@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Felix Fietkau <nbd@nbd.name>
Subject: Re: [GIT PULL] ARM: dts: MediaTek DT changes for v5.20
Date: Thu, 14 Jul 2022 17:36:14 +0200
Message-Id: <165781284929.3193627.15632310146386359167.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <63536da6-fbe4-2d96-ab91-ae756cd580c4@gmail.com>
References: <63536da6-fbe4-2d96-ab91-ae756cd580c4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Jul 2022 19:36:06 +0200, Matthias Brugger wrote:
> Please have a look at the following changes to MediaTek based HW in the 32-bit
> Arm space. The most notable change is that we now have support for clock and
> PCIe on the Airoha EN7523, which were the last two bits that were missing.
> 
> Regards,
> Matthias

Merged into arm/dt, thanks!

merge commit: 1a110d77a9b9f8ae023634845dd8fd9c1c2efe21

       Arnd
