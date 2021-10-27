Return-Path: <SRS0=lmAU=PP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7BAC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Oct 2021 02:52:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0570060720
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Oct 2021 02:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0570060720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:Subject:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4/GzGGb0xExATk3iVXwdr5hhtMfAGSj95VJLceoXnMc=; b=re7L06t8WYmbnDTZ6PTy7S+ZTg
	wWU6D1qrlsHrP6d1CKPbat0VMY/t+/slt1QVnCsSeIScwxO5hOX/npIrDvMrLPjwzW6tEpheXMMV7
	sBJmKdHQmDpIW1cMqiua5rN4gHAnMQKWjLPIp/UIsHLf65NhKNiRMUI78u0fBICWzwGDjcaguZ+Mp
	g3cdWsUZnkn/kn9TzP21TgIg5sQ09TWLNAOqR8GO6CCCTmUsifI05vxN6UU6boYxI6CP49uZsxbQr
	tH3U+8t0tJEfI7gUQyxqvGJjTPhCVn8TKaXSqL4OjobII6bvHsEa8miNqQudjlm7nIlKTC2FwdQUz
	HCwcA/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfZ1x-003gOH-GR; Wed, 27 Oct 2021 02:51:09 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfZ1t-003gGi-7h
 for linux-arm-kernel@lists.infradead.org; Wed, 27 Oct 2021 02:51:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id C33C841EA7;
 Wed, 27 Oct 2021 02:50:58 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
Subject: [GIT PULL] Apple SoC MAINTAINERS updates for 5.16
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Message-ID: <748d5e4d-9ea6-cf50-cce4-7a7e9267c76b@marcan.st>
Date: Wed, 27 Oct 2021 11:50:58 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_195105_462487_64F96D8E 
X-CRM114-Status: UNSURE (   9.67  )
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
Message-ID: <20211027025058.rrWmQk8PUubZmvHN-u76kxe1vmMWtnim5WIxFYgeh-o@z>

Hi SoC folks,

Please merge these Apple SoC MAINTAINERS changes for 5.16.

I expect one merge conflict when this goes upstream, as the PCIe binding
MAINTAINERS change went in via the DT tree (a3b539fedc0 in dt/next), but
hopefully nothing else.

-Hector

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

   https://github.com/AsahiLinux/linux.git tags/asahi-soc-maintainers-5.16

for you to fetch changes up to 4c929eb8eab498de3a9a706e892da45998fa8aa2:

   MAINTAINERS: add pinctrl-apple-gpio to ARM/APPLE MACHINE (2021-10-25 18:55:47 +0900)

----------------------------------------------------------------
Apple SoC MAINTAINERS updates 5.16.

This includes entries for new drivers/bindings that have been already
merged into subsystem trees (sans these updates). It is also based on
the 5.15 fixes pull with general maintainer updates.

----------------------------------------------------------------
Alyssa Rosenzweig (1):
       MAINTAINERS: Add Alyssa Rosenzweig as M1 reviewer

Joey Gouly (1):
       MAINTAINERS: add pinctrl-apple-gpio to ARM/APPLE MACHINE

Sven Peter (2):
       MAINTAINERS: Add Sven Peter as ARM/APPLE MACHINE maintainer
       MAINTAINERS: Add pasemi i2c to ARM/APPLE MACHINE

  MAINTAINERS | 7 +++++++
  1 file changed, 7 insertions(+)


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
