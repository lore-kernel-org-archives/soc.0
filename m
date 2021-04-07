Return-Path: <SRS0=LeP6=JE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C5BC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 20:41:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69823611EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 20:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69823611EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=znUv2QPJAVLww6E5IzLJmBjOOAqL8g4/HnPBpUKB8xE=; b=ji38k1+06TNsDSxG9lEf2zK+kc
	HEW7xg9RzA7+M85yvyB/a/zmfg+UVx19xVkDn0COEOyPKsxqg9qDg0I/n2RKEB/kW8zd9sNOJvshT
	NUg4c32lr4Sb6IgpT1GOEzoz6WyJfbm0WUxUEmKXdzaW/j+MAO7GVRplvL98/grfgYatt9CUSCmJ2
	HOZB0rwTg/MiNTghlrEbZNHQxZeW/t4rRbEd3Z9melPoV2bWAhf1s3rvQudsmZN+ZiaH98gGPKhpO
	c4wYRk/Q6Yt9IT6/VQdIt2ZHjyDWT+RXICDZeahpOsy3+0a8ZlOpy/viGXB9mE77lXA1Vc3/zXlBL
	3tsXIVRg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUExI-005ys1-G0; Wed, 07 Apr 2021 20:39:16 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUExE-005yql-37
 for linux-arm-kernel@lists.infradead.org; Wed, 07 Apr 2021 20:39:14 +0000
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
 (Authenticated sender: gregory.clement@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 565C8240008;
 Wed,  7 Apr 2021 20:39:08 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v5.13 (#1)
Date: Wed, 07 Apr 2021 22:39:08 +0200
Message-ID: <87v98xbzir.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_213912_259812_E6C72747 
X-CRM114-Status: GOOD (  10.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210407203908.sS6u28yBTJNXb7kQSqdK-iVXCzb6VjkoluzmPZZXXMA@z>

Hi,

Here is the first pull request for dt for mvebu for v5.13.

This one is latter that the other ones, because I've just found a
patch pending since December. I hope it is not too late.

Gregory

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt-5.13-1

for you to fetch changes up to c6dfc019c239c76c179ebbccbac27170ba1e3bb6:

  ARM: dts: mvebu: Add device tree for ATL-x530 Board (2021-04-07 22:31:30 +0200)

----------------------------------------------------------------
mvebu dt for 5.13 (part 1)

Add support for ATL-x530 Board (Armada 38x based)

----------------------------------------------------------------
Aryan Srivastava (1):
      ARM: dts: mvebu: Add device tree for ATL-x530 Board

 arch/arm/boot/dts/Makefile                |   1 +
 arch/arm/boot/dts/armada-385-atl-x530.dts | 235 ++++++++++++++++++++++++++++++
 2 files changed, 236 insertions(+)
 create mode 100644 arch/arm/boot/dts/armada-385-atl-x530.dts
-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
