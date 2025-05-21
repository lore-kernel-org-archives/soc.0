Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36A212E5D
	for <soc@lists.linux.dev>; Wed, 21 May 2025 17:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848366; cv=none; b=S68iDTTlG0+CpXx8g1PnEUWOlt7e7EWsnGG68oKF8cxtwzQvOb+hhQ2+R24xQEu8hszMWfaHjIiQtdtohRS43eaIRYUqkETwH9S5TIWU3suTLr3SHjp71RRhtVe5w1/O+RI9cq07MBFq+Yi1ILh8j3TkJ05RFRwzkaPNmEXRyjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848366; c=relaxed/simple;
	bh=TH46vyQ3pxMrokQUlKJhuM6SUNYZ43kAlXYcHv+OzLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XWtk4k+suGYLBw1mZ8EghMMc4zNc8DqQgypfdv6iTEBHaSrvZQfLSeAYV/6qsmsMTYtW9nyIDvllwf+wojKIv2eqB3IQjdK5Pun4FLN9p4VzC0g462SYbC/+sLkbnQMFcKKMm+87NXJqlzpBgU58Q5bAtsUgZThFYy5VsdBhr+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=YJdEYkXH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="YJdEYkXH"
Received: by smtp.kernel.org (Postfix)
	id 5F816C4CEEB; Wed, 21 May 2025 17:26:05 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 996A1C4CEE4;
	Wed, 21 May 2025 17:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 996A1C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=DnMLD3+0ckchWosSSYtmn7b2yCGZyXFleRAl074knsQ=; b=YJdEYkXHXEjAdpqgjMDlB4CJcR
	SPRLN7QBHQFvmfzY1t8VQNVPG34YWexxxMa3ijUeBNi7V92+Xj4wnGH5MD4Mq+hoInff8mqNJ9+kI
	pUbFz8UtKdMbBaSu/UnsT0lR4GbdpmosmpWR7tvUhPvly9uYlXie393P5ZBoYYzC0UJjNPIFZMBGt
	zQ6LZC4AV4kINjhphYOaa2vBnEag77IWlLsqZtF8CpK8gi1w0GOOet3xWNHL+i8oTuIE+SHPqBQhk
	xjzuuKFhL4ascYadUxKQ4pRf39QbWQZLOkw7facyNJrIBb0l40Sa9qaraKju1CAy+NStXUwvM0AWN
	OF3cGRQg==;
Received: from i53875bdb.versanet.de ([83.135.91.219] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uHnCZ-0001cS-Q7; Wed, 21 May 2025 19:25:59 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip defconfig64 changes for 6.16 #1
Date: Wed, 21 May 2025 19:25:58 +0200
Message-ID: <4060740.R56niFO833@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.16-rockchip-defconfig64-1

for you to fetch changes up to bd088836a10e418aaf7dbda4a1db9da864f09fb8:

  arm64: defconfig: Enable Rockchip SAI and ES8328 (2025-05-09 21:41:34 +0200)

----------------------------------------------------------------
Enable Rockchip SAI and ES8328 modules.

----------------------------------------------------------------
Nicolas Frattaroli (1):
      arm64: defconfig: Enable Rockchip SAI and ES8328

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)



