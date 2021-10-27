Return-Path: <SRS0=lmAU=PP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EA1C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Oct 2021 12:31:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B172160F5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Oct 2021 12:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B172160F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bC2WcbxnzWEpe24EGsS5MqOEwE2Wc/XnfKFTKBkmEnc=; b=T+echDkKnNQ1epSfcsKD9Bk2uS
	iusZZuOqBTsAjmGFDDrkls1XQSmj7W5JINsHNvIZJ+9pp7yP7dC7LVSLMkWQnpv5PrPqsMe55tg5Q
	MJilv8OZtsuMCBjSIcN6oBUCGLVtAwFYN3+qopXxYgPh940B6F5zBYdpycq/AQOGAN2hXkqKTzOq/
	jw/KhnYKPI/98mdksFN/s3B1DWDvryQvOSuZf53jSc6+AlRBLLTpJhXafBCY5hPhXzVXBrhcTzhwW
	95RB4wWihlgOTUBQcAYJxkNY2U+teRMdXHevbH3PyTBRa/0UfNF0+PzrzIRNDsd4cyYF6XpFwFax5
	BT58XOxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfi4Z-004sY8-W8; Wed, 27 Oct 2021 12:30:28 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfi4U-004sWo-BL
 for linux-arm-kernel@lists.infradead.org; Wed, 27 Oct 2021 12:30:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 8EEF3419BC;
 Wed, 27 Oct 2021 12:30:18 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] Apple SoC MAINTAINERS updates for 5.16 (v2)
Message-ID: <f62bfa4a-3cc8-c568-be78-c5fd6919bc74@marcan.st>
Date: Wed, 27 Oct 2021 21:30:15 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_053022_559145_AD63165B 
X-CRM114-Status: UNSURE (   9.38  )
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
Message-ID: <20211027123015.pcn6T6gXBTJkpvxyvaknzkC5VODDoZLgtA1OZJXrlPw@z>

Hi SoC folks,

Second try at the Apple SoC MAINTAINERS changes for 5.16. Sorry for the
s-o-b snafu...

-Hector

The following changes since commit 56dd05023675a35541e9baeba868bd0472eb97f9:

   MAINTAINERS: Add Sven Peter as ARM/APPLE MACHINE maintainer (2021-10-08 01:16:48 +0900)

are available in the Git repository at:

   https://github.com/AsahiLinux/linux.git tags/asahi-soc-maintainers-5.16-v2

for you to fetch changes up to e081c53a5ba10041d3512f51d0e3975ac514c532:

   MAINTAINERS: add pinctrl-apple-gpio to ARM/APPLE MACHINE (2021-10-27 21:23:56 +0900)

----------------------------------------------------------------
Apple SoC MAINTAINERS updates 5.16.

This includes entries for new drivers/bindings that have been already
merged into subsystem trees (sans these updates). It is also based on
the 5.15 fixes pull with general maintainer updates.

----------------------------------------------------------------
Joey Gouly (1):
       MAINTAINERS: add pinctrl-apple-gpio to ARM/APPLE MACHINE

Sven Peter (1):
       MAINTAINERS: Add pasemi i2c to ARM/APPLE MACHINE

  MAINTAINERS | 4 ++++
  1 file changed, 4 insertions(+)


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
