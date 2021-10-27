Return-Path: <SRS0=U14U=PP=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EABC433F5
	for <soc@archiver.kernel.org>; Wed, 27 Oct 2021 12:30:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 803BE60F5A; Wed, 27 Oct 2021 12:30:27 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF1B26103B
	for <soc@kernel.org>; Wed, 27 Oct 2021 12:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF1B26103B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 60743419C2;
	Wed, 27 Oct 2021 12:30:24 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] Apple SoC DT updates for 5.16 (v2)
Message-ID: <6d41b29c-dafa-9b0e-d9ff-fe01eb6dce82@marcan.st>
Date: Wed, 27 Oct 2021 21:30:22 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit

Hi SoC folks,

Second try at the Apple SoC DT changes for 5.16. Sorry for the s-o-b
snafu...

-Hector

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

   https://github.com/AsahiLinux/linux.git tags/asahi-soc-dt-5.16-v2

for you to fetch changes up to e1bebf97815158f16da96f69e9d9bb891a4c69eb:

   arm64: dts: apple: j274: Expose PCI node for the Ethernet MAC address (2021-10-27 21:12:32 +0900)

----------------------------------------------------------------
Apple SoC DT updates for 5.16. Adds pinctrl and PCIe nodes.

----------------------------------------------------------------
Marc Zyngier (3):
       arm64: dts: apple: t8103: Add PCIe DARTs
       arm64: dts: apple: t8103: Add root port interrupt routing
       arm64: dts: apple: j274: Expose PCI node for the Ethernet MAC address

Mark Kettenis (2):
       arm64: apple: Add pinctrl nodes
       arm64: apple: Add PCIe node

  arch/arm64/boot/dts/apple/t8103-j274.dts |  23 ++++
  arch/arm64/boot/dts/apple/t8103.dtsi     | 207 +++++++++++++++++++++++++++++++
  2 files changed, 230 insertions(+)

