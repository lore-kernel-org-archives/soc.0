Return-Path: <SRS0=orft=AI=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE91C77B72
	for <soc@archiver.kernel.org>; Mon, 17 Apr 2023 09:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AEA7BC4339B; Mon, 17 Apr 2023 09:26:42 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D96CAC433D2
	for <soc@kernel.org>; Mon, 17 Apr 2023 09:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D96CAC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id AFEA441F72;
	Mon, 17 Apr 2023 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1681723598; bh=tJwzVZqrJCl1Nyb8wS/o4gf6vdrybmwtTAfNdsp9wDM=;
	h=Date:To:Cc:From:Subject;
	b=lknILKwdHgQpfTmPOHNLybhGJVO0onZFLgdWamk3MSaG5DJMu5I6Cok1vyPWogrqI
	 wdytm7AqZsTnrxrFy6a6xGSB7J5SqYYKrkfTQ12oWHnUdDSxXPJUVRAYs+IMfZCTFa
	 2foJo4xCEz/mtxEGn7uBueKEog6Q502vLcHWtVksp6cVRcgC+xLgnxg7iNRvZ754Nd
	 e4M/H+ZjXGVIyD+K9G1g1UlW4YR6MC1L6Ud9lYI0uIzEAxr6SmKAntOAxIUHw3uTDZ
	 DKR4C9Yg0OBJB32AHFFj70iDschANJQ2Y8xYBiyl4ctCkErlGvwKiuZ6B8IIx4y7Zb
	 htyIAS0gCZL9Q==
Message-ID: <d0862463-acb3-ce83-6493-281a833ec87e@marcan.st>
Date: Mon, 17 Apr 2023 18:26:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Asahi Linux <asahi@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
From: Hector Martin <marcan@marcan.st>
Subject: [GIT PULL] Apple SoC DT updates for 6.4 (v2)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi SoC folks,

Please merge these DT changes for 6.4.

A bit late this cycle, this adds the PWM controllers and keyboard
backlight nodes. That driver is also on the way to 6.4.

- Hector

The following changes since commit 8d59efc33fdaa2c82072b4d3ba5f67d7dd9270d0:

  arm64: dts: apple: t600x: Disable unused PCIe ports (2023-03-28 20:07:02 +0900)

are available in the Git repository at:

  https://github.com/AsahiLinux/linux.git tags/asahi-soc-dt-6.4-v2

for you to fetch changes up to 50aa09ac18fac94a907d26dca21aff5507373fb1:

  arm64: dts: apple: t8112: Add PWM controller (2023-04-17 17:27:57 +0900)

----------------------------------------------------------------
Apple SoC DT updates for 6.4 (v2).

A late addition to the tree, adding the PWM controllers and associated
keyboard backlight nodes, since that driver and its bindings are now
on the way to 6.4.

----------------------------------------------------------------
Sasha Finkelstein (3):
      arm64: dts: apple: t8103: Add PWM controller
      arm64: dts: apple: t600x: Add PWM controller
      arm64: dts: apple: t8112: Add PWM controller

 arch/arm64/boot/dts/apple/t600x-die0.dtsi      |  9 +++++++++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 18 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j293.dts       | 17 +++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j313.dts       | 17 +++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi           |  9 +++++++++
 arch/arm64/boot/dts/apple/t8112-j413.dts       | 17 +++++++++++++++++
 arch/arm64/boot/dts/apple/t8112-j493.dts       | 17 +++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi           |  9 +++++++++
 8 files changed, 113 insertions(+)

- Hector
