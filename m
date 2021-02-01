Return-Path: <SRS0=ZBoG=HD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23770C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Feb 2021 16:26:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B366364E8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Feb 2021 16:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B366364E8D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GvUCm6Lpty5UVYGGqP5c0CiqSv3dyn/1Z8ZnSH8zI5s=; b=rBmnlWaRqWbMbZly0+ts5tO2Dd
	VbIaCYK5x0Oj6MmLI2zNZBSfFgvjzv8xNy5OLLlQed/fSaa7j59NyRRF5RL4DD4VRIWqcV8pj9fkG
	435mgxbWD9DMd1HGHGHilcmCBm57MgKjglMmt9bTKHjB9Wt7ebe1uQgIWoj3MFF0IdzbzLqUnWGuc
	G1SakdlK8zu9iNXSWg7/fPIymQ7TUB+y9EML0ei1WP1KlJ52bw+CPen0gvIs3dp3xdhpEvWe3bwg2
	bIoCosnLn9GMNUXKkz7hcmLMB41zlhGE48Br9Y+nZmpZg2OBi3aLdgkO2t4G3wbIDJxx+/e+Z3Rrc
	g96/PcyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6c17-0000n7-Fv; Mon, 01 Feb 2021 16:25:33 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6c14-0000lr-FQ
 for linux-arm-kernel@lists.infradead.org; Mon, 01 Feb 2021 16:25:31 +0000
X-Originating-IP: 90.65.91.141
Received: from localhost (lfbn-lyo-1-1912-141.w90-65.abo.wanadoo.fr
 [90.65.91.141]) (Authenticated sender: gregory.clement@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 2AD081BF207;
 Mon,  1 Feb 2021 16:25:25 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Subject: [GIT PULL] ARM: mvebu: arm for v5.12 (#1)
Date: Mon, 01 Feb 2021 17:25:24 +0100
Message-ID: <87v9bbn4az.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_112530_633156_71A2E5DD 
X-CRM114-Status: GOOD (  10.59  )
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
Message-ID: <20210201162524.ssCh8epLTkmVEriW6pbgSuvkZD6gSESK9-IcPj9RGjQ@z>

Hi,

Here is the first pull request for arm for mvebu for v5.12.

Gregory

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-arm-5.12-1

for you to fetch changes up to 2241ed9205ed91072d20ae10ad6904dc2bec5612:

  bus: mvebu-mbus: make iounmap() symmetric with ioremap() (2021-01-29 17:57:07 +0100)

----------------------------------------------------------------
mvebu arm for 5.12 (part 1)

Improve mvebu-mbus code readability.

----------------------------------------------------------------
Chris Packham (1):
      bus: mvebu-mbus: make iounmap() symmetric with ioremap()

 drivers/bus/mvebu-mbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
