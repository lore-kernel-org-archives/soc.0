Return-Path: <SRS0=G8Te=VN=svenpeter.dev=sven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEACC433F5
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 15:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06C93C385AC; Thu,  5 May 2022 15:40:38 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59540C385A4;
	Thu,  5 May 2022 15:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59540C385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 292215C0230;
	Thu,  5 May 2022 11:40:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 05 May 2022 11:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1651765235; x=1651851635; bh=xpW3unNQu8
	QRdU1aUouMudDjza+0AjvP9kw1txQmGyE=; b=K+XKjHnGqoyi4gHJkLolZqrINg
	RXQ3eKUiL7v16XSP/Xxy0bqhYpHj9MrT4YEofBAY2Q8bhzdjhoxY05FYZ6vMNjwE
	typxn9tP2wsX7buHn1ABCO4GcQkZmvmsrJ+dTnQkeK0425tON0QKXveRQUczpTZt
	x8p4KFd8wHXIQjo9fHcIJGWqM+qHVZxgOqj0X6FAJACLdgNMPq4AkVF5wqE9g2kF
	NogEIXNjMG64mJHB8sfbuG3AABGf7i3frI/TE6Ss1WmUsdu0NLY2UoylI9OpvKSb
	CNroMLbHbGxVx0RPNyReTLP0O0ivy0fU1sLIeH9ZiW3VjGG4j5uYMISYMMlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1651765235; x=1651851635; bh=x
	pW3unNQu8QRdU1aUouMudDjza+0AjvP9kw1txQmGyE=; b=TjcNgBTc7BCUORWuw
	w1V6d2ADSkSxdWxd9PcwW9dHtUk/Xiq1UtIebZkA1gLOivoi01gSZVgOqmCp4zkG
	nzAMO/Ec6lpCAeuIf+QFEBsBCYYontmP6kdnSwa3C5aiUDMJe1t7Yw4zgaLLVGWu
	2oxj7CcOqxetJSFxnNrQvClCGKH23FhZTUgeUXoOQITb6NgS2IlkdqClsbWb6K0V
	gxifAERdnnQK6G4i8lRdiDxc6c8fOwaK1NtDdPPAcAujUVMk36zXvYb/HU4jriZ8
	z9Y5fMjSWhOq56Gue7hvd/+hU7I3H3u1QCR2SXxtUQl2TrJ0S/60+0FuKznDSKj0
	LO2nQ==
X-ME-Sender: <xms:8u9zYqpHNfccglHszBmcPMmsUFcx3xUIG_J_FjD1eQEj0ugs1ddqjQ>
    <xme:8u9zYopbwOR-PTVh8Uy4vTAOdJN5N4sSV3N5VRKMW-3xd0eKhoYPqfLiZOU5DripU
    AIOykFiIgfzspfCN6A>
X-ME-Received: <xmr:8u9zYvNNvT5d-uoqoYWYHzU9HL1oO9c6WjDQ_jYwwrpEq9hs1GUG1t7j9rkGL6F7CfpHgitsjiWh2e9fA0ctYADudmn_NqnDBuvznUsptYEsUH70IBfzZrl2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedugdeklecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcurfgv
    thgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epjeelveffvdefgeeuteefueetgeeghfelveevheeugefftdelleeuudefvefhieelnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhp
    vghtvghrrdguvghv
X-ME-Proxy: <xmx:8u9zYp7uiaXQxVD6Z0S9wMfF0lXJw61YG661LlBR_-aVfWatKyXo9w>
    <xmx:8u9zYp5RCKJdTXMOpzV_8z0kAbOsKoDXxZdjTLMbjXWGumMfkXavaQ>
    <xmx:8u9zYphQbTnNIpT4E4fEChQw9PyfouPuBH-KUQJf6taUybFEyE1vvg>
    <xmx:8-9zYjuZdxLGCNjqeyVYfh2HQRjOGg-8CDs_qd0qPWl_bqRdBQ0MlA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 May 2022 11:40:33 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-nvme@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Sven Peter <sven@svenpeter.dev>,
	Hector Martin <marcan@marcan.st>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@fb.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Subject: [GIT PULL] Apple SoC RTKit/SART/NVMe driver
