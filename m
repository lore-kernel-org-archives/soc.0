Return-Path: <SRS0=r7Jl=MI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2D4C12002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:27:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99E4961374
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99E4961374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oCjt3Cr0Yr/CJq3K0t7Cok6u7F0j5nFS4TIf/vz7Zxc=; b=rDhU8jG+OQcsud
	P+V5AJFbBDjYFp3TlZW9hITjTwrL0PWiDTpHgbH5q2i2lFFSL0pkPZH6knLL7i/C7IIaGcA0A/92G
	XGK0cGPmKrFvuUBWnYIGJ2hNqPlr6CvsU6irfyurWtYZ1X/0xEK9wLC3r0Tq2lY9iSxhBEQNZwHgC
	rEmfztMHopQzW0g6H++K3Fotj+ZUXFFX1jUx7hsE91DJ6OTqBDtlSDzIBo+M5kigSYF+87mfl1wId
	5Gg5z1Bd59fyjApU5BWbfePIfsKpJRHjtNf5I9Qh+RnZ20pVW2e+M6RKY4MXTRQbivosQAcnWiCQR
	vUvClee79psh4w+TRGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4VKW-005I41-KS; Fri, 16 Jul 2021 21:25:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4VKR-005I2h-9Q
 for linux-arm-kernel@lists.infradead.org; Fri, 16 Jul 2021 21:25:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCD36613C0;
 Fri, 16 Jul 2021 21:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626470702;
 bh=DbCcNeBD7TVXg9zVM+PpP0kyut3rqP3VmrWfa4jQD4w=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BO1Y/tMEYvkVL3ZLdipsjfwh46m4+DfnUCn02kQzXaSiUkI+FMC81QF6qFk7Uue0H
 MfYPxgXCNzwJkPlG88xDqsf5f3TY9bOhtNsC+rWeCfS3pYM0t3o9g35B05kCdPhYWa
 g1sH38fhvbcY64/ry+LOocv6p+z9GxPzzMprcfvF3tcSnTtXJsz09UhudeiFFggj/w
 kZ/1QdMLy0gun6ErTW2RMLt2sdobznCsjuCmvQty+rnxTzyKJPvfivfLYWXepDVMYL
 8nrjD7DBrcf5OgR8Ch8fvCvQCNaMeU+Ce3RVmA4kxe3xTrxr0DBQtzoxpPir0NhfCW
 b+sbrM/wWqIog==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL] Renesas fixes for v5.14
Date: Fri, 16 Jul 2021 23:24:42 +0200
Message-ID: <162647049869.3478428.8962503020877326112.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1626253929.git.geert+renesas@glider.be>
References: <cover.1626253929.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_142503_388150_D28D59B9 
X-CRM114-Status: UNSURE (   7.28  )
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
Message-ID: <20210716212442.bCeahuOUPDnxSUxTBUtn88xa8JnO1jNsPhKVUx-JHOE@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 14 Jul 2021 11:23:50 +0200, Geert Uytterhoeven wrote:
> 	Hi soc folks,
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: e0129a0e826eda3b61f094afe52fd742bbc1923a

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
