Return-Path: <SRS0=OI5N=LZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B488DC11F64
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jul 2021 04:33:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7211D61476
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jul 2021 04:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7211D61476
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I/WA/Dk2SdxKxax6ZzX5M0uCQOJtUDkrGaDx+Z5XXGI=; b=Qvzp5YpS9cwI6z
	JJVYLa8snIspKkN/waA701dXs44VKJLJzCk800/FwCIj3oyCf7uKvlPV3n9QjihWgXiDJwOv+Jw0Z
	m+eehuJLfxQlv0RIhH39orz4e8lMJhQ6YQ/eLtQuS70ehLgzGVsGWE2TSQhLZCYXd/slSUO8BT4eH
	y8HhIU2e1CvABQruw+xob0Y63FBBGCYkUj65j8hf5LgFDK1AY2pskN1GJJbsXwfwkIK/v0yypqU3Z
	sO1G4tLPLPwnYjObFPbBWM4Fa3ckMEViVmx8HVejgX3yPapRgrJVFygyud6YvVUh3FRxsY4R2E57Z
	JR02tokdeYssVUFzpsjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyoN5-00G4NZ-Kk; Thu, 01 Jul 2021 04:32:15 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyoN1-00G4N6-G4
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Jul 2021 04:32:13 +0000
Received: by mail-qv1-xf31.google.com with SMTP id u2so2310118qvp.13
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 30 Jun 2021 21:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ZDwANdeZngtquubBMny4xTGFmM5ryOv877t1DM8d0eY=;
 b=FkWPmGQX3BLG1gJRHwscUBE0g7ow4mpQOlLBQ0IgCC51x7Cmf3b9OFxJRRtt6Wsi0f
 gD5oFrX+a479C1xGk3wsyVvOEoSIAPsgLq2OqvoO0dyeCl5MeeUu4OqxDGZHHg20Go6K
 hvz2BoEFv5zUeDAlLyhD1+DcbiJRbfIThMcfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ZDwANdeZngtquubBMny4xTGFmM5ryOv877t1DM8d0eY=;
 b=mmHmxfVvabQUdDC2AjN73ORbl4MSsUwtcYgVtZRT67HTtawzUF4TrvMfZh+rXUvshE
 SS0MNuOsNuZJ3uFUrrJ3kn2Q+JK5+dU4bJkfRzxdaVv03J/p9mckTmKL+f2jR/JwOHM5
 zcNcCCmnz8rR0VuBbpU7p+8Yhys+x/aubfY+4dxssDZUxmcR4hqcg4cqo6HL7O+hd6n8
 WQkfSwex9kYtBJ0VUSR3hPAE0FhqEs+Kn9Sdh5Sl6BlMC9ZI2+YNDdAMEPaT96stXa4X
 yKg9yicagj+DG/Fs28eBONwX1CtleeFMH9yBYKqDNcEIH/WYB2zb/V5KV0dPwoR4O4Da
 l+8g==
X-Gm-Message-State: AOAM533f/EbxCS70NQYGg96Eoqyn4vb8XiuPMFXjV4Nh2nj6y+R2fuYM
 hULvylr7tgQitJcK+cvFamNzZUj9e/GnzGIstFQ=
X-Google-Smtp-Source: ABdhPJyvbSh42hrNgpYeAMR1+1kC/eGTFXnpd3MmgjT334Jw16Tx7OzUCX/fFZK8JW0WGhgBu0/4Y37FGDUg1bY5AVM=
X-Received: by 2002:ad4:436b:: with SMTP id u11mr6159929qvt.18.1625113930426; 
 Wed, 30 Jun 2021 21:32:10 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 1 Jul 2021 04:31:59 +0000
Message-ID: <CACPK8XefdPzeOUDnDgk9cHQEs-9wF_ZSPdYQRzuNOpGZTyGUKQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree fixes for 5.14
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Jeffery <andrew@aj.id.au>, 
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Zev Weiss <zweiss@equinix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_213211_827055_7DD1BE34 
X-CRM114-Status: UNSURE (   8.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210701043159.TIqC1foQJL6ouKHauRntgPu8IAsJfqkf-MGFfyhh37I@z>

Hello Soc maintainers,

Here are some minor fixes for the aspeed device trees.

The following changes since commit dd87684c7c9b82ad450cf063c58b4131074ad8f2:

  ARM: dts: aspeed: everest: Add pcie cable card indicator leds
(2021-06-07 13:38:55 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.14-devicetree-2

for you to fetch changes up to ab4a49d36010564c70fe5586a4c2b1985866616f:

  ARM: dts: aspeed: everest: PSU #3 address change (2021-07-01 13:41:33 +0930)

----------------------------------------------------------------
ASPEED device tree fixes for 5.14

 - eMMC phase corrections so Tacoma and Everest can boot

 - VUART irq polarity fix for e3c246d4i, using new bindings

 - I2C address fix for Rainier power supply

 - GPIO line name fixes

----------------------------------------------------------------
Andrew Jeffery (2):
      ARM: dts: tacoma: Add phase corrections for eMMC
      ARM: dts: everest: Add phase corrections for eMMC

B. J. Wyman (1):
      ARM: dts: aspeed: everest: PSU #3 address change

Joel Stanley (1):
      ARM: dts: aspeed: Fix AST2600 machines line names

Zev Weiss (1):
      ARM: dts: aspeed: Update e3c246d4i vuart properties

 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts | 4 +++-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts      | 9 +++++----
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts      | 5 +----
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts       | 6 ++----
 4 files changed, 11 insertions(+), 13 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
