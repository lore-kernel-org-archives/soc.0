Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78652C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:09:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 302DC64E54
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 302DC64E54
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=axL7mGigFhSn/Z7M/tS5rhKCZIgvJQywkfogQaNxd7o=; b=ZSUBoh933FhwJKrPsaV1ChY1r
	bwYtV0KZ6aRBBGP/bIAsFU0A9XxwF+yvH+ghvatjd86UrQvm6JxU6zmGDiEbTsX/UufkwKP9D+jf9
	+W6GTKPF1t4cipSg1sId3vIxH9ti3s+zwzINsdpS19IPnxkPTZ6nJjvdNv+t8lwo0osDqpaT7d5EX
	I87icL66UC2Ja4vDrVXeZ4MNMSmASirXrX+jENbQZxrAveW7HlGIltoETPlJYDvPvQem6gyVUbroV
	aCZp/VWkIM2QzPQaOvTz9pz37xaKdM77ev+bC0XJ7OIc+/xnMLgoYQ6cJrMKzmYifpkZ4TYqrMvtF
	cnc9ijHnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9c6v-0007jG-I0; Tue, 09 Feb 2021 23:07:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9c5h-0007Ho-Uz
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 23:06:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA93664E53;
 Tue,  9 Feb 2021 23:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612912001;
 bh=/wq8JSDUov9vAvA1GfExy59e4zrtM8zH4pEEYcvWz2w=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lSeGliwYwFXpgqSQr3BHrhdCSGRvqH9eQMvgMgn2wiePp+EfFony9jzIl/EOXU2Du
 ppy1bcmTIrvh4AFmyon5NiDmdJlgRUoHrmHmEZJ4xjHWGdVR14wGl/LkLhTIV1vdvN
 5JzeoMANgmKDHWNSZ+Sn4NdsxoOe0JtAd8/bl7B0aTqV/vKA47Re4XAAm6DpQh9hUH
 NnQ0yN66V9/szsDcZlOvbcCc87kC+aeSOB/EfQ28o9KU6frQmMWvtuoCwbsHBIOs9V
 UfhtYXXryzq1gotIkHjFvjjBf6lWYlCJJgGfM0ig5jVZPxTV0ZlJfXCNNt2n1OO+JL
 EL4Kg4wVKeS7Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>
Subject: Re: [GIT PULL] arm64: dts: ZynqMP DT changes for v5.12
Date: Wed, 10 Feb 2021 00:06:11 +0100
Message-ID: <161291108040.974605.3573776808485788092.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <b1a6f89e-f6b4-757b-daf0-d2f1844b833d@xilinx.com>
References: <b1a6f89e-f6b4-757b-daf0-d2f1844b833d@xilinx.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_180642_205631_2A081A60 
X-CRM114-Status: UNSURE (   9.27  )
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
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209230611.xxjxzCFggfwmATXz8XvasszFNxRN4j3gXbVv37EDDtI@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 14:31:04 +0100, Michal Simek wrote:
> please pull the following changes to your tree.
> 
> Thanks,
> Michal
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 638f79778d4fe79adc7d3ee72ae367982db51759

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
