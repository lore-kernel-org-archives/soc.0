Return-Path: <SRS0=lmAU=PP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207E3C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Oct 2021 12:31:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFB0E60F5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Oct 2021 12:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFB0E60F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6weEs8Cm5V3fI/xaOZnmqVLqBLuGAzZUvF5lrLZWoe8=; b=PROF64LETuUsAptuMRwrJtRS0x
	zWjL45/7GaJPvxsdZYcUsIFtT17OiLHIdxF1bhL13jHv83fB2fF81Wk03zk2wbGtjPxK5AilHWJRV
	+dzU1F08eDqOQxUQWsnsnExIC8oWCDy8lFFR7LfWUuOKLpIr88U+yp8xHhZJPXvZudUcbiW5C5cab
	ebEPjB5BrS+7N1zFZ1sKB8uizAPmsqMf4SrkZNJYPWC/wLWftS/WCx4809lsBUO7/H3mwywEd2MU+
	DvqOoyRelwmYKnF7n9/hBxiW08Nh0iT5kGOcQXdhc5K1+PAU4An785bE7fJf8IX33e89xHYMsyd9e
	9zQ85GwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfi4k-004saO-Co; Wed, 27 Oct 2021 12:30:38 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfi4a-004sY7-9M
 for linux-arm-kernel@lists.infradead.org; Wed, 27 Oct 2021 12:30:29 +0000
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
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_053028_525172_4B732978 
X-CRM114-Status: UNSURE (   7.86  )
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
Message-ID: <20211027123022.6S3WTMwki_T4ZY8-Nj4i8RLtK3Dgy_h0Ex1DtyUKLMA@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
