Return-Path: <SRS0=U14U=PP=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51981C433F5
	for <soc@archiver.kernel.org>; Wed, 27 Oct 2021 02:55:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2B629610C7; Wed, 27 Oct 2021 02:55:05 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C916561002
	for <soc@kernel.org>; Wed, 27 Oct 2021 02:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C916561002
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 4803641EA7;
	Wed, 27 Oct 2021 02:54:59 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
Subject: [GIT PULL] Apple SoC DT updates for 5.16
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Message-ID: <fef30d0a-ad50-ed58-ac20-9e372862b4e4@marcan.st>
Date: Wed, 27 Oct 2021 11:54:59 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit

Hi SoC folks,

Please merge these Apple SoC DT changes for 5.16.

This includes the pinctrl and PCIe nodes, now that pinctrl is in
linusw's for-next and the GPIO npins binding issue is settled.

-Hector

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

   https://github.com/AsahiLinux/linux.git tags/asahi-soc-dt-5.16

for you to fetch changes up to fcc92afad9b57d80d2e5cb9b34cabdf69589ca29:

   arm64: dts: apple: j274: Expose PCI node for the Ethernet MAC address (2021-10-27 11:18:51 +0900)

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

