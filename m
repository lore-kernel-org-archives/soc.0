Return-Path: <SRS0=GSTU=FE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC77AC63777
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 16:01:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 400CF20659
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 16:01:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wjeq0eHl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 400CF20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R6lOSH9O/Msbpuc78PMrMDUsyKtm/98LZmn5vmpW6Gc=; b=wjeq0eHlR3F7/3Q7yVw4VVLh5l
	KtQ4KaI3Qw0dfYwAswK1d+zn4PhvKcNsW8lEQ3Zou3YI0thRuNiKSWPZd0vyT7VPzX1cAFZFE7avH
	CTuiLV6HuF01NDuOMzCCgHpnlaEY642/Boc6wpurSjKxqCm72QU67wlCeP32K/wafBF6Ei1FUMijb
	w5Im/EWz86uqw5Jhy1iGeDJ+n7SofJRn1XnhmdNd88JAESIrxJLqzYLEXdt0ul+pFLcXE0c/XTiTV
	Modovv71IkFJqaYGAJrpcodNDX1TvCpeJrRc0RT1GAgr0uDTllgdH4wruUzotkUG4zSbA6kFDNIJ/
	rzzjNlKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjlav-00062P-Ch; Mon, 30 Nov 2020 16:00:05 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjlaq-0005zT-Eg
 for linux-arm-kernel@lists.infradead.org; Mon, 30 Nov 2020 16:00:01 +0000
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
 (Authenticated sender: gregory.clement@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0CC21FF80B;
 Mon, 30 Nov 2020 15:59:56 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Subject: [GIT PULL] ARM: mvebu: arm for v5.11 (#1)
Date: Mon, 30 Nov 2020 16:59:56 +0100
Message-ID: <87k0u2j0n7.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_110000_647047_F9854B10 
X-CRM114-Status: GOOD (  10.38  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201130155956._GCFIKJViz8_bBZ6A_lTWyu0oBouw8F_OHZ3qQIOgSo@z>

Hi,

Here is the first pull request for arm for mvebu for v5.11.

Gregory

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-arm-5.11-1

for you to fetch changes up to d7ce8739f50e9e8c55a3c7651ebfbca57199553f:

  MAINTAINERS: switch mvebu tree to kernel.org (2020-11-29 11:59:17 +0100)

----------------------------------------------------------------
mvebu arm for 5.11 (part 1)

Update MAINTAINER file:
 - add new 98DX3236 based boards
 - point new git repository for mvebu

----------------------------------------------------------------
Gregory CLEMENT (1):
      MAINTAINERS: switch mvebu tree to kernel.org

Luka Kovacic (1):
      MAINTAINERS: Add an entry for MikroTik CRS3xx 98DX3236 boards

 MAINTAINERS | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
