Return-Path: <SRS0=lmAU=PP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E3CC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Oct 2021 02:56:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E0DF6103B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Oct 2021 02:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E0DF6103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:Subject:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pagyM3Bg1RbcIp+HmxNoAlNAN+mdp7K/kapot90/PGw=; b=KR1q7iKW46L25nlmSSmDspFHNJ
	WZsOW/S6rpLyZvdgKVpdcqljMcL3ip4KV45dVBERM4lus1syZ6HeyUCTHCkevDLF4lEsjONzfkqHg
	ojFoP6ECto0YjDg48vb3cDZqCMC5InXd0FmGU+zKIlO+SZTDxRQSiyJfcHDhZ5BDk4hTQ7nB4EJV9
	f2N2rj8fPZ/GYyQ2a5FuIV1la2zip8nFbunvag5+AoTPMmuIkF/GF/9XrB1Y9HVmV+7G+oRnzO80+
	p7MG6FfsDCIvd/UDn10aQ6sSJV9CQirNmCp1fqEZZRcBJdWz8GWbbP1uHL27JvTzdRluNnGj5UeQo
	PHLtbw1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfZ5p-003h3p-Tu; Wed, 27 Oct 2021 02:55:10 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfZ5l-003h2U-Pf
 for linux-arm-kernel@lists.infradead.org; Wed, 27 Oct 2021 02:55:07 +0000
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
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_195506_025052_D9B40359 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211027025459.h2cGVsHv-CuezdXBNj05skUoSEGaTrWD0SXv7sNbC6s@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
