Return-Path: <SRS0=FMRd=O3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0D1C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Oct 2021 16:40:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC71261090
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Oct 2021 16:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC71261090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8dgR/hg7hvXQMy/X5o+UM8VQRzY//ePfsoEPonhnucM=; b=Iu40eMGiOhn3TC
	R/OJxS5DewAbeSCtY76LI68mDuxTxopy4Xc0qr49AdkbaE0TCD5fIJ2AHCdYVfmYcWNM2lIFxdi+W
	fukYgRH35ABZhb0jFPQZ8XO03MKZXtnrOmK/NQuTzGny36aRg52DpUjFI2Q2zj190M0qBSSSvEXUQ
	Mn83HJ6H/+4ThemVvDCcdaboTbSwmBaWv8H8z9BJ/AvBBnSP79vnvofSgDw6urKqCVWRsNMTkdm0L
	z4kAbNvLWcBJl/slMHEEIm6JGhdaAEArYHLAtOSOGRqqjgUJ/UrZ5B1r6AbqDDP3Zttm92XOts1uE
	3rmE4tS7ZT3BhjPdf5Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYWPk-000HZ3-4O; Thu, 07 Oct 2021 16:38:36 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYWPf-000HYL-9D
 for linux-arm-kernel@lists.infradead.org; Thu, 07 Oct 2021 16:38:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id A848E419BC;
 Thu,  7 Oct 2021 16:38:24 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
Subject: [GIT PULL] Apple SoC fixes for 5.15
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Message-ID: <a50a9015-0e62-c451-4d0d-668233b35b85@marcan.st>
Date: Fri, 8 Oct 2021 01:38:21 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_093831_560928_9F7B9672 
X-CRM114-Status: UNSURE (   7.11  )
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
Message-ID: <20211007163821.VwfBJLKEDMJrShYb-VitAt9x0lH60yhE5woQoDpSU1k@z>

Hi SoC folks,

Please merge these Apple SoC fixes for 5.15.

-Hector

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

   https://github.com/AsahiLinux/linux.git tags/asahi-soc-fixes-5.15

for you to fetch changes up to 56dd05023675a35541e9baeba868bd0472eb97f9:

   MAINTAINERS: Add Sven Peter as ARM/APPLE MACHINE maintainer (2021-10-08 01:16:48 +0900)

----------------------------------------------------------------
Apple SoC fixes for 5.15; just two MAINTAINERS updates.

- MAINTAINERS: Add Sven Peter as ARM/APPLE MACHINE maintainer
- MAINTAINERS: Add Alyssa Rosenzweig as M1 reviewer

----------------------------------------------------------------
Alyssa Rosenzweig (1):
       MAINTAINERS: Add Alyssa Rosenzweig as M1 reviewer

Sven Peter (1):
       MAINTAINERS: Add Sven Peter as ARM/APPLE MACHINE maintainer

  MAINTAINERS | 3 +++
  1 file changed, 3 insertions(+)

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
