Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBD8C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 12:29:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE08464E3B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 12:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE08464E3B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pralWmIoBZOx7kyEqbApqjqwpFJHHaHfpKp2lblKxMk=; b=UNMqvKNYJrJig/rtat+vEVhH9M
	4v0ebLfY9oJuLWmbOFxwUhX7bN/RJHr2IGd5zC23Ueu/RMTwZiRdu6v1O8cPFjQyFKnJZWirtnCSu
	vUB2bLEvKhoUCDN1yqSrXjLz33o0KWfpIi07Dl1NbLmD40MrkjyWZeF0Ih/XuDRCHpj8NwoqfVOgA
	+trrmYeCfFLUCsPYt3NDWVmQ+4ZFGc+DnKWQG57CKFNNvyagEsPOBccX3dmHRJfluF6eV6mVo5bnW
	d1or9EqutKKI0Om/w9aocjwFkaxweEtlpf/9llxd5bQNDeg6Ukb23HrXeseUF0SFUvcVNw0mdwfJS
	FWFB+Jlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9obn-0007OS-Is; Wed, 10 Feb 2021 12:28:39 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9obl-0007Nz-5p
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 12:28:38 +0000
Received: by mail-qk1-x72b.google.com with SMTP id t63so1396851qkc.1
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Feb 2021 04:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=vI8LTqZNRbWKdjOBJGdCR1A9O42gwiRAlVy4aB+gjt0=;
 b=UWUHSPK2UgUR1Opbv/hP+s9OXD8+lmPO3KTBgt2KyxMCb5rUpC+M5kQXYKKTI6FpCu
 duv1gcgxmy042asbgJC4Adw4BNM86J4Qrqe0iF0rSPMrgZ8Y8u4uwz7WPl/ihBw5Wuiq
 VGaeK6v/PHrOZqy9raO2rEcAKY7kPqrPcaMFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=vI8LTqZNRbWKdjOBJGdCR1A9O42gwiRAlVy4aB+gjt0=;
 b=XqEQ9a3tJ8xUgidqS3bnOsp1GjM0/uT4FpoSeb1zhvEh4eSq+QrqgJ56eHxuVil+WM
 wqI+pdXDTUP9YDvpVnYC8QY+lCMWYY36PC/SmaDigi5XNiPu5P22yE0sbDcH5zZusFnP
 Tmt/1uTI6jKbeo8PL21Ndxzng5zTnxbQ8EhkiG/QqrHfENwpad+ho776dne9noses4u2
 +XE0L3as9bhePcNttdwN0C4Udd3TpOsSmwZvdTzXgqm7gc5x29wmtzYXfWyp5AdSUXIt
 gh0VZsJmh782UPTRQ+z+RGrxLbucNwhsfeoODJCka8jdEaaIGEyFNmjIOGULdMj+N/Nz
 i4jg==
X-Gm-Message-State: AOAM532P7hJsJCS3J7M5vxbnY8oTcx2vrB3MXnSIaT0oVGdlR5arH9Hy
 dK+7HP36f6ctaFCUCaXyADcbCSq1eKdpJO0wvlA=
X-Google-Smtp-Source: ABdhPJxjIvSwIe2LcPNfvc5jPUF+6QlqW8H70/X76vGSIgNLwakHY/aQ7AyZjlqjYEgZjUXBB1iDcH472vf7tDszxzw=
X-Received: by 2002:a37:ac10:: with SMTP id e16mr2984793qkm.465.1612960115018; 
 Wed, 10 Feb 2021 04:28:35 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Feb 2021 12:28:23 +0000
Message-ID: <CACPK8XfQgGch5bK3YD0La+CE2L5DxVa1MNw6m1fc40j0w7e9Tw@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.12
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm <arm@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_072837_677824_B15EE0A8 
X-CRM114-Status: UNSURE (   7.79  )
X-CRM114-Notice: Please train this message.
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210122823.OJM7MLSvsV2O5lebHZ9BcIzLA-hK9KGuWd32knTq4JA@z>

Hello Soc maintainers,

Here's my late pull request. I've deferred some LPC device tree
bindings rework that need a closer review, so the contents of this
pull request should be straightforward.

The following changes since commit a74c6525f12f35a5af529ff057e63cfdc461704c:

  ARM: dts: aspeed: ast2600evb: Add enable ehci and uhci (2021-02-10
21:21:36 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.12-devicetree

for you to fetch changes up to a74c6525f12f35a5af529ff057e63cfdc461704c:

  ARM: dts: aspeed: ast2600evb: Add enable ehci and uhci (2021-02-10
21:21:36 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 5.12

 - New machines

  * Ampere Mt. Jade, an AST2500 BMC for an x86 server
  * IBM Everest, an AST2600 BMC for a Power10 server
  * Supermicro x11spi, an AST2500 BMC for an ARM server

 - AST2600 eMMC clock phase configuration

 - Proper clock support for LPC snoop

 - Misc updates to ethanolx, mowgli, ast2600evb, g220a, and rainier

----------------------------------------------------------------
Andrew Jeffery (1):
      ARM: dts: aspeed: rainier: Add eMMC clock phase compensation

Ben Pai (1):
      ARM: dts: aspeed: mowgli: Add i2c rtc device

Eddie James (1):
      ARM: dts: aspeed: Add Everest BMC machine

George Liu (2):
      ARM: dts: aspeed: inspur-fp5280g2: Add GPIO line names
      ARM: dts: aspeed: inspur-fp5280g2: Add ipsps1 driver

John Wang (2):
      ARM: dts: aspeed: Add LCLK to lpc-snoop
      ARM: dts: aspeed: g220a: Fix some gpio

Konstantin Aladyshev (1):
      ARM: dts: aspeed: amd-ethanolx: Enable secondary LPC snooping address

Lotus Xu (1):
      ARM: dts: aspeed: g220a: Enable ipmb

Quan Nguyen (1):
      ARM: dts: aspeed: Add device tree for Ampere's Mt. Jade BMC

Ryan Chen (1):
      ARM: dts: aspeed: ast2600evb: Add enable ehci and uhci

Ryan Sie (1):
      ARM: dts: aspeed: Add Supermicro x11spi BMC machine

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