Date: Thu,  5 May 2022 17:40:20 +0200
Message-Id: <20220505154020.84638-1-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi SoC Team,

Please merge the Apple SoC NVMe driver and its dependencies for 5.19.
As discussed on the nvme mailing list [1] it's easiest if we take it
entirely through the SoC tree since there's a chance that we will have
more drivers depending on rtkit for 5.19.

Thanks


Sven

[1] https://lore.kernel.org/linux-nvme/CAK8P3a1CO8_Pa=Hk3hcdNfT_eD3PQK2aWDFB9bwk6TCNbGmtEg@mail.gmail.com/

----------------------------------------------------------------
The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://github.com/AsahiLinux/linux.git tags/asahi-soc-rtkit-sart-nvme-for-5.19

for you to fetch changes up to 5bd2927aceba181b84286e00aa2f56e117e699c3:

  nvme-apple: Add initial Apple SoC NVMe driver (2022-05-02 17:24:45 +0200)

----------------------------------------------------------------
Apple SoC NVMe driver and dependencies:

  - RTKit IPC library required to boot and communicate with
    co-processors embedded inside Apple SoCs
  - SART DMA address filter required to allow some DMA transactions for
    the NVMe co-processor
  - NVMe platform driver

The following minor changes since v3 on the mailing list have been
folded in:

  - sart: %llx -> %pa for a phys_addr_t
  - rtkit:/sart: Drop IS_ENABLED inside headers
  - rtkit: Use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL
  - nvme: Set NVME_REQ_CANCELLED in the timeout handler
  - nvme: Use DEFINE_SIMPLE_DEV_PM_OPS instead of #ifdef CONFIG_PM_SLEEP

----------------------------------------------------------------
Sven Peter (6):
      soc: apple: Always include Makefile
      soc: apple: Add RTKit IPC library
      dt-bindings: iommu: Add Apple SART DMA address filter
      soc: apple: Add SART driver
      dt-bindings: nvme: Add Apple ANS NVMe
      nvme-apple: Add initial Apple SoC NVMe driver

 .../devicetree/bindings/iommu/apple,sart.yaml      |   52 +
 .../devicetree/bindings/nvme/apple,nvme-ans.yaml   |  111 ++
 MAINTAINERS                                        |    4 +
 drivers/nvme/host/Kconfig                          |   13 +
 drivers/nvme/host/Makefile                         |    3 +
 drivers/nvme/host/apple.c                          | 1593 ++++++++++++++++++++
 drivers/soc/Makefile                               |    2 +-
 drivers/soc/apple/Kconfig                          |   24 +
 drivers/soc/apple/Makefile                         |    6 +
 drivers/soc/apple/rtkit-crashlog.c                 |  154 ++
 drivers/soc/apple/rtkit-internal.h                 |   62 +
 drivers/soc/apple/rtkit.c                          |  958 ++++++++++++
 drivers/soc/apple/sart.c                           |  328 ++++
 include/linux/soc/apple/rtkit.h                    |  155 ++
 include/linux/soc/apple/sart.h                     |   53 +
 15 files changed, 3517 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/iommu/apple,sart.yaml
 create mode 100644 Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
 create mode 100644 drivers/nvme/host/apple.c
 create mode 100644 drivers/soc/apple/rtkit-crashlog.c
 create mode 100644 drivers/soc/apple/rtkit-internal.h
 create mode 100644 drivers/soc/apple/rtkit.c
 create mode 100644 drivers/soc/apple/sart.c
 create mode 100644 include/linux/soc/apple/rtkit.h
 create mode 100644 include/linux/soc/apple/sart.h
